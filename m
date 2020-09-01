Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AD5C28E83
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71589206FA
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glItF4y7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKnX93uv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71589206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBsMDqE1XW/Ru1w6PtExjBT2qJBNKe9JbaSyyT3Q+XU=; b=glItF4y7CR/XN8GJ6WA2J2ozd6
	gN7A1hTrY6DplMymCTlKUqIugs1ekbE8wlYwvhy8+Wf3wpu2KYaRcxOCHFRPuEN5+izPSr/10IaCY
	3oHyqDt8Ad+F8pJ6gANppVyAi+tYz6jlC9vBQleQ1R7955/Y5RfjafgIgWQWcVvWohiqbbAz83JPC
	PraobZVNgMZbk8ei4fCNi5/+XrLRn9yeEnrWNkA94BdROy6h7QoCHE5jcTL37vc29SD0QbuLJlYOc
	RSWFbmtyhBx5ePYLu6NcEG7tCgV2cX6veBKwmV80DfyR0t8sS7QWc8yAmccpsW0wMwnSlLdVYQbrh
	qc9bUpvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8BR-0000p5-Tk; Tue, 01 Sep 2020 15:26:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8Aq-0000VO-9l; Tue, 01 Sep 2020 15:26:18 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FBF920BED;
 Tue,  1 Sep 2020 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598973974;
 bh=/DpnsDYOTLifmkSR22WSm4c/WFR7d9XLBURUx2xMS8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XKnX93uve3XqlI73tLoimAVhdyiQqbIfv9Xq9suG++RS6/kho7f1H4fsbKhV/KDEU
 WsYaHF6hQLc60mijBJdmrBPWkk5itKOpxsACHbcH6uMgZOyS5RRNG9mTPivi9Imn28
 868exXUwQ+zIu0c3PjbP1XZ/e9YV+n/GSpj2/5zQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] mtd: rawnand: marvell: Fix and update kerneldoc
Date: Tue,  1 Sep 2020 16:25:34 +0200
Message-Id: <20200901142535.12819-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901142535.12819-1-krzk@kernel.org>
References: <20200901142535.12819-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112616_558196_0CB19517 
X-CRM114-Status: GOOD (  18.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix kerneldoc comments and add missing documentation for members to fix
W=1 compile warnings like:

  drivers/mtd/nand/raw/marvell_nand.c:251: warning:
    cannot understand function prototype: 'struct marvell_hw_ecc_layout '

  drivers/mtd/nand/raw/marvell_nand.c:342: warning:
    Function parameter or member 'layout' not described in 'marvell_nand_chip'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 52cb7da2fc02..fbffbb3fcc1c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -227,6 +227,8 @@
 #define XTYPE_MASK		7
 
 /**
+ * struct marvell_hw_ecc_layout - layout of Marvell ECC
+ *
  * Marvell ECC engine works differently than the others, in order to limit the
  * size of the IP, hardware engineers chose to set a fixed strength at 16 bits
  * per subpage, and depending on a the desired strength needed by the NAND chip,
@@ -292,6 +294,8 @@ static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] = {
 };
 
 /**
+ * struct marvell_nand_chip_sel - CS line description
+ *
  * The Nand Flash Controller has up to 4 CE and 2 RB pins. The CE selection
  * is made by a field in NDCB0 register, and in another field in NDCB2 register.
  * The datasheet describes the logic with an error: ADDR5 field is once
@@ -312,14 +316,15 @@ struct marvell_nand_chip_sel {
 };
 
 /**
- * NAND chip structure: stores NAND chip device related information
+ * struct marvell_nand_chip - stores NAND chip device related information
  *
  * @chip:		Base NAND chip structure
  * @node:		Used to store NAND chips into a list
- * @layout		NAND layout when using hardware ECC
+ * @layout:		NAND layout when using hardware ECC
  * @ndcr:		Controller register value for this NAND chip
  * @ndtr0:		Timing registers 0 value for this NAND chip
  * @ndtr1:		Timing registers 1 value for this NAND chip
+ * @addr_cyc:		Amount of cycles needed to pass column address
  * @selected_die:	Current active CS
  * @nsels:		Number of CS lines required by the NAND chip
  * @sels:		Array of CS lines descriptions
@@ -349,7 +354,8 @@ static inline struct marvell_nand_chip_sel *to_nand_sel(struct marvell_nand_chip
 }
 
 /**
- * NAND controller capabilities for distinction between compatible strings
+ * struct marvell_nfc_caps - NAND controller capabilities for distinction
+ *                           between compatible strings
  *
  * @max_cs_nb:		Number of Chip Select lines available
  * @max_rb_nb:		Number of Ready/Busy lines available
@@ -372,7 +378,7 @@ struct marvell_nfc_caps {
 };
 
 /**
- * NAND controller structure: stores Marvell NAND controller information
+ * struct marvell_nfc - stores Marvell NAND controller information
  *
  * @controller:		Base controller structure
  * @dev:		Parent device (used to print error messages)
@@ -383,7 +389,9 @@ struct marvell_nfc_caps {
  * @assigned_cs:	Bitmask describing already assigned CS lines
  * @chips:		List containing all the NAND chips attached to
  *			this NAND controller
+ * @selected_chip:	Currently selected target chip
  * @caps:		NAND controller capabilities for each compatible string
+ * @use_dma:		Whetner DMA is used
  * @dma_chan:		DMA channel (NFCv1 only)
  * @dma_buf:		32-bit aligned buffer for DMA transfers (NFCv1 only)
  */
@@ -411,7 +419,8 @@ static inline struct marvell_nfc *to_marvell_nfc(struct nand_controller *ctrl)
 }
 
 /**
- * NAND controller timings expressed in NAND Controller clock cycles
+ * struct marvell_nfc_timings - NAND controller timings expressed in NAND
+ *                              Controller clock cycles
  *
  * @tRP:		ND_nRE pulse width
  * @tRH:		ND_nRE high duration
@@ -455,8 +464,8 @@ struct marvell_nfc_timings {
 						     period_ns))
 
 /**
- * NAND driver structure filled during the parsing of the ->exec_op() subop
- * subset of instructions.
+ * struct marvell_nfc_op - filled during the parsing of the ->exec_op()
+ *                         subop subset of instructions.
  *
  * @ndcb:		Array of values written to NDCBx registers
  * @cle_ale_delay_ns:	Optional delay after the last CMD or ADDR cycle
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
