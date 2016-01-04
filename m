Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aG9V4-0000Yj-HB
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 18:05:18 +0000
Received: by mail-ig0-x230.google.com with SMTP id ph11so250380431igc.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 10:04:40 -0800 (PST)
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
Subject: [PATCH RESEND v2 13/18] fs: Allow superblock owner to access
 do_remount_sb()
Date: Mon,  4 Jan 2016 12:03:52 -0600
Message-Id: <1451930639-94331-14-git-send-email-seth.forshee@canonical.com>
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

Superblock level remounts are currently restricted to global
CAP_SYS_ADMIN, as is the path for changing the root mount to
read only on umount. Loosen both of these permission checks to
also allow CAP_SYS_ADMIN in any namespace which is privileged
towards the userns which originally mounted the filesystem.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
---
 fs/namespace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 18fc58760aec..b00a765895e7 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1510,7 +1510,7 @@ static int do_umount(struct mount *mnt, int flags)
 		 * Special case for "unmounting" root ...
 		 * we just try to remount it readonly.
 		 */
-		if (!capable(CAP_SYS_ADMIN))
+		if (!ns_capable(sb->s_user_ns, CAP_SYS_ADMIN))
 			return -EPERM;
 		down_write(&sb->s_umount);
 		if (!(sb->s_flags & MS_RDONLY))
@@ -2199,7 +2199,7 @@ static int do_remount(struct path *path, int flags, int mnt_flags,
 	down_write(&sb->s_umount);
 	if (flags & MS_BIND)
 		err = change_mount_flags(path->mnt, flags);
-	else if (!capable(CAP_SYS_ADMIN))
+	else if (!ns_capable(sb->s_user_ns, CAP_SYS_ADMIN))
 		err = -EPERM;
 	else
 		err = do_remount_sb(sb, flags, data, 0);
-- 
1.9.1
