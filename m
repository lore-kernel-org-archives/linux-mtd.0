Received: from cmailg2.svr.pol.co.uk ([195.92.195.172])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2vp1-0000Ll-1y
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 13:56:33 -0400
From: "Nick Bane" <nick@cecomputing.co.uk>
To: "yaffs list" <yaffs@toby-churchill.org>
Date: Thu, 2 Sep 2004 18:56:07 +0100
Message-ID: <IDEJKGNLJIGGPDGEHFGBKEADEBAA.nick@cecomputing.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0030_01C4911E.813E59D0"
Cc: "Balloon@Balloonboard.Org" <balloon@balloonboard.org>,
	"Linux-Mtd@Lists.Infradead.Org" <linux-mtd@lists.infradead.org>
Subject: yaffs update#2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0030_01C4911E.813E59D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi folks,

Some mods that get yaffs running properly on 2.6.8.1. The superblock =
name issue is now resolved.

For kernel integration examples in 2.4.25 and 2.6.8.1-tcl1, see trees at =
http://husaberg.toby-churchill.com/balloon/. I am also starting a cvs =
repository for 2.6 with viewcvs access not unlike the hh site.

There are moves afoot to submit yaffs to mainstream linux. All opinions =
about suitability/maturity welcome. The kernel mtd layer and yaffs_mtdif =
have now harmonised so now seems a good moment.

Non-yaffs: Current balloon board is supported in 2.6.8.1-tcl1 as is =
Mainstone (pxa270) though 2.6.9-rcx may superceed it.

Nick
cc mtd list, balloonboard list
-----------------------
Nick Bane
nick@cecomputing.co.uk
+44 (0)1954 719270=20

------=_NextPart_000_0030_01C4911E.813E59D0
Content-Type: application/octet-stream;
	name="diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="diff"

diff -urN yaffs-clean/yaffs_fs.c yaffs-2.6.8/yaffs_fs.c=0A=
--- yaffs-clean/yaffs_fs.c	Thu Nov 20 08:54:05 2003=0A=
+++ yaffs-2.6.8/yaffs_fs.c	Thu Sep  2 18:37:17 2004=0A=
@@ -52,7 +52,8 @@=0A=
 #include <asm/statfs.h>=0A=
 #define UnlockPage(p) unlock_page(p)=0A=
 #define Page_Uptodate(page)	test_bit(PG_uptodate, &(page)->flags)=0A=
-#define kdevname(x) cdevname(to_kdev_t(x))=0A=
+//#define kdevname(x) cdevname(to_kdev_t(x))=0A=
+//#define sbname(sb) sb->s_id	// temporary fix=0A=
 #else=0A=
 #include <linux/locks.h>=0A=
 #endif=0A=
@@ -582,7 +583,7 @@=0A=
 		inode->i_gid =3D obj->st_gid;=0A=
 		inode->i_blksize =3D inode->i_sb->s_blocksize;=0A=
 #if defined(CONFIG_KERNEL_2_5)=0A=
-		inode->i_rdev =3D to_kdev_t(obj->st_rdev);=0A=
+		inode->i_rdev =3D old_decode_dev(obj->st_rdev);=0A=
 		inode->i_atime.tv_sec =3D (time_t)(obj->st_atime);=0A=
 		inode->i_atime.tv_nsec =3D 0;=0A=
 		inode->i_mtime.tv_sec =3D (time_t)obj->st_mtime;=0A=
@@ -1241,10 +1242,14 @@=0A=
 		printk(KERN_INFO"yaffs: sb is NULL\n");=0A=
 	else if(!sb->s_dev)=0A=
 		printk(KERN_INFO"yaffs: sb->s_dev is NULL\n");=0A=
+#if defined(CONFIG_KERNEL_2_5)=0A=
+		printk(KERN_INFO"yaffs: dev is %d name is \"%s\"\n", sb->s_dev, =
sb->s_id);=0A=
+#else=0A=
 	else if(! kdevname(sb->s_dev))=0A=
 		printk(KERN_INFO"yaffs: kdevname is NULL\n");=0A=
 	else=0A=
 		printk(KERN_INFO"yaffs: dev is %d name is \"%s\"\n", sb->s_dev, =
kdevname(sb->s_dev));=0A=
+#endif=0A=
 =0A=
 	=0A=
 =0A=
@@ -1303,7 +1308,11 @@=0A=
 		struct mtd_info *mtd;=0A=
 		=0A=
 		printk(KERN_DEBUG "yaffs: Attempting MTD mount on %u.%u, \"%s\"\n",=0A=
+#if defined(CONFIG_KERNEL_2_5)=0A=
+		 MAJOR(sb->s_dev),MINOR(sb->s_dev),sb->s_id);=0A=
+#else=0A=
 		 MAJOR(sb->s_dev),MINOR(sb->s_dev),kdevname(sb->s_dev));=0A=
+#endif=0A=
 			=0A=
 		// Check it's an mtd device.....=0A=
 		if(MAJOR(sb->s_dev) !=3D MTD_BLOCK_MAJOR)=0A=
diff -urN yaffs-clean/yaffs_mtdif.c yaffs-2.6.8/yaffs_mtdif.c=0A=
--- yaffs-clean/yaffs_mtdif.c	Sun Jul 20 15:03:30 2003=0A=
+++ yaffs-2.6.8/yaffs_mtdif.c	Thu Sep  2 13:15:34 2004=0A=
@@ -31,6 +31,8 @@=0A=
 =0A=
 struct nand_oobinfo yaffs_oobinfo =3D {=0A=
 	useecc: 1,=0A=
+// this is for versions of mtd nand driver in kernel 2.6.8 and later=0A=
+	eccbytes: 6,=0A=
 	eccpos: {8, 9, 10, 13, 14, 15}=0A=
 };=0A=
 =0A=

------=_NextPart_000_0030_01C4911E.813E59D0--
