Received: from ip68-7-112-74.sd.sd.cox.net ([68.7.112.74] helo=clpanic.kennet.coplanar.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sxwb-00056x-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 04:29:49 +0100
Received: from bridge (bridge.kennet.coplanar.net [192.168.10.126] (may be forged))
	by clpanic.kennet.coplanar.net (8.11.6/8.11.2) with SMTP id g343Tml14194
	for <linux-mtd@lists.infradead.org>; Wed, 3 Apr 2002 19:29:48 -0800
Message-ID: <015d01c1db88$f595b970$7e0aa8c0@bridge>
From: "Jeremy Jackson" <jerj@coplanar.net>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] comple fixes for 2.5.7 kernel
Date: Wed, 3 Apr 2002 19:29:40 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

These are some changes I had to make to compile some of MTD
under 2.5.7.  It updates some files to use the compatmac.h provided
version-independent macros.  Unfortunately I didn't fix everything,
but simply checked at which version it stopped working, and simply
#error with a message to that effect.  But it's a start.  I don't use
some of the kernel config options, so ymmv.

I figure everyone will need this at some point so I'm submitting
it for inclusion in the HEAD code.

Index: drivers/mtd/mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdchar.c,v
retrieving revision 1.44
diff -u -r1.44 mtdchar.c
--- drivers/mtd/mtdchar.c 2 Oct 2001 15:05:11 -0000 1.44
+++ drivers/mtd/mtdchar.c 4 Apr 2002 03:17:46 -0000
@@ -60,7 +60,7 @@
static int mtd_open(struct inode *inode, struct file *file)
{
- int minor = MINOR(inode->i_rdev);
+ int minor = minor(inode->i_rdev);
int devnum = minor >> 1;
struct mtd_info *mtd;
Index: drivers/mtd/nftlcore.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nftlcore.c,v
retrieving revision 1.86
diff -u -r1.86 nftlcore.c
--- drivers/mtd/nftlcore.c 6 Mar 2002 14:38:17 -0000 1.86
+++ drivers/mtd/nftlcore.c 4 Apr 2002 03:17:48 -0000
@@ -68,8 +68,10 @@
major: MAJOR_NR,
major_name: "nftl",
minor_shift: NFTL_PARTN_BITS, /* Bits to shift to get real from partition */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,2)
max_p: (1<<NFTL_PARTN_BITS)-1, /* Number of partitions per real */
-#if LINUX_VERSION_CODE < 0x20328
+#endif
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,28)
max_nr: MAX_NFTLS, /* maximum number of real */
init: dummy_init, /* init function */
#endif
@@ -168,10 +170,12 @@
nftl_gendisk.nr_real++;
/* partition check ... */
-#if LINUX_VERSION_CODE < 0x20328
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,28)
resetup_one_dev(&nftl_gendisk, firstfree);
-#else
+#elseif LINUX_VERSION_CODE < KERNEL_VERSION(2.5.1)
grok_partitions(&nftl_gendisk, firstfree, 1<<NFTL_PARTN_BITS,
nftl->nr_sects);
+#else
+#error this does not support versions above 2.5.0 yet
#endif
}
@@ -793,7 +797,7 @@
struct NFTLrecord *nftl;
int p;
- nftl = NFTLs[MINOR(inode->i_rdev) >> NFTL_PARTN_BITS];
+ nftl = NFTLs[minor(inode->i_rdev) >> NFTL_PARTN_BITS];
if (!nftl) return -EINVAL;
@@ -804,16 +808,16 @@
g.heads = nftl->heads;
g.sectors = nftl->sectors;
g.cylinders = nftl->cylinders;
- g.start = part_table[MINOR(inode->i_rdev)].start_sect;
+ g.start = part_table[minor(inode->i_rdev)].start_sect;
return copy_to_user((void *)arg, &g, sizeof g) ? -EFAULT : 0;
}
case BLKGETSIZE: /* Return device size */
- return put_user(part_table[MINOR(inode->i_rdev)].nr_sects,
+ return put_user(part_table[minor(inode->i_rdev)].nr_sects,
(unsigned long *) arg);
#ifdef BLKGETSIZE64
case BLKGETSIZE64:
- return put_user((u64)part_table[MINOR(inode->i_rdev)].nr_sects << 9,
+ return put_user((u64)part_table[minor(inode->i_rdev)].nr_sects << 9,
(u64 *)arg);
#endif
@@ -835,29 +839,33 @@
*/
p = (1<<NFTL_PARTN_BITS) - 1;
while (p-- > 0) {
- kdev_t devp = MKDEV(MAJOR(inode->i_dev), MINOR(inode->i_dev)+p);
+ kdev_t devp = MKDEV(major(inode->i_dev), minor(inode->i_dev)+p);
if (part_table[p].nr_sects > 0)
invalidate_device (devp, 1);
- part_table[MINOR(inode->i_dev)+p].start_sect = 0;
- part_table[MINOR(inode->i_dev)+p].nr_sects = 0;
+ part_table[minor(inode->i_dev)+p].start_sect = 0;
+ part_table[minor(inode->i_dev)+p].nr_sects = 0;
}
-#if LINUX_VERSION_CODE < 0x20328
- resetup_one_dev(&nftl_gendisk, MINOR(inode->i_rdev) >> NFTL_PARTN_BITS);
-#else
- grok_partitions(&nftl_gendisk, MINOR(inode->i_rdev) >> NFTL_PARTN_BITS,
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,28)
+ resetup_one_dev(&nftl_gendisk, minor(inode->i_rdev) >> NFTL_PARTN_BITS);
+#elseif LINUX_VERSION_CODE < KERNEL_VERSION(2.5.1)
+ grok_partitions(&nftl_gendisk, minor(inode->i_rdev) >> NFTL_PARTN_BITS,
1<<NFTL_PARTN_BITS, nftl->nr_sects);
+#else
+#error this does not support versions above 2.5.0 yet
#endif
return 0;
#if (LINUX_VERSION_CODE < 0x20303)
RO_IOCTLS(inode->i_rdev, arg); /* ref. linux/blk.h */
-#else
+#elseif LINUX_VERSION_CODE < KERNEL_VERSION(2.5.1)
case BLKROSET:
case BLKROGET:
case BLKSSZGET:
return blk_ioctl(inode->i_rdev, cmd, arg);
+#else
+#error does not support kernels above 2.5.0 yet
#endif
default:
@@ -886,7 +894,7 @@
(req->cmd == READ) ? "Read " : "Write",
req->sector, req->current_nr_sectors);
- dev = MINOR(req->rq_dev);
+ dev = minor(req->rq_dev);
block = req->sector;
nsect = req->current_nr_sectors;
buffer = req->buffer;
@@ -908,7 +916,7 @@
if (block + nsect > part_table[dev].nr_sects) {
/* access past the end of device */
printk("nftl%c%d: bad access: block = %d, count = %d\n",
- (MINOR(req->rq_dev)>>6)+'a', dev & 0xf, block, nsect);
+ (minor(req->rq_dev)>>6)+'a', dev & 0xf, block, nsect);
up(&nftl->mutex);
res = 0; /* fail */
goto repeat;
@@ -968,7 +976,7 @@
static int nftl_open(struct inode *ip, struct file *fp)
{
- int nftlnum = MINOR(ip->i_rdev) >> NFTL_PARTN_BITS;
+ int nftlnum = minor(ip->i_rdev) >> NFTL_PARTN_BITS;
struct NFTLrecord *thisNFTL;
thisNFTL = NFTLs[nftlnum];
@@ -1005,7 +1013,7 @@
{
struct NFTLrecord *thisNFTL;
- thisNFTL = NFTLs[MINOR(inode->i_rdev) / 16];
+ thisNFTL = NFTLs[minor(inode->i_rdev) / 16];
DEBUG(MTD_DEBUG_LEVEL2, "NFTL_release\n");
Index: drivers/mtd/chips/amd_flash.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/amd_flash.c,v
retrieving revision 1.17
diff -u -r1.17 amd_flash.c
--- drivers/mtd/chips/amd_flash.c 5 Mar 2002 17:00:37 -0000 1.17
+++ drivers/mtd/chips/amd_flash.c 4 Apr 2002 03:17:50 -0000
@@ -913,7 +913,7 @@
times_left = 500000;
while (times_left-- && flash_is_busy(map, adr, private->interleave)) {
- if (current->need_resched) {
+ if (need_resched()) {
spin_unlock_bh(chip->mutex);
schedule();
spin_lock_bh(chip->mutex);
@@ -1150,7 +1150,7 @@
/* Latency issues. Drop the lock, wait a while and retry */
spin_unlock_bh(chip->mutex);
- if (current->need_resched)
+ if (need_resched())
schedule();
else
udelay(1);
Index: drivers/mtd/devices/doc2000.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/doc2000.c,v
retrieving revision 1.46
diff -u -r1.46 doc2000.c
--- drivers/mtd/devices/doc2000.c 2 Oct 2001 15:05:13 -0000 1.46
+++ drivers/mtd/devices/doc2000.c 4 Apr 2002 03:17:53 -0000
@@ -97,7 +97,7 @@
DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
return -EIO;
}
- if (current->need_resched) {
+ if (need_resched()) {
set_current_state(TASK_UNINTERRUPTIBLE);
schedule_timeout(1);
}
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.30
diff -u -r1.30 cfi.h
--- include/linux/mtd/cfi.h 21 Feb 2002 08:27:43 -0000 1.30
+++ include/linux/mtd/cfi.h 4 Apr 2002 03:17:54 -0000
@@ -450,7 +450,7 @@
static inline void cfi_udelay(int us)
{
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
- if (current->need_resched) {
+ if (need_resched()) {
unsigned long t = us * HZ / 1000000;
if (t < 1)
t = 1;
