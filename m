Received: from mail.adb.com.ua ([193.105.30.103])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SStxt-000530-IX
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 17:49:18 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.adb.com.ua (Postfix) with ESMTP id A064F387260
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 20:42:53 +0300 (EEST)
Received: from mail.adb.com.ua ([127.0.0.1])
 by localhost (mail.adb.com.ua [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXSuF9sa14m9 for <linux-mtd@lists.infradead.org>;
 Fri, 11 May 2012 20:42:53 +0300 (EEST)
Received: from [192.168.23.7] (dmaluka.adb.ua [192.168.23.7])
 by mail.adb.com.ua (Postfix) with ESMTPS id 28FD538725F
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 20:42:53 +0300 (EEST)
Message-ID: <4FAD51B7.6010303@adbglobal.com>
Date: Fri, 11 May 2012 20:51:51 +0300
From: Dmitry Maluka <D.Maluka@adbglobal.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Missing offset increment in scan_read_raw_oob()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems there is a bug in scan_read_raw_oob() in nand_bbt.c which
should cause wrong functioning of NAND_BBT_SCANALLPAGES option.

Possible fix (relies on offs passed page-aligned):

--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -324,6 +324,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd,
uint8_t *buf, loff_t offs,
 
                buf += mtd->oobsize + mtd->writesize;
                len -= mtd->writesize;
+               offs += mtd->writesize;
        }
        return 0;
 }
