Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpcu-0000gv-JL
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:57:53 +0000
Received: by wiclk2 with SMTP id lk2so15454610wic.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:57:34 -0700 (PDT)
From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: [PATCH 3/5] 9p: Simplify the xattr handlers
Date: Fri,  4 Sep 2015 13:57:20 +0200
Message-Id: <1441367842-25079-4-git-send-email-agruenba@redhat.com>
In-Reply-To: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
References: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The generic_{get,set,remove}xattr inode operations use the xattr name prefix to
decide which of the defined xattr handlers to call, then call the appropriate
handler's get or set operation.  The name suffix is passed to the get or set
operations, the prefix is still "there" in the name before the suffix though.
There is no need to recompose the name in a temporary buffer.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/9p/xattr_security.c | 34 ++++------------------------------
 fs/9p/xattr_trusted.c  | 34 ++++------------------------------
 fs/9p/xattr_user.c     | 34 ++++------------------------------
 3 files changed, 12 insertions(+), 90 deletions(-)

diff --git a/fs/9p/xattr_security.c b/fs/9p/xattr_security.c
index cb247a1..2c9b394 100644
--- a/fs/9p/xattr_security.c
+++ b/fs/9p/xattr_security.c
@@ -22,10 +22,7 @@
 static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
 			void *buffer, size_t size, int type)
 {
-	int retval;
-	char *full_name;
-	size_t name_len;
-	size_t prefix_len = XATTR_SECURITY_PREFIX_LEN;
+	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -33,26 +30,13 @@ static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	name_len = strlen(name);
-	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
-	if (!full_name)
-		return -ENOMEM;
-	memcpy(full_name, XATTR_SECURITY_PREFIX, prefix_len);
-	memcpy(full_name+prefix_len, name, name_len);
-	full_name[prefix_len + name_len] = '\0';
-
-	retval = v9fs_xattr_get(dentry, full_name, buffer, size);
-	kfree(full_name);
-	return retval;
+	return v9fs_xattr_get(dentry, full_name, buffer, size);
 }
 
 static int v9fs_xattr_security_set(struct dentry *dentry, const char *name,
 			const void *value, size_t size, int flags, int type)
 {
-	int retval;
-	char *full_name;
-	size_t name_len;
-	size_t prefix_len = XATTR_SECURITY_PREFIX_LEN;
+	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -60,17 +44,7 @@ static int v9fs_xattr_security_set(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	name_len = strlen(name);
-	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
-	if (!full_name)
-		return -ENOMEM;
-	memcpy(full_name, XATTR_SECURITY_PREFIX, prefix_len);
-	memcpy(full_name + prefix_len, name, name_len);
-	full_name[prefix_len + name_len] = '\0';
-
-	retval = v9fs_xattr_set(dentry, full_name, value, size, flags);
-	kfree(full_name);
-	return retval;
+	return v9fs_xattr_set(dentry, full_name, value, size, flags);
 }
 
 struct xattr_handler v9fs_xattr_security_handler = {
diff --git a/fs/9p/xattr_trusted.c b/fs/9p/xattr_trusted.c
index e30d33b..ee470b6 100644
--- a/fs/9p/xattr_trusted.c
+++ b/fs/9p/xattr_trusted.c
@@ -22,10 +22,7 @@
 static int v9fs_xattr_trusted_get(struct dentry *dentry, const char *name,
 			void *buffer, size_t size, int type)
 {
-	int retval;
-	char *full_name;
-	size_t name_len;
-	size_t prefix_len = XATTR_TRUSTED_PREFIX_LEN;
+	const char *full_name = name - XATTR_TRUSTED_PREFIX_LEN;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -33,26 +30,13 @@ static int v9fs_xattr_trusted_get(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	name_len = strlen(name);
-	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
-	if (!full_name)
-		return -ENOMEM;
-	memcpy(full_name, XATTR_TRUSTED_PREFIX, prefix_len);
-	memcpy(full_name+prefix_len, name, name_len);
-	full_name[prefix_len + name_len] = '\0';
-
-	retval = v9fs_xattr_get(dentry, full_name, buffer, size);
-	kfree(full_name);
-	return retval;
+	return v9fs_xattr_get(dentry, full_name, buffer, size);
 }
 
 static int v9fs_xattr_trusted_set(struct dentry *dentry, const char *name,
 			const void *value, size_t size, int flags, int type)
 {
-	int retval;
-	char *full_name;
-	size_t name_len;
-	size_t prefix_len = XATTR_TRUSTED_PREFIX_LEN;
+	const char *full_name = name - XATTR_TRUSTED_PREFIX_LEN;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -60,17 +44,7 @@ static int v9fs_xattr_trusted_set(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	name_len = strlen(name);
-	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
-	if (!full_name)
-		return -ENOMEM;
-	memcpy(full_name, XATTR_TRUSTED_PREFIX, prefix_len);
-	memcpy(full_name + prefix_len, name, name_len);
-	full_name[prefix_len + name_len] = '\0';
-
-	retval = v9fs_xattr_set(dentry, full_name, value, size, flags);
-	kfree(full_name);
-	return retval;
+	return v9fs_xattr_set(dentry, full_name, value, size, flags);
 }
 
 struct xattr_handler v9fs_xattr_trusted_handler = {
diff --git a/fs/9p/xattr_user.c b/fs/9p/xattr_user.c
index d0b701b..4432604 100644
--- a/fs/9p/xattr_user.c
+++ b/fs/9p/xattr_user.c
@@ -22,10 +22,7 @@
 static int v9fs_xattr_user_get(struct dentry *dentry, const char *name,
 			void *buffer, size_t size, int type)
 {
-	int retval;
-	char *full_name;
-	size_t name_len;
-	size_t prefix_len = XATTR_USER_PREFIX_LEN;
+	const char *full_name = name - XATTR_USER_PREFIX_LEN;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -33,26 +30,13 @@ static int v9fs_xattr_user_get(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	name_len = strlen(name);
-	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
-	if (!full_name)
-		return -ENOMEM;
-	memcpy(full_name, XATTR_USER_PREFIX, prefix_len);
-	memcpy(full_name+prefix_len, name, name_len);
-	full_name[prefix_len + name_len] = '\0';
-
-	retval = v9fs_xattr_get(dentry, full_name, buffer, size);
-	kfree(full_name);
-	return retval;
+	return v9fs_xattr_get(dentry, full_name, buffer, size);
 }
 
 static int v9fs_xattr_user_set(struct dentry *dentry, const char *name,
 			const void *value, size_t size, int flags, int type)
 {
-	int retval;
-	char *full_name;
-	size_t name_len;
-	size_t prefix_len = XATTR_USER_PREFIX_LEN;
+	const char *full_name = name - XATTR_USER_PREFIX_LEN;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -60,17 +44,7 @@ static int v9fs_xattr_user_set(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	name_len = strlen(name);
-	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
-	if (!full_name)
-		return -ENOMEM;
-	memcpy(full_name, XATTR_USER_PREFIX, prefix_len);
-	memcpy(full_name + prefix_len, name, name_len);
-	full_name[prefix_len + name_len] = '\0';
-
-	retval = v9fs_xattr_set(dentry, full_name, value, size, flags);
-	kfree(full_name);
-	return retval;
+	return v9fs_xattr_set(dentry, full_name, value, size, flags);
 }
 
 struct xattr_handler v9fs_xattr_user_handler = {
-- 
2.4.3
