Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atdB7-0001hd-NS
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 15:39:34 +0000
Received: by mail-ob0-x231.google.com with SMTP id n10so44633380obb.2
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2016 08:39:13 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <mszeredi@redhat.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, linux-kernel@vger.kernel.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 cgroups@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH v3 10/21] fs: Check for invalid i_uid in may_follow_link()
Date: Fri, 22 Apr 2016 10:38:27 -0500
Message-Id: <1461339521-123191-11-git-send-email-seth.forshee@canonical.com>
In-Reply-To: <1461339521-123191-1-git-send-email-seth.forshee@canonical.com>
References: <1461339521-123191-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Filesystem uids which don't map into a user namespace may result
in inode->i_uid being INVALID_UID. A symlink and its parent
could have different owners in the filesystem can both get
mapped to INVALID_UID, which may result in following a symlink
when this would not have otherwise been permitted when protected
symlinks are enabled.

Add a new helper function, uid_valid_eq(), and use this to
validate that the ids in may_follow_link() are both equal and
valid. Also add an equivalent helper for gids, which is
currently unused.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
---
 fs/namei.c             |  2 +-
 include/linux/uidgid.h | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index a29094c6f4a1..6fe8b0d8ca90 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -915,7 +915,7 @@ static inline int may_follow_link(struct nameidata *nd)
 		return 0;
 
 	/* Allowed if parent directory and link owner match. */
-	if (uid_eq(parent->i_uid, inode->i_uid))
+	if (uid_valid_eq(parent->i_uid, inode->i_uid))
 		return 0;
 
 	if (nd->flags & LOOKUP_RCU)
diff --git a/include/linux/uidgid.h b/include/linux/uidgid.h
index 03835522dfcb..e09529fe2668 100644
--- a/include/linux/uidgid.h
+++ b/include/linux/uidgid.h
@@ -117,6 +117,16 @@ static inline bool gid_valid(kgid_t gid)
 	return __kgid_val(gid) != (gid_t) -1;
 }
 
+static inline bool uid_valid_eq(kuid_t left, kuid_t right)
+{
+	return uid_eq(left, right) && uid_valid(left);
+}
+
+static inline bool gid_valid_eq(kgid_t left, kgid_t right)
+{
+	return gid_eq(left, right) && gid_valid(left);
+}
+
 #ifdef CONFIG_USER_NS
 
 extern kuid_t make_kuid(struct user_namespace *from, uid_t uid);
-- 
1.9.1
