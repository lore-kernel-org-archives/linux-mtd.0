Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AD2C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5A52084D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAKU5LZv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="K8z/d+aH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5A52084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYNrvb+V4LBfIW9P0r0HHKe3OObR9PiEJMWSTgaQa8U=; b=BAKU5LZvGMfE+o
	bpm6rnLcH3e6o3yfoVSjplLqPV/lWkySRscqNGRN1EcBkms17nJLRf0L2RwNXeqz2Xh7xCW+e86PZ
	fIFuV3mR8vyNtseMaIr9zzzaAgVNwQuDRSESMTiCdWrwu0YzNvKmz+jiRzPrn9DiufXsnHbwQrCy+
	WTc5m1BWaCcJOYEmXygNQqSh2xKgB80o9kjrwSryaof0NYTzhPyUY0YrQfhOxl/DfMpoewchOG7ci
	cB6ARSib3vckCSNKGdiCS8jMPs9HGRZMJ9Eue8ChmylGgBeldgF7HmE3pOqMqQiDHBpTlvgzQ7kCw
	cHuh2fFScdioUREtsSjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhmE-0005CQ-Ek; Thu, 11 Apr 2019 22:02:34 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhl7-0003ZS-6y; Thu, 11 Apr 2019 22:01:29 +0000
Received: by mail-wm1-x342.google.com with SMTP id c1so8627452wml.4;
 Thu, 11 Apr 2019 15:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppI9nqpQVIT5EX87CEcKbfdI9W3paDlwzbHWj7vYXTg=;
 b=K8z/d+aH5mjiptQEK6iIvRF5y6r0lfHtJ2mmS1otxJlDG8x6bxBz44Ahm4f4XQfs1+
 cOqQ4+ESVP8nM6T7Wl724gJlOdaAjcOPaOmwPKL89bDgFvb/fka7ZPYKIgOZZe5vhABe
 ViA/k5YhxEIxOn0Zvwm88Sd2YC95kEMpRw5yOcTuDYt7zWsmMbIv/Q6pCXyUOo1OD61d
 XGyoSMgiOeNdP5ETplauulOv5IZIIWKVHWKVMABjThJHeukWIgDihy/TgBGDF8frgK2G
 U7p2RlmMPOerGXwlzEOai+8xI/JbK3EraMbgpSliTd4337GMu36XDqj2Rpk6WlctInq0
 zR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppI9nqpQVIT5EX87CEcKbfdI9W3paDlwzbHWj7vYXTg=;
 b=E5Zg5JnKLxMl5qj5kMlsyJIcyXB+PwXj+3SiDWu1RK7wakQBap/bTmuJnWdETi6tfb
 0wlOoLDlw4QIeFKU84iKnSZwPJaUzYg+MEUyJ2HNOxlgm/DmKN3Pd/lseKnUwHsfuaVK
 HfJTqX/p8gaREY8pXhtAoAoOT1HCfeW77gI2wv5W90/0dzHpscw1GgK+WapYLg3NjzSC
 yxg+eP2fTohDfHH1bpeOTQ1ncx4Qj7pAfonani3bh9ai8E9TRjI4f4DCNr5TUUArYUnG
 BWxQZtD9HgF2NItg/s5FZQvEjoGUviQ55YSkeut8lPSoftSZ/ccC7E6FjkaNk+t3jmfq
 7Y7w==
X-Gm-Message-State: APjAAAVUOYvBpPRS87RoQ49X9y48fD/ucFKyaPoMUtHC3NrG5Hn2qi2S
 GSkepWoXVVty8kzk2/i3E6M=
X-Google-Smtp-Source: APXvYqzluhRlLS7+aeGTBMGtndLaXbk7pEcHusdW0T738cU+A7Iw4rH1UIR99+QzGesPhCuXYb/STQ==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr8160946wmh.32.1555020083782; 
 Thu, 11 Apr 2019 15:01:23 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0009F15067C8D22C31.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:9f1:5067:c8d2:2c31])
 by smtp.googlemail.com with ESMTPSA id
 s189sm13266186wmf.45.2019.04.11.15.01.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 15:01:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-mtd@lists.infradead.org, richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 3/4] mtd: rawnand: meson: use a void pointer for
 meson_nfc_dma_buffer_setup
Date: Fri, 12 Apr 2019 00:00:55 +0200
Message-Id: <20190411220056.19109-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_150125_421677_EEDF74B6 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This simplifies the code because it gets rid of the casts to an
u8-pointer when passing "info_buf" from struct meson_nfc_nand_chip.
Also it gets rid of the cast of the u8 databuf pointer to a void
pointer.
The logic inside meson_nfc_dma_buffer_setup() doesn't care about the
pointer types themselves because it only passes them to dma_map_single
which accepts a void pointer.

No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 9a6023638101..57cc4bd3f665 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -470,15 +470,15 @@ static int meson_nfc_ecc_correct(struct nand_chip *nand, u32 *bitflips,
 	return ret;
 }
 
-static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, u8 *databuf,
-				      int datalen, u8 *infobuf, int infolen,
+static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, void *databuf,
+				      int datalen, void *infobuf, int infolen,
 				      enum dma_data_direction dir)
 {
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	u32 cmd;
 	int ret = 0;
 
-	nfc->daddr = dma_map_single(nfc->dev, (void *)databuf, datalen, dir);
+	nfc->daddr = dma_map_single(nfc->dev, databuf, datalen, dir);
 	ret = dma_mapping_error(nfc->dev, nfc->daddr);
 	if (ret) {
 		dev_err(nfc->dev, "DMA mapping error\n");
@@ -645,7 +645,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 		return ret;
 
 	ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
-					 data_len, (u8 *)meson_chip->info_buf,
+					 data_len, meson_chip->info_buf,
 					 info_len, DMA_TO_DEVICE);
 	if (ret)
 		return ret;
@@ -729,7 +729,7 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
 		return ret;
 
 	ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
-					 data_len, (u8 *)meson_chip->info_buf,
+					 data_len, meson_chip->info_buf,
 					 info_len, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
