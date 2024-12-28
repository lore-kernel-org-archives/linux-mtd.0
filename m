Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F52E77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRLoXnK4D4O52k7XXHMPvWfxVNtVKwM+K0aTU+mwpM4=; b=WJEOwCfxN5RL1Q
	01kRdmW7vn4OretJVjtcVipv0mE4E758XMiX0ENbYncmZjCQ0UpeGM171VUR957N6FLJfMHiCbI4A
	1lia8WBOb5nV2NRrPcCSWl9wAkK3zaTuCb2qzIT+P6+AVdvdJ/79PDm7GqZT7yEh3OaZtGHf9AXKR
	L3+fqS0iopzTAv/ALHw6bu22K3OvXF+NZ9tWsI0sigG9LBG/ny8PMrjJIwdhk5ED3S4ybdKb71sDf
	qvw+Mohyqd81yqqnbJY35UCnZcu4yvoy2QeiVRZIrwbwbRPwrBh7ifLtfSpSnXDd5K/uhMOwP8ESZ
	X4UupD8UjYbPWrike6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgPp-00000002bP4-2nFL;
	Sat, 28 Dec 2024 23:40:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIo-00000002ZsO-0R0w;
	Sat, 28 Dec 2024 23:33:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43622267b2eso86860625e9.0;
        Sat, 28 Dec 2024 15:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428781; x=1736033581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3zTfYTmH7V6QXuNHKkMZLGYqANdc4Kmp0yLfTvIJII=;
        b=cfH2yvVoGWGHy9LcuhiGRdTP3ecs3QueZEGMWqLjXHxYR2lKnbnvS3m7da/WxnHb92
         HM6sOk7LMdMJVgbIN58e7qXivHQStuWn97foFvUmnFbOmYZcmkToj1S1cb/1rFy4LQfI
         IrFqV2U0I81y6FMzY0dLEpQAWu/2bo5NSKZJf/U64XF8j0XfgUBf2VastkPkbq2dCc1b
         pbJWzirZEA7vl4QZpQZ2CJ2NC8IauZfvI8teBInUOh5V6FoHCCY8mnJAIYg9ElH4cruY
         glQyet+31CLthIGCdSoI1z7m8yrdAW5eOqwY88toZ7VhXqec/iQvnlRQNg34EUujClAB
         Vk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428781; x=1736033581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3zTfYTmH7V6QXuNHKkMZLGYqANdc4Kmp0yLfTvIJII=;
        b=R+F/44ieaemUuGgwH0Gtjzl7iQG4eTGtH688ifjgLWLzkO0xPkGlUeFMOs+8YI+DtF
         DSnyI2c0mlIRD07jyzAlO3t2r+Z1hNFfAN0JrXT/Ndb4CWWt9HTHdLlTXjiBc4k97Ba+
         2JBVbNeUs6iYPWVwSR97jlx5HMO+tmO4S/pIpw72A3seJCErWRnHulzLVP+QF77SuWnQ
         iESHVoqZGldIK+6uOHusAQwnEPdDCXF2Qt94r1WWvZSkhpfR2KwTIswiZJoKIpU10PjP
         O6MpQkSOI+yiLtecFu6YpfAouqlcZ0qUSycf9zQjeSPdJSmrWzB3ZroqrGlTvSG+XWrT
         b7Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVq3MqgLYDxWRfCnkH1Sxm4Bf3F5KjNaDPT2K3h35CYUi430cDfjvV7ivlN0AgC3vG0yUgECYq7Ht4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz72VJ/3114Y23N46lfQXsIk1DqMpK5dOEIfa/7gN35669pe/0L
	v/KiaTnNyIkAHE8gl8yReb816ZDKXjRU58ZBkea8/jt6wYeqlqE1
X-Gm-Gg: ASbGnctOpuvE5eG4AXPNnjpmQYMHm2wCCGuAnepojSrShEiN5rHJ/a5nEA7nW3/djQj
	N8rNLLwxZXvtQ9Xlv4kY0JgO9PK7lvK1IWf3Gp7AmzC5yeblAwxyDBkACIgc/bgWU/+/DyDtStK
	6MTOzHBOGH+S2qWhEDvD5gA0JdAii49FBR8LQfztmZm1NnFIeWPSPJv0Fl/eSryNIvkqAucPDkd
	ClLKNsqAwqGlcNoXt5je5PpwWSWcyCCupFclA61Sn8yXsmz0bCAA1VqXA==
X-Google-Smtp-Source: AGHT+IEcJYHmTXyjTQ0IKDccCfhouFmdjCPXPJuqVdFHdCEXf871k685aGmx4Gh0Y+WbNAty4FI1JQ==
X-Received: by 2002:a05:6000:4021:b0:385:e4a7:df07 with SMTP id ffacd0b85a97d-38a223f76a3mr28191587f8f.42.1735428780424;
        Sat, 28 Dec 2024 15:33:00 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4b0sm309653465e9.35.2024.12.28.15.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:33:00 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:45 +0100
Subject: [PATCH 6/6] spi: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-6-c7d4c4856336@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=2SAyWje7KVs9u2R4zoEyduMFN1gU91zxKOMAXSN9WYY=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqlgyp8ozEWbmqkXK9N4hLvauXPgVgz8iuIX
 xBtJUtexBuJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpQAKCRDnIYpo1BLC
 tQjtEACgRG4xlJ7uKeIA7lnM0soMV6YFReYT4AAeQKOEdIX+sJjm1B/RWvmEgjXHXiMS6i/olGb
 tdDopgx+J7oOsCT66udg8iNHBKWlKb/czzNYxNoGUk7ot5nUdnl3Bpi4D04kQrhx0LX+BMyTZ1s
 +tUcKBW2RH7Kjv2vjN1o/ibE7G6bNCGaBwQGTQ9bQd4lxohl9pKtpGmSYvHzpKodw074qMs+YdT
 z4kVd89fIMpy7xqvrsFb27UR/VRPP8IpZ02niz+kXpcXaEQaVz6Gexv+T/QlM37+ep/oXUYpFEz
 wl2lxWo3Dr87Xr1tl8nkk9R+1KGlQXOCm+jQOBA5Glz7qtPq9KyckYmCnaioNMg4QZ1dJKjgN8E
 BP0o+AKr2SsiZrlB0eG59j0BtjMzxcHcTjtCqqc9eLfL3QxRkjDnRXslWdHYjK3xarvL4qoWFnc
 5SoEnxWQAzlBUlnMQbMz+rvUOBgBf2CkbJL00q/21GlSPaafulA5Ir3UE8ZutbThESAmOb3YCCC
 7KICCYh5ru3stSIk3v57JjCGG8OmoViMTw9TdUI1I57+KNmiSlNoC84LUAqRsXLEl2kHrXrPH46
 0b5vWiZUeMOn33qDrFPEiGuHlzP3BcA0M7IwZNPW7nJ1rhQ6H9dkT9dR3nF1MtJg2X2Orpw5FsW
 Ww6pQALy6v0aVTA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153302_155498_25CFBB33 
X-CRM114-Status: GOOD (  13.57  )
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
 drivers/spi/spi-st-ssc4.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
index 4cff976ab16fbdf3708ab870176a04f2628b501b..5cc452447410bedf3c12893d94bc959892ac827d 100644
--- a/drivers/spi/spi-st-ssc4.c
+++ b/drivers/spi/spi-st-ssc4.c
@@ -378,7 +378,6 @@ static void spi_st_remove(struct platform_device *pdev)
 	pinctrl_pm_select_sleep_state(&pdev->dev);
 }
 
-#ifdef CONFIG_PM
 static int spi_st_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
@@ -403,9 +402,7 @@ static int spi_st_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int spi_st_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
@@ -429,7 +426,6 @@ static int spi_st_resume(struct device *dev)
 
 	return pm_runtime_force_resume(dev);
 }
-#endif
 
 static const struct dev_pm_ops spi_st_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_st_suspend, spi_st_resume)
@@ -445,7 +441,7 @@ MODULE_DEVICE_TABLE(of, stm_spi_match);
 static struct platform_driver spi_st_driver = {
 	.driver = {
 		.name = "spi-st",
-		.pm = &spi_st_pm,
+		.pm = pm_sleep_ptr(&spi_st_pm),
 		.of_match_table = of_match_ptr(stm_spi_match),
 	},
 	.probe = spi_st_probe,

-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
