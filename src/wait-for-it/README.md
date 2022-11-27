
# wait-for-it (wait-for-it)

wait-for-it.sh is a pure bash script that will wait on the availability of a host and TCP port. It is useful for synchronizing the spin-up of interdependent services, such as linked docker containers. Since it is a pure bash script, it does not have any external dependencies.

## Example Usage

```json
"features": {
    "ghcr.io/lukewiwa/features/wait-for-it:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| host | Host or IP under test | string | localhost |
| port | TCP port under test | string | 80 |
| timeout | Timeout in seconds, zero for no timeout | string | 15 |
| strict | Only execute subcommand if the test succeeds | boolean | false |
| quiet | Don't output any status messages | boolean | false |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/lukewiwa/features/blob/main/src/wait-for-it/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
