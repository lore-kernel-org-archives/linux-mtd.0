Received: from mail.tataelxsi.co.in ([203.200.1.48])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H2Sjt-00029W-Mo
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 08:34:42 -0500
Received: from bobys (tataelxsi.co.in [203.197.169.124] (may be forged))
	by mail.tataelxsi.co.in (MOS 3.8.3-GA)
	with ESMTP id CEF67378 (AUTH bobys)
	for <linux-mtd@lists.infradead.org>;
	Thu, 4 Jan 2007 19:04:33 +0530 (IST)
From: Boby S Pullamkottu <bobys@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Subject: Kernel Crash in Jffs2 garbage collector thread.
Date: Thu, 4 Jan 2007 19:05:39 +0530
Message-ID: <001501c73005$399738d0$283da8c0@telxsi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
Iam facing  inconsistent kernel crash on a proprietary board. The kernel
crashes sometimes on jffs2 garbage collector thread. This happens during the
mounting or writing to the mounted partition .When I traced, it is found
that the kernel crashes on jffs2_garbage_collect_metadata() which is called
from jffs2_garbage_collect_live() (file gc.c). The issue was the meta data
length variable (char *mdata = NULL, mdatalen = 0;) inside the
jffs2_garbage_collect_metadata() is of type char and the metadatalen
received is greater than 128 and inode passed is of symbolic link type. This
causes the crc calculation for data node to access invalid memory and makes
the crash.
Version of the kernel is 2.4.22 and this partition is not the root
partition(root partition is read only). Flash used is AMD spansion 128 KB
sector size
Does anybody know  why the "mdatalen" size is limited to size of char and
advice me if there is any better way to trace this issue..

Thanks in Advance
Boby

This is the oops message which I seen.

Oops: kernel access of bad area, sig: 11
NIP: C013E384 XER: 20000000 LR: C009E1EC SP: C3D0BCC0 REGS: c3d0bc10 TRAP:
0300    Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: C4000000, DSISR: 20000000
TASK = c3d0a000[13] 'jffs2_gcd_mtd2' Last syscall: -1
last math c376e000 last altivec 00000000
GPR00: 7BA5011B C3D0BCC0 C3D0A000 00000000 C3FFFFFC 3FFFFFEC 00000000
00000003
GPR08: C0164C1C 00000154 7E19801B 05BC8100 04000000 100254C8 00000000
00000000
GPR16: 00000000 00000000 00000000 00000000 C38777A0 C3FA30F4 C3B5EB20
C0150000
GPR24: FFFFFFB3 C0150000 C3D0BCC8 C3D0BD18 0000A1FF 3FB533C2 00000000
C3B485B0
Call backtrace:
C009E1DC C009D984 C009D180 C00A0DC4 C0009028




Iam just adding the code snippet where kernel crash occurs for reference

static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb,
     struct jffs2_inode_info *f, struct jffs2_full_dnode *fn)
{
struct jffs2_full_dnode *new_fn;
 struct jffs2_raw_inode ri;
 jint16_t dev;
 char *mdata = NULL, mdatalen =
0;---------------------------------------------------------------------->
This variable is of type char
 uint32_t alloclen, phys_ofs;
 int ret;

 if (S_ISBLK(JFFS2_F_I_MODE(f)) ||
     S_ISCHR(JFFS2_F_I_MODE(f)) ) {
  /* For these, we don't actually need to read the old node */
  /* FIXME: for minor or major > 255. */
  dev = cpu_to_je16(((JFFS2_F_I_RDEV_MAJ(f) << 8) |
   JFFS2_F_I_RDEV_MIN(f)));
  mdata = (char *)&dev;
  mdatalen = sizeof(dev);
  D1(printk(KERN_DEBUG "jffs2_garbage_collect_metadata(): Writing %d bytes
of kdev_t\n", mdatalen));
 } else if (S_ISLNK(JFFS2_F_I_MODE(f))) {
  mdatalen =
fn->size; ------------------------------------------------------------------
------------------------------>fn->size is greater than 127
  mdata = kmalloc(fn->size, GFP_KERNEL);
  if (!mdata) {
   printk(KERN_WARNING "kmalloc of mdata failed in
jffs2_garbage_collect_metadata()\n");
   return -ENOMEM;
  }

Thanks in Advance
Boby
