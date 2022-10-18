Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4447C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mac2hBWNmIWEkgvXSAS2jpuiWXxw+NqppWvWnWRqDFQ=; b=diQb3Y/1uTGD2e
	vYO+WGMixlepn59QfYHND3LffUsyNm9KYsIchUBmMaS67LSokACld3cNo+qnFHZvzm6y6DYpzOwSX
	SxIOGqyNGa+7FM9dupfyP2NpcypxBh9Jm/OExq4mued2VPdghiofbkJ6Oy55vbepVr1jnqpHw88/z
	x0WITvLsOJZf/t49ly6KfxI3TT3qt709n84HgFV927HFCuKpIbXDtEBWa+bgayHAAYP/rky7JILEh
	oiwfmcGOJjDSaBZVJp1kYpOzG+yYf6k57ZvJ7AQRUbNkoDkrx3erdBTbBmOUGMTDMMs2nxrZO8Kmz
	CQUJEVMWBm7iWkqMaT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiT6-004dJ2-Do; Tue, 18 Oct 2022 09:01:00 +0000
Received: from esa1.hc353-39.eu.iphmx.com ([207.54.70.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiT2-004dBV-OQ
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sequans.com; i=@sequans.com; l=4603; q=dns/txt;
  s=corp; t=1666083656; x=1697619656;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SCV5+YDGx/hX+pF9GIqAAK8y0Gok/vyrEY5p1TYXH0o=;
  b=SXQiMYfBtnmrLg7jodfD14uAZ1BXFVroncPLf9FZjD78+8iD+BZJUCFm
   ArPd+oda3y5kc5/47fxQUz8tURbG7e3vbtNCuypUn07La7MjXNQa6q8nF
   DJlcQj3OwinYTPySzyEKIs2dHpwQYs4XWK969JObvz6m5a1SIabr5glKb
   Q=;
X-IPAS-Result: =?us-ascii?q?A2FMAQDBaU5jl5bSIB9agliDLoFYA5VinR6BcwkLAQEBA?=
 =?us-ascii?q?QEBAQEBCSwNCQQFBIR+hG8nNQgOAQIEAQEBAQMCAwEBAQEBAQMBAQEFAQEBA?=
 =?us-ascii?q?QEBBgIBAQEBAhABAQEBAQEBATYFEDWFLzkNgjUifIEIAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBARYCDVJpAQQmCwFGgQk/CYJ9AYMgE6ATAYwZM4EBg1ABhE2BYAaBP?=
 =?us-ascii?q?Yp9hXmBSUSCUYIsgmIFiBoEkg+JEgMJAwcFSUADCxgNFjMYAxQDBSEHAxkPI?=
 =?us-ascii?q?w0NBB0MAwMFJQMCAhsHAgIDAgYTBQICNRg0CAQIBCskDwUCBy8FBC8CHgQFB?=
 =?us-ascii?q?hEIAhYCBgQEBAQVAhAIAggmFwcTMxkBBVkOCSEcKA0FBhMDIG8FBzsPKC9pK?=
 =?us-ascii?q?xwbB4EMKigVAwQEAwIGEwMiAg0pMRQEKRMPLQcjcQkCAyJqAwMEKCwDCSEfB?=
 =?us-ascii?q?yUkPAdYOgUDAhAiPAYDCQMCIll1MBIUBQMNFyUIBTcaBAg8AgUGUhICChEDE?=
 =?us-ascii?q?g8tSA9KPjkWBidFATYPDhoDm1WCGAEwXSwgMIFtPcIDg2qLQo0Gh2BMg3aSf?=
 =?us-ascii?q?jmRYpcZi1KBb5RKgRiEITCBQCQCghJNI1CCMwEBATFRGQ+OOYhthUxzAgE4A?=
 =?us-ascii?q?gYLAQEDCYpCAQE?=
IronPort-PHdr: A9a23:XiMpNxwIRMQZwnvXCzL6zVBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 heZvqQ0xweZFazgqNt8w9LMtK7hXWFSqb2gi1slNKJ2ahkelM8NlBYhCsPWQWfyLfrtcjBoV
 J8aDAwt8H60K1VaF9jjbFPOvHKy8SQSGhLiPgZpO+j5AIHfg9q52uyo9ZDeZxhEiDWhbb5xM
 R67sRjfus4KjIV4N60/0AHJonxGe+RXwWNnO1eelAvi68mz4ZBu7T1et+ou+MBcX6r6eb84T
 aFDAzQ9L281/szrugLdQgaJ+3ART38ZkhtMAwjC8RH6QpL8uTb0u+ZhxCWXO9D9QLYpUjqg8
 qhrUgflhicZOTMn7W/ZhM9+gqVUrxyuvBFz343ZbZuJOPdkYq/RYdUXTndBUMZLUCxBB5uxY
 IQVAOoFI+lYqZX9p1oIrRCjAAesA/nvxSFOhnDt2a060vghGhzB0Qw+HNIOt27Uo8vzNKgJV
 eC1zbXIwC7Yb/xIwDf99ZLHchY6of2WQb1wds/RxFApGgjYgVqetZbrMCmJ1uQRrWeb9exgW
 PqshmMktw19vziiyMcwh4TVmo4YxEzI+CF9zYs3ONC2SEF2bN+rHZZRqyyXKYp7TMwmTmx2u
 Ss21LIItJy0cSUJzpks2hDRa/uCc4eS4xLjUv6cLStliH5/f7K/nRmy/E69weP/Tsm5yFhHo
 jdfntTCqHwBzQLf5tWbRvdn40us2SqD2gbO4e9eO080j7DUK5s5z741kZocrFrMEzftmEXzk
 K+WbkIk+vW06+j/YrXpuJucN4hshwD/M6Qun9ewAf4iPQQURGiU5/281KD58k3/W7VGlOE5k
 q7csJzCJMQboLC2AxNN34st9hqzFTmr3MoCkXUZMV5JZAiLg5XpNl3SOPz4CO2wg1WokDdl3
 fDGObjhD43TLnjAl7fhZ6hy60hHxwo3zNBf+4lZCqofL/LqR0/+rtrYDgQjPwOoxObnDc1x1
 oUFVm2XGK+WLLvSsUOU5uIoO+SBa5cZuCzhJPg9+/7ukXg5lEcHcqmz25sYdWu1Ee58I0Wff
 HXjmc0NHnoUsQYmVuzllEWCUSJPZ3a1R6884zA7CJu7DYjdQoChmqaB0z27H51QfG9GDkuBH
 mzvd4WDR/cMbCOSIsl7njMYUrihTpct1Quyuw/i17pnMu3U9zUctZLi0th1+uLSmQg39TxoE
 suQyGWNT2BvnmMUXD86xqF/oUpzyleZy6d3nuJXGsZO6P9TVQc6L5Hcw/RgC9/uQgLBYsuJS
 FG+T9SmHz49VN0ww94IY0ZyB9qijg7M3yyxDr4Ui7yEGoY4/b7b33j0Pcpy13DGh+EdiAwiQ
 81SJSijmqJX8wnIG5WPkkOXja+meK0QminX+zSt122L6X9RVAN2TaTDFVMYfEbQp9D4+guWU
 bypE7khOA9A1eaZJ7JXY9vyy15BQaGwa5zlf2utljLoVl6zzbSWYd+yE1g=
IronPort-Data: A9a23:6HaJbKB7ajtRFRVW/8vjw5YqxClBgxIJ4kV8jS/XYbTApGkq1T1Wn
 WQcD2rUPfyPYmrweYwjPdiz908CsJKGyNVrTANkpHpgZkwTlceUXt7xwmUcns+xBp2YHBI5t
 5V2hv3odp1coqr0/0/1WlTHhSckjfngqp3UV7KfZUidfSc9FGF7z0oLd9cR2uZAmcK+Dx6Gp
 eT8qsjePE7N8zNvOycf5rnrRClH5ZwegxtF+A1jDRx3lAWGzSNMVMtPffjZw0bQG+G4IMbrH
 44v85nkpgs1zz91Yvu5n7DydFE9Q7K6FWBiXVIPBsBOKjAbzsAD+v5T2Mg0MC+7uB3Q9zxF8
 +ihgLTpIesfFvOTwbxNA0cEe81JFfQuFLfveRBTuOTJnx2eKxMAyd03ZK09FdRwFupfXjsWr
 ZT0gd3CB/yOr7ve/V61dgVjrs4KLM7VI4Athk1t9Q7QC/o/ZKrRYqqfsLe03B9o7ixPNeTfY
 sADYHx0YQ3dahtUfFwQDfrSns/z3z+kKXsC8QrT/Pdvi4TQ5FUZPLzFLtnSYNGMT8FUgm6Dq
 3vb9mLiRBodMbRzzBLZrCj237+Q9c/9cK0CP7KZ5tVruQyemTAVVz8VCEaEr8Ds3yZSXPoFc
 RVOoULCt5Ma/VatQvH0RRu0qjiIs3Y0XttJDuA+rhuE26zd5y6TAW8YSj9HLtchsaceQT0sy
 0/Mms/lLThuq6GOD3Ob+K2doT67NW4SN2BqTT4JCxsE5dbooIw1pgDTQ5BoF6vzhdudJN3r6
 yKLqSIkjvMIgNcW3qOgu1vAhlpAu6QlUCY/zwXQYH2m3D9Fabaaboqk8H3h/9dPedPxoka6g
 JQUpySPxLlQU8/VyXzdEbtl8KKBu6bUbG2A6bJ7N8N7qm32k5K2VdoIiAySMnuFJe4qQ1cFi
 mf6owxc4oNeIXquBUOcS9PsUpxypUQMPX8DUv2RYtcLTIJ4cgSKlByChHJ8PEi0wSDAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkUr/iuPCPy7NFe5t3L6yggYRsvrsTOL9r
 Y83Cid240o3vBDWPXGGqtNLcTjm01BiWM+t8KS7idJv0iI8Qjh7UJc9MJsrfJF0kLlYja/U8
 3WwUUhdoGcTdlWZQThmnktLMeu1Nb4m9CpTFXV1bT6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU57dWK8RE2SeoG51gFuUhNUKSSlHTDmmZ0KNCAXTtbY5L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:WFl9hKEyfgT4ZjQ1pLqE/8eALOsnbusQ8zAXPo5KKSC9Ffbo8f
 xG885rtyMc5Ax+ZJhCo6HmBED/ewK4yXcd2+B4VtrPMzUO01HYT72Kg7GC/9SZIVybygeD78
 1dT5Q=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="4622187"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Virus-Scanned: amavisd-new at sequans.com
From: Valentin Korenblit <vkorenblit@sequans.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	arnd@arndb.de,
	ye.xingchen@zte.com.cn,
	Valentin Korenblit <vkorenblit@sequans.com>
Subject: [PATCH v3] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Tue, 18 Oct 2022 11:00:45 +0200
Message-Id: <20221018090045.10268-1-vkorenblit@sequans.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020057_242967_EB1BED0E 
X-CRM114-Status: GOOD (  15.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.

Check dma capabilities before reading/writing from/to sdma interface.

Link to discussion:
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B/

Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>

---

Changes v1 -> v2:
	- Replaced ioread64_rep by cadence_nand_readsq (suggested by Arnd)
	- Replaced iowrite64_rep by cadence_nand_writesq (suggested by Arnd)
	- Do not try to access 64-bit sdma if __raw_readq/__raw_writeq are not defined

Changes v2 -> v3:
	- Use readsq/writesq on 64-bit architectures (Arnd)
	- Detect issue on init instead of 1st transfer
---
 .../mtd/nand/raw/cadence-nand-controller.c    | 70 +++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 9dac3ca69d57..7661a5cf1883 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1184,6 +1184,14 @@ static int cadence_nand_hw_init(struct cdns_nand_ctrl *cdns_ctrl)
 	if (cadence_nand_read_bch_caps(cdns_ctrl))
 		return -EIO;
 
+#ifndef CONFIG_64BIT
+	if (cdns_ctrl->caps2.data_dma_width == 8) {
+		dev_err(cdns_ctrl->dev,
+			"cannot access 64-bit dma on !64-bit architectures");
+		return -EIO;
+	}
+#endif
+
 	/*
 	 * Set IO width access to 8.
 	 * It is because during SW device discovering width access
@@ -1882,17 +1890,36 @@ static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return status;
 
 	if (!cdns_ctrl->caps1->has_dma) {
-		int len_in_words = len >> 2;
+		u8 data_dma_width = cdns_ctrl->caps2.data_dma_width;
+
+		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
 
 		/* read alingment data */
-		ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+		if (data_dma_width == 4)
+			ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+#ifdef CONFIG_64BIT
+		else
+			readsq(cdns_ctrl->io.virt, buf, len_in_words);
+#endif
+
 		if (sdma_size > len) {
+			int read_bytes = (data_dma_width == 4) ?
+				len_in_words << 2 : len_in_words << 3;
+
 			/* read rest data from slave DMA interface if any */
-			ioread32_rep(cdns_ctrl->io.virt, cdns_ctrl->buf,
-				     sdma_size / 4 - len_in_words);
+			if (data_dma_width == 4)
+				ioread32_rep(cdns_ctrl->io.virt,
+					     cdns_ctrl->buf,
+					     sdma_size / 4 - len_in_words);
+#ifdef CONFIG_64BIT
+			else
+				readsq(cdns_ctrl->io.virt, cdns_ctrl->buf,
+				       sdma_size / 8 - len_in_words);
+#endif
+
 			/* copy rest of data */
-			memcpy(buf + (len_in_words << 2), cdns_ctrl->buf,
-			       len - (len_in_words << 2));
+			memcpy(buf + read_bytes, cdns_ctrl->buf,
+			       len - read_bytes);
 		}
 		return 0;
 	}
@@ -1936,16 +1963,35 @@ static int cadence_nand_write_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return status;
 
 	if (!cdns_ctrl->caps1->has_dma) {
-		int len_in_words = len >> 2;
+		u8 data_dma_width = cdns_ctrl->caps2.data_dma_width;
+
+		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
+
+		if (data_dma_width == 4)
+			iowrite32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+#ifdef CONFIG_64BIT
+		else
+			writesq(cdns_ctrl->io.virt, buf, len_in_words);
+#endif
 
-		iowrite32_rep(cdns_ctrl->io.virt, buf, len_in_words);
 		if (sdma_size > len) {
+			int written_bytes = (data_dma_width == 4) ?
+				len_in_words << 2 : len_in_words << 3;
+
 			/* copy rest of data */
-			memcpy(cdns_ctrl->buf, buf + (len_in_words << 2),
-			       len - (len_in_words << 2));
+			memcpy(cdns_ctrl->buf, buf + written_bytes,
+			       len - written_bytes);
+
 			/* write all expected by nand controller data */
-			iowrite32_rep(cdns_ctrl->io.virt, cdns_ctrl->buf,
-				      sdma_size / 4 - len_in_words);
+			if (data_dma_width == 4)
+				iowrite32_rep(cdns_ctrl->io.virt,
+					      cdns_ctrl->buf,
+					      sdma_size / 4 - len_in_words);
+#ifdef CONFIG_64BIT
+			else
+				writesq(cdns_ctrl->io.virt, cdns_ctrl->buf,
+					sdma_size / 8 - len_in_words);
+#endif
 		}
 
 		return 0;
-- 
2.20.1

-- IMPORTANT NOTICE:



The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.



Thank you.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
