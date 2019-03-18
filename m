Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6081C10F00
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:47:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 950062175B
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CnyBiMBD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QtGreQaP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 950062175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//SX1b9Fv4CKTFqAy2NXU4p30SyiZgdD8thPYdyBkk8=; b=CnyBiMBD4dnkje
	ZHxc1CeC+KTunEH+l6gjvrQpNGngd5hOTNC72WGq93RGA/GQ8kTYJrx0PYVZRgCEe+xFmGtEXnK2I
	8X50D1UjrLSA4ODULX7QlOCfn1/nI6ibi7V+FXknriSGxXgRFNsTd6XtTbou+pDxPERUTZo81twtC
	G0Wt2+WczlMwjBwFkV4Aj7jFLf5T3kAlgbxMcVPR0MyZtFW25DRVYLoGSyXJORiGsTTS/B9Qol7oM
	Ah2m4djtzsy1DdK4xAyqizj8Fo+bFGkDwJICh12Lxa3202fe96owXF3gyRD+ZZR3CZpap3Bfb/hVc
	VCCN5Nj3Pr8J1IsI4GRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5zAo-0000dG-PM; Mon, 18 Mar 2019 20:47:54 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5zAS-00005S-7W; Mon, 18 Mar 2019 20:47:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id w2so18601937wrt.11;
 Mon, 18 Mar 2019 13:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0873ZLskCB6Lvg+syhxqGIBY5YOohbYE2wenaTl30+w=;
 b=QtGreQaPHla07Yp+mGiHlv3HE2rnqgE7Ji7JfX3ujMrf6GxlwfHLXUY1LhjBUhYAvW
 PjpAM9wdto38jH6IF6kpeqeLgFhcL4WdLR/hHzO8cAFqrC3oBAhyx1tVsZ06gYqIvxv3
 EuvsJbAFtVbLoKKRsgwiJpTDsM7R4Ce5x52PrNmy2BmuIQvBy6piur162MyYCaR8rP9a
 NWkZ+/POi3kzOO/WlZpco6FqcwOJqnlgtA+BlW6YpJuJ11nV8z7wMNDARxG+EfL4s/K/
 e+HStdIuNJYYL2tn0UXh8XYp0YQtemd6tkB291/MU2Ia3QzbKutQe+TH48+nc4CB2gXh
 lm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0873ZLskCB6Lvg+syhxqGIBY5YOohbYE2wenaTl30+w=;
 b=I6omGPigVmgLEcOhtICQZq5Oy8qqRLPfK9vA+jNgHFErbbg27Apn6iGITrUaJusgW9
 IEd8qAtCIPlxqRvxUSpSs7tP3Kb3mg36WLlNktZjC9G6FudE8VkjlAbtawS6NfOB8I0i
 RAGwN1JD8TLOI3Ea/Bk2nvRlASILXxayYpHJ0NMuvyQ7VyD+qK47LmUgW7GYISWWos14
 qGcxOpTRfO/vvaH7jkJ5JGSXqsdwHGiEoo7rOItEIqB4EsHvtnC6W5m41wvB2KzBJyJe
 yq8kVbyJ/nbekNqVwwpvT7SSwz4i/YSrI2rkz6OaoftXQGynD0+EzyqiPDdDe1Htqv8H
 hLnQ==
X-Gm-Message-State: APjAAAW97T8D39KATyqWGu3D7Y4WL2lMOMwDUFJopvsMelrJg+yEnLnh
 DBaYKOfugDGbRvMtvf0GSLEza+iC
X-Google-Smtp-Source: APXvYqyg9XphgCbZpbnjd28jfUaYDrWSVUE7pZocWpFznrc+9Gl/E/JaIExeGJ7Ymx5XIxgcE0bOGQ==
X-Received: by 2002:adf:84c6:: with SMTP id 64mr14357276wrg.246.1552942050247; 
 Mon, 18 Mar 2019 13:47:30 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900918378ACFECF051C.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:9183:78ac:fecf:51c])
 by smtp.googlemail.com with ESMTPSA id y12sm224849wma.44.2019.03.18.13.47.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 13:47:29 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: [PATCH v2 2/2] mtd: rawnand: meson: fix a potential memory leak in
 meson_nfc_read_buf
Date: Mon, 18 Mar 2019 21:47:22 +0100
Message-Id: <20190318204722.9901-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_134732_267865_52F4ED1B 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 liang.yang@amlogic.com, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

meson_nfc_dma_buffer_setup() is called with the "info" buffer which is
allocated a few lines before using kzalloc(). If
meson_nfc_dma_buffer_setup() fails we need to free the allocated "info"
buffer instead of only freeing it upon success.

Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index a1d8506b61c7..38db4fd61459 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -534,7 +534,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	ret = meson_nfc_dma_buffer_setup(nand, buf, len, info,
 					 PER_INFO_BYTE, DMA_FROM_DEVICE);
 	if (ret)
-		return ret;
+		goto out;
 
 	cmd = NFC_CMD_N2M | (len & GENMASK(5, 0));
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
@@ -542,6 +542,8 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	meson_nfc_drain_cmd(nfc);
 	meson_nfc_wait_cmd_finish(nfc, 1000);
 	meson_nfc_dma_buffer_release(nand, len, PER_INFO_BYTE, DMA_FROM_DEVICE);
+
+out:
 	kfree(info);
 
 	return ret;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
