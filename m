Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6942C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 02:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FB02065C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 02:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1EDYIcqJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastmail.com.au header.i=@fastmail.com.au header.b="AyfTriU1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pPBuCUBC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FB02065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=johnthomson.fastmail.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H0MnUTKRGROkMKITkpNICC/qnWidjO0t4lDqTX6y2xc=; b=1EDYIcqJNSalwwDa+SzBb7EPBj
	H7RVCpsp5+bs+DsBmm3cDLXbUNdu54A0VMnsLirHNOYetdX2HpZp8RTlCAO3xQmHfdCas0Kq358kP
	q4txED6yiuVB15dwflq9QRDlYQ+yjoc/M90j/9p8fLanRG5k1ublQutTiCbcG+TajIc9zN0iBRsj3
	RUSBsWDxUemgjcox15GHJ4hcmph84QRMlmpz1kUElwlLrJJFfYesTKQYzZ0GIa34eO1coff5Rh/UF
	i+v5ZDsByeCqU4uRQrWtbWYSLNuijoK2ttuo35SLhU04HK/QDEPzqjDRQ9eGPwRlsBmjPH80mv23Y
	6BJNGPOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5gbq-0006yW-28; Wed, 12 Aug 2020 02:35:22 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5gbi-0006y4-8C
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2020 02:35:15 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A59AB5C0099;
 Tue, 11 Aug 2020 22:35:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 Aug 2020 22:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=xsntqUSdoQ3/GvHjS+DbaHEDP8
 XdqpFpF8NRiTAzwWI=; b=AyfTriU1Xf/h7jMrrmZYJFB57j4YjF/bidZCr5hRNM
 Xc/Mqh3rx+TCH71BEoPukeKesCpdwI2k3w5laTaxnDeyw4asOWdT4Eo+zySMhS7K
 LPp/JFONg5vsI3v8Q2+BBz/Quw0VTChWT6Ob4RujblZpUuwgVLO1+7sNIF6kUuCR
 rLF15mq0t4RKyD+xAgv+YBqxzn1aEdhh/ubEbXtMDY0Em8yKK1LQbTQt/+TKRXz3
 VlVH4C8R8BybNG7ac5C2PxaCyFBYwBdMKkdNInxeLHuAGMDPzDjLzpwvuMJ01f84
 cOMazo8ToT1wfYu39oLBiJ5WzyP2LU3o0bBdSjq21epA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xsntqUSdoQ3/GvHjS
 +DbaHEDP8XdqpFpF8NRiTAzwWI=; b=pPBuCUBCQoZw4ujQlRdqCELHJckRRXDwL
 RJZdiJILtv0SX6D4ZghQzlVwOh//m0GgtMr21K2yIw1ZINGRlZAszpVUMrc8tI5Q
 3iaywx32pR4pJhN/05jY/DhIROSbjOraav3ol3NBfzA17RGC4bLkLXw6yzWTeK/9
 9qenEy8GrDR4e/NdsPkTpBKvmydc/EyxC/5BKOaVpIftHBdeIiSZJmOpIgU4je8L
 S0aGSomD7EiscyPfl9B+OduKvUJ+jrPwQxwURtAJ43s747AZFJGQ/Jzy+uwyWvT+
 38Ia1vsbnCJGDEGal41htUV24khPVUWeglzM2/yw99q86ny7Q/ARQ==
X-ME-Sender: <xms:WVUzXyXSP0osCqi9v0E2mR6D-lCRGQVbgza5kARqe3dQcjEKJhnuiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrledugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeflohhhnhcuvfhhohhmshhonhcuoehgihhtsehjohhhnhhthhhomhhs
 ohhnrdhfrghsthhmrghilhdrtghomhdrrghuqeenucggtffrrghtthgvrhhnpefffeeihf
 dukedtuedufeetieeuudfhhefhkefhtefgtdeuffekffelleetveduieenucfkphepheek
 rdduieehrddvheehrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepghhithesjhhohhhnthhhohhmshhonhdrfhgrshhtmhgrihhlrdgt
 ohhmrdgruh
X-ME-Proxy: <xmx:WVUzX-nTCwwqOtNPMOxYN2yhGr-ApWq02tK_IR9bXATs8q3ubgBX6w>
 <xmx:WVUzX2bomCHBLIRE4bEHjCEGwybOOCSlUr-uO17l5NOqySqVgGwI4Q>
 <xmx:WVUzX5UD0qVDU-h7yom-bBVsTNwN0jxQH6e2sLQjr-W1UURc4wP92A>
 <xmx:XlUzX4x8aBw-X_CY057IdjUArl-L3ZYvlsu-hsIW43oaHd-PzOrhzw>
Received: from john.thome.spur.red (unknown [58.165.255.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1FDDB30600B1;
 Tue, 11 Aug 2020 22:35:03 -0400 (EDT)
From: John Thomson <git@johnthomson.fastmail.com.au>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC] 5.4 spi-nor: allow uniform eraseregion device to try
 smallest erase
Date: Wed, 12 Aug 2020 12:34:42 +1000
Message-Id: <20200812023442.8748-1-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_223514_657727_AC025A3D 
X-CRM114-Status: GOOD (  20.15  )
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
Cc: John Thomson <git@johnthomson.fastmail.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allow a uniform erase region spi-nor device to test a requested erase
length, which is not cleanly divisible by the mtd device erasesize,
against the smallest supported erasesize of the device.
If this test is successful, use the multi_sectors path to calculate
and run a list of erase operations.

Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>

--

Hi linux-mtd

I am trying to get a 4K erase to work on a 64K erasesize
(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS unset) spi-nor device,
which has a uniform erase region.
I am using Linux 5.4 in OpenWrt. I am not sure how I would test
my changes against current Linux.
Is there common hardware, or software that would allow me to do this?

I do seem to get the result I want with this (5.4) patch,
but want to check how valid my changes are,
or if there is a better approach?

Any suggestions would be greatly appreciated!
Cheers
---
 drivers/mtd/spi-nor/spi-nor.c | 52 +++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f417fb680cd..480bf95d36e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1200,11 +1200,14 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 	LIST_HEAD(erase_list);
 	struct spi_nor_erase_command *cmd, *next;
 	int ret;
+	u8 previous_erase_opcode;
 
 	ret = spi_nor_init_erase_cmd_list(nor, &erase_list, addr, len);
 	if (ret)
 		return ret;
 
+	if (spi_nor_has_uniform_erase(nor))
+		previous_erase_opcode = nor->erase_opcode;
 	list_for_each_entry_safe(cmd, next, &erase_list, list) {
 		nor->erase_opcode = cmd->opcode;
 		while (cmd->count) {
@@ -1225,10 +1228,14 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 		kfree(cmd);
 	}
 
+	if (spi_nor_has_uniform_erase(nor))
+		nor->erase_opcode = previous_erase_opcode;
 	return 0;
 
 destroy_erase_cmd_list:
 	spi_nor_destroy_erase_cmd_list(&erase_list);
+	if (spi_nor_has_uniform_erase(nor))
+		nor->erase_opcode = previous_erase_opcode;
 	return ret;
 }
 
@@ -1239,17 +1246,37 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct spi_nor_erase_map *map = &nor->params.erase_map;
 	u32 addr, len;
 	uint32_t rem;
 	int ret;
+	uint32_t rem_minimum;
+	u8 i;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
 
-	if (spi_nor_has_uniform_erase(nor)) {
+	if (spi_nor_has_uniform_erase(nor))
 		div_u64_rem(instr->len, mtd->erasesize, &rem);
-		if (rem)
-			return -EINVAL;
+
+	/* Find the smallest set bit of uniform_erase_type, and
+	 * find out the erase size it uses.
+	 * Test the erase length is cleanly divisible by it.
+	 */
+	if (spi_nor_has_uniform_erase(nor) && rem) {
+		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+			if (map->erase_type[i].size == 0)
+				continue;
+			if (map->uniform_erase_type & BIT(i)) {
+				div_u64_rem(instr->len,
+					    map->erase_type[i].size,
+					    &rem_minimum);
+				if (rem_minimum)
+					return -EINVAL;
+				break;
+			} else if (i == SNOR_ERASE_TYPE_MAX - 1)
+				return -EINVAL;
+		}
 	}
 
 	addr = instr->addr;
@@ -1260,7 +1287,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return ret;
 
 	/* whole-chip erase? */
-	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
+	if (len == mtd->size &&
+	    !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE) &&
+	    !rem) {
 		unsigned long timeout;
 
 		write_enable(nor);
@@ -1289,7 +1318,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	 */
 
 	/* "sector"-at-a-time erase */
-	} else if (spi_nor_has_uniform_erase(nor)) {
+	} else if (spi_nor_has_uniform_erase(nor) && !rem) {
 		while (len) {
 			write_enable(nor);
 
@@ -4258,9 +4287,10 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
 	if (!erase)
 		return NULL;
 
-	/* Disable all other Sector Erase commands. */
-	map->uniform_erase_type &= ~SNOR_ERASE_TYPE_MASK;
-	map->uniform_erase_type |= BIT(erase - map->erase_type);
+	/* Disable all other Sector Erase commands.
+	 * map->uniform_erase_type &= ~SNOR_ERASE_TYPE_MASK;
+	 * map->uniform_erase_type |= BIT(erase - map->erase_type);
+	 */
 	return erase;
 }
 
@@ -4443,12 +4473,18 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
 	struct spi_nor_flash_parameter sfdp_params;
 
 	memcpy(&sfdp_params, &nor->params, sizeof(sfdp_params));
+	if (spi_nor_has_uniform_erase(nor))
+		nor->params.erase_map.regions = (
+			&nor->params.erase_map.uniform_region);
 
 	if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
 		nor->addr_width = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	} else {
 		memcpy(&nor->params, &sfdp_params, sizeof(nor->params));
+		if (spi_nor_has_uniform_erase(nor))
+			nor->params.erase_map.regions = (
+				&nor->params.erase_map.uniform_region);
 	}
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
