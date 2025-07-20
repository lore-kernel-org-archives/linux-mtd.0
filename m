Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B26C83F22
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jul 2025 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0h0EOqgGjNFivhWtv0xSz+s4l4Gv18ysMNVSfi1ovew=; b=HqR+54TSoGsvRS
	Gf+h3BaSGOB7rd9CzDvTnUL9LjKaHboaca93g10M5hPQVhkubaz4W/ATG3iANu1XUw9EeKSB8P4i9
	8qRi28C3nF31aRP+R9KB9O19IP4xMw1/ho8Krjhzdwp5OpkI/yGo0tKdOATBGWH7S2unKjIZKqler
	kQMF7yKOSZndIGjY8Xk5hUUK6tQW7MslPn5zfY0L0jdFcM6ZBd+CV/PP6byr3FqeVHJDLiSqjim4W
	6cmUBON6InGb64AEsQx5P2mOuPVcsR/sboVx0ICLPnbuOAxLP5rvLXrXRzwECbOL74pVlhHk81Duh
	7oQlvxiptYtfoVFYquMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTY-0000000F1rg-2R7u;
	Sun, 20 Jul 2025 08:32:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTV-0000000F1rK-0nYT;
	Sun, 20 Jul 2025 08:32:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-313a188174fso3302190a91.1;
        Sun, 20 Jul 2025 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000368; x=1753605168; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiNF4SEuIin2EgUqWK8JFEp6BYToNAS7zW+nZhJnUmo=;
        b=Smbp5r3lpn/ja0eFgqm6jWORjLDUl1WFm8Iyol7DwC6JjKHiA/z/8hyTnzFQotVDG1
         bnJYDkABR28QWCaiTpFX728aPMBJQKqq/CV3ZkI0vhdOuhWw84wEnXMxJbOboub/rWnR
         9eT37RbQGWrykC1fbVNez+L/Q5wsyAV65ZunKKI+WlcHHtOsG3y3x4gOa1yvabGTTOAJ
         V+bnBCAKfbjnT9Gni0OFIWvcVgf9wFVgKngtr3alyNXrXYTrBghwbMvmK4lcMmRhuuwq
         NMFsoNWkWFZ0Bs/Q5C7TtYmbhqmuyyH9fRDkeIkOK3GUVS3W9bftM4KkO1Kl61pIJwld
         a+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000368; x=1753605168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiNF4SEuIin2EgUqWK8JFEp6BYToNAS7zW+nZhJnUmo=;
        b=Kgy8FqvmGOAK6YOfil3qRXIfQBXYjxkC2UbKqEvjuSg3E3sIMzog6bWB3wTXVUn7wT
         /mqEg0tZiH1fQfG9428BUBH/60cVI0fUe5k3+NtgKhCuftFB5/jlcqkDorGY1o3a3vc0
         GC47aKRJ+RnHbfFXoXVNbdrBB7qcvfMrTDF3TikSgfm1RedP2ZMgRjAcpTquA+oBZ8Mh
         c+ROE0U9Bk4nfpENvpg5hX4TGRMRqiO3ijvsGKYlAKOfHCmfvauuWBOv3zRs+9Ale7LA
         sCtJ7qZfUqUjeqIlWAAi5lIRRCe5Egoam6RjMcIpmcd21wzojYWnHvsX1DYYpiNG3GqD
         xxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpvmbuxlKmNSL+aVQuhA4fkHtfKj+b+DjTkRGpSse1N812JJy7Ktlqgd/UZnQLh3nFqLBqVuFY5uFOPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx0JZTYR2SSg2pWUTpOiFDk262LIJt8p0mEMRxWFnfe6fPZCok
	wkynUdrbF/77C2nyuIDJhpH1L/Yo4FSg3GazFOxunL0B4q+T7NygXhXw
X-Gm-Gg: ASbGncsJazJF3rNeJhK99bOgkxa0rgjaDWv6ppDNv3reD4umFE/nluou2ou/IuzVM1K
	rVtCiJSQt+sxBE5XmLqIispKl3pmpU4dDykvcixc+s3/sO3+a7XqyLsrl/okMZXfTkiy9eS0UR8
	LHNP2Zntf535tfBQlFgMC2MVe+LbGigJOUzxOFrLcTVRG7INw7yL5busb3rKFXhKv++1t26U4kO
	T4LAJSaDVgceabU26LyZFCFTp9DTDtaWl3/1C5MfeJzQaU83chbhkG4hYWnRaVPzsTaUVa3dayS
	iWVEete7WzU/3dxr2o6gHJXkvLjG6hmucqIA1zJGYr7NczB7M0/uoZq7+WHtJUZMWcBybK1jX+U
	WzpwnBeDs5NMbAg==
X-Google-Smtp-Source: AGHT+IGZKIIWxW0MM8M+8exnM4woxigogql9EMO/mHA038LwIs21zmM+BeC1R09FPp/G2WH28WdCag==
X-Received: by 2002:a17:90b:288b:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-31cc03c01e6mr11886432a91.4.1753000367324;
        Sun, 20 Jul 2025 01:32:47 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:32:46 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v4 0/4] spi: sophgo: Add SPI NOR controller for SG2042
Date: Sun, 20 Jul 2025 16:31:42 +0800
Message-Id: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG6pfGgC/23M0Q6CIBiG4VtxHEeDH9DoqPtoHSDyK1umg8Zqz
 nsPPUlbh9+3Pe9EogveRXIuJhJc8tEPjzzkoSC2M4/WUd/kTYCBYgoEjdjSOHrsLa2M5gw0c7q
 UJIMxOPSvNXa95d35+BzCe20nvrx/M4lTRqVFXloU2IC5tL3x96MderJkEmyp2lHI1IhKQF2iM
 rX8peJLS9A7KjKFU1NzhMpprbd0nucPmRjohRoBAAA=
X-Change-ID: 20250523-sfg-spifmc-7a910290e964
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=2195;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=txKyTWgMnO1Ncvzz/n1aTwE0i4eSFrFSmoLYu+02pqw=;
 b=Bty5Us+RDErqs1hsitaE/Etf77DhqRuEEm5hj9oZFE4DY2gy+5UoSPR3DZCPnKeQv+NsoG1oH
 lSM0QtJLQBkD+90idbkhwV7YqJ/zbSn8bgnFKisClm5VChqzFIMH6T7
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_013249_239464_38EC796F 
X-CRM114-Status: UNSURE (   9.79  )
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

Add support SPI NOR flash memory controller for SG2042, using upstreamed
SG2044 SPI NOR driver.

Tested on SG2042 Pioneer Box, read, write operations.
Thanks Chen Wang who provided machine and guidance.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v4:
- patch1: Explain why SG2042 is not compatible with SG2044 and add Fixes tag.
- patch2: Explain the hardware differences between SG2042 and SG2044.
- patch4: Remove the extra "sophgo,sg2044-spifmc-nor" compatible property.
- Link to v3: https://lore.kernel.org/r/20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com

Changes in v3:
- Drop the patch which adds additional flash_info into gigadevice.c
- patch1: Because of the incompatibility, separate the SG2042 from the previous fallback mechanism to independent one.
- patch2: Newly add configurable options to spi-sg2044-nor driver.
- patch3: Fix reading bytes issue that causes the spi_nor_check_sfdp_signature() failure on SG2042.
- Link to v2: https://lore.kernel.org/r/20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com

Changes in v2:
- patch1: Accept devicetree nodes whose compatible contains only
  "sophgo,sg2044-spifmc-nor" to avoid breaking existing devicetrees.
- patch1: Improve the commit subject message.
- patch2: Dump the SFDP information to commit message.
- Link to v1: https://lore.kernel.org/r/20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com

---
Zixian Zeng (4):
      spi: dt-bindings: spi-sg2044-nor: Change SOPHGO SG2042
      spi: spi-sg2044-nor: Add configurable chip_info
      spi: spi-sg2044-nor: Add SPI-NOR controller for SG2042
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  9 +++----
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++
 drivers/spi/spi-sg2044-nor.c                       | 29 +++++++++++++++++++---
 4 files changed, 77 insertions(+), 9 deletions(-)
---
base-commit: 8727665368cd4af112146b650ec0ebac038b5cf5
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
