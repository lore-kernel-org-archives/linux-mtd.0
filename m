Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B27C5AE59
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PScMLD7yAHK9spBGs42U0/q9O27Xnt2Uv+5gwNYsC7o=; b=clxOf5kI3JFqPK
	C+E7TB1WdCyPfy1pjCaD9pfBc7RW5ek2cJOvT/+qilRtkDMkB3GQC65xn9U9R1R8sAyL0Az0icZrU
	u5rAs1IFN9ATOUH08bdAMf1iAY/vDzzG481xJcF2uYCGjN7WLYi9FvIuUiMsZC31pI9CijHv18Wxu
	xtu6fK2NEz2cgIXAzAo7uXS/KFrVCyJb5+M/U0J0NY/QPDGNPu3ZkmKM2r/GSdXs5/Ao9OBOIB3jR
	nc//Y8Kgqj1ebulZI3kpv94KInCNMxURZ/0SThSwHNcdZjUjwfLE1HTEd4Mf/Am9kULnGDHQCoZ9a
	rWzqjTWppl6TGaiR6GOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCp9-00000007E4o-0rmD;
	Sun, 25 May 2025 14:59:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCp4-00000007E3s-2mMW;
	Sun, 25 May 2025 14:59:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23461842024so1084295ad.0;
        Sun, 25 May 2025 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185173; x=1748789973; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJSZqhft8oN88RWw/icnXyxnygR+ybrApsl+WofewtM=;
        b=fJuC/WYdRb7IZmbqWve11HIXz/Wpb2A/CCUJdYMsIiRkPk87kDkk46NyPt5986C0wT
         k3NSU1W6zDzr0QFXZlP9IN8r/k5Z774pMDWt3xoHv+HJHspos63FZQyo1EUtr+6wP+cC
         TEDeA22lg6c9FvozBtdJ/69mD3y8x3v2QEA+cPAbVT1z83edSiuKNSG+NxewzdYeI01r
         WrKG6o8XCvJEm09bK1MLEKIfPM7bNGp5IRhsTcmCKVcHcSQ/CoERtaO4gqNjGrb3Z6ws
         k+PdZTJ3sCm2U3lCYEYzZB1bSa4mMjufOyOykkg3jBnlZwWogWougBkvgvjFm4NEWR9q
         QeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185173; x=1748789973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJSZqhft8oN88RWw/icnXyxnygR+ybrApsl+WofewtM=;
        b=R4EvyA11D2bK3j2WdjjXr4CxUZTmzit8Uh5VMKaU1y9P78BaZWxCmWfpOkEIgqcX5U
         JdfbQSitSJVcBY5Vj66T31pSjKjBi8kWXMfNG/+TbCkZMWnNO2rrKsL6+GKZDAFtOYRm
         BM73inMaPLJ8lb0e15/x047OXCBv25QeABGDcSvTvEOGhEgJplX8PTOWOUtZ/ggpzxvl
         yZjsJQm5CKcl8mOs57/+lh3q2YtOxkT5gzUouJuBFzjkncOkJMfnuDvenNOImE+3pzAu
         czFdsfUY1brCAMyQe/xAScEv2o4Z/G0ZJIYJpEtMPJQ5BQEVTXFfLpKSzd69AwFM5xpp
         V/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhOTWHYWkXMJea6aL4Ap0tLUnI7h7xfzJx5yNdnwkW1y54a1663TWXjkjBi8RMPksfv/UjjqwGBGABvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwukJ8FzlV6k+yCKy1D70boCn6aweb0jzbb7VOwfNW94hUjV/Sb
	udKyv+blowPSscQ5WB+WdOABynO4RBdNt8d6VO1yi2e5bTo/N3LGREZE
X-Gm-Gg: ASbGncv098LYfV/KNH5/sT8VXe+xCw+OXXzxxk+qoYwOmBr0tknOH+SwvtC+9FRAprU
	tLqilyCtuf13boJuqYtqX5upQQxhQ9rAF0QCW8edhkMVvCQzP9YzZ88OEVuLbqtvjlckdjAcyJI
	UO15nAFoYowdXSObeodv6RDoUjiZQyewyicRcLdTmuOeA1Lql3s27SqJ7ELhuoes238ASw+8k3v
	clvkdJ23/xziiekIvKAR5PaK84kkgMQvq4rS+nhWESUXm+QXj1FdvD3v0ApijNjkuTFIr9vM0iJ
	AX6Br2O4Ene/espzMO4AVWOpETLvhSc+AJSf8FenoDFu+AxwD42kYA==
X-Google-Smtp-Source: AGHT+IGMA891Z9QcMnUNy37nLhB0qBQRarrDsxvWe011CA95ftR2WVjmKQaGn9yEpFYZJ8bwv7RwvQ==
X-Received: by 2002:a17:903:32c3:b0:220:c34c:5760 with SMTP id d9443c01a7336-23414fd3f1fmr80933825ad.51.1748185172627;
        Sun, 25 May 2025 07:59:32 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:32 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v2 0/3] spi: sophgo: Add SPI NOR controller for SG2042
Date: Sun, 25 May 2025 22:58:40 +0800
Message-Id: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACAwM2gC/23MywrDIBCF4VcJs+4UNZdiV3mPkoWY0QzUJGiRl
 uC712bd5X/gfAckikwJ7s0BkTIn3tYa6tKAXczqCXmuDUqoXvSqxeQ8pp1dsHgzWgqlBemhg3r
 YIzl+n9hjqr1wem3xc9pZ/ta/TJYosLNODta1blZm9MHw82q3AFMp5Qsn912RpAAAAA==
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=1277;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=5Rf+XH7wYeHA/1Ip4R0wdkjAiYWlYPDMcrHiaZwX1Ls=;
 b=w3J+SqKPY7joyY5psDMZB+uFx1T6KaYC9OLGQsA2Thu53R2RBdIYrBT7sOAQn4ef7ZzEtCD6V
 eLvSJDWaMGPAXW6EgcdiNWwkHqxEtfQ79HoahVSQP1t4TRogUPsN1fz
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_075934_702747_CF9AE682 
X-CRM114-Status: UNSURE (   7.96  )
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

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v2:
- patch1: Accept devicetree nodes whose compatible contains only
  "sophgo,sg2044-spifmc-nor" to avoid breaking existing devicetrees.
- patch1: Improve the commit subject message.
- patch2: Dump the SFDP information to commit message.
- Link to v1: https://lore.kernel.org/r/20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com

---
Zixian Zeng (3):
      spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042
      mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  7 ++++++-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 drivers/mtd/spi-nor/gigadevice.c                   | 17 +++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)
---
base-commit: bd8ad2bcb8ff8e7af8d35273a8194104ca9ba5c0
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
