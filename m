Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6B5C4727F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C7EE2085B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYVVUB4F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X6OR+Kzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C7EE2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PkRRE9HxyVC7vjU+aMfxTM+X0/ox1ovOJ2BJ1YfC8xc=; b=jYVVUB4FTbi31dEiCR0XHf7/x
	gSoCfG+y8oC6ZwOSfrFM8et6quyFWYNrsAv952P22Vonj52SpISI9tfUG/yfEkSbFImwaW7SMABmY
	+r7D2S61qJo7N5tMzum/U/JcvPUtaQytpoPcbUWoqcy/QZI+hr8w7oqwSzUHMWgkygxXgUpRhOBuU
	rV4tif2qzYXOkGswQ+FOLfTJXG9IC5xjNUDnvJv0etT1AFU1IVr5yMIW7aMBmY+fDfaGE1Wl8NB9M
	pO9zu+kVUOtsUMtlSBn77R45+236STACDgaqrcGpZxCDWUU6kTHNyCkKE5fObPKPqQraDNXVDMIad
	mvbdbKDBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhdG-0003a3-Db; Fri, 25 Sep 2020 06:55:02 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcp-0003Pv-0O
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 06:54:37 +0000
Received: by mail-pg1-x543.google.com with SMTP id t14so1714268pgl.10
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2020 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6A7I2+xa+JzqfUUJmmCkQYIIjfofSHKtXj6ieBn98k=;
 b=X6OR+Kzr1L29x1BQVGldMkJqu8KRWqcyEcYQJD+ya42lnml69EzPYF9ouzFHvDwXIU
 znn3F7jcsx24lM/hZxLfd6CZS9wcsK+YefmG7jjFFrsZna9EEaJzH1c2mMj55g4AQ1N9
 JNTp73XgNucjtRN7dYa3pW6DP0JDe8gFoxuFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6A7I2+xa+JzqfUUJmmCkQYIIjfofSHKtXj6ieBn98k=;
 b=lymNEBROcRyx/3P1M9n0mYo2Hxws/lLYmUbt1TLx2OmbH8oG29RJR5qvv9wckL4/ob
 B0tlxsvjU9z7HzgP1iLFjCs2hYRqhBudCKIjGMJ1ggpdIDffQjhbycrUdi6/XNtVPq6l
 zcIA3WQbEf+zmBZXvgznyfCoR5j2G20z2A+bwIKb9wJg4AS/2PxPxipPPQ9/5rNOaxnq
 k/6O+RaUzx3zYo8R9zOhj1y8paQPOTM+/B283MXs/x5JoT3z2Fs6pGIUCI/lMf43bq23
 nvuZpSNRxt2limBdTp08RYaKg3f8uNNXHdoaSIOiGO9RE0o2oLO8NTlmOQnM1zaCIxQU
 Kv+g==
X-Gm-Message-State: AOAM532YcF6yB29j/+YZpNgDEI9dzstqG3ovHajVufW4npBO4Yo4BlFQ
 25gIZLm2NB3T3J/zIh9rpsPZkQ==
X-Google-Smtp-Source: ABdhPJz6kdElWH7oBxMzrNtroD9NdXSuNaRDKOUS8ZeMpdwM7u/op/NfT2A0F8AbN8AIg0ARptiwAg==
X-Received: by 2002:a17:902:d913:b029:d1:f388:9fa6 with SMTP id
 c19-20020a170902d913b02900d1f3889fa6mr2963337plz.67.1601016872951; 
 Thu, 24 Sep 2020 23:54:32 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:32 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/6] spi: spi-mtk-nor: fix mishandled logics in checking
 SPI memory operation
Date: Fri, 25 Sep 2020 14:54:13 +0800
Message-Id: <20200925145255.v3.2.I48d59ef5398f3633c6ebbab093da6b4b06495780@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025435_077164_92953216 
X-CRM114-Status: GOOD (  14.03  )
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

Fix a bug which limits its protocol availability in supports_op().

Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c8..0f7d4ec68730 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -211,28 +211,24 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 	if (op->cmd.buswidth != 1)
 		return false;
 
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		switch(op->data.dir) {
-		case SPI_MEM_DATA_IN:
-			if (!mtk_nor_match_read(op))
-				return false;
-			break;
-		case SPI_MEM_DATA_OUT:
-			if ((op->addr.buswidth != 1) ||
-			    (op->dummy.nbytes != 0) ||
-			    (op->data.buswidth != 1))
-				return false;
-			break;
-		default:
-			break;
-		}
+		if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
+			return true;
+		else if (op->data.dir == SPI_MEM_DATA_OUT)
+			return (op->addr.buswidth == 1) &&
+			       (op->dummy.nbytes == 0) &&
+			       (op->data.buswidth == 1);
 	}
+
 	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
 	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
 	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
 		return false;
 
-	return spi_mem_default_supports_op(mem, op);
+	return true;
 }
 
 static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
