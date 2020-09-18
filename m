Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB1AC43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:33:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C89C20789
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jRkCVfdN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gIWNzXXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C89C20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nbfx7w+Z8mAURRCWf9QkJ0Qj0g/tTKuwLnIlZllEv+4=; b=jRkCVfdNrRqC4UdrxGxYMuSn1
	NqNYD3cK+BkPYG9xpGkT1HdiXh5vN3WyxJ2lSnHWwRQPlh9utKsnln/hLgNcIvUTS8ymPpXEVc9dL
	Jj86QJDFxRaC5nWlD58+AN0gvQGgEF5svpbVlJUau0y8w2NdDonkzyDN4yg3ikASanpqaXNwQF2N9
	9+eLc2ZVKVgbj6kQu0Oyd/BXIZCbwR/d7PkaecLe0kw/BdqFtSR+J4OtmlPJ+xpDPRAgHtqDjK+t+
	FDscWodcIY5/PCwjAxorultQv+awD0i/qY2WPuaAd91G5Cfp4pY0/DSujm/bKcrsn+I7jTf/li5SN
	FrdmVLkXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBp2-0000Cz-1n; Fri, 18 Sep 2020 08:32:48 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnu-0008DL-G5
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 08:31:41 +0000
Received: by mail-pg1-x544.google.com with SMTP id 7so3032539pgm.11
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2020 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtgT8oGdi7tJWYrZylWP5X+Qu5mtWrTjssOMjWBLBio=;
 b=gIWNzXXI/65W9lRuW4rM4ZuoKImgBcadG9k1ZTZdlozcVR0w6y7VHSw5ovnfxV+y4s
 me4YUC5KA0N/CovI2zxVtNEXpQ8aXA1C+c8tsuTUo/mPKvhbcVunwTsO8sq35KVqV2wP
 tRlaD2cHR/DshX6cxwuMkOhzPkx4cdjcbJxpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtgT8oGdi7tJWYrZylWP5X+Qu5mtWrTjssOMjWBLBio=;
 b=eYvwhroOkGkjI8JiMkJTe4iJ70fuVqOiJ7gUKi9ybxZgtyyOvHqzGD74qIKHmlTcLD
 LXLbsLQ5iKJWQeTgr5oWYz5wi2Kpf1rdG4j6Gxx12s1Qabk8/iP2HyuXG4O/4eFDcCsB
 JqzwbD+9RVmuMA02egHsCODikosf9GfPt9cn6Gb4qrrpSTMZm8Fr4r0TJelq0+weOo/W
 AXQ4Za58tsxiLF/HSqvo05dHnXIWhmUGwjS9m+zQBZzuAe+jOjb00uz+YtWQis1wKQIh
 MDylsyqt3MwIGGctT+ggyTNWtuhX8IyGBaqfqGqaWnmtlfLDmg8k/308DgDgAb3/mUEQ
 V+dA==
X-Gm-Message-State: AOAM533P3qlMVIvGMPG9c3vJ4nUygvBlH59fH9Eb3U2Au+Z+lA1Z5Z4F
 KGgF/d7hqSCqUuyb8J0/yT6WKt+VSmiueAGJ
X-Google-Smtp-Source: ABdhPJylLeVr7aTAeXl/TquJqTgllezEHHoyI6zJ5/+F2fB1EMgD/15lCBC8Kt+Lo/SC0WxayecFLQ==
X-Received: by 2002:aa7:934e:0:b029:13f:d056:593 with SMTP id
 14-20020aa7934e0000b029013fd0560593mr25187131pfn.15.1600417896081; 
 Fri, 18 Sep 2020 01:31:36 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:35 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/5] spi: spi-mtk-nor: fix mishandled logics in checking
 SPI memory operation
Date: Fri, 18 Sep 2020 16:31:20 +0800
Message-Id: <20200918162834.v2.2.I3de2918f09b817cc2ae6d324f1ece62779ecc7cf@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043138_727231_34BC7D2D 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix a simple bug which can limits its transfer size,
and add a simple helper function for code cleanups.

Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 62 ++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c8..54b2c0fde95b 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -167,52 +167,63 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
 	return false;
 }
 
-static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+static bool need_bounce(void *cpu_addr, unsigned long len)
 {
-	size_t len;
+	return !!(((uintptr_t)cpu_addr) & MTK_NOR_DMA_ALIGN_MASK);
+}
 
+static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
 	if (!op->data.nbytes)
 		return 0;
 
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		if ((op->data.dir == SPI_MEM_DATA_IN) &&
-		    mtk_nor_match_read(op)) {
+		switch (op->data.dir) {
+		case SPI_MEM_DATA_IN:
+			if (!mtk_nor_match_read(op))
+				return -EINVAL;
+			/* check if it's DMAable */
 			if ((op->addr.val & MTK_NOR_DMA_ALIGN_MASK) ||
-			    (op->data.nbytes < MTK_NOR_DMA_ALIGN))
+			    (op->data.nbytes < MTK_NOR_DMA_ALIGN)) {
 				op->data.nbytes = 1;
-			else if (!((ulong)(op->data.buf.in) &
-				   MTK_NOR_DMA_ALIGN_MASK))
+			} else {
+				if (need_bounce(op->data.buf.in, op->data.nbytes) &&
+				    (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE))
+					op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
 				op->data.nbytes &= ~MTK_NOR_DMA_ALIGN_MASK;
-			else if (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE)
-				op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
-			return 0;
-		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
+			}
+			break;
+		case SPI_MEM_DATA_OUT:
 			if (op->data.nbytes >= MTK_NOR_PP_SIZE)
 				op->data.nbytes = MTK_NOR_PP_SIZE;
 			else
 				op->data.nbytes = 1;
-			return 0;
+			break;
+		default:
+			break;
 		}
+	} else {
+		u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+		if (len > MTK_NOR_PRG_MAX_SIZE)
+			return -EINVAL;
+		if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
+			return -EINVAL;
+		if (op->data.nbytes > (MTK_NOR_PRG_MAX_SIZE - len))
+			op->data.nbytes = MTK_NOR_PRG_MAX_SIZE - len;
 	}
 
-	len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
-	      op->dummy.nbytes;
-	if (op->data.nbytes > len)
-		op->data.nbytes = len;
-
 	return 0;
 }
 
 static bool mtk_nor_supports_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	size_t len;
-
 	if (op->cmd.buswidth != 1)
 		return false;
 
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		switch(op->data.dir) {
+		switch (op->data.dir) {
 		case SPI_MEM_DATA_IN:
 			if (!mtk_nor_match_read(op))
 				return false;
@@ -226,11 +237,14 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 		default:
 			break;
 		}
+	} else {
+		u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+		if (len > MTK_NOR_PRG_MAX_SIZE)
+			return false;
+		if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
+			return false;
 	}
-	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
-	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
-	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
-		return false;
 
 	return spi_mem_default_supports_op(mem, op);
 }
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
