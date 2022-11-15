# Description

## API end points

**Background colour that is visible**

https://fqdn/background

**Boot time**

https://fqdn/boot

**Uptime in pretty format**

https://fqdn/uptime

# Interaction

**gomplate**
```
gomplate -d up=https://fqdn/uptime -d background=https://fqdn/background -d boot=https://fqdn/boot -i 'Running for {{ (ds "up").up }} on colour {{ (ds "background").background }} since {{ (ds "boot").boot }}'
```

**curl**
```
curl -X POST -H "Content-Type: application/json" -d '{"background":"blue"}' https://fqdn/background
```

# OpenShift Container Platform integration

**New Project**
```
oc new-project set-colour
```

**New Build**
```
oc new-app https://github.com/chornberger-c2c/set-colour.git
```

**Create Route**
```
oc expose svc/set-colour
```
**Verify**
```
URL=$(oc get route set-colour -o jsonpath='{.spec.host}''{"\n"}')
curl ${URL}
```
