Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aG9V5-0000X0-Dp
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 18:05:22 +0000
Received: by mail-ig0-x231.google.com with SMTP id mv3so218495igc.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 10:04:39 -0800 (PST)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH RESEND v2 12/18] fs: Don't remove suid for CAP_FSETID in
 s_user_ns
Date: Mon,  4 Jan 2016 12:03:51 -0600
Message-Id: <1451930639-94331-13-git-send-email-seth.forshee@canonical.com>
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

Expand the check in should_remove_suid() to keep privileges for
CAP_FSETID in s_user_ns rather than init_user_ns.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
---
 fs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/inode.c b/fs/inode.c
index 01c036fe1950..3e7c74da9304 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1684,7 +1684,8 @@ int should_remove_suid(struct dentry *dentry)
 	if (unlikely((mode & S_ISGID) && (mode & S_IXGRP)))
 		kill |= ATTR_KILL_SGID;
 
-	if (unlikely(kill && !capable(CAP_FSETID) && S_ISREG(mode)))
+	if (unlikely(kill && !ns_capable(dentry->d_sb->s_user_ns, CAP_FSETID) &&
+		     S_ISREG(mode)))
 		return kill;
 
 	return 0;
-- 
1.9.1
