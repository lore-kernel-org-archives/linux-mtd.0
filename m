Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABh1N-0000qD-1S
	for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2003 21:52:57 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9KKppH04048
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2003 09:51:51 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9KKpp204042
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2003 09:51:51 +1300
Received: from tait.co.nz ([172.25.110.7])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HN2001O6PYDRY@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Tue, 21 Oct 2003 09:51:49 +1300 (NZDT)
Date: Tue, 21 Oct 2003 09:51:42 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F944ADE.70804@tait.co.nz>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_+uwBRTuBGzhOzp/YWIpuPg)"
Subject: [PATCH] Fix m28w320cb buffered write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Boundary_(ID_+uwBRTuBGzhOzp/YWIpuPg)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

Greetings

Looks like I was on the right lines - the CFI fixups that Stuart 
introduced just didn't go far enough!! The m28w320cb doesn't support 
buffered write (just like the m28w320ct doesn't) so a 2 line patch fixes 
it :-))

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand

--Boundary_(ID_+uwBRTuBGzhOzp/YWIpuPg)
Content-type: text/plain; name=mtd-patch
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=mtd-patch

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

--Boundary_(ID_+uwBRTuBGzhOzp/YWIpuPg)--
