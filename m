Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CE3C31D63
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 06:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E494A21773
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 06:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMZwxmJi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="BZDt5m8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E494A21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=p2ObmwWUMD3kBMeXqFB6T8j9+k/rEU6ksyM0YRaLJtk=; b=qMZ
	wxmJiDCXNv4vjngyFMWxvXvrWq94gZ+ni41UtiVu//dfzkl1ERyu2TuSfGraWTjMZ29shhVWOR1gn
	I31H+ZsqryEv49PTcJYTOVGjEWebWW/Jf37K/d5AVDTE6v8omOQVRvdAw3vjfdYZLtsTrfwRPamLX
	q/R8r+rHyHj5MEH32qN7vKFV79mF0Fs+OQz9MzJq2rCl8KRGa8lp2AKXlbfE9WaCpb4Csow4RXSOo
	QfxaaEnK79YkbYYfnkh/As+P52BBOdDz3bo/ft1uA3LknSLqg/VjGDQ6WKwuIoIxthj9kjQ/YX6HM
	zJatXhSwLCfbBD8w9HVeF3Y3iIIr3VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glT8P-0000Xz-HS; Mon, 21 Jan 2019 06:32:37 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glT8J-0000XX-CU
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 06:32:33 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x0L6WCPC003098;
 Mon, 21 Jan 2019 15:32:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x0L6WCPC003098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548052333;
 bh=qrh/ZcVeEBRczMZx/DNnPsCU/3ppDsvTOZXlUv3uS90=;
 h=From:To:Cc:Subject:Date:From;
 b=BZDt5m8ZX+oGTcNyNLj6dly8ZyqgwpbvGocWGu5X8myzZosRQGKmXE5hp+6CFcyKG
 sjovxM/VtDF+Pqe3U4dDOQ7JDYm/cKuuoLElr4hb36/B3w2Rn1avvFPB8jesJzrEbU
 enEuwao6qwfXcErDo18UjbMFYRaCQVQQ8yHVsb7S4yIkJ5RvcRFRKg5fj6oKNoVnVg
 2CXMYsZuKTCMMJlBJRKFqZTlXMZj/2bW8AmABLpwuui0EwyEa5DsEbiYZLVPu7iVAf
 xTWhyFyiTdx6DANV8NzwxZHAnnK+4VVG5qwIk+TjPcfA3SNu275K658A7MzyNA7xqT
 j/BgSva9Sjv+w==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: rawnand: remove ->legacy.erase and single_erase()
Date: Mon, 21 Jan 2019 15:32:07 +0900
Message-Id: <1548052327-26483-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_223231_655670_813084FF 
X-CRM114-Status: GOOD (  15.01  )
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

Now that the last user of this hook, denali.c, stopped using it,
we can remove the erase hook from nand_legacy.

I squashed single_erase() because only the difference between
single_erase() and nand_erase_op() is the number of bit shifts.

The status/ret conversion in nand_erase_nand() is unneeded since
commit eb94555e9e97 ("mtd: nand: use usual return values for the
->erase() hook"). Cleaned it up now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This depends on the denali patch:
http://patchwork.ozlabs.org/patch/1028264/


Changes in v2:
  - I noticed the masking by chip->pagemask is still needed

 drivers/mtd/nand/raw/nand_base.c | 31 ++++---------------------------
 include/linux/mtd/rawnand.h      |  2 --
 2 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index cca4b24..7ea3f10 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4155,23 +4155,6 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 }
 
 /**
- * single_erase - [GENERIC] NAND standard block erase command function
- * @chip: NAND chip object
- * @page: the page address of the block which will be erased
- *
- * Standard erase command for NAND chips. Returns NAND status.
- */
-static int single_erase(struct nand_chip *chip, int page)
-{
-	unsigned int eraseblock;
-
-	/* Send commands to erase a block */
-	eraseblock = page >> (chip->phys_erase_shift - chip->page_shift);
-
-	return nand_erase_op(chip, eraseblock);
-}
-
-/**
  * nand_erase - [MTD Interface] erase block(s)
  * @mtd: MTD device structure
  * @instr: erase instruction
@@ -4194,7 +4177,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt)
 {
-	int page, status, pages_per_block, ret, chipnr;
+	int page, pages_per_block, ret, chipnr;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -4246,17 +4229,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    (page + pages_per_block))
 			chip->pagebuf = -1;
 
-		if (chip->legacy.erase)
-			status = chip->legacy.erase(chip,
-						    page & chip->pagemask);
-		else
-			status = single_erase(chip, page & chip->pagemask);
-
-		/* See if block erase succeeded */
-		if (status) {
+		ret = nand_erase_op(chip, (page & chip->pagemask) >>
+				    (chip->phys_erase_shift - chip->page_shift));
+		if (ret) {
 			pr_debug("%s: failed erase, page 0x%08x\n",
 					__func__, page);
-			ret = -EIO;
 			instr->fail_addr =
 				((loff_t)page << chip->page_shift);
 			goto erase_exit;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 33e240a..5e37534 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -936,7 +936,6 @@ static inline void nand_controller_init(struct nand_controller *nfc)
  * @waitfunc: hardware specific function for wait on ready.
  * @block_bad: check if a block is bad, using OOB markers
  * @block_markbad: mark a block bad
- * @erase: erase function
  * @set_features: set the NAND chip features
  * @get_features: get the NAND chip features
  * @chip_delay: chip dependent delay for transferring data from array to read
@@ -962,7 +961,6 @@ struct nand_legacy {
 	int (*waitfunc)(struct nand_chip *chip);
 	int (*block_bad)(struct nand_chip *chip, loff_t ofs);
 	int (*block_markbad)(struct nand_chip *chip, loff_t ofs);
-	int (*erase)(struct nand_chip *chip, int page);
 	int (*set_features)(struct nand_chip *chip, int feature_addr,
 			    u8 *subfeature_para);
 	int (*get_features)(struct nand_chip *chip, int feature_addr,
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
