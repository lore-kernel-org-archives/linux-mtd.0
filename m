Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aG9Uj-0000AP-3l
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 18:05:05 +0000
Received: by mail-ig0-x236.google.com with SMTP id to18so224098059igc.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 10:04:16 -0800 (PST)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Paul Moore <paul@paul-moore.com>, Stephen Smalley <sds@tycho.nsa.gov>,
 Eric Paris <eparis@parisplace.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 Seth Forshee <seth.forshee@canonical.com>,
 James Morris <james.l.morris@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH RESEND v2 04/18] selinux: Add support for unprivileged mounts
 from user namespaces
Date: Mon,  4 Jan 2016 12:03:43 -0600
Message-Id: <1451930639-94331-5-git-send-email-seth.forshee@canonical.com>
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

Security labels from unprivileged mounts in user namespaces must
be ignored. Force superblocks from user namespaces whose labeling
behavior is to use xattrs to use mountpoint labeling instead.
For the mountpoint label, default to converting the current task
context into a form suitable for file objects, but also allow the
policy writer to specify a different label through policy
transition rules.

Pieced together from code snippets provided by Stephen Smalley.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: James Morris <james.l.morris@oracle.com>
---
 security/selinux/hooks.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index a5b93df6553f..5fedc36dd6b2 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -756,6 +756,28 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 			goto out;
 		}
 	}
+
+	/*
+	 * If this is a user namespace mount, no contexts are allowed
+	 * on the command line and security labels must be ignored.
+	 */
+	if (sb->s_user_ns != &init_user_ns) {
+		if (context_sid || fscontext_sid || rootcontext_sid ||
+		    defcontext_sid) {
+			rc = -EACCES;
+			goto out;
+		}
+		if (sbsec->behavior == SECURITY_FS_USE_XATTR) {
+			sbsec->behavior = SECURITY_FS_USE_MNTPOINT;
+			rc = security_transition_sid(current_sid(), current_sid(),
+						     SECCLASS_FILE, NULL,
+						     &sbsec->mntpoint_sid);
+			if (rc)
+				goto out;
+		}
+		goto out_set_opts;
+	}
+
 	/* sets the context of the superblock for the fs being mounted. */
 	if (fscontext_sid) {
 		rc = may_context_mount_sb_relabel(fscontext_sid, sbsec, cred);
@@ -824,6 +846,7 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 		sbsec->def_sid = defcontext_sid;
 	}
 
+out_set_opts:
 	rc = sb_finish_set_opts(sb);
 out:
 	mutex_unlock(&sbsec->lock);
-- 
1.9.1
