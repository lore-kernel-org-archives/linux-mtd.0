Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4SmM-0002dJ-Dg
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 06:51:51 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2T6pmgt013165
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2011 09:51:48 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: fix assertion warnings
Date: Tue, 29 Mar 2011 09:54:56 +0300
Message-Id: <1301381696-26884-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes UBIFS assertion warnings like:

UBIFS assert failed in ubifs_leb_unmap at 135 (pid 29365)
Pid: 29365, comm: integck Tainted: G          I 2.6.37-ubi-2.6+ #34
Call Trace:
 [<ffffffffa047c663>] ubifs_lpt_init+0x95e/0x9ee [ubifs]
 [<ffffffffa04623a7>] ubifs_remount_fs+0x2c7/0x762 [ubifs]
 [<ffffffff810f066e>] do_remount_sb+0xb6/0x101
 [<ffffffff81106ff4>] ? do_mount+0x191/0x78e
 [<ffffffff811070bb>] do_mount+0x258/0x78e
 [<ffffffff810da1e8>] ? alloc_pages_current+0xa2/0xc5
 [<ffffffff81107674>] sys_mount+0x83/0xbd
 [<ffffffff81009a12>] system_call_fastpath+0x16/0x1b

They happen when we re-mount from R/O mode to R/W mode. While
re-mounting, we write to the media, but we still have the c->ro_mount
flag set. The fix is very simple - just clear the flag before
starting re-mounting R/W.

These warnings are caused by the following commit:
2ef13294d29bcfb306e0d360f1b97f37b647b0c0

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 91fac54..1c618fa 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1536,6 +1536,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	dbg_save_space_info(c);
 	c->remounting_rw = 1;
 	c->always_chk_crc = 1;
+	c->ro_mount = 0;
 
 	err = check_free_space(c);
 	if (err)
@@ -1640,7 +1641,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	}
 
 	dbg_gen("re-mounted read-write");
-	c->ro_mount = 0;
 	c->remounting_rw = 0;
 	c->always_chk_crc = 0;
 	err = dbg_check_space_info(c);
@@ -1648,6 +1648,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	return err;
 
 out:
+	c->ro_mount = 1;
 	vfree(c->orph_buf);
 	c->orph_buf = NULL;
 	if (c->bgt) {
-- 
1.7.2.3
