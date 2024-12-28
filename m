Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91CBE77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qX0ds8KsPteokoo21+rMU3M3VUrd9HKxDYkhB1cWhyI=; b=pX72NRoGfjSu4w
	zgjA+g0csfSInfpb1C2UF0UdOtLuOQzwWDvQ2CrxQXRGT2VZHWKx6V/Qp/pJbpQBBkenPdh7epOox
	bZqToqNuYEqiJ0fDyMreVDzTzNue8TIgBnwSMYtyQhx2TgsLAZ895W+ULK8s3q0R4T7k+62zYy+r1
	xT4auy6G3C4huCfUjiUJlX/2G+2s65+oGLSCOD0EqdAmWPsUXTvGGV7y/tLXO/JbBILejZTEHDZVy
	I7rQYuIy72GZemCzTU+R7mYR4V3d0mwaPqEHwl7Lg95wy3KQtQAXrQPtQaWe3gRs9Y1RrV66MdNdW
	ynSKEwvVfsCunLCczGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIk-00000002Zr7-49Ma;
	Sat, 28 Dec 2024 23:32:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIi-00000002Zq2-0NcD;
	Sat, 28 Dec 2024 23:32:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so4525448f8f.0;
        Sat, 28 Dec 2024 15:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428774; x=1736033574; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yp6YLaS3wbdHHh56yyPBMz3HOcQbYn0L1NBzbosE89U=;
        b=QTgPD9vo+c8ymez35iQlMGJNlqGe5VFexNN4ioxk+PuUgCARPeMAA/LS9Rt+C85LGC
         jobBPhpyfXX7UnerMQmsJ3HwxZTdrgutzjcwh8iegoypAj5DXho18CtKDFlgR8ryF3gI
         zQiQj+c8a+fRWbNSP4LQ9+uyNjXNXlt6z1oG9vx/5eb/8NE15lGqxK9JD9daOI1C+bs3
         F5w3mrPGHgxOjNcw/hiDcVUm4Qk5FUOO8n7VW2UBo6PvoAx31E5Oio9+sb8s6a9A++qF
         eYXza83/88xL6RqtyNUZDTKpFDw6R+CuBdhn38PRjlE/YAdNzG4wt+B/uKGnh//2W5F8
         bVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428774; x=1736033574;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp6YLaS3wbdHHh56yyPBMz3HOcQbYn0L1NBzbosE89U=;
        b=a9pW4PugCb5P4aB9O2qmo1UDEIUQ7BSTMzsphECMfA1R4gMXQA1R6dzDcPqn/ZzV5E
         0tly+sROEYqzk0FVZ9BOouKjBVMhFLiKijz35lZklQa5r0fFq0yMzefDSr/rQUKAhlKH
         Ieb8a9AFSb96JPTr3A7/b89aDofxwdrTVpDwyXCnlrDGgZiH5KhZCTD00YpUkB8ezVLO
         RITLgWCS6MAGApkMTqlXAAONGKunRKd7vnX3AzoL327Qz+PTCWy7GD6oKDVTEmAMN3Mm
         gcKxGXC4poV5m4pi2lzJv94xlvrJgXjGYcY0zyXAufM/pGo93grqMkX9vvxEg0CZ79A3
         E54Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2b82wDf+aHtE2pYBavnojNKMnPVJeY9RJrq8OKj/D7XwWC7YH5ALcL6HdQUiAXfp3q0/qVxy/PsA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4OwaIRgUZiFxnV/Jeb5PeVBAKDo/QFdBYbxgEDztSaLvPBzMD
	HTfq+5OVJrk4C5yRBETrpCsFcm36amrQYlEBDekNm9zMSy/HonkA
X-Gm-Gg: ASbGncsZxFoGfE92s/aRPJ1GfG2ZZjKZKb0WynbdRQBlm13xfhM1Ka0LHsltikeI0r0
	TuAv/CfAhD8ivlxbjJEBdtWAjzGYQ2FZsOh/kSq0X9uuhlUy2tQz7bGbXgvy5GTqfAypaxn3i2W
	ln7otmwLIc+XhH3/WJRv240p0RMr2vQKBzF3Wt8ATpf6I1noIyRmcTdnyBYMQ4gMjkdhP8AuFyM
	diJdKET0ZdRxpYlJR3yfC/eC9641jWLPkvCVli04KdVQP5t2a3BSFG1jA==
X-Google-Smtp-Source: AGHT+IH9Pxly1KkOAngXtmnCTp49btuhnhudeYM8IucjVtpMMTrprdVjqVAvd4Ltow0b92P3+UAzuA==
X-Received: by 2002:adf:ab0a:0:b0:38a:50fa:d582 with SMTP id ffacd0b85a97d-38a50faf3cemr1893012f8f.59.1735428774217;
        Sat, 28 Dec 2024 15:32:54 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474c2sm25616331f8f.55.2024.12.28.15.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:32:53 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Date: Sun, 29 Dec 2024 00:32:39 +0100
Message-Id: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJeKcGcC/x3MQQqAIBBA0avIrBPKFKSrRIjpVLPQRCuC6O5Jy
 7f4/4GCmbDAwB7IeFGhPVZ0DQO32bgiJ18NohWyE0LzM3l7oEnBBOvyzlEqrWa0i+97qFXKuND
 9H8fpfT9Zpv3sYQAAAA==
X-Change-ID: 20241228-update_pm_macro-e4585beafd33
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=giHUQnI8ap63UVqjMPzoWtpyquzmfVZTDzUG6P1RK5Q=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqaIFUIX99U52dYXyKTHv3kUYpiB1NgWDXmQ
 fbeWDg8/+6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKmgAKCRDnIYpo1BLC
 tcMtEACBJ0gPdEh3A9kQDku4xnQ3prDDj0BroWFCemcZ3uDele37akkQ207mrAPUnUAf9Zjo6nc
 lFC566Wdx1jXko5eOVPaPJ/edqebt3W2r4sk2Y3mZcT6m2+MeO43BR2XfjjNXzSxDSYp6zSh0QM
 R0urFraGthT4o2d/WeZBebYnfPMfCemp8aA5KA3NDlRTDs0AdY8BNKiLKl2eaRuZno4DUuK2ibI
 zw8rWXkJHld/dOAL+sm+Z4L5PnkRFnUCDk/IXDiJuHWiYlKzwX7G2FP1s1r/fAIFg4rtm2x8wCo
 guwnv5TNvItP1xk1dOqmdxOqboQdx7O6Zxg6aE0iz/LFB0oU/cV0tTZJQaI1mg9LSJQqjF9tFiD
 ws0ugN8G4DLBVUJotARGmqBcWIyIzHZpP1u0UBpnM58l87bG1qK+9CLt2EnCUELhVgdz+QOqtfm
 mU6LioIYAoEFxMPlYDjFTK++GHJ28PO9vOfanD8WFpAIHbUrJJyWXXyI28hKfcBLOXPuxN5kmny
 YUc+xSr1t+hM1ger7KHjGW4dpzEpAOtWwYvYzk+WgMOn1vYeBqWC6x8LaEeN/qOGS+4ajhwrqj1
 c3PTO7zspLoPoHi7uMoGHkGtePff2MI9uzzYdWnKAQW3+iftKa3RtY8hFgxDar0iu0ldblZHZnB
 sISlnpXRGIpbxKw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153256_187675_68B449D5 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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

Prevent the use of macros, and rely instead on kernel configuration for
power management.

This series makes the same change over six different drivers:
usb-st-dwc3, sdhci-st, st-spi-fsm, ahci_st, sti-dwmac, spi-st.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (6):
      usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      mmc: sdhci-st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      spi: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

 drivers/ata/ahci_st.c                           | 6 ++----
 drivers/mmc/host/sdhci-st.c                     | 6 ++----
 drivers/mtd/devices/st_spi_fsm.c                | 6 ++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 8 +++-----
 drivers/spi/spi-st-ssc4.c                       | 6 +-----
 drivers/usb/dwc3/dwc3-st.c                      | 6 ++----
 6 files changed, 12 insertions(+), 26 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241228-update_pm_macro-e4585beafd33

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
