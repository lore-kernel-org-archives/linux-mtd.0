Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63212E77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPm1SbMelgx3W6LchzShYAS3eMjiCoHK/H3WwvDoJOQ=; b=LNKJ5EmnMLuPlJ
	ihBoqfBut9gg3xp1caHUjVDr6DyYzwnvTjb2ZtWB54koRdrOd+8YXrILWSiaLbryIlrtxY/0a3lr0
	QvrBlhLOBJpOTgHlFKlMZwa7u5kn9u+3WOm48KQNinjZJv4dSAzLhs59k+nIGtrPSsMOTXiypWLiX
	gU8CTtSypH91njv1VCHx1q0piM3drSDQ0aJVWWS/9dzCQ/cT9VWQNK/jQA2QYwYR4UWII6B8LYIQm
	pEKqt465VULQDnjAdY9w6S3niBcmtU6+YIEGwhacwnx3YrLJvTKOhJVBUcw2bP3MNG1BUfGjT85Ec
	pG2HciYKTGtX12J+qoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgNT-00000002b1d-2Oql;
	Sat, 28 Dec 2024 23:37:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIm-00000002ZrW-0XiT;
	Sat, 28 Dec 2024 23:33:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43618283dedso82166825e9.3;
        Sat, 28 Dec 2024 15:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428778; x=1736033578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfubF/yufWY092c2cPTjDejWqTWBBJxWn/OStLH2dG0=;
        b=OKElZgUW8QrkhKIEPW1eC3/RL2e3XD1nsEj7h5DxEfBTEWn6sH3L+rQzq+LDav3weu
         sNKncd/hSEsMxCK8wQPZyOtJ8SRNlthhs44/kkl5+S/AkmrBJzW4snntFs8drhsjGup6
         mE2VXlgffhdX7LhbOvtgYvbUVypk2U/6+E1vYiXRCvapIsqNVBVjq6BDnEy9Qb22ld31
         hHdYnrPcYsJq3Ao0DQsfhNrN7YseC5dC3LTY+YnDRefTEXXCRecodUBCxWsbEvkYSUcW
         nmc9R/sxqRg132s49J9Vw+8EYNXRvDSYhWT9nh0nbnfpFQ+JZi7RmLJldv2f3ICnVhsg
         gMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428778; x=1736033578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfubF/yufWY092c2cPTjDejWqTWBBJxWn/OStLH2dG0=;
        b=Xl4/n6xA4pD4sisbG7AZPOc+YptZa7N96WIqtJSaoRY94aHCDbxHGUdDW/KvvwDezm
         aWLVjyd7D7dDIlq45Q0yUzS5OcUVqiHmaKYFSOxdIeQ7oRJQR85PfLUrpARy2NTWIqf1
         XP6oG3alX9PsNktgNdtMWOiaZMhhVn+HUZ7YiTf8zSw93sReuopm/had2sbIR8z2wv75
         SxwOdGqv3xaxOHnXw41zESAaqUFsiBYx/A3uVgrP+hGVCgZdIHfZiFfhKPCxP6N0PoUC
         83LYuj3PKG6huCFXXbjm0X4MDv9KDInspU5xVO0R+Hr4bfuaLKTRhmyGaJi+xPEBY7ni
         OfaA==
X-Forwarded-Encrypted: i=1; AJvYcCUsgql1HT8N2y8kBtlzFL+yUKgGuQhrx62vOPoWYkxqmjtaZOQKflOe4dFWR5RWruwo5YWRpt7dRU0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSvHWAo2ptp6luSRv7f9mhNYnK73bYIqbEdH6/c4E8k/yZ+5QP
	oCd4o1O7CxQjEnU9kJoss8mJDFo5D45Kf/JNw90tFVttgHZ++jlk
X-Gm-Gg: ASbGncvuf0CT9+Y5lNeMbiZw+yV7RITlYwP8W/w4PaccmAJHHUoR2fETAgd44YigUWl
	H1Ipkvkh3XBx1ltcYphtqez6DlnpCqXjG/jRxosRAGIa022nO4tASt8qrc8HICl79TnRc9PPWfr
	OkINwqz5Ul2Kq4iyh9Qn+ZvrSw0ye29UIspzoXOnbasU2AjMC4R2B8vkPYIv2ppXiYLRQE4Yas0
	uwCAg0OUE6XN/nt7IAFWe9afcb35fAzV9dPn9krvWbArZD6j9RbNoJ7Kg==
X-Google-Smtp-Source: AGHT+IF2ClbgecNehGE5fWNtec9ewXlro34blBIKLgyQx5qEfdd7BFdxq3aJXVLuA8KbNB+TQ/BMPg==
X-Received: by 2002:a05:600c:1c9f:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43668642f9dmr262491285e9.14.1735428778151;
        Sat, 28 Dec 2024 15:32:58 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm307077615e9.15.2024.12.28.15.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:32:57 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:43 +0100
Subject: [PATCH 4/6] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-4-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-spi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=puiG5xEDdJCtQ8qmQzW/cyD8qGWndW0XH0vnx7xw1nQ=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkWao0M4f63BMEsxa8BRIQnaXQWygL0phkf
 tdecngcH0aJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tQJWD/9qfpDmwRN6zrCJNqZMU53EqDWlK+stpQdz2PxOgWM3IiMDfRC+jyRnvxeiWM9DBojy3CM
 eVzk/pzBMVdce6RrqEdBvSXEOhqvQtC1rwivdehnng1VXuGW7/WzqQ16lvPoYhaOeOSnH7v4S/Y
 5OJd33Yy8upYHZK+CHEDoRw7Y1JJcLzOGrgX4WjCVSnnCwzlncx6xZwhUkwtvI1FO18X5Jhgjh1
 yX6RZxXVxYc+3wdbKn6W9rDZZlfws37B0DfFdap3GBWMTfkNCgs+DGNgoEuYhZcMQxmwx66wb2o
 0BwEpi5PF9IGK6bHuLEEX2cr4gV9784GayGuaSythX1VMWzo4yVE6o9ETY0gdEdQUx5oxA+R5iZ
 QkPazXjn8VJIjnJgxjrVaVcCjDt/PomoWdeLWNdPtcslOtcTqTWVA3PxK3YuF/r4p+9hHbaizB2
 gnOwVzHIaLIKng0moZCBSHKUejWzwgkT/D692Qnwo1jzezsRFXBAHYBXxYC47FPUqrrNVLZ1IGW
 LSc+5kqpqWoJbf/J6FUi77wzfUAa7wwVSAr/kgt0ep2DMsyTxaWYy8N5KKmBIYr4eXWmdCr5IUv
 4HsYTrNo1Tx7bDH04sfmhHiXxDpwdR5kjuWexjioIGfPKVsju98eeYPPJy1R6MG0pnsXFTTm3AW
 1UCYQhk+nmIQ2hQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153300_186553_EC954794 
X-CRM114-Status: GOOD (  13.49  )
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

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 6b9b4a1dfa15bb6f395cc742f25251376b869a21..4336c8a6e20871fe25b61d6e2043fa15902b3559 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -176,7 +176,6 @@ static int st_ahci_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
 
 	return ahci_platform_resume_host(dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
 
 static const struct of_device_id st_ahci_match[] = {
 	{ .compatible = "st,ahci", },
@@ -234,7 +232,7 @@ MODULE_DEVICE_TABLE(of, st_ahci_match);
 static struct platform_driver st_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.pm = &st_ahci_pm_ops,
+		.pm = pm_sleep_ptr(&st_ahci_pm_ops),
 		.of_match_table = st_ahci_match,
 	},
 	.probe = st_ahci_probe,

-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
