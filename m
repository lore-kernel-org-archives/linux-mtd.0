Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AF8C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8602147C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qDUG0NME";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="1AlivkQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8602147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YSVen/GPW5c/vDJMqITEfCXUXjo6RtjNTQodKEqU+XY=; b=qDUG0NMEnzKf3BVJc5FTyCk9J2
	Dv9g0QPrFESkm6behNCtEcNWRLq0AQTOb81ow8WMoC1ZNXvHitKpO0mdm48b7QKGZmpJ0G8Pwf7xH
	ivFZYBLIvMWDddWXMjPrHxU2niOPISguil9eDpNW2lJzQJOfqXoz10yscGXcxWqBI+dNFzyWuY2JB
	j7wo9a4/vIEBVKmnqY8WJS0cWYI0oD3r38/hhns//XOg9re9BVXxnBe6Ii4qHIKBrgzUXV9CWnXKD
	Ck2qxx3qA+FRwvFW96OV4DuwEj+akNE3VkvtLGuZOKATPwk2SYIoFkgvrtIj/c6oKsB/O0H9vfsxL
	NNrtCu2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs1GB-0001RR-VW; Fri, 08 Feb 2019 08:11:44 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs1EF-0006jC-Ox
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 08:10:11 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x188902J007241;
 Fri, 8 Feb 2019 17:09:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x188902J007241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549613351;
 bh=4zRVCkg/JqYATaz8w/n52lDPh+nyy/86YNhKn3aIKXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1AlivkQeB0sqZjn/QVpg2ses5Md81TmQiFxy8v0qYX8DNda0iSLNKnKh/BdUGS/Ng
 PvioLXEseYNivXfAcgoozn/yul2ZYHBdVfoo42iXYIRSZZ4rhGwWF1e+0hfpPbyYW4
 LvhAIhhdgCAMvPTWnSuJ2M/shuqrOwZ09PyzljFReunCDc0Y30DXikWlqjXdsVZc2n
 M2d8BmpHSMUQNwiUp70osAcftlAbskNGvQIln1uPI9DtVe7qwLCZOenNFAik4vGTIo
 absSn3pdCamgM+dPVuZ+whP71kTt3gmkd2fm1CoIWiZZPwumXFnuodI9eETzo6nDea
 +qLQzggiCgelw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 10/11] mtd: rawnand: denali: remove DENALI_NR_BANKS macro
Date: Fri,  8 Feb 2019 17:08:54 +0900
Message-Id: <1549613335-30319-11-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_000944_632943_02235339 
X-CRM114-Status: GOOD (  10.19  )
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

Use the runtime-detected denali->nbanks instead of hard-coded
DENALI_NR_BANKS (=4).

The actual number of banks depends on the IP configuration, and
can be less than DENALI_NR_BANKS. It is pointless to touch
registers of unsupported banks.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 84dac9f..ce3a4bb 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -40,7 +40,6 @@
 #define DENALI_BANK(denali)	((denali)->active_bank << 24)
 
 #define DENALI_INVALID_BANK	-1
-#define DENALI_NR_BANKS		4
 
 static struct denali_chip *to_denali_chip(struct nand_chip *chip)
 {
@@ -92,7 +91,7 @@ static void denali_enable_irq(struct denali_controller *denali)
 {
 	int i;
 
-	for (i = 0; i < DENALI_NR_BANKS; i++)
+	for (i = 0; i < denali->nbanks; i++)
 		iowrite32(U32_MAX, denali->reg + INTR_EN(i));
 	iowrite32(GLOBAL_INT_EN_FLAG, denali->reg + GLOBAL_INT_ENABLE);
 }
@@ -101,7 +100,7 @@ static void denali_disable_irq(struct denali_controller *denali)
 {
 	int i;
 
-	for (i = 0; i < DENALI_NR_BANKS; i++)
+	for (i = 0; i < denali->nbanks; i++)
 		iowrite32(0, denali->reg + INTR_EN(i));
 	iowrite32(0, denali->reg + GLOBAL_INT_ENABLE);
 }
@@ -117,7 +116,7 @@ static void denali_clear_irq_all(struct denali_controller *denali)
 {
 	int i;
 
-	for (i = 0; i < DENALI_NR_BANKS; i++)
+	for (i = 0; i < denali->nbanks; i++)
 		denali_clear_irq(denali, i, U32_MAX);
 }
 
@@ -130,7 +129,7 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 
 	spin_lock(&denali->irq_lock);
 
-	for (i = 0; i < DENALI_NR_BANKS; i++) {
+	for (i = 0; i < denali->nbanks; i++) {
 		irq_stat = ioread32(denali->reg + INTR_STATUS(i));
 		if (irq_stat)
 			ret = IRQ_HANDLED;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
