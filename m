Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989EC35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8gzF9Kvt0r9cEBAOSZOwL3HI1NaRzl6bOtD8DjEoTjA=; b=YRdkS9lfAhn1ns
	MC9f2wKE62hvQSfCQ+FkzdiL3CY3DzO2OQvfSloUKCNDz0E2ITrDFnZdkF8JB4xl6DhDoRilQWGYc
	RRJOG5eNoidGSYS4aAerv+hn9sEnvZ/6SP6Nays971jqdXw87JnthlRvc9j0bDCxrleBReCWCCLay
	gbH1aLRkas9QfU8e8kIMJZG4dSAXob+DgvgvlrsUVR6IGCdBCDmteT2LVDTQaZLcuKLHm7stx8xIe
	W4Q5MxwFXxzvdRYgjmSTFTu6K1LnciYSdLchqJFXTs0mq2z7S5j4ZCM2mJEC2ID6h8LaGXJ1XUNKG
	memia99hz3yxxiRTzGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqB9-00000008aq9-44ss;
	Wed, 19 Mar 2025 09:57:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq1o-00000008Yj4-1IXH
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:48:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22548a28d0cso27591575ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2025 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742377679; x=1742982479; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sbZ47FHRO8GhpAC9R2csVeiqmhI0azn0pBpxkZV5e70=;
        b=NxNpJwxT8Hej2MChyRGkil6xWPvbybLRzBjfIdlaORydcv4qU96IYnULNrcCHtbxZq
         jqkgLLP6IOsVcXr5M3X8MFjFoO+ZyEA2e4S2WKxdTWgf4SgxJ7cEug1sDoYqRnaAejDV
         liJkRNpkOBjHIJC7NT4QJyihX35bb1QgGWHWq2x6m8ab7BabxFUmjTUswIhap+Kh/P78
         MT/iOXv6KUfWF6e4rvjMFQxl5FY+EVA8H9pF6N85VF7NnW7PT0bj3sdNjuYs6vhoJlDu
         nsmWRNAvf/7DcE6+RXQRtWgbBQrhHW4HRBynpf/WYokyqRpn6Z48j0rK/FwNgrcG21G1
         SGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377679; x=1742982479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbZ47FHRO8GhpAC9R2csVeiqmhI0azn0pBpxkZV5e70=;
        b=Qcr/sBmbx6cPZ8c4QrL0zYNXKOzmeiUs9TKvoekghFDy5H6IB7sHiUWZnV9298eY1g
         QAQwFgYq8c2Tb4r7hIWjFg5M/dMgSEMKlogQrhtWpApK49R04c2PelDPEzmp0O+OMdXQ
         dZunHMTaeZwLQjjaQs1jugypDXKPoMIb14TeE+TeqKaV7WGUtxvVx583f6UM5jF+IkEw
         pVZ6itDhR/3ZiMO3Mva0B5DqStsjuTW1pCPtA/eIkmopNXKYUigO7jpRWie7M4Nwx0QV
         +JPkdBtM1XpzZoKlNNt73JMDAB65E/GFWMikuIQy5hXqGFwL41mILTxq4OUT0l3DvACl
         rxqA==
X-Gm-Message-State: AOJu0Yys5iebmCf/a8ZWvnxxmq4fzMZPHLEEdbOPp1U0TPw5Gp6Aweyf
	2pn86oa+v3H8g+4BxCitF1Exhp8oo/7FGuOKaf1f9y/5EkUZiGv+
X-Gm-Gg: ASbGncuV56NQzyaI2wlZZtNszCro7Fcn6zfROhehiOUoJKzIvFT70s45MUoVw79U9AQ
	F4c8X+656ZN9VAII6OrUyDTdKR7pNwPPQXP/r0HHUXnXWUUYa/PsCnU+ObzZZzOkFKNdQrVt89k
	pC8MbBiVcA4nOlk0hK9GnhCv7IO2yxCwbbpXKwMDcFdGtsvXEMlz55f9YUPmGxGn3siboAquuk5
	VuOymHS3hr99gM+uhrPpwTZ8VwN8oBKXOAat1+LR122aHhwZnhbkhX6JTLjX7GFAThi5Cgf3HhU
	+0h8aUi8lwBQT66aZmflR9fYY6Da8RRJgLUDOSzdgStll1aj7zsWWsSRFwrHHuqrR9w5NsCFUQR
	Atg58WJ4+7Zgfw0mY5TAKX9HEpGwYLVlnUEPeng==
X-Google-Smtp-Source: AGHT+IHTmxf8tW2M1KZtfHI15upvypUupgDK1VnTqwzKkg65HgVFiFFIiQv7mkavRYVjgTTd8SaQag==
X-Received: by 2002:a17:90b:3d05:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-301bde445a4mr3574609a91.3.1742377679003;
        Wed, 19 Mar 2025 02:47:59 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589bccsm1103483a91.11.2025.03.19.02.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:47:58 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/3] mtd: spi-nor: introduce optional rdid-dummy-ncycles DT
 property
Date: Wed, 19 Mar 2025 18:47:42 +0900
Message-Id: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL6S2mcC/x3MQQqDQAxA0atI1gZ02mHEq4iLNknbQB0lwdJBv
 HuHLt/i/wNcTMVhbA4w+ajrmiv6tgF63fJTULkaQhdiF/orel4NjZWR92UpmKnQWxzTJaYoROk
 +MNR6M3no93+e5vP8AZ9ra9VpAAAA
X-Change-ID: 20250214-snor-rdid-dummy-ncycles-73575ecc7b8d
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bacem Daassi <Bacem.Daassi@infineon.com>, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742377674; l=1201;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=PMk0c7uKIxAn+T63Z5jwhxs6lh/HmsfYncTnpawUELs=;
 b=Z7wgIOhMU7hQ/wL7cFqCkBQZM5QVjjiylMBcS6ZIm2nx6iFnh+p2AprMpA2RcDa7eRDWaQxQH
 3bFr85fDBDODFUIOplpDU8Jo4015PZ8B+7QSQXzdvUgV0leJNVLgVhf
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_024800_357255_FEDAA780 
X-CRM114-Status: UNSURE (   8.93  )
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

There are infineon flashes [1] that require 8 dummy cycles for the
1-1-1 Read ID command. Since the command is not covered by JESD216
or any other standard, introduce an optional "rdid-dummy-ncycles"
DT property to allow flashes to be correctly identified.
Add support for CYRS17B512.

Link: https://www.infineon.com/dgdl/Infineon-CYRS17B512_512_MB_64_MB_SERIAL_NOR_FLASH_SPI_QSPI_3-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c8fc2dd9c01900eee733d45f3 [1]

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Takahiro Kuwano (3):
      dt-bindings: mtd: jedec,spi-nor: add optional rdid-dummy-ncycles
      mtd: spi-nor: use rdid-dummy-ncycles DT property
      mtd: spi-nor: spansion: add support for CYRS17B512

 .../devicetree/bindings/mtd/jedec,spi-nor.yaml          |  6 ++++++
 drivers/mtd/spi-nor/core.c                              |  9 ++++++++-
 drivers/mtd/spi-nor/spansion.c                          | 17 +++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250214-snor-rdid-dummy-ncycles-73575ecc7b8d

Best regards,
-- 
Takahiro Kuwano <Takahiro.Kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
