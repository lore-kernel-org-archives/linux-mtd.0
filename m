Received: from static-213-115-50-13.sme.bredbandsbolaget.se ([213.115.50.13]
 helo=fw-y.tutus.se)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaNBN-0008FI-3W
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2011 07:53:50 +0000
Subject: [PATCH] UBIFS: Kernel oops on a read only mounted file system
From: Daniel Fahlgren <fahlgren@tutus.se>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-rDdzgSAu3kZn7YPXKR8D"
Date: Tue, 13 Dec 2011 08:53:10 +0100
Message-ID: <1323762790.27828.30.camel@fahlgren-laptop>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rDdzgSAu3kZn7YPXKR8D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I have a system where the kernel is getting an oops a couple of seconds
after it has booted. It can also be provoked to happen earlier if I run
the command sync. The only ubifs file system on the machine is a read
only mounted root partition. The call trace is:

Call Trace:
[c7a57d50] [c00d3aa4] make_reservation+0xa0/0x434 (unreliable)
[c7a57db0] [c00d44c4] ubifs_jnl_write_inode+0x7c/0x248
[c7a57df0] [c00db898] ubifs_write_inode+0xd4/0x11c
[c7a57e10] [c009a1c8] __writeback_single_inode+0x424/0x42c
[c7a57e60] [c009a950] generic_sync_sb_inodes+0x444/0x56c
[c7a57ea0] [c009ab44] sync_inodes_sb+0xcc/0xe8
[c7a57ef0] [c009ac08] __sync_inodes+0xa8/0x12c
[c7a57f10] [c009aca8] sync_inodes+0x1c/0x50
[c7a57f20] [c009eae0] do_sync+0x24/0x84
[c7a57f30] [c009eb54] sys_sync+0x14/0x28
[c7a57f40] [c0010b10] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0x10061d78

Neither the kernel nor the ubifs system is the latest, but the code in
ubifs_write_inode hasn't changed since 2008-something.

Looking at the list there is another similar report[1] but that isn't in
the same place. Attached is a patch that fixes the problem for me. To be
honest is my local version slightly different and is checking for
inode->i_sb->s_flags & MS_RDONLY and not c->ro_mount. I'm not sure if it
is in the correct place regarding locks, or if the check should be in
ubifs_jnl_write instead.

Best regards,
Daniel Fahlgren

1: http://lists.infradead.org/pipermail/linux-mtd/2011-April/034884.html

--=-rDdzgSAu3kZn7YPXKR8D
Content-Disposition: attachment; filename="ubifs_patch.txt"
Content-Type: text/plain; name="ubifs_patch.txt"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 20403dc..be472d1 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -301,6 +301,9 @@ static int ubifs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	if (is_bad_inode(inode))
 		return 0;
 
+	if (c->ro_mount)
+		return 0;
+
 	mutex_lock(&ui->ui_mutex);
 	/*
 	 * Due to races between write-back forced by budgeting

--=-rDdzgSAu3kZn7YPXKR8D--
