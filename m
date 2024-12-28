Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C21EE77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVDEFILW7D3LUQcn8uU8uxj0wzFYQFI2VjrroIoIlNo=; b=IQuP5vwYX3eSPe
	CLNRUwdRBTxGcnGqFcG8c9VuDAVn8WDv1oadiSJ03o6oljCUvZ21idizx3oDXeeHTfFG/ZCcpDp/U
	T3JAL6SmVkKVAbgTeYhZFnuIyf9lT43Bl+FBtCSGaoJF5mK5P4PwLkr13Aj1cYZIbTVIapJMsPDKS
	L/8xPNJ68OMgkdBwJU/daic1rGwxr/RiU4OnuTSe7TwOV5Knv5PnNIMXW2p3qoHhm80UGYY0arMuC
	YuUSXpG8L2r4o1t1G3yaXXKWU4GbWUV0ZndQ62dcCvAibIeXWSdTP0wPhHgLhJxeoSY+uDqT4a0BN
	pj7BVQPQfr/PNgTiwHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgOf-00000002bCt-1Bb4;
	Sat, 28 Dec 2024 23:39:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIn-00000002Zrk-0ZW5;
	Sat, 28 Dec 2024 23:33:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385de59c1a0so4918815f8f.2;
        Sat, 28 Dec 2024 15:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428779; x=1736033579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOT7K8Ya5QmS9KbZEm2dNA6PzTUyykxaRlEoFqze/Wo=;
        b=akFMHbwiJVUSc3yk4XbSe8kcFgNvIsQ5Ih4PyRAA4h5RE2HI2ZiJPXt7z08jZXx79+
         WrwzPcWdpnpcECoMD8vYKsG3xKiyrqRxnUbSchuUhN10INrZVktBJNx6DmIn7VvAM+BJ
         emNWi35jtUO3RlQ91ptH7DYETGbcygUB7VUPsj5jYe+hTAHbjw1rK9Nr2S9OyysWe3wL
         O4LF1z6hyJHR4xMG8HnEnGPihOk2HVOV1ib12zgpGqKqhySiYNoCLPfk7GoAx5ZYbXwq
         +j7Oo9eaZPbeKF5XpMuAkT7Ye7RM/2CVQxq7Gxith6Ekl3uIDBK2NYEiOlwVJ1inx+DG
         f/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428779; x=1736033579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOT7K8Ya5QmS9KbZEm2dNA6PzTUyykxaRlEoFqze/Wo=;
        b=LYsxkQjfJv/mMv0myCoGVGrJQhZl//fUk3z2bHpEVpHw9ASiNsJrRC2gifAOHAbDi/
         scuj3wygVf/2SlwEgW7LfXfzd6QTO3txq1cmxnDLrpsaMhfkBEiTf+u45iyFGaBFQp/7
         X5M0rb9GADcUA86PsMJugLiaTjakPfBb+2JEgjgadpZtkeL9HmV7bFcEH7goVIjfRxaB
         w3yxa7eC+WKRXsUNtmxQw2KkCZfnXazKG2uq3/Ac6QjF2FVOuAXZDD6DA+mhzsJScL9S
         byYkKO6c1KyDt9T7Y7JNNYRRz/gZhuEG515MsmxbNEB8/J4K9nN52ueEkLqIht0u3+J9
         0lEw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VQ+mkwH9jZmqQoYKCizmgEga1yv3TL8FDLEvWE65yMbC0WNNXQPxyNmwCngGQDUrsKQqjeF6OAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlJGJU25UaT3M1sEVb675aOQsGkB98LwgLdz8b4GYxcxjizABL
	JgZklz8kfvbSV6Pl43tPnuU/pt6unDQbzrVrFhs8883CtrY22t3c
X-Gm-Gg: ASbGncvl4H35JXQWxriy7XdCnrwXUW9BnKPa9+EU6YwcJC+JqjGMJTXmbKwQejI4w5h
	92b5ht0ACH4MeiCKPzp7rAZhjWORUcrNmrr2VFNYfjItIhKD9y4AxKKMpAIcS9pyK9JiX0x3uzb
	xXaEC5E5hS4QEMIYFfhNpuPJ5eEn6rAvunjZTUshl/L2sGYOsjk3pBJOZwyErcQLWLe5gwQ9hqy
	3rSBJcIiqCGy9zrw4uEcpUhAvHjEutRPVNpT1QSOLdFEjTyLh+BE00mMA==
X-Google-Smtp-Source: AGHT+IEDx7wvGkLVUnT9AMtJHUHuNgRawRAtN+qgnC0Cj3E/aztBEivykLbd/wn9yN327aAFyzdA4Q==
X-Received: by 2002:a05:6000:1542:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a221e1f67mr24709765f8f.7.1735428779386;
        Sat, 28 Dec 2024 15:32:59 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6ca5sm26538490f8f.86.2024.12.28.15.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:32:59 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:44 +0100
Subject: [PATCH 5/6] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=Xy7AdPQ3XNeeLhZR/TYDcrnRFX91WkBoxIfX4qqZmFU=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkdCM7I2+fjKtHyJmXuIMRiTT3ConPrpraf
 j4VH3GYg+CJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tWOLD/9mLv8T49Aj92DxuFqK+5R3cczwAA+SNhe7B2SwXvfVYYd3E77Y+/6R7e61V78SrnbI8gz
 uaBNqyvNBthY5MeF0I+NbwVeOCkA2B23GaLT+QSAAgc/lpqQ7wFVR3ISSUhZfAT5dU4co5VkvHM
 xnEYsquomiIFCIsoOVZw7fvrHUaCfpBwiyPXjs+jaTzfcq++bCknVVo0bsn9SrV9v6OIEzL4CxJ
 2Gec/Ah9nHgtAISBD8U11Ay92zy0/x8J2tmMEkLxjOFcmqZmJyYB0X1eyMts89qT1Xz+qxVwJ4b
 eGSEySEwcjMA401vbYtcTwgiaRaERA8MMXj2OjAznA2N2n1aswBx2ElmwHm1wBW2FXPfVapYd9u
 cKDauqd2bZioY7er4gOxCHnT7cvL+mGopN2wMggQ7N2mnGfAnVhUwo1BvvKnALB6XZUt4riUWco
 td11vz8xganX4BAkgJUrdabbCavIB95y7cYJOMpKAnQGDHRALdO3K/R9opffcvMi6xvmOl/amaJ
 z/7BF43VuNbdS0NTjhHxD5V9G5FlkeT31KscpPYrGl4XpRe4HaazkrXfMZr0DbWSBESGgi8Rj7V
 +MXQFC/biruMtBy8YzlG9rLxu1xkClx8ECgKGVnRJBpUo0oBdpjoD8/QjoS35kjJWNjGSlKyI9T
 uq80NJHRbLeVYQg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153301_182421_7A67778A 
X-CRM114-Status: GOOD (  13.87  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a985101643908d2efdb0b4acaa9d60..de9b6dfef15b3d0a503a3b55b3e9a42ee68c6141 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -313,7 +313,6 @@ static void sti_dwmac_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dwmac->clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sti_dwmac_suspend(struct device *dev)
 {
 	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
@@ -333,10 +332,9 @@ static int sti_dwmac_resume(struct device *dev)
 
 	return stmmac_resume(dev);
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
-					   sti_dwmac_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
+						  sti_dwmac_resume);
 
 static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
 	.fix_retime_src = stih4xx_fix_retime_src,
@@ -353,7 +351,7 @@ static struct platform_driver sti_dwmac_driver = {
 	.remove = sti_dwmac_remove,
 	.driver = {
 		.name           = "sti-dwmac",
-		.pm		= &sti_dwmac_pm_ops,
+		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
 		.of_match_table = sti_dwmac_match,
 	},
 };

-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
