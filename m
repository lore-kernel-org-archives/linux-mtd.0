Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A15CC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFvFf1W2WtgNYhinQLAOkG0a6gjGnr7mnyA9y73pcOY=; b=lakQS3XjcJOKsH
	kavthqdptLwdeK/CseKxGEZvINc6+lhabioqnClbFqWatyBMNZYy5A5W4EI6MGunyVEcP4paXqGFT
	adYr9twbtctLS1MPv9amAF7NnrezoAFJ9ShOniUwvQ/zzA3hvtaPiOKUwYQD3GjEU7Vcz8bOKPYbw
	fFO0ZbTU3iqvUCIcZpFZyFHMxrgao23pKd8L/32hcwQJv6SitlED9ZU+4r5iN8dzrbFH0pHvAqC93
	a1qY8g8SCKjq917HRCw6VmARVBnjjtO2WqFb9lAHqJN1bJd5jbBACv9VsfnSu4WS5Jf4J6lemtQ6h
	WLhNxBS4HySD1bV2NMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EI7-007GH7-0A;
	Wed, 29 Nov 2023 06:43:23 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EI2-007GFM-0y
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 06:43:19 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b84e328327so3524582b6e.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 22:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701240196; x=1701844996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6qfrVn0277bDMh3KhTRXLaLEzam5I22VMt+zO4G1cM=;
        b=QeadAMzBQAHnq+GQAieyOx8gRpTcwZkTjyvdB/wRXD8Tt8CFVsj9+xGYWT3KpZISMg
         Mcv+lCTs2lv5sEpbOn3danuL8REDiuwjj1Te2dVj/4/pDfOYw9tpOnFRr1KPEtd4cLW0
         uwWhwlXUhU4oi6qFWXFQiSJer8XHw3W7vX6SoyX+1TtJXAYHZKVetwOB7W/7pEoSQAoj
         SdHOW26b14LXImQoI1OwtzJvyRNvShYykmTELoJc5atVAF0KFV9phiRLifMbcZ8vRh8Q
         3LLSc/ucFv3gsVtjklw9vzZAL34a8FH8qW/F/q4aL/rhiAwiDajmbyQlmj5odxa+zHnQ
         Kjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701240196; x=1701844996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i6qfrVn0277bDMh3KhTRXLaLEzam5I22VMt+zO4G1cM=;
        b=rVps+yDZnLr21yATC/9ZOVxEObX65LgyiCoYPPny8jy1zIK6gw8u/3gplhFFl6CFSl
         qYgj266GBhbijDXY0J3UJfCkxa1RHmCV1y3qAKazrwpWeO9ev6JEgB/Ze0H1nwRD71Lk
         +hsTXgiWfxmmr8BDLnFLB1FpqmeylFC1LG1xOmJvWFdK1xeFdtc0dciYJWuO+6T9FB6G
         Za9UYmDT8GzA4vRaowS+PUjcTfG0i5jfpf7bWUsTP5nnMMAWPyxk6NQLXoaUISJAGVsH
         ViDxbKVaIE0Z8SqbaSWOo3tCwXVu6FXEn0XyHgHpNXFByFw1vJaOpQywqaBFxpyriH0k
         8v0g==
X-Gm-Message-State: AOJu0YwIHrQRhUkiDb+euus/QkHKKyLOYAV5CNSi3r7SIyH0MuN++XnM
	Jv2y9g8+XtTGQaS4IMQbof4=
X-Google-Smtp-Source: AGHT+IEaYdguNW0MvrtGlevAV1RSYiqQFJXUoenv/xvsoqABBLuNLSdryk2roXcEnPubcmjtlLFCzg==
X-Received: by 2002:a05:6808:23c9:b0:3b5:ae0d:b208 with SMTP id bq9-20020a05680823c900b003b5ae0db208mr25801175oib.6.1701240196530;
        Tue, 28 Nov 2023 22:43:16 -0800 (PST)
Received: from localhost (220-135-95-34.hinet-ip.hinet.net. [220.135.95.34])
        by smtp.gmail.com with ESMTPSA id x23-20020aa793b7000000b006cb638ba1aasm9877362pff.49.2023.11.28.22.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 22:43:16 -0800 (PST)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Mario Kicherer <dev@kicherer.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] mtd: spi-nor: Stop reporting warning message when soft reset is not suported
Date: Wed, 29 Nov 2023 14:43:11 +0800
Message-Id: <20231129064311.272422-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_224318_360966_EF7BB3E7 
X-CRM114-Status: GOOD (  12.32  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

When the software reset command isn't supported, we now stop reporting
the warning message to avoid unnecessary warnings and potential confusion.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
v2. only lower the priority for the not supported failure
v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
v4. move the version information below the '---' line
v5. remove dev_warn if soft reset operation is not supported
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 87cb2047df80..96a207751cf2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3237,7 +3237,8 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret != -EOPNOTSUPP)
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
