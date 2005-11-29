Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh7AU-0000hk-Nh
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 10:13:26 -0500
Date: Tue, 29 Nov 2005 18:06:59 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20051129180659.6f872e14.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH] MTD ioctl interface rework to get rid of
 MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this patch gets rid of MEMGETOOBSEL/MEMSETOOBSEL ioctls and introduces a new one (MEMGETOOBAVAIL).
As page layout is moving towards being an internal NAND layer knowledge, there's no need to let the user lavel apps change or read it. On the other hand, user level apps will need to know how many bytes long a free OOB area is for this particular flash type.
The patch for MTD utilities will be ready shortly.

Vitaly

diff -uNr linux-2.6.10.orig/drivers/mtd/mtdchar.c linux-2.6.10.nand/drivers/mtd/mtdchar.c
--- linux-2.6.10.orig/drivers/mtd/mtdchar.c	2005-11-24 15:58:37.000000000 +0300
+++ linux-2.6.10.nand/drivers/mtd/mtdchar.c	2005-11-28 16:40:40.000000000 +0300
@@ -520,16 +520,9 @@
 		break;
 	}
 
-	case MEMSETOOBSEL:
+	case MEMGETOOBAVAIL:
 	{
-		if (copy_from_user(&mtd->oobinfo, argp, sizeof(struct nand_oobinfo)))
-			return -EFAULT;
-		break;
-	}
-
-	case MEMGETOOBSEL:
-	{
-		if (copy_to_user(argp, &(mtd->oobinfo), sizeof(struct nand_oobinfo)))
+		if (copy_to_user(argp, &(mtd->oobavail), sizeof(mtd->oobavail)))
 			return -EFAULT;
 		break;
 	}
diff -uNr linux-2.6.10.orig/include/mtd/mtd-abi.h linux-2.6.10.nand/include/mtd/mtd-abi.h
--- linux-2.6.10.orig/include/mtd/mtd-abi.h	2005-11-24 15:58:49.000000000 +0300
+++ linux-2.6.10.nand/include/mtd/mtd-abi.h	2005-11-28 17:03:12.000000000 +0300
@@ -102,8 +102,7 @@
 #define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
 #define MEMGETREGIONCOUNT	_IOR('M', 7, int)
 #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
-#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
-#define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
+#define MEMGETOOBAVAIL		_IOR('M', 10, uint32_t)
 #define MEMGETBADBLOCK		_IOW('M', 11, loff_t)
 #define MEMSETBADBLOCK		_IOW('M', 12, loff_t)
 #define OTPSELECT		_IOR('M', 13, int)
