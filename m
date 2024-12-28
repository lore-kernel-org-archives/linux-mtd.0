Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFBCE77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpbaUvTyguaJMYpCP4HQhhTTOiEJyGiwCuAnfwmCbnQ=; b=SaFq5RwXvb0tKC
	aow44RIiVLI5uj62pIR+IS7R1pkBQHJS4I9yFcXymTBevFpmukjHH/NJHknmmSG+4LXUBiLkOzMOU
	OiswuqU57eoZLIjHI1kiRhz+9+8WluWp6rOqLT1uyKkwFZb1CVZiD24n/GYka9KhjtVVti30Iij58
	XLic0SDpWphh6DJPJ/qzYyMY/g10elHDfAZBvgphQ/LLfb3V+zt1n7lC1nOSM+zmcmxiaqnB2HmKJ
	9xg0eviyj5kTQadJabJppcs32jdLpvO4dcc/eJ5oj07tt1jJbnoaUY0nSq4PkwQnTwURjs6WMPOlB
	T1ojOHB3mTY7ki2Z4NmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgL7-00000002ab9-2Os2;
	Sat, 28 Dec 2024 23:35:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIj-00000002Zqc-3YOB;
	Sat, 28 Dec 2024 23:32:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4368a293339so40158775e9.3;
        Sat, 28 Dec 2024 15:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428776; x=1736033576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKu4EPBvLsopgOFZpl7wz7qwa3Ue5APX8+1kt9ZJzXY=;
        b=QuwEwtIKjglphHLxUN17VjQANYcEn7RhGnuaxBsGNPl66HdhZ1ZD3YwmTTvS9LGSci
         JbwUybMdx1hXALWZm+GJRToBbZwFMYnd7kRsajfiCJ1bVUn0bfAGIJ7nTzoWOxxhkPYI
         nleYXMZhQWAfARCywelGSy2mMbEyZ9N6VxUaJ14At9NVhAG94kh9FMgaHmLLLLv+r0k8
         /+zi1oYfZ3Afuc0paDPAocdjKmqa8zP2lp3fr58bpBrVxTZR+gQESFIA/KD/26s/UkyE
         Nu3pdJTxbzGsR2wGPjOfIJENg2PpMF96fexRNn1fJ+WEAu6JQ1fvyYGrqaQRJff4KGvG
         TxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428776; x=1736033576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKu4EPBvLsopgOFZpl7wz7qwa3Ue5APX8+1kt9ZJzXY=;
        b=h3ncwKImBRqnu+wjBLi/i5QzieRKtdl2tLeOIuvKlMKL/3ybWI/DKe7EYJy9pMuNcH
         +nIpJWzi72OBju6lIsKOOHaGYVk9P1ZeOEGO36ftZuKqXXh7/Cto6AblfGA+iUdQCUwQ
         +A9CmfxNDixrWPgtg0HYg/aplhuIXwdIOXXY6fBiydzUCpugDSEky6m0filCs5skTt5w
         nfc//B6WWpNjAYYFsveRv3X4dcBItjmaCsLRoppBYFhvLRh1Nt2Jh/eowLLq0AG5y2MK
         7SFOnQ1jhvkz/9sjkwW8z/bqe8QsVN6w8+9vvOZp+RRh+p+piAkH/Kld4VCYlY219DDq
         E8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVxERMYsWDErGqKGEOwuX9eeGH/Yg+4bkf9l+SacFYdvwREJI+h8TjAhF/OErRiusUgTNOasVUTbA4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBnKHJ/SCM+XJI85BZy0e5xDT1dFfKqU7J8QB9AvRXYra4dMyN
	nuooBBGUVoQ9zTVo8OmBTbHE2Yx6MOMLEIOAwr1flPrCWKRJk+iO
X-Gm-Gg: ASbGncs1KRzHDwuBDzIgAIv8TN8UFA+08vSzYpYEJl7meV4+5LHCMCTgTrPr2YnOrbn
	sQ0AwU+JlZrk0tley8ZAt6xsl+WwgYqPXu3WM1RyU+edjiT8mAp1KpefqUQ+GvWvtgtiEF+F0KS
	G1+LXwPTWTv2GbTDDIl4i+qW+DlRW+GxKP73yX7spaZPEUzmHLbuZqe6DOavEwYcDL5ed8oFj+V
	4pD5blkZs2vfyswrp604dh68f2EzI911PrlGtINpbqYL0ZdfcweTWoeaQ==
X-Google-Smtp-Source: AGHT+IEFMVt9avPwZbEkQECNlih0Tj5apwRe3kcAhJ6WkS9XD2NmI7QYDZOlN1PK+TzmG7eJVzqslw==
X-Received: by 2002:a7b:cb14:0:b0:436:90d4:5f3e with SMTP id 5b1f17b1804b1-43690d46037mr104959305e9.6.1735428776211;
        Sat, 28 Dec 2024 15:32:56 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a08sm312165205e9.25.2024.12.28.15.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:32:56 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:41 +0100
Subject: [PATCH 2/6] mmc: sdhci-st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-2-c7d4c4856336@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=0LBKnKFkf/CBAf2vV5CqDxilt6OKT0uPTamcOeeAqdk=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkV+oVyk//zTE8gZslpR+kKKOstF8wTCVuV
 TKvMYBC/MeJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tavPD/4vrOzvBtiiJvKt9sC4OUwOCDInW95G7gdKLGetgoMPL841oWQyr9G/28XQniPi4LdT6m7
 v0phn8UdBtytA77ajXuapY2/8ME5HKafYbBvhAVJsbGqHwDq4uTWZDV38h40Ll7odOwUniCSWHm
 Bt03pyV6HdwF64lkyn0pGoDN579sNaOHWW1uzn07Yo4mE+bV/Aa96/I87xWaMtiglRUNBuDWMeK
 SHLmnTlNcvlBc3MjUhsPmtAeTnd9Hevaw5MHK5Kq2jyg4Ixm5eLx9Afar0rxLpPZiO7U89upIRG
 UZLL89qGSMcgBh4TXwESAAnZ48AiwQ1nCxhXne5Nug+Y+XVvpA1qIZa3qvecraz8aTQ0W6lqPEm
 yZ+U7m770MJmH9PWsNGpGQkbpV/m0m/mpqZwmonu9Lqdr1qz/4pewLG3+ZT1658XgOqwnj+cls8
 ZqtnvNYqKMurs9OupShrezeNUioevn5bHYv8QlHIqU8KvmJhhd6ybeqchpUPz/n/kuMIyh3YHJ8
 mToQrF1qUoCjt8RAZfqivZo5GVNIK0Bw8t677CoM5UhnFNbPZmQ934JFNbbdJCbYtwj0XfrIhBD
 MAzzXA+NSAoqzC4S+u2/GKJYki+n9kBcqr5N2nbH46jPNqxOsf+vz1K+b+BDhfuedcCzn0ES8mQ
 K9j1SwhQL4jmseA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153257_912300_39C355D5 
X-CRM114-Status: GOOD (  13.54  )
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
 drivers/mmc/host/sdhci-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-st.c b/drivers/mmc/host/sdhci-st.c
index 4973e08a98f87380325566a6b18878dd45e1dc30..901e431976ced68d5b6e374c2dec93c9fa821d38 100644
--- a/drivers/mmc/host/sdhci-st.c
+++ b/drivers/mmc/host/sdhci-st.c
@@ -447,7 +447,6 @@ static void sdhci_st_remove(struct platform_device *pdev)
 	reset_control_assert(rstc);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sdhci_st_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
@@ -494,9 +493,8 @@ static int sdhci_st_resume(struct device *dev)
 
 	return sdhci_resume_host(host);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(sdhci_st_pmops, sdhci_st_suspend, sdhci_st_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sdhci_st_pmops, sdhci_st_suspend, sdhci_st_resume);
 
 static const struct of_device_id st_sdhci_match[] = {
 	{ .compatible = "st,sdhci" },
@@ -511,7 +509,7 @@ static struct platform_driver sdhci_st_driver = {
 	.driver = {
 		   .name = "sdhci-st",
 		   .probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		   .pm = &sdhci_st_pmops,
+		   .pm = pm_sleep_ptr(&sdhci_st_pmops),
 		   .of_match_table = st_sdhci_match,
 		  },
 };

-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
