Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EDDC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pf82q6+M7muehrZkmUoTDISqc9flhsHnDu0no8q3hmI=; b=DPVVjVCXxBMmrB
	iL2vYezZOpJ7ebPsbs5RbSGonRcVaM2BPH8T4ZAzZ6rnLJ9dxhtEbmJg48owpI/2PvEVqYyMlf208
	WyK5qiT6TNcQJwijWK1l/RNlQkg5DlCh/MM13bqf7waVdQ1lkKeWVLsTWu+hR0bFHP0878P3+e6aJ
	HKpVvw1wsjLVqHxsiC91JZ6MqHDdwI2MhHK+RGpE7d1o1UAwSapGjyugi29QhIma4QMECQWTKRHm4
	qbc/76t25tHZ63vbbsDk9gyEE4EvYRK4V87n2ashQNSAzyvIevhWtjEJKADX7vYZ+ib5vg6Qt3+jc
	lCg0b+WNPXr3wimF+wnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCNsY-008Q2U-7B; Tue, 25 Jan 2022 15:37:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCNlt-008OPL-R5
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 15:30:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d18so6944618plg.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrAtAIlMK2rk7KAp7C2s7R2F2nNCdug8ASeh5+c9Xxw=;
 b=hmA+4kWIT0VJkfsrIj3CAk+o2e5xm3EHa9OOGgMLC6V8kk3s6txEmtpOvHCwQCFu/z
 f6Z1KLDIBThomje+wVZtC/avAyK1NYKshJzQbEKYVjuh+o+SiJevaxvP9ArK8rWsbreG
 W0NdXjX/AzBkRxSlOjgUb2e5K+WqPzSqA/cXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrAtAIlMK2rk7KAp7C2s7R2F2nNCdug8ASeh5+c9Xxw=;
 b=jKjM3zhlqAQplQHrxqajBOWx02K6pTuHiRLHMse/6tp+c775pytfcOCOOmGVN+WW5A
 HTz6vamo9hzQE4reLy2YtLKpfPM0KQ17SfOGwgfJUJooNrzoWzoExi47q0yMpM4ezxRJ
 0wMpPIT2hOKNzCrU3PvqlhLbDqCaxWhS+bbGNy9ZBA4jYZxj5G6g2BsZjSKkCNnCZyh2
 Ik7TQMUFpWFJ7rrlbxunPT7bOiC7nSKx7nOF7NkBAQOeOyszzIBxYg9FRZIt3kKMhZDM
 HyGHoW0609LUZh2aHf5qrXPfQwlDSL1RkUtqyTfBRaxHOpj++HaoW1Me0kxcHZPTiIr6
 JCKA==
X-Gm-Message-State: AOAM532E6jvdH+ZG/jyHZt4Q2mQ2GA/On59W9PXuExOVMtev8oO5uj+3
 qzflFs9CGVuJYnwtRNZtV4Ga0w==
X-Google-Smtp-Source: ABdhPJzd5aF6C+FAPgDlRwmXwFEc5etijNnVCwLbg8thUNE5rIwkeqTw25zE2c3dG5DyN9uNQ8t/ig==
X-Received: by 2002:a17:902:7d81:b0:149:c926:7c2e with SMTP id
 a1-20020a1709027d8100b00149c9267c2emr19600182plm.27.1643124612092; 
 Tue, 25 Jan 2022 07:30:12 -0800 (PST)
Received: from chentsungp920.tpe.corp.google.com
 ([2401:fa00:1:10:b78b:8e2a:968c:d872])
 by smtp.gmail.com with ESMTPSA id k5sm20989991pfc.85.2022.01.25.07.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 07:30:11 -0800 (PST)
From: Chen-Tsung Hsieh <chentsung@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Chen-Tsung Hsieh <chentsung@chromium.org>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Date: Tue, 25 Jan 2022 23:30:00 +0800
Message-Id: <20220125153000.3263064-1-chentsung@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_073013_952236_CA2F9969 
X-CRM114-Status: GOOD (  10.73  )
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

Read back Status Register 1 to ensure that the written byte match the
received value and return -EIO if read back test failed.

Without this patch, spi_nor_write_16bit_sr_and_check() only check the
second half of the 16bit. It causes errors like spi_nor_sr_unlock()
return success incorrectly when spi_nor_write_16bit_sr_and_check()
doesn't write SR successfully.

Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>
---

 drivers/mtd/spi-nor/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 04ea180118e3..426bfa9a65f4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1007,6 +1007,15 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 	if (ret)
 		return ret;
 
+	ret = spi_nor_read_sr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	if (sr1 != sr_cr[0]) {
+		dev_dbg(nor->dev, "SR: Read back test failed\n");
+		return -EIO;
+	}
+
 	if (nor->flags & SNOR_F_NO_READ_CR)
 		return 0;
 
-- 
2.35.0.rc0.227.g00780c9af4-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
