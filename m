Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Atens-0001D5-Hl
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 03:24:44 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i1J3Ogh11060
	for <linux-mtd@lists.infradead.org>; Thu, 19 Feb 2004 16:24:42 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i1J3Og911053
	for <linux-mtd@lists.infradead.org>; Thu, 19 Feb 2004 16:24:42 +1300
Received: from tait.co.nz ([172.25.107.91])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HTB00MCAAT08C@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 16:24:36 +1300 (NZDT)
Date: Thu, 19 Feb 2004 16:24:25 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <40342C69.9050100@tait.co.nz>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_XBDFK90AUSg0r2o0reWdcQ)"
Subject: [PATCH] no buffered write in m28w320cb
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Boundary_(ID_XBDFK90AUSg0r2o0reWdcQ)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

Like the m28w320ct, the m28w320cb does not support buffer writes.

This patch to cfi_cmdset_0001.c treats them the same by disabling the 
timeout value for m28w320cb devices to turn off the buffered write feature.

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand

--Boundary_(ID_XBDFK90AUSg0r2o0reWdcQ)
Content-type: text/plain; name=cfi_cmdset_0001.diff
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=cfi_cmdset_0001.diff

diff -purN /home/gilksr/mtd/drivers/mtd/chips/cfi_cmdset_0001.c /home/packages/mtd/drivers/mtd/chips/cfi_cmdset_0001.c
--- /home/gilksr/mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2003-08-12 10:00:05.000000000 +1200
+++ /home/packages/mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2003-10-17 16:53:47.000000000 +1300
@@ -147,6 +147,8 @@ static void fixup_st_m28w320cb(struct ma
 	/* Note this is done after the region info is endian swapped */
 	cfi->cfiq->EraseRegionInfo[1] =
 		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
+	cfi->cfiq->BufWriteTimeoutTyp = 0;	/* Not supported */
+	cfi->cfiq->BufWriteTimeoutMax = 0;	/* Not supported */
 };
 
 static struct cfi_fixup fixup_table[] = {

--Boundary_(ID_XBDFK90AUSg0r2o0reWdcQ)--
