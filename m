Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892A1C10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3C12184B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fqlq52mV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Dl+ME5YN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3C12184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3qJEEgHxUSt8f/OBeg3UuSgNliI0E3Gq1m+TvwCEXc=; b=Fqlq52mVvEAEup
	AKWXGF9n1QriIpmDIvExJPSEGQVT4C4ZdnCTqWhw4xXJl0C5TD+47Y1dOmfDy/MR6T+rkLtY6exla
	xuP3++wrMe4ZUuX77WC8Nwnw8jS7T07gKhCbPBjDRzIYk7V/dJpZQIsaL2v0mBwCpIW9HprFA/Wdu
	3Ok8ysCeuvVJ4cfO7FoZt/r72bOjAPLBjlS64yzXwRf6HQk82zOsWHUpbsvVJoZ0u3U+rkl7cH2/T
	raLaY+KKDpAr4nExgwf2iWHX8SUaUYyozZpnPkogeE0W2gdkZqKamEj4R3uh74EVKufGK+NKBqmdj
	9aYLA43c2WR0EXbgBwaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhle-0004Sd-UB; Thu, 11 Apr 2019 22:01:58 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhl6-0003Yt-De; Thu, 11 Apr 2019 22:01:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id z11so8680592wmi.0;
 Thu, 11 Apr 2019 15:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNpnhysGNBYBU9vZbHTKcY8UQNku4HVmL3x6AsvBeB4=;
 b=Dl+ME5YNZFahF/2igCGYWogD/O/0Gd3bQea5s/0xjbTfm9BIuXFheqWl1O+VWnobKp
 njy4xCKs88mG2WRT7KBBdmUoiol97+QcOiz/7ocz9pBT4yFKSbMGie8LYSm5mkn5FQ2F
 j44Phia/Ko+czhZgjQCaCHFQCxx93EyjC9eY8/dXDMGoky5AbMS9zwLrx4Tp4IP1j93f
 vTPUVfXj7jk8vbvwoNl4TMwUxF2nXalNmz4ogOl/bEESUCKc+SDkQ9QDzM4iBbp1uQZb
 nLVkQtuZe6MllvRAUKp5OBnAODevz58LqLo86auklRd9M1H7bpjVKCEfRXhnmgPuCXKl
 PfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNpnhysGNBYBU9vZbHTKcY8UQNku4HVmL3x6AsvBeB4=;
 b=SdPFe4WJbpZpxp2tGFtd4U2xpEYFQLdZFb4/akCK1ZAg6QT89JdqZj6EIhuWYt32fh
 eZCuu8r+tU8TDNbg+96Ehko1B0LS8RWBEXvC2PJtCEEK+FKRYSF8xAac3c4vSwfGvFhB
 whCSFYY3p2AnFf2PRy9hg/TJkPKFHRM6LgFsAqPfeQhtb3cTPHqjhs4mmwAx1k8Fj1wh
 4/73cR2OrnssMOs76+O/5FDyBG5J24MBf7ddpLBTU56UYJPbzA9UVLB5BQ34CU3cL/+T
 jy9u7QJLXCFVvsHpCsvpGTwUXbsVJuSSvC44/0iA23JxpboInk4EnCg23lylL1fyWxV9
 +eFw==
X-Gm-Message-State: APjAAAX76Ft/J2xoGaSmpH078s8UzChrLjNsm6xiFKzNL7GxNMjZR2qJ
 L4VEyHu7zAjnXM8tyCT5dpw=
X-Google-Smtp-Source: APXvYqz35ooInE1ZKyccYGGGO9VGmdSKB2QtHLGDBX83aWFKO0k452TWykwlq54bD8TUpyg33NUcMQ==
X-Received: by 2002:a1c:2348:: with SMTP id j69mr7827582wmj.35.1555020082569; 
 Thu, 11 Apr 2019 15:01:22 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0009F15067C8D22C31.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:9f1:5067:c8d2:2c31])
 by smtp.googlemail.com with ESMTPSA id
 s189sm13266186wmf.45.2019.04.11.15.01.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 15:01:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-mtd@lists.infradead.org, richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 2/4] mtd: rawnand: meson: use of_property_count_elems_of_size
 helper
Date: Fri, 12 Apr 2019 00:00:54 +0200
Message-Id: <20190411220056.19109-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_150124_610415_FFFDC334 
X-CRM114-Status: GOOD (  10.63  )
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

Use the of_property_count_elems_of_size() helper instead of open-coding
it's logic. As a bonus this will now error out if the "reg" property
values use an incorrect size (anything other than sizeof(u32)).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index c1a6af57dab5..9a6023638101 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1233,10 +1233,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	int ret, i;
 	u32 tmp, nsels;
 
-	if (!of_get_property(np, "reg", &nsels))
-		return -EINVAL;
-
-	nsels /= sizeof(u32);
+	nsels = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (!nsels || nsels > MAX_CE_NUM) {
 		dev_err(dev, "invalid register property size\n");
 		return -EINVAL;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
