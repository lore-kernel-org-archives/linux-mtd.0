Received: from mail-ig0-f171.google.com ([209.85.213.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOuGi-0001e5-HG
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 21:06:06 +0000
Received: by igbij6 with SMTP id ij6so78139905igb.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2015 14:05:42 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 James Morris <james.l.morris@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: Andy Lutomirski <luto@amacapital.net>, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH v2 4/7] fs: Limit file caps to the user namespace of the super
 block
Date: Mon, 10 Aug 2015 16:05:15 -0500
Message-Id: <1439240719-46850-5-git-send-email-seth.forshee@canonical.com>
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

Capability sets attached to files must be ignored except in the
user namespaces where the mounter is privileged, i.e. s_user_ns
and its descendants. Otherwise a vector exists for gaining
privileges in namespaces where a user is not already privileged.

Add a new helper function, in_user_ns(), to test whether a user
namespace is the same as or a descendant of another namespace.
Use this helper to determine whether a file's capability set
should be applied to the caps constructed during exec.

Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 include/linux/user_namespace.h |  8 ++++++++
 kernel/user_namespace.c        | 14 ++++++++++++++
 security/commoncap.c           |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 8297e5b341d8..a43faa727124 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -72,6 +72,8 @@ extern ssize_t proc_projid_map_write(struct file *, const char __user *, size_t,
 extern ssize_t proc_setgroups_write(struct file *, const char __user *, size_t, loff_t *);
 extern int proc_setgroups_show(struct seq_file *m, void *v);
 extern bool userns_may_setgroups(const struct user_namespace *ns);
+extern bool in_userns(const struct user_namespace *ns,
+		      const struct user_namespace *target_ns);
 #else
 
 static inline struct user_namespace *get_user_ns(struct user_namespace *ns)
@@ -100,6 +102,12 @@ static inline bool userns_may_setgroups(const struct user_namespace *ns)
 {
 	return true;
 }
+
+static inline bool in_userns(const struct user_namespace *ns,
+			     const struct user_namespace *target_ns)
+{
+	return true;
+}
 #endif
 
 #endif /* _LINUX_USER_H */
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 4109f8320684..2b043876d5f0 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -944,6 +944,20 @@ bool userns_may_setgroups(const struct user_namespace *ns)
 	return allowed;
 }
 
+/*
+ * Returns true if @ns is the same namespace as or a descendant of
+ * @target_ns.
+ */
+bool in_userns(const struct user_namespace *ns,
+	       const struct user_namespace *target_ns)
+{
+	for (; ns; ns = ns->parent) {
+		if (ns == target_ns)
+			return true;
+	}
+	return false;
+}
+
 static inline struct user_namespace *to_user_ns(struct ns_common *ns)
 {
 	return container_of(ns, struct user_namespace, ns);
diff --git a/security/commoncap.c b/security/commoncap.c
index d103f5a4043d..175ab497e810 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -439,6 +439,8 @@ static int get_file_caps(struct linux_binprm *bprm, bool *effective, bool *has_c
 
 	if (bprm->file->f_path.mnt->mnt_flags & MNT_NOSUID)
 		return 0;
+	if (!in_userns(current_user_ns(), bprm->file->f_path.mnt->mnt_sb->s_user_ns))
+		return 0;
 
 	rc = get_vfs_caps_from_disk(bprm->file->f_path.dentry, &vcaps);
 	if (rc < 0) {
-- 
1.9.1
