Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438EE7719A
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Avy13t8kXzF5EjjxZZFEdL2fJ5IMXZj9PtThfFzvov0=; b=gZZHPayaDF9QGW
	BTOSv3BwtunOBh7TynH1c1HMIJTrb4sBs+DF28yQoRx0bpH1Szv+lIoiFjkSj9JPo54OuNit0Nsx/
	dvQjORlY6fJ8/4F4O86VN0Qj1bw5qBhBABN3DMrjdF5ViJj33oP6WKYiBNxNwGiXq47fH8Z3NH7w6
	4Y2CdzokQb/oK5XZ12wrvwDVvoQQzRNORu1nmFP4kKjei9/9URipcJ9SemRCklF+qjZl7lQsI9xVy
	MqKgXH/mk6qELiWBILKsy4W/uFC4zloBvnv5jT3msQfiLgjTxJU/CQmouMWtmSuxq6PhHO3y62AM9
	XRhm4J5dZJTq/2l6Ggxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuqO-0000000CYWt-3uET;
	Thu, 09 Jan 2025 15:53:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVupq-0000000CYPC-1hR0
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 15:52:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3862d161947so592110f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2025 07:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437956; x=1737042756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVppjMLEiOmV72M1ziGD3GGOTSNX+Dvm8cS4A38OgRc=;
        b=IYijetYeqFtFxj92p3SfiJQb3wUmd3hOlkJ2f4kzu6rGPQlHRn6URmZ9HpUHiv8453
         bpCJl6eI3+Bzes9LIjc6b6rmmkJFzXXXgfqn30c4qMtjUKTcsT8noHYNB1iG8exrw+mp
         8V/oHFwSPKBs8Jp2W7TWsyf/ur+e/MXpQzyOF+ANMq7Zuf/WrJ0oiN2BA/W8abVV4m/X
         pu4sGshI0Y2CAu16SCkBBcfcNxit6OqOznacwVeM/nm9NkX233rIeP0E9DDm9/VzXT0t
         eafa7O0BC4xOuNGd4kDdmSRRW/9ceHMU5YKGyOl6pls7vUcSEbL/uUHVf0toQtCxn0hD
         AIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437956; x=1737042756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVppjMLEiOmV72M1ziGD3GGOTSNX+Dvm8cS4A38OgRc=;
        b=w9VhMxRlMF6Pd2k+W3PnRwpGBHmdLf5aO/uOMr8BRNU4rR2iasjyOsy7KuyNXfbw83
         sn+qjc/Nd9Ohs/V6bpKe1K6EmRl9w+MnIbLGIgH7oVA6pbqncvEjtClcxMY/xQNTnGFR
         ErnhNiiZtuZwe8uMgw5woXC1+xqRTfDCVptZjqd5UmsN9/D3htSD9N1/0wO6AUWglK/v
         ra/rDJRu3OwTiAe3Khy4r3IJyBNFsoPAxAAryirMw2vdoL8qaDzXLgrU+DYT4gkiqc/z
         tN9RXwxTK33Fpf7YoX1YhEmstYVXMp57i6XwMvsnB3ojXwn+ZGSOqBeKlMTFLmM1x4sQ
         uruQ==
X-Gm-Message-State: AOJu0YycTn7hk6BApxiKmNoYqzyY/NpHplxdo3R8VX7mXOa4q8kd4fwh
	exM/TPY6X66cOA5NluPT6QZmbvBD5cQT9bIn/CSj5A1xTKmZNrk5
X-Gm-Gg: ASbGncvLcIPZod/Xj2dOBgYh9iBBKBs4cPkCCS1ZSUF3Knrc6IHE4xKRVDWEplucP+0
	ND0WZb6ZNwebm2L4kJuAZWDs1QC31N6hTPeQtiA8F739HZGLu7iYZ7n2sKLWAFpOIpM9zdEHU4U
	Fp5SVijqe9Si6hdeT/0hZitNsPhGBGkbORtRMX1fY9hiuRHpQ4+o5NL7uSdM3jbNrkTcqAysbao
	DYRM9Z+KK7J7yHEp9Ai/yNwBMGwL7ClNp7kjX0XBFabqhKyP5LwlSoP
X-Google-Smtp-Source: AGHT+IGmGiuGmJ7cr/YlFtKUGfl+Lw+keZnJY+/qyECXqKWi2gZ7Ll72lMqjSSpR4TXWTqZ9CQzRGw==
X-Received: by 2002:a05:6000:1847:b0:386:4a24:18f2 with SMTP id ffacd0b85a97d-38a8730adf0mr6533402f8f.25.1736437956119;
        Thu, 09 Jan 2025 07:52:36 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d050sm2200096f8f.15.2025.01.09.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:52:35 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?=27Uwe=20Kleine-K=C3=B6nig=27?= <u.kleine-koenig@baylibre.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Date: Thu,  9 Jan 2025 16:52:33 +0100
Message-ID: <20250109155233.59162-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_075238_441108_FE2C7031 
X-CRM114-Status: GOOD (  14.24  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Split serie in single patches
  - Remove irrelevant 'Link:' from commit log
  - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com
---
 drivers/mtd/devices/st_spi_fsm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index dba584fa2a53..f2266145b821 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2104,7 +2104,6 @@ static void stfsm_remove(struct platform_device *pdev)
 	WARN_ON(mtd_device_unregister(&fsm->mtd));
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stfsmfsm_suspend(struct device *dev)
 {
 	struct stfsm *fsm = dev_get_drvdata(dev);
@@ -2120,9 +2119,8 @@ static int stfsmfsm_resume(struct device *dev)
 
 	return clk_prepare_enable(fsm->clk);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume);
 
 static const struct of_device_id stfsm_match[] = {
 	{ .compatible = "st,spi-fsm", },
@@ -2136,7 +2134,7 @@ static struct platform_driver stfsm_driver = {
 	.driver		= {
 		.name	= "st-spi-fsm",
 		.of_match_table = stfsm_match,
-		.pm     = &stfsm_pm_ops,
+		.pm     = pm_sleep_ptr(&stfsm_pm_ops),
 	},
 };
 module_platform_driver(stfsm_driver);
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
