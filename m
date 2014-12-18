Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1RZf-0006TI-NK
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 03:16:24 +0000
From: <chenjie6@huawei.com>
To: <linux-mtd@lists.infradead.org>, <David.Woodhouse@intel.com>
Subject: [PATCH] [RESEND] jffs2: bugfix of summary length
Date: Thu, 18 Dec 2014 19:04:48 +0800
Message-ID: <1418900688-21760-1-git-send-email-chenjie6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, akpm@linux-foundation.org, lizefan@huawei.com,
 zengweilin@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Chen Jie <chenjie6@huawei.com>

sm->offset maybe wrong but magic maybe right, the offset 
do not have CRC.

------------[ cut here ]------------
Badness at c00c7580 [verbose debug info unavailable]
NIP: c00c7580 LR: c00c718c CTR: 00000014
REGS: df07bb40 TRAP: 0700   Not tainted  (2.6.34.13-WR4.3.0.0_standard)
MSR: 00029000 <EE,ME,CE>  CR: 22084f84  XER: 00000000
TASK = df84d6e0[908] 'mount' THREAD: df07a000
GPR00: 00000001 df07bbf0 df84d6e0 00000000 00000001 00000000 df07bb58 00000041
GPR08: 00000041 c0638860 00000000 00000010 22084f88 100636c8 df814ff8 00000000
GPR16: df84d6e0 dfa558cc c05adb90 00000048 c0452d30 00000000 000240d0 000040d0
GPR24: 00000014 c05ae734 c05be2e0 00000000 00000001 00000000 00000000 c05ae730
NIP [c00c7580] __alloc_pages_nodemask+0x4d0/0x638
LR [c00c718c] __alloc_pages_nodemask+0xdc/0x638
Call Trace:
[df07bbf0] [c00c718c] __alloc_pages_nodemask+0xdc/0x638 (unreliable)
[df07bc90] [c00c7708] __get_free_pages+0x20/0x48
[df07bca0] [c00f4a40] __kmalloc+0x15c/0x1ec
[df07bcd0] [c01fc880] jffs2_scan_medium+0xa58/0x14d0
[df07bd70] [c01ff38c] jffs2_do_mount_fs+0x1f4/0x6b4
[df07bdb0] [c020144c] jffs2_do_fill_super+0xa8/0x260
[df07bdd0] [c020230c] jffs2_fill_super+0x104/0x184
[df07be00] [c0335814] get_sb_mtd_aux+0x9c/0xec
[df07be20] [c033596c] get_sb_mtd+0x84/0x1e8
[df07be60] [c0201ed0] jffs2_get_sb+0x1c/0x2c
[df07be70] [c0103898] vfs_kern_mount+0x78/0x1e8
[df07bea0] [c0103a58] do_kern_mount+0x40/0x100
[df07bec0] [c011fe90] do_mount+0x240/0x890
[df07bf10] [c0120570] sys_mount+0x90/0xd8
[df07bf40] [c00110d8] ret_from_syscall+0x0/0x4
--- Exception: c01 at 0xff61a34
    LR = 0x100135f0
Instruction dump:
38800005 38600000 48010f41 4bfffe1c 4bfc2d15 4bfffe8c 72e90200 4082fc28
3d20c064 39298860 8809000d 68000001 <0f000000> 2f800000 419efc0c 38000001
mount: mounting /dev/mtdblock3 on /common failed: Input/output error


Cc: <stable@vger.kernel.org>
Signed-off-by: Chen Jie <chenjie6@huawei.com>

---
 fs/jffs2/scan.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 7654e87..ba978363 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -509,6 +509,10 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 			if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
 				sumlen = c->sector_size - je32_to_cpu(sm->offset);
 				sumptr = buf + buf_size - sumlen;
+
+				/* sm->offset maybe wrong but MAGIC maybe right */
+				if (sumlen > c->sector_size)
+					goto full_scan;
 
 				/* Now, make sure the summary itself is available */
 				if (sumlen > buf_size) {
@@ -544,6 +548,7 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 		}
 	}
 
+full_scan:
 	buf_ofs = jeb->offset;
 
 	if (!buf_size) {
-- 
1.8.0
