Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B50C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 04:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B659F2070D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 04:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYJHKise";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="zKFkzbQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B659F2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XBSTWyAeWicoVafmtaozkF1ybH5QU0Yf796gKPi2fGI=; b=kYJHKise45xH/D2vnmq6wpGLFp
	VRtrTmgLJIU/F/Je6rqhhnvwHn2lGWRSs2OjFiM0FbgNTUP/7hTvNFdJiDisqXXK6zV9DREv3W/Bn
	r+A/esqxcyeJ00ALbjrRIj+v/OPtnPwKlKQ/VE4r81CZRTdD5MLzpuqo35wcEih1DyFkmkytHx5f4
	gPzDs/WqdOQrCmxEX9EGp3cdSyHdW2T8IUnDBL7wEHiTxrFmNPp3piVuHbdn3ImIF8krRulmnsJ95
	rG3AAHUg+ZH5urnZVxf1A54xf/SRSC8MR4HmoF39/hB/6FrZ7lph/n1dXY4Q/J8Avv3w5WOwDSArR
	lVtU7Nnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBAea-0000Aq-AS; Tue, 02 Apr 2019 04:04:04 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBAeG-0008Cx-1H
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 04:03:46 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3243HaW021871;
 Tue, 2 Apr 2019 13:03:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3243HaW021871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1554177801;
 bh=hwp7B4epm8xIJuNf4RNloi2tLVuAeJkYxTUaLmMTjAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zKFkzbQf973zNpAcNfC6xUrmOYIx6eX8Lyp3shiPnIc6TRgl6dFbiBeLjbtBQJp63
 oDMP3VVXLDLUeI4GrBIVMjE9cFqGXuseluPq4Ocgd2cuSEQCK10lh8I2zFdpsnFXcz
 VCox/AXG1ZmcSjHDrooB37l5QkaFvouS6K/YAwpsG2T3/+HWr2zozZgQWkWMBgGBkG
 rHeqRgtuWsOzBlUdabAws4HyPHZWvqnusnukThIlLDMWwpgodZzp2LSqcIIhGtRUgj
 kY0k/HTTxgT75vpZ6T23kJ4MepkDRsq72ycDfP2DpljX6nRFyLhd1LHyjiMbZZ0T4c
 PrG12Qp+stCiA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 3/9] mtd: rawnand: denali: remove unneeded casts in
 denali_{read, write}_pio
Date: Tue,  2 Apr 2019 13:03:03 +0900
Message-Id: <1554177789-15414-4-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
References: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_210344_374661_E5E458E5 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since (u32 *) can accept an opaque pointer, the explicit casting
from (void *) to (u32 *) is redundant. Change the function argument type
to remove the casts.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 6a3520f..1422015 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -654,11 +654,10 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 	denali->host_write(denali, mode | 0x14000, 0x2400);
 }
 
-static int denali_pio_read(struct denali_nand_info *denali, void *buf,
+static int denali_pio_read(struct denali_nand_info *denali, u32 *buf,
 			   size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status, ecc_err_mask;
 	int i;
 
@@ -670,7 +669,7 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 	denali_reset_irq(denali);
 
 	for (i = 0; i < size / 4; i++)
-		*buf32++ = denali->host_read(denali, addr);
+		buf[i] = denali->host_read(denali, addr);
 
 	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
 	if (!(irq_status & INTR__PAGE_XFER_INC))
@@ -682,18 +681,17 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 	return irq_status & ecc_err_mask ? -EBADMSG : 0;
 }
 
-static int denali_pio_write(struct denali_nand_info *denali,
-			    const void *buf, size_t size, int page)
+static int denali_pio_write(struct denali_nand_info *denali, const u32 *buf,
+			    size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	const uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status;
 	int i;
 
 	denali_reset_irq(denali);
 
 	for (i = 0; i < size / 4; i++)
-		denali->host_write(denali, addr, *buf32++);
+		denali->host_write(denali, addr, buf[i]);
 
 	irq_status = denali_wait_for_irq(denali,
 				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
