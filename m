Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA59DC2F3A0
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 13:06:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 772E920861
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 13:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u8CWEeM0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="wXCI3GF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 772E920861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8vKSWJJxdAubic2Wvnbzgv4+cwXt89KnOAHhmoANWt8=; b=u8C
	WEeM0b5b5uEwXDbqW5lK50Kuhtf6cyX7M5BfJgUDYPGOcJh3UAVoQmH0VQK63BFTqoILPr0FR12uu
	MHpusKlOV87txgG9UX8hk5FL5sea2Cus2fJAFRGBkA2CL9l6FWz9PUHP24yfkLSsjmsz4tNlep2Mq
	TF3JjMj02hzxJ7fasVSXPcADCI++rBW1Z4TLjVqcF+Q8/laNuvGo3sI+N5JK5lruXsnXYmL1T2Gxa
	aTi54dTQ4L2SWJKPghKUN8tTMD4Qlg7Ydgl7F4yO8Qg8hColAfZkwGbc5vZbmbbOLtDzlJq/o5bQ8
	AkPL8+febA0lQqI7lXU/tCDR6oXPeSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glZHL-0007q9-Rc; Mon, 21 Jan 2019 13:06:15 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glZHI-0007po-MZ
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 13:06:14 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0LD5exQ027454;
 Mon, 21 Jan 2019 22:05:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0LD5exQ027454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548075941;
 bh=oDS6K478k8S9TuIPdGCS0e12SPNRa7vs+WnpfNLNJ18=;
 h=From:To:Cc:Subject:Date:From;
 b=wXCI3GF6HAanitgdyzFucM1iCB+qgXsVG5mMXCrqtHocFPjGYFN91iGSNnyR5Goph
 FuipL0/OXmon/BTB5PeReDS9a/F1UN6xu8cLrBaUoGA6YIr+CTk4JLXwtrlVyU39z4
 rQQD8Ml/CRJkECI4rgQ1tJcNuizXUYEYixqDNEmyzS6HvameSpqzklX2TN8k7JI2qP
 o6yLJwbwVga/1N+KoJTTCjObWjlpnKbnS1QW8o/m/Sp7SatvVnsjURI9+5WlvG/NKd
 QKTLUJ2hjMCWTP2wCVc/QAZbeldjWrbqXDR813seBx8bARje5IPUHU/PZ8oq8TkcOd
 Qac5lPE9EP05g==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: check return code of nand_reset() and
 nand_readid_op()
Date: Mon, 21 Jan 2019 22:05:34 +0900
Message-Id: <1548075934-19963-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_050613_086311_56D2F06E 
X-CRM114-Status: GOOD (  14.18  )
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

nand_scan_ident() iterates over maxchips to find as many homogeneous
chips as possible.

Currently, this loop bails out only when manufacturer or device ID
unmatches. The reason of unmatch is most likely no chip is connected
to that chip select. In this case, nand_reset() has already failed,
and the following nand_readid_op() is pointless.

Before ->exec_op hook was introduced, drivers had no way to tell
the failure of NAND_CMD_RESET to the framework because the legacy
->cmdfunc() has void return type. Now drivers implementing ->exec_op
hook can return the error code. You can save nand_readid_op() by
checking the return value of nand_reset(). The return value of
nand_readid_op() should be checked as well. If it fails, probably
id[0] and id[1] are undefined values.

Just for consistency, it should be sensible to check the return
code in nand_do_write_oob() as well.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/nand_base.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7ea3f10..3407523 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -457,7 +457,7 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int chipnr, page, status, len;
+	int chipnr, page, status, len, ret;
 
 	pr_debug("%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
@@ -479,7 +479,9 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 	 * if we don't do this. I have no clue why, but I seem to have 'fixed'
 	 * it in the doc2000 driver in August 1999.  dwmw2.
 	 */
-	nand_reset(chip, chipnr);
+	ret = nand_reset(chip, chipnr);
+	if (ret)
+		return ret;
 
 	nand_select_target(chip, chipnr);
 
@@ -5037,11 +5039,15 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 		u8 id[2];
 
 		/* See comment in nand_get_flash_type for reset */
-		nand_reset(chip, i);
+		ret = nand_reset(chip, i);
+		if (ret)
+			break;
 
 		nand_select_target(chip, i);
 		/* Send the command for reading device ID */
-		nand_readid_op(chip, 0, id, sizeof(id));
+		ret = nand_readid_op(chip, 0, id, sizeof(id));
+		if (ret)
+			break;
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != id[0] || nand_dev_id != id[1]) {
 			nand_deselect_target(chip);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
