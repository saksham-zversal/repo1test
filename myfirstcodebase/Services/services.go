package services

import(
	"os"
	"bufio"
	"strings"
	"strconv"
)

func ReadPropertiesFile(filename string) (map[string]interface{}, error) {
    file, err := os.Open(filename)
    if err != nil {
        return nil, err
    }
    defer file.Close()

    config := make(map[string]interface{})
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := strings.TrimSpace(scanner.Text())

        if line == "" || strings.HasPrefix(line, "#") || strings.HasPrefix(line, "//") {
            continue
        }

        parts := strings.SplitN(line, "=", 2)

        if len(parts) == 2 {
            key := strings.TrimSpace(parts[0])
            valueStr := strings.TrimSpace(parts[1])
            value, err := strconv.Unquote(valueStr)
            if err != nil {
                value = valueStr
            }
            config[key] = value
        }
    }

    if err := scanner.Err(); err != nil {
        return nil, err
    }

    return config, nil
}