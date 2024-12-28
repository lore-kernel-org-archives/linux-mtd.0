Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD37FE77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CW0R5hJXEJJV/nPiSat9+OQbHvzeZJxMgfWuoiHksMU=; b=MUyEkQpqoD42zb
	SlhZhIU/YWpCvGFkIL+tLxCI7RMLpsaHunIvBjDHV1Szlc5heMqP824jZH2BvMIK+DLyLiHFXwNHz
	G+tXR4kZXZARYsYzpC0mry0cAgwnEvr+93D2gpG/BFsE56hPquj7gJ41ReZwmJGTXoa0WI81DeJik
	VMlp+QhdowAjHPyou0Hv3DbHgDeRdjURZOj3laNdRcDK+E90w5e+TbsrW7O70l2q7uA1xpSQrnFgP
	efFbEJDOsHaiUt0Ab98VI9f8omRzjPyV8rDACN6pDM2ArPDvy/yZAMlLTdpM1wYZ7EQg5K/gb/tfD
	t6uD2VKRirXHejukA41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgMI-00000002aqM-0ljn;
	Sat, 28 Dec 2024 23:36:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIk-00000002Zr1-3gtM;
	Sat, 28 Dec 2024 23:33:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso82146985e9.1;
        Sat, 28 Dec 2024 15:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428777; x=1736033577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxV9VtPwcOjfdreL/ElR6ztmuVaPGRx7ZtA/COvnbHs=;
        b=NfkaoeftJjqq91W9d27AopKacThZuA+b+0DaMPVmECATlZbB1b0rjzjYvo/2I+xTvr
         vhKLaDF9lF84Ybhuzjhuf9vZNo3qQKjjFH64feJhFrsL9whFBBkD2/WpgG2mJVeJ8yjf
         T6ocbodszWyzI8Ips+PR5O3wBjE1i3cktG+lMw48zQ7e9oc1yc1642n/17jF7H47k9+1
         hxnrXnkskrB0IYy0dlaO12MEvoHFuNecU3s4eiyBWW+nK6H0+mNiPT3RBhT7jllTSQaR
         wIi1cO24d1RkjE5eEnIs3m4k7wsEmSTB/aJX4Vd29hpa01L6S5hP3eDfIGRGW8X7xYM2
         YHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428777; x=1736033577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxV9VtPwcOjfdreL/ElR6ztmuVaPGRx7ZtA/COvnbHs=;
        b=H5AmJL7lGo2SGatakqzf/8fRjOaz/ghP+YzmqYJf8MyHfpC8sRdgAYMT/GuGUKo6Gl
         QeQqR+rQlBdzegqlmJXlJD44HjZHoYpe7teMZNv1By1U7a1xaV5mmiK5Ib8nt9CaxqzN
         AQG+zZSskIJdVsRnIz2GnM6oybwjPboeB34XR1w91QGQs4bZc2Zwb9b0AD07Xla1cPty
         tiuvpsTNFCdhIy/Jm7mENRAaEp0MdWEPURuWVG7mAW7F5+rvJwbmGJc7weC9km5+b7KE
         vigextT2ZeE+E5kieNDJgP4SxkWEXC9zyCWAjanXLzGl93bCxhH3Nir12hjE8pCj9o7t
         3Fcw==
X-Forwarded-Encrypted: i=1; AJvYcCVy6mT72I/dKzyvtr+gae8pA5P7GBwZNGMA1iQB7tM5YEzIFqIT7zSIqfzSdvd0VxWxZvEUkUIAH54=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk+ExS6Kio1BUQoCXY247Ye28zohSpyfpDMwBXO3XfpukvvNk8
	KmpbsqI3dKDbqKFTbO5QDvgMf9Bty18BszQ4oQnKyQ9wp3q12X51
X-Gm-Gg: ASbGncvYDbxMJxpGb1t+AXTaV421rQ3Uk89apb3eS7IPFNgKsbx2sh52aEZ+sLetoC5
	TlKBQR/CfUCdKWylv8KzzdPKZie0Y6YvY62kyBewjLbdyiB37RO3b4/3nLXwYfvXIX8MdMh/S6w
	Cd2RWioQkkRObRvgvxwxhzzH9ert7U0PUbxncIaGFkHLYd4O1t8cTDxT8LLrAGIL6X+GDjPgcIu
	cUJaXUnwMjqrGj2wX3W5I+ipIDS2zPJnmwTaLl3CRxs6IPj2eGw/ZZGfA==
X-Google-Smtp-Source: AGHT+IFXB6mtbitt1Ty/iT+t/Wxyvt+fr2CPLQ6VRcW7h6pu2iRFzuNW50tyST860x+rxbR3cQJGsw==
X-Received: by 2002:a05:600c:3b20:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-43668643bccmr256788785e9.13.1735428777279;
        Sat, 28 Dec 2024 15:32:57 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e528sm26232100f8f.83.2024.12.28.15.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:32:56 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:42 +0100
Subject: [PATCH 3/6] mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=3cZeUXTp51nnkA0ehfcJ3kzlhmQfCuKF9N0XQDOcDK8=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkunV0YUrJmo2OxF1WCeGsLT1QpLwOpvdep
 XrGjLg1MXGJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tYhUD/9P4jzfqCUfSrApK6lmfba4E7uCY6h7SzplroCGW1ScAmboJ/iYlxhkMHbAYfLQ771Sy5X
 GApAEGp4oyZ3wXnMKt8YIdaZ6hmJTzeBWIsuISUWUx+2NFEqQQ3NuKR9fyjjJOz541V9Sbrbhj5
 dKm2bsvCeg/vFy7uEo6HCGmbFFrdSMUOahladMZaNiFyssMjt5B+Oxo9WuGPd1qecQKGPVIsqS0
 Rnlrb/7nduNaMV6u5peS3QPgq/rW8qodw5k+1u7YDrMbvU3jOpDBbNkZ1S0sNxBnoJ8tnAjwDk/
 eQlg2JFElPRIvOnRWXngSOzLgvZR/nHaFpYZiZnfF32pvu0VFABQoQ1JL159abwroLScvR48/C6
 6i2RMm5ARJf5RdkBoYai3xU93SvI1qxjYucRkE3uj+mMTZ0PUrftZ3JZ23DMZZG8WnPNfh2EOxW
 xWL1/3THYy7Wl7qHQ00LPyMT2NRocPs+0Tp1wzMaRVMj0q6ciGjqJ+QYHMZlHbhSh5sBCuqRwmu
 41acQELy7x7I3k01wrZ1sy4TLYyni32a1fvdO2G/DWSvUSDhFTMkl2dhQUfKpv0VrXcx331yS/z
 p0to76g+3pC4HZPGpFzKof2JGxRm11hvlh2tzpvL3RFL3eaWjrtMGvmM8gXxvtCcmh8Ha9CGnNI
 ovHV8xs1qQgCQKw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153258_975465_4FBED4A2 
X-CRM114-Status: GOOD (  13.56  )
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
 drivers/mtd/devices/st_spi_fsm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index dba584fa2a530b8d32eccc4ebc4d04ce01582ca8..f2266145b82167a4f7a063bcc7815115815483a1 100644
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
