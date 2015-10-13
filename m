Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm31I-0001XI-Qs
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 17:05:49 +0000
Received: by igbkq10 with SMTP id kq10so97069930igb.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 10:05:28 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH v2 3/7] mtd: Check permissions towards mtd block device inode
 when mounting
Date: Tue, 13 Oct 2015 12:04:16 -0500
Message-Id: <1444755861-54997-4-git-send-email-seth.forshee@canonical.com>
In-Reply-To: <1444755861-54997-1-git-send-email-seth.forshee@canonical.com>
References: <1444755861-54997-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unprivileged users should not be able to mount mtd block devices
when they lack sufficient privileges towards the block device
inode.  Update mount_mtd() to validate that the user has the
required access to the inode at the specified path. The check
will be skipped for CAP_SYS_ADMIN, so privileged mounts will
continue working as before.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/mtd/mtdsuper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index b5b60e1af31c..5d7e7705fed8 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -125,6 +125,7 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 #ifdef CONFIG_BLOCK
 	struct block_device *bdev;
 	int ret, major;
+	int perm;
 #endif
 	int mtdnr;
 
@@ -176,7 +177,10 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 	/* try the old way - the hack where we allowed users to mount
 	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
 	 */
-	bdev = lookup_bdev(dev_name, 0);
+	perm = MAY_READ;
+	if (!(flags & MS_RDONLY))
+		perm |= MAY_WRITE;
+	bdev = lookup_bdev(dev_name, perm);
 	if (IS_ERR(bdev)) {
 		ret = PTR_ERR(bdev);
 		pr_debug("MTDSB: lookup_bdev() returned %d\n", ret);
-- 
1.9.1
