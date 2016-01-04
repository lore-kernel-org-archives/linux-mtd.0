Received: from mail-io0-x22b.google.com ([2607:f8b0:4001:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aG9V8-0000aR-9Q
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 18:05:24 +0000
Received: by mail-io0-x22b.google.com with SMTP id 77so132133431ioc.2
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 10:04:42 -0800 (PST)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 James Morris <james.l.morris@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH RESEND v2 14/18] capabilities: Allow privileged user in
 s_user_ns to set security.* xattrs
Date: Mon,  4 Jan 2016 12:03:53 -0600
Message-Id: <1451930639-94331-15-git-send-email-seth.forshee@canonical.com>
In-Reply-To: <1451930639-94331-1-git-send-email-seth.forshee@canonical.com>
References: <1451930639-94331-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A privileged user in s_user_ns will generally have the ability to
manipulate the backing store and insert security.* xattrs into
the filesystem directly. Therefore the kernel must be prepared to
handle these xattrs from unprivileged mounts, and it makes little
sense for commoncap to prevent writing these xattrs to the
filesystem. The capability and LSM code have already been updated
to appropriately handle xattrs from unprivileged mounts, so it
is safe to loosen this restriction on setting xattrs.

The exception to this logic is that writing xattrs to a mounted
filesystem may also cause the LSM inode_post_setxattr or
inode_setsecurity callbacks to be invoked. SELinux will deny the
xattr update by virtue of applying mountpoint labeling to
unprivileged userns mounts, and Smack will deny the writes for
any user without global CAP_MAC_ADMIN, so loosening the
capability check in commoncap is safe in this respect as well.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
---
 security/commoncap.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 2119421613f6..d6c80c19c449 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -653,15 +653,17 @@ int cap_bprm_secureexec(struct linux_binprm *bprm)
 int cap_inode_setxattr(struct dentry *dentry, const char *name,
 		       const void *value, size_t size, int flags)
 {
+	struct user_namespace *user_ns = dentry->d_sb->s_user_ns;
+
 	if (!strcmp(name, XATTR_NAME_CAPS)) {
-		if (!capable(CAP_SETFCAP))
+		if (!ns_capable(user_ns, CAP_SETFCAP))
 			return -EPERM;
 		return 0;
 	}
 
 	if (!strncmp(name, XATTR_SECURITY_PREFIX,
 		     sizeof(XATTR_SECURITY_PREFIX) - 1) &&
-	    !capable(CAP_SYS_ADMIN))
+	    !ns_capable(user_ns, CAP_SYS_ADMIN))
 		return -EPERM;
 	return 0;
 }
@@ -679,15 +681,17 @@ int cap_inode_setxattr(struct dentry *dentry, const char *name,
  */
 int cap_inode_removexattr(struct dentry *dentry, const char *name)
 {
+	struct user_namespace *user_ns = dentry->d_sb->s_user_ns;
+
 	if (!strcmp(name, XATTR_NAME_CAPS)) {
-		if (!capable(CAP_SETFCAP))
+		if (!ns_capable(user_ns, CAP_SETFCAP))
 			return -EPERM;
 		return 0;
 	}
 
 	if (!strncmp(name, XATTR_SECURITY_PREFIX,
 		     sizeof(XATTR_SECURITY_PREFIX) - 1) &&
-	    !capable(CAP_SYS_ADMIN))
+	    !ns_capable(user_ns, CAP_SYS_ADMIN))
 		return -EPERM;
 	return 0;
 }
-- 
1.9.1
