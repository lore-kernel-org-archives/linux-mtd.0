Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5648C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=42rfeD+hSeC4loPSDKv+WDr4RQYjA+VH4cnVX28fM0Q=; b=octwSlHRg8Hg8E
	VxeXGvwbW6W/3Ynv8LkJGs4Cpnm2qikMRNg6SClSTe7sGt38Y9lYn8k7uWQEFtc4JTwZpVPGjTBbm
	ZNBdUDRateN8v40CBys79p8ecob2tmdajWurJEewjOPod1ezGX1GXNmM+w3wWy01atnwjLmXgjsZO
	wdvP3479vhSHfsGobitPHVrXtQ5CoXcIiHjZ55hJy4JiLAGGFggUxRU9d6fTG63y4vza2dgOL5DcK
	E7XaX25kSGSf/9poEidAeJUgmvpe2b29mxQRRWWRD8Ea3rMdpujPLo39D9enfi008e9YpvCwCyui6
	UWAGOBlj0JkR86mhnpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcoO-00AYyL-Uu; Wed, 26 Jan 2022 07:33:49 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcoM-00AYx5-84
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 07:33:47 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso3934853pjv.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 23:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yoxv9TkwSWCw0FOtU6AluVOp0+jEM6CR8CmoyaRpUNM=;
 b=ZbEEe75gALbVnYqP5DJDIi4cJdA++eoSi+o3xHVPSH/HHHh+Gwm3shw1W7KQB1OoP+
 wCHUMQCTbdQDtxUBa3lYxaWV5sD96lgdpXNk4wggL7ntREEZu80K8MA7PqU4J0twLr2c
 UJtslw4cEo+4K/J1hfIINGJyIRy2yCHWgjER8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yoxv9TkwSWCw0FOtU6AluVOp0+jEM6CR8CmoyaRpUNM=;
 b=P1yiP92YJAeZKFVeC11SsiwDirjEsJ6RZJWPXdxWCFDJZEJ0kV7WcOSSj+Em8oPSKJ
 ScuGs46T9oxb2xslVv/vO+/YluFuf3Pmt62CoEb6olElYOIS3Yprw3tybW26OrHZXBzD
 um9CsIaIPEHkXpN6jWpiFWokLXgv4K6obiDdctoz+127RJaC4N6cKOKl32YYU7lUENi1
 rJompRRqGTn/QHY1mVNZXbdxOL9Kyhi/vgBYjnEvhud/G1zoNEuqt/Jy+zBTsEJWVss/
 SsXqwvMLg22xoQZcrGByPp+4EjMx0GF8w0nTB9ronWeGDxEluVRQEhecLHMYA7iay2uc
 5lYg==
X-Gm-Message-State: AOAM533h25lPXyS3KWuvttodKzSmXSpIY9WyTjUnCkrVrYLo+nW6w/O5
 X+NZLLh6XtQzE39S4ms87cPe9A==
X-Google-Smtp-Source: ABdhPJyDNLx2iPQQ5w5mvvbnDtjcrusu0DL1t2Cw+Bvkcd6IGCVe2Z7+w5seVe/xZzFq3vk4CzEZ5w==
X-Received: by 2002:a17:902:c201:b0:14b:2c5f:b278 with SMTP id
 1-20020a170902c20100b0014b2c5fb278mr18151198pll.13.1643182425468; 
 Tue, 25 Jan 2022 23:33:45 -0800 (PST)
Received: from chentsungp920.tpe.corp.google.com
 ([2401:fa00:1:10:189e:b22e:a147:b5e1])
 by smtp.gmail.com with ESMTPSA id b14sm1183763pfm.17.2022.01.25.23.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:33:44 -0800 (PST)
From: Chen-Tsung Hsieh <chentsung@chromium.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chen-Tsung Hsieh <chentsung@chromium.org>
Subject: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Date: Wed, 26 Jan 2022 15:32:26 +0800
Message-Id: <20220126073227.3401275-1-chentsung@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_233346_319500_12EBB4D0 
X-CRM114-Status: GOOD (  11.03  )
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
Resend patch to move maintainers from 'Cc' to 'To' list.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
