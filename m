Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ei4w5-0002eE-Fo
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 02:02:30 -0500
Message-ID: <438FF17E.9080601@ru.mvista.com>
Date: Fri, 02 Dec 2005 10:02:22 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------050503050800070503010304"
Subject: [PATCH] [update] MTD ioctl interface rework to get rid of
	MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050503050800070503010304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

this patch gets rid of MEMGETOOBSEL/MEMSETOOBSEL ioctls and introduces a new one (MEMGETOOBAVAIL).
As page layout is moving towards being an internal NAND layer knowledge, there's no need to let the user lavel apps change or read it. On the other hand, user level apps will need to know how many bytes long a free OOB area is for this particular flash type.

The main difference with the previous patch
- no more reuse of old ioctl values

Vitaly


--------------050503050800070503010304
Content-Type: text/plain;
 name="mtd-nand-generic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-nand-generic.patch"

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
+++ linux-2.6.10.nand/include/mtd/mtd-abi.h	2005-11-30 16:35:24.972168568 +0300
@@ -102,14 +102,13 @@
 #define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
 #define MEMGETREGIONCOUNT	_IOR('M', 7, int)
 #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
-#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
-#define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
 #define MEMGETBADBLOCK		_IOW('M', 11, loff_t)
 #define MEMSETBADBLOCK		_IOW('M', 12, loff_t)
 #define OTPSELECT		_IOR('M', 13, int)
 #define OTPGETREGIONCOUNT	_IOW('M', 14, int)
 #define OTPGETREGIONINFO	_IOW('M', 15, struct otp_info)
 #define OTPLOCK		_IOR('M', 16, struct otp_info)
+#define MEMGETOOBAVAIL		_IOR('M', 16, uint32_t)
 
 struct nand_oobinfo {
 	uint32_t useecc;

--------------050503050800070503010304--
