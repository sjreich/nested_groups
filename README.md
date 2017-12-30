# Nested Groups
A SQL exercise for putting users in groups and subgroups

This was inspired by the [discussion of subgroups at gitlab](https://docs.gitlab.com/ee/user/group/subgroups/).

What I've done here is just the minimum from a database perspective - a way to represent that one group is a subgroup of another, and a way to represent that if a user is a member of one group, and that group is a subgroup of a second group, then the user is also a member of the second group.
