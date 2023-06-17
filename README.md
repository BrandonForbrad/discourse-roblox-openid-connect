## Note:

This plugin was forked from the official openid connect plugin that discourse uses. A few changes were made to the settings and source code. Most of the setting changes are most likely unwarranted and could of stayed the same. I still need to change a few class names so that this plugin can work alongside the offical one incase you wanted to use Roblox sign on with another openid connector.

# What does this plugin do differently?

99% of this plugin is exactly the same as the original plugin. The changes made were allowed to denote this plugin is for roblox as the most important aspect that was needed to get discourse working with roblox was to fetch the users avatar.

Roblox does not auto-provide a image for the user so the plugin has to internally do the fetch with the users id in order to get the proper image. This plugin also has defaults to make the set-up pretty straight forward and almost work out of the box.

# Settings

Here are the following settings you should use for the plugin:

- DiscourseConnect:
  - auth overrides username
    - This will automatically update the users username everytime they login as well as not allow the user to change their username manually.
  - auth overrides name
    - This will automatically update the users name everytime they login as well as not allow the user to change their name manually.
  - auth overrides avatar
    - This is a bit different from the other options, this will not allow the user to change their profile picture. This setting pairs well with the `openid connect rbx overrides avatar` plugin setting.
- Global Settings
  - enable local logins
    - This will force the user to only be able to log in with their roblox account (or other OAuth providers you have) if disabled.
- Plugin Settings
  - openid connect rbx enabled
    - To enable or disable the provider
  - openid connect rbx client id
    - The oauth client id provided by roblox.
  - openid connect rbx client secret
    - The oauth client secret provided by roblox.
  - openid connect rbx allow association change
    - Allows the users to disconnect/reconnect their roblox accounts if they want to.
  - openid connect rbx overrides avatar
    - This will force the users avatar to be fetched everytime they login and update their profile picture. This paired with the DiscourseConnect `auth overrides avatar` setting forces the user to always have their avatar be their roblox avatar and they can't change it.

_These settings shown are the main settings one should most likely use for their discourse instance for roblox._

# Usage

Important url redirect: `https://yourforum.com/auth/auth/rbxoidc/callback`
OAuth application should have profile and openid enabled in your OAuth app settings.

## SSO Roblox Only Username, Avatar, and Name.

If you're looking for a discourse instance that only lets users log in with their roblox account and thats how they are identified then the following settings is what you would want:

- DiscourseConnect:
  - auth overrides username: **true**
  - auth overrides name: **true**
  - auth overrides avatar: **true**
- Global Settings
  - enable local logins: **false**
- Plugin Settings
  - openid connect rbx enabled: **true**
  - openid connect rbx client id: **Your client id**
  - openid connect rbx client secret: **Your client secret**
  - openid connect rbx allow association change: **false**
  - openid connect rbx overrides avatar: **true**

## SSO Roblox login, allow users to change name, username, or avatar.

If you're looking for a discourse instance that only lets users log in with their roblox account and thats how they are identified then the following settings is what you would want:

- DiscourseConnect:
  - auth overrides username: **false**
  - auth overrides name: **false**
  - auth overrides avatar: **false**
- Global Settings
  - enable local logins: **false**
- Plugin Settings
  - openid connect rbx enabled: **true**
  - openid connect rbx client id: **Your client id**
  - openid connect rbx client secret: **Your client secret**
  - openid connect rbx allow association change: **false/true (your choice)**
  - openid connect rbx overrides avatar: **false**

## Typical Discourse instance with Roblox as a extra sign-in method.

If you're looking for a discourse instance that only lets users log in with their roblox account and thats how they are identified then the following settings is what you would want:

- DiscourseConnect:
  - auth overrides username: **false**
  - auth overrides name: **false**
  - auth overrides avatar: **false**
- Global Settings
  - enable local logins: **true**
- Plugin Settings
  - openid connect rbx enabled: **true**
  - openid connect rbx client id: **Your client id**
  - openid connect rbx client secret: **Your client secret**
  - openid connect rbx allow association change: **false/true (your choice)**
  - openid connect rbx overrides avatar: **false**

---

---

# Forked from discourse-openid-connect

A plugin to integrate Discourse with an openid-connect login provider

For information and discussion, see https://meta.discourse.org/t/openid-connect-authentication-plugin/103632
