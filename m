Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DB1C31D64
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 04:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B317B217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 04:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfTu9ZYL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="YruTm/4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B317B217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5phU4snyc3PKZ1sTI7HhgIiS+T7tGKE17VjIgFIWdFM=; b=VfT
	u9ZYLBcylfgcZ8tG77cXfRJP4eu6V2GeQNWPwRuJ7hlOWCKCxlern+trlYc2UxMZP9/XfAdAvJdOX
	RTXnDnAH904NtrMFHc/jBRNASx6aeMAm3E14Ux0mzm/ugf0NMXj9Tu+oqqzVdXL6DqtZRjtnEULwU
	PYCTl/QPJXLaS6GOiRzVLYS4/wKDJsjpnqD9tj7RaY/t26MUWVgIPsP+d5aKUiq0+yq+tUn3gSU7c
	xoKHTPVrYWdmPE127nTzGLX+T8TDZIHL9P1B8n/6qOau2sAbnzNu9Q6k/GDDMRTCv2IrTdZ8v3PfK
	ftNOs039guR9uJcZ4V0LNtX2SdKGekA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glRZc-0005ZP-1t; Mon, 21 Jan 2019 04:52:36 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glRZZ-0005Yx-0k
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 04:52:34 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x0L4qBI2028292;
 Mon, 21 Jan 2019 13:52:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x0L4qBI2028292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548046332;
 bh=hNK5faw4hFSOBOK912B0tZ/yjjxR6feiPy2LU0UJiOE=;
 h=From:To:Cc:Subject:Date:From;
 b=YruTm/4N0JaW1TJ5H8MfRo+phnImsq6kZw3VDa9/YmoRBEo0Zsq5qmZegsFCO+ujE
 Qgepzvu2Qbj9D9pXR3jnjp41C9O+1ppQhq6u+tAD+M11JRcGvgBDU7ROdxWoFA966Y
 p+dPFuIn7QAeB31VGkgT9/ywm/loqX3SZnH3Qtn8fw5TKjIWsm5IPTQ8Pxsn2q2CYi
 i4H5FtujPIFalAqszEEOucZncKPdOQ/A5KHkgAnyM0b4YLfbliuKKxMSGYqIFRGoCH
 +XhwoeqStvbubOPa3F1HbpdaZzPteEGJiLrowdmp3/5hcR3ij/nFB6eMSh5I1uAYws
 6Y9NCsIVc2SZw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: denali: remove ->erase hook
Date: Mon, 21 Jan 2019 13:52:06 +0900
Message-Id: <1548046326-26776-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_205233_397879_2A2E67D9 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit f9ebd1bb4103 ("mtd: rawnand: Deprecate ->erase()") discouraged
the use of this hook, so I am happy to follow the suggestion.

Although the Denali IP provides a special MAP10 command for erasing,
using it would not buy us much. The Denali IP actually works with the
generic erasing by single_erase() + ->cmdfunc hook (nand_command_lp)
+ ->cmd_ctrl hook (denali_cmd_ctrl).

This method is also deprecated, but denali_erase() can go away
irrespective of ->exec_op conversion.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 6e8edc9..21320b1 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -37,9 +37,6 @@
 #define DENALI_MAP11_ADDR	((DENALI_MAP11) | 1)	/* address cycle */
 #define DENALI_MAP11_DATA	((DENALI_MAP11) | 2)	/* data cycle */
 
-/* MAP10 commands */
-#define DENALI_ERASE		0x01
-
 #define DENALI_BANK(denali)	((denali)->active_bank << 24)
 
 #define DENALI_INVALID_BANK	-1
@@ -903,23 +900,6 @@ static int denali_waitfunc(struct nand_chip *chip)
 	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;
 }
 
-static int denali_erase(struct nand_chip *chip, int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-	uint32_t irq_status;
-
-	denali_reset_irq(denali);
-
-	denali->host_write(denali, DENALI_MAP10 | DENALI_BANK(denali) | page,
-			   DENALI_ERASE);
-
-	/* wait for erase to complete or failure to occur */
-	irq_status = denali_wait_for_irq(denali,
-					 INTR__ERASE_COMP | INTR__ERASE_FAIL);
-
-	return irq_status & INTR__ERASE_COMP ? 0 : -EIO;
-}
-
 static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 				       const struct nand_data_interface *conf)
 {
@@ -1244,7 +1224,6 @@ static int denali_attach_chip(struct nand_chip *chip)
 	chip->ecc.write_page_raw = denali_write_page_raw;
 	chip->ecc.read_oob = denali_read_oob;
 	chip->ecc.write_oob = denali_write_oob;
-	chip->legacy.erase = denali_erase;
 
 	ret = denali_multidev_fixup(denali);
 	if (ret)
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
