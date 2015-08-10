Received: from mail-io0-f178.google.com ([209.85.223.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOuGf-0001dW-5V
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 21:06:03 +0000
Received: by iodd187 with SMTP id d187so182614368iod.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2015 14:05:37 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeff Layton <jlayton@poochiereds.net>,
 "J. Bruce Fields" <bfields@fieldses.org>
Cc: Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH v2 1/7] fs: Add user namesapace member to struct super_block
Date: Mon, 10 Aug 2015 16:05:12 -0500
Message-Id: <1439240719-46850-2-git-send-email-seth.forshee@canonical.com>
In-Reply-To: <1439240719-46850-1-git-send-email-seth.forshee@canonical.com>
References: <1439240719-46850-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Initially this will be used to eliminate the implicit MNT_NODEV
flag for mounts from user namespaces. In the future it will also
be used for translating ids and checking capabilities for
filesystems mounted from user namespaces.

s_user_ns is initialized in alloc_super() and is generally set to
current_user_ns(). To avoid security and corruption issues, two
additional mount checks are also added:

 - do_new_mount() gains a check that the user has CAP_SYS_ADMIN
   in current_user_ns().

 - sget() will fail with EBUSY when the filesystem it's looking
   for is already mounted from another user namespace.

proc requires some special handling. The user namespace of
current isn't appropriate when forking as a result of clone (2)
with CLONE_NEWPID|CLONE_NEWUSER, as it will set s_user_ns to the
namespace of the parent and make proc unmountable in the new user
namespace. Instead, the user namespace which owns the new pid
namespace is used. sget_userns() is allowed to allow passing in
a namespace other than that of current, and sget becomes a
wrapper around sget_userns() which passes current_user_ns().

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 fs/namespace.c     |  3 +++
 fs/proc/root.c     |  3 ++-
 fs/super.c         | 38 +++++++++++++++++++++++++++++++++-----
 include/linux/fs.h |  9 ++++++++-
 4 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 0570729c87fd..d023a353dc63 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2381,6 +2381,9 @@ static int do_new_mount(struct path *path, const char *fstype, int flags,
 	struct vfsmount *mnt;
 	int err;
 
+	if (!ns_capable(current_user_ns(), CAP_SYS_ADMIN))
+		return -EPERM;
+
 	if (!fstype)
 		return -EINVAL;
 
diff --git a/fs/proc/root.c b/fs/proc/root.c
index 361ab4ee42fc..4b302cbf13f9 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -117,7 +117,8 @@ static struct dentry *proc_mount(struct file_system_type *fs_type,
 			return ERR_PTR(-EPERM);
 	}
 
-	sb = sget(fs_type, proc_test_super, proc_set_super, flags, ns);
+	sb = sget_userns(fs_type, proc_test_super, proc_set_super, flags,
+			 ns->user_ns, ns);
 	if (IS_ERR(sb))
 		return ERR_CAST(sb);
 
diff --git a/fs/super.c b/fs/super.c
index b61372354f2b..b5f171aadbf7 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -33,6 +33,7 @@
 #include <linux/cleancache.h>
 #include <linux/fsnotify.h>
 #include <linux/lockdep.h>
+#include <linux/user_namespace.h>
 #include "internal.h"
 
 
@@ -148,6 +149,7 @@ static void destroy_super(struct super_block *s)
 	list_lru_destroy(&s->s_inode_lru);
 	for (i = 0; i < SB_FREEZE_LEVELS; i++)
 		percpu_counter_destroy(&s->s_writers.counter[i]);
+	put_user_ns(s->s_user_ns);
 	security_sb_free(s);
 	WARN_ON(!list_empty(&s->s_mounts));
 	kfree(s->s_subtype);
@@ -163,7 +165,8 @@ static void destroy_super(struct super_block *s)
  *	Allocates and initializes a new &struct super_block.  alloc_super()
  *	returns a pointer new superblock or %NULL if allocation had failed.
  */
-static struct super_block *alloc_super(struct file_system_type *type, int flags)
+static struct super_block *alloc_super(struct file_system_type *type, int flags,
+				       struct user_namespace *user_ns)
 {
 	struct super_block *s = kzalloc(sizeof(struct super_block),  GFP_USER);
 	static const struct super_operations default_op;
@@ -231,6 +234,8 @@ static struct super_block *alloc_super(struct file_system_type *type, int flags)
 	s->s_shrink.count_objects = super_cache_count;
 	s->s_shrink.batch = 1024;
 	s->s_shrink.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE;
+
+	s->s_user_ns = get_user_ns(user_ns);
 	return s;
 
 fail:
@@ -427,17 +432,17 @@ void generic_shutdown_super(struct super_block *sb)
 EXPORT_SYMBOL(generic_shutdown_super);
 
 /**
- *	sget	-	find or create a superblock
+ *	sget_userns -	find or create a superblock
  *	@type:	filesystem type superblock should belong to
  *	@test:	comparison callback
  *	@set:	setup callback
  *	@flags:	mount flags
  *	@data:	argument to each of them
  */
-struct super_block *sget(struct file_system_type *type,
+struct super_block *sget_userns(struct file_system_type *type,
 			int (*test)(struct super_block *,void *),
 			int (*set)(struct super_block *,void *),
-			int flags,
+			int flags, struct user_namespace *user_ns,
 			void *data)
 {
 	struct super_block *s = NULL;
@@ -450,6 +455,10 @@ retry:
 		hlist_for_each_entry(old, &type->fs_supers, s_instances) {
 			if (!test(old, data))
 				continue;
+			if (user_ns != old->s_user_ns) {
+				spin_unlock(&sb_lock);
+				return ERR_PTR(-EBUSY);
+			}
 			if (!grab_super(old))
 				goto retry;
 			if (s) {
@@ -462,7 +471,7 @@ retry:
 	}
 	if (!s) {
 		spin_unlock(&sb_lock);
-		s = alloc_super(type, flags);
+		s = alloc_super(type, flags, user_ns);
 		if (!s)
 			return ERR_PTR(-ENOMEM);
 		goto retry;
@@ -485,6 +494,25 @@ retry:
 	return s;
 }
 
+EXPORT_SYMBOL(sget_userns);
+
+/**
+ *	sget	-	find or create a superblock
+ *	@type:	  filesystem type superblock should belong to
+ *	@test:	  comparison callback
+ *	@set:	  setup callback
+ *	@flags:	  mount flags
+ *	@data:	  argument to each of them
+ */
+struct super_block *sget(struct file_system_type *type,
+			int (*test)(struct super_block *,void *),
+			int (*set)(struct super_block *,void *),
+			int flags,
+			void *data)
+{
+	return sget_userns(type, test, set, flags, current_user_ns(), data);
+}
+
 EXPORT_SYMBOL(sget);
 
 void drop_super(struct super_block *sb)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index fbd780c33c5f..6242e9629fe6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -30,6 +30,7 @@
 #include <linux/lockdep.h>
 #include <linux/percpu-rwsem.h>
 #include <linux/blk_types.h>
+#include <linux/user_namespace.h>
 
 #include <asm/byteorder.h>
 #include <uapi/linux/fs.h>
@@ -1369,6 +1370,8 @@ struct super_block {
 	struct workqueue_struct *s_dio_done_wq;
 	struct hlist_head s_pins;
 
+	struct user_namespace *s_user_ns;
+
 	/*
 	 * Keep the lru lists last in the structure so they always sit on their
 	 * own individual cachelines.
@@ -1499,7 +1502,6 @@ static inline void sb_start_intwrite(struct super_block *sb)
 	__sb_start_write(sb, SB_FREEZE_FS, true);
 }
 
-
 extern bool inode_owner_or_capable(const struct inode *inode);
 
 /*
@@ -1975,6 +1977,11 @@ void deactivate_locked_super(struct super_block *sb);
 int set_anon_super(struct super_block *s, void *data);
 int get_anon_bdev(dev_t *);
 void free_anon_bdev(dev_t);
+struct super_block *sget_userns(struct file_system_type *type,
+			int (*test)(struct super_block *,void *),
+			int (*set)(struct super_block *,void *),
+			int flags, struct user_namespace *user_ns,
+			void *data);
 struct super_block *sget(struct file_system_type *type,
 			int (*test)(struct super_block *,void *),
 			int (*set)(struct super_block *,void *),
-- 
1.9.1
