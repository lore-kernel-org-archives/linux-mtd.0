Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF97C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WgEuapF8Eif3+Y+k2d2pj6TG9ctzt34lHaObxJGxYTc=; b=2AGwIok7JES65i
	zNdXEleK+NQe/Vymos3YChcZ2XVzB/H4+4dvdYzqUTvjLbaNUGkDouHNfDH2oC7NGp7fzlbynsFgw
	SKIMw2mWuN/8QcZ2rqJNZjeohAN8s48pVn1Rmn7T+1feWLsx/TFQXgGjetY2/iA1rSk7Nrt9Kc6xj
	GogfE1FHg5UVLXiLp6JxYcYwnMUpKqcqSR0GU13aNc/5szfV9Vy6vhx9UmjzKetZwmhf2cgap9g1n
	WjJzteUpOEa9Hu8n8snOwFp1ry8Le4kMmSC/dRxWjVBBlQmZmA6goR2/3/DpjpWYDibRpKOJlozLC
	KJQF7i860PDU2ZR1iIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiiI-004ois-Al; Tue, 18 Oct 2022 09:16:42 +0000
Received: from esa2.hc353-39.eu.iphmx.com ([207.54.65.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiiF-004oe9-BY
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sequans.com; i=@sequans.com; l=5193; q=dns/txt;
  s=corp; t=1666084599; x=1697620599;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O2EruY7vPfzdznIgSTU0rRjUi3gssL+edwj0iUVadl8=;
  b=IuqlOT3ne0Jj8hpDA7rDch9u2E/l76wCpZaP4AxnHerKDoFYpcGuMhkK
   fOyfxFLzHQm9Yrwu7ja1jNlhCBSs2lzX5i5XGwucmbGBD9LgnY542Yl2i
   vE1W6NGqnQjueMbbq+cqpxW/sj9p2UqMiFvHwhJyAQJPvaaf2KK+R4hUj
   0=;
X-IPAS-Result: =?us-ascii?q?A2EMAQCkbU5jl5bSIB9agliDLoFYlWWdHoF8CwEBAQEBA?=
 =?us-ascii?q?QEBAQlCBIUHhG8nNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQEFAQEBAQEBBgIBA?=
 =?us-ascii?q?QEBAhABAQEBAQEBATYFEDWFL0aCNSKDdysLAUaBSAmCfQGDIKAlAYwZM4EBi?=
 =?us-ascii?q?B6BYAaBPYp9hXmBSUSCUYIsiwEEkg+JEgMJAwcFSUADCxgNFjMYAxQDBSEHA?=
 =?us-ascii?q?xkPIw0NBB0MAwMFJQMCAhsHAgIDAgYTBQICNRg0CAQIBCskDwUCBy8FBC8CH?=
 =?us-ascii?q?gQFBhEIAhYCBgQEBAQVAhAIAggmFwcTMxkBBVkOCSEcKA0FBhMDIG8FBzsPK?=
 =?us-ascii?q?C9pKxwbB4EMKigVAwQEAwIGEwMiAg0pMRQEKRMPLQcjcQkCAyJqAwMEKCwDC?=
 =?us-ascii?q?SEfByUkPAdYOgUDAhAiPAYDCQMCIll1MBIUBQMNFyUIBTcaBAg8AgUGUhICC?=
 =?us-ascii?q?hEDEg8tSA9KPjkWBidFATYPDhoDnW0BMF0sIDCBRBMWPcIDg2qgKEyDdpJ+O?=
 =?us-ascii?q?ZFilxmiC4EYhCEwgUAighZNI4M3URkPjjmOOXM7AgYLAQEDCYpCAQE?=
IronPort-PHdr: A9a23:KOOuOB0XQxJcoYM7smDOkAMyDhhOgF0UFjAc5pdvsb9SaKPrp82kY
 BaEo6481RSQB83y0LFts6LuqafuWGgNs96qkUspV9hybSIDktgchAc6AcSIWgXRJf/uaDEmT
 owZDAc2t360PlJIF8ngelbcvmO97SIIGhX4KAF5Ovn5FpTdgsip2e2+4ZPebgFViDayfL9+M
 gi9oBnMuMURnYZsMLs6xAHTontPdeRWxGdoKkyWkh3h+Mq+/4Nt/jpJtf45+MFOTav1f6IjT
 bxFFzsmKHw65NfqtRbYUwSC4GYXX3gMnRpJBwjF6wz6Xov0vyDnuOdxxDWWMMvrRr0yRD+s7
 bpkSAXwhSkHKTA07nzZhMJzgqxcrx2vqAdyz5LXbYyPKPZzZL/Rcc8cSGFcXshRTStBAoakY
 oQAFeUBOfhXr4/hp1sPqxu1GAyiBOT1yjBWgH/5xqk60+U9EQrb2wEgAdEOsHPOrNrrMqcdS
 uS1zKjUzTjYdPNZxy796JXSfRAnuvGAR65/cc3UyUQ2EQ7Ok1qfp5D/MTyPyuQNr3aU7/BmV
 e+3i2AqpQ9/rDeyyskjl4XHhoAYx1HY+Chl3os4JcG0RU11b9OrEJVdqT2WOoRoTs4mQGxmt
 yQ3x7kYtJKlfSUEx5IqzAPRZfyAdoiH+BPjVOCJLDhkhXJlY66whxGo/Ue8ze38U9G43EpXo
 iZfldnMrH8N2hrO4caEUvtw5kms1SuV2w3d9O1IO144mbfHJ5I737I9loYfvELeFSHsgkr2l
 rWZdkA89+it7OTof6vpq4eHN49xlgH+KqMumtGjAeggMggBQWyb+eOk2bzi/E35Ra5Fjucsn
 aXDq5DVO90bprOjDA9TyYYv8QqwDzCj0NgAnHkHKkxKeA6fgoXnJl3COv71Aemlj1iyjTtn2
 +rKMqDhD5nRNnTDla3ufbd5605S0gozytVf6opKCrECJ/LzQFH+tNrDAR89Mgy03/3qCM5j2
 YMHRGKAGKmZMLjIvVCU4eIvJvGAZIkOtznlMfgq++bujWMlmV8aZaSk0oMbaGqkEfR+P0WZf
 X3sj88bHmcQuAoxUffnh0eYUT5Venm9RLgw6SwlB46+F4fMWpitgKCd3Ce8BpBWY2FGCkmRE
 Xj2c4WIQe0MZziSI89niDMEUaOsRJQm1RGpqA/6z7tnLuzO9iIEspLj0cB55/fPmhEq6Tx0E
 8Od3nmJT2F1mGMIWjA30Ll6oUxh11iOyqx4g/1DFdxP/PNFSAY6NZjSz+xgEd/9RxzOcc2UR
 1q8RdWmGz4xQsorw9ASe0Z9B8mijhfb0iuqHbAZjbOKBJ0y8qLTw3fxJ9hyy3Dd2aggk1kpX
 NFDOnGhhq567QTcG4jJwA2lkPOudKIBzGvI6GuryWuVoFoeUQh+S6zJUHkTIEzMoofX/ETHG
 oGnDbkhLgpHge2FMKZMYNnokR0SWvTkItnYaWawh0+rCA+Vz7WXKoHtfjNOj23mFEEYnlVLr
 j69Pg8kC3L5y18=
IronPort-Data: A9a23:X+S5zqBn39VCNhVW/8vjw5YqxClBgxIJ4kV8jS/XYbTApGh21DwHy
 mEYDGjSPauDajCgKN9/O4zn/BxTvsSAmoNiTANkpHpgZkwTlceUXt7xwmUcns+xBp2YHBI5t
 5V2hv3odp1coqr0/0/1WlTHhSckjfngqp3UV7KfZUidfSc9FGF7z0oLd9cR2uZAmcK+Dx6Gp
 eT8qsjePE7N8zNvOycf5rnrRClH5ZwegxtF+A1jDRx3lAWGzSNMVMtPffjZw0bQG+G4IMbrH
 44v85nkpgs1zz91Yvu5n7DydFE9Q7K6FWBiXVIPBsBOKjAbzsAD+v5T2Mg0MC+7uB3Q9zxF8
 +ihgLTpIesfFvOTwbxNA0cEe81JFfQuFLfveRBTuOTJnx2eKxMAyd03ZK09FdRwFupfXjsWr
 ZT0gd3CB/yOr7ve/V61dgVjrsYKLvvbFq8mgEBh1DHzC8kfZJf/cbqfsLe03B9o7ixPNeTfY
 sADYHx0YQ3dahtUfFwQDfrSns/z3z+kKXsC8QrT/Pdvi4TQ5FUZPLzFLtnSYNGMT8FUgm6Dq
 3vb9mLiRBodMbRzzBLZqCLy3LWS9c/9cLsbO7GmzqJtu22s9GUQNzwuTUuJm+bs3yZSXPoFc
 RVOoULCt5Ma/VatQvH0RRu0qjiIs3Y0XttJDuA+rhuE26zd5y6TAW8YSj9HLtchsaceQT0sy
 0/Mms/lLThuq6GOD3Ob+K2doT67NW4SN2BqTT4JCxsE5dbooIw1pgDTQ5BoF6vzhdudJN3r6
 yKLqSIkjvMIgNcW3qOgu1vAhlpAu6QlUCY3zwflbkiJ1zlIZZelTYqX0H3c0cRfedPxoka6g
 JQUpySPxLlQU8/VyXzdEbtl8KKBu6bUbG2A6bJ7N8N7qm32k5K2VdoIiAySMnuFJe4qQ1cFi
 mf6owxc4oNeIXquBUOcS9PsUpxypUQMPX8DUv2RYtcLTIJ4cgSKlByChHJ8PEi0wSDAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkUr/iuPCPy7NFe5t3L6yggYRsvrsTOL9r
 Y83Cid240o3vBDWPXGGqtNLcTjm01BiWM+t8KS7idJv0iI8Qjh7UJc9MJsrfJF0kLlYja/U8
 3WwUUhdoGcTdlWZQThmnktLMeu1Nb4m9CpTFXV1bT6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU57dWK8RE2SeoG51gFuUhNUKSSlHTDmmZ0KNCAXTtbY5L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:yGP3qqM5Qf+yzMBcTtajsMiBIKoaSvp037Dk7SBMoHtuA6qlfq
 +V7ZYmPHPP5gr5O0tQ/uxoRpPwJE80nKQdieJ9UdiftWLdyQiVxe9ZjLcKuweQfxEWKdQ26Z
 td
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="4286225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Virus-Scanned: amavisd-new at sequans.com
From: Valentin Korenblit <vkorenblit@sequans.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	arnd@arndb.de,
	ye.xingchen@zte.com.cn,
	Valentin Korenblit <vkorenblit@sequans.com>
Subject: [PATCH v4] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Tue, 18 Oct 2022 11:16:31 +0200
Message-Id: <20221018091631.11264-1-vkorenblit@sequans.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_021639_704121_170380AF 
X-CRM114-Status: GOOD (  15.80  )
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

Link: https://secure-web.cisco.com/1Zuwps3Jm-Qybygq3UAIg4d4S5heggZX1ow8KENGLYXasfYvc72QPuxCC1kbg9_YPoqVYqfCQVlokpkras6hyjajt6RxKCmlzNhUsTu6vdTgufT8upiLvVnbScXuhDTKV539Fk3pwIluw0CMUbizt16dze_fAdyNKJxwNbEzZIq8DIpD8kK9qUCTdhHSEXza7Ytk_EmwCBawUQFBNNV2CzKBaw-vx5t7gbuvlT1IL9WV4bA3nzUs4NLiN1TV2lBuyA28Duk2i-aouwPb5o3UwDHhHxyCQuGos0F-sSxMREQr2Uj4lgR8lfIpFbk6O8o7J3K2i8rXA4TqUYcRD4BxWWNk3nBHVJxW2oVqX6sjS3Vh32VxOnsoXhttu_3UFm3qziOiukq8jXcvoFPvD6kwJutnujcsJzeGzEBSBfUxSHdgZYFyBbHwqqBC298e3uUV-/https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org%2Fthread%2F3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B%2F

Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>

---

Changes v1 -> v2:
	- Replaced ioread64_rep by cadence_nand_readsq (suggested by Arnd)
	- Replaced iowrite64_rep by cadence_nand_writesq (suggested by Arnd)
	- Do not try to access 64-bit sdma if __raw_readq/__raw_writeq are not defined

Changes v2 -> v3:
	- Use readsq/writesq on 64-bit architectures (Arnd)
	- Detect issue on init instead of 1st transfer

Changes v3 -> v4:
	- Updated link and reviewed tag (Arnd)
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
