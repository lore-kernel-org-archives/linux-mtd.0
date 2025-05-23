Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD41C54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdC5prI6GmPD3J487BMuf1AEpjkfsXVQIhlkIF6tsEE=; b=VdHHazd7FFYGlV
	u+Xn8j/3KwH99gfq7b5XSXGL0yOIaRugmpimII/vJlooFjH+PpVpSbWi9isVvtXtl8zn1E27u/Yo1
	/VwignDC82TlhQ26A39xiZfuaAgibmuGiqHOkNZT68PKx0ui9FSnsS6iuAKWcxgc1zZ2PqvB4hyce
	c2MBHLoGgEbIVv5/si4FthQJyGDMAwvAFEaj1iqvXRC6T1wLe7ejXCmB6tn7Kq/aPb3Q2AerE83kA
	v7ppewDk/7O7K2y2MYiGP8bv3sGyVuEXsilOGBQisNqB1K8fAQ9p+HlNHcfLZryDgl1Q0D1DPIs0/
	fylXt+ut5yWV52LcHmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ3K-00000003eJq-1g5B;
	Fri, 23 May 2025 10:55:02 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ3H-00000003eIq-1STC;
	Fri, 23 May 2025 10:55:00 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74068f95d9fso7863301b3a.0;
        Fri, 23 May 2025 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997698; x=1748602498; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gx2NMAGILchCpYDTM4FKpaWOrSAXV5ZVZLo5ud4chIc=;
        b=W0e84bI7uHi7pt+YCcaZq3bj6/mCmSkOSS+J8uYXnk9567qWddfb3yxzki64eLLC4i
         M9sFEtI+AWz+an3yw+dczr77EcZDTTEjo8/J93KAKIBMjNID3/79PPHE/adX4CGJdkbR
         KQzfKGV/HBWLoXL7Hb4hcrgEImjVRnuQB2oYgiZ+cClGAfk4k84E3qZhFqsA2yZN2vch
         MJU8JffFVQQLnpDZG0zE5ArzDKeGnQq4ugD6VpUZOJKUAQmaTticeS+56VZ9qYJG0Xso
         OLcQV8AlFh4KX5FweBtbMwpOcHUQO0t38r2AlUvRI3kRcIc2iSRNo7meMWCynx9mLlM0
         fOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997698; x=1748602498;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gx2NMAGILchCpYDTM4FKpaWOrSAXV5ZVZLo5ud4chIc=;
        b=Qzvpp47ZrzilhOBt5Sf/nJj81PIePiKCWtNTyEUWmvqcT17oa6fA6bbZWwkTZtiKVk
         KqFNxNNvcx/uNY7hvLkjbORnGhKM42Uf8A55Kb/6BKgdVpSCHvXvjQZFmdrlNN9UHxfm
         3gCjUayJPiA9Mzwofe6rC44BWLDBJm1FQYzk0XGeDrX0eX8eCmA+nRJxnnCOcW7Dzo2E
         ctBvzW2pNhjMb/nm2qaNIZYOYYhKwKY2r1g73c/jPHhbYIxeWCoS7CZFcKcQvWDSMRSu
         gyc1SgzEdQemcjd09UYurpbY5oWojW4kQDuXxcEvmIrGjhrDpA1rDcgKq43D/wJx0n69
         Te4A==
X-Forwarded-Encrypted: i=1; AJvYcCWo5xmIle8lpL7gyd45N9/BsYQb2sYVX/xn9VhgSqTxyJ1+n3bm16lozj94g3pvb638wNg0W0hn3ngWIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz1hjUyQdNm8b3jSwkwzyZ6r/cPMwnlyFjBh76BQ2j8EekXXtB
	vCY0VZejJ+x7Cmxsy4aDBafA0CWMZsLnNKHzgcVGqSuwAj8VIjQ4DNaP
X-Gm-Gg: ASbGnctRJBQxeyunSNpKDqb2+vchxvxrB1sgEOmbSnhFUhVHqWYaakCzak1fTvAbxXH
	YCRTlgwmVwJ7tBUVDffXVlo0kQKgqmOjZqGwuN61d6kgj+FBp4VCsVv1ryw8m5WwJvLRAavNKMs
	AP3TzpJmcnQM92x31BnZH3DfWo26UzVW8/CqiIDBco3Icr/D7MGGe14lVWJn2SiMQZheVaxdDm4
	KrD4IqWJ2Gl3FaGTSby/YUTGga48/zkphFVKTGmyOWvst2ZHEp8toYY/2BT9NSHTsjotILbt7T4
	bas3lOUPDGeB0lGG2g/u+/lbYl13h6zWtnGLHKDpPbA=
X-Google-Smtp-Source: AGHT+IFypCY7WCS5VRqKJwgRs1MNVp/Tllo9WTcuJPwUOgHY8A/NI05aS1ZGOdCAv2mrHaxVdZW0kw==
X-Received: by 2002:a05:6a00:a06:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-742acc8d18amr40326934b3a.3.1747997697689;
        Fri, 23 May 2025 03:54:57 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:54:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH 0/3] spi: sophgo: Add SPI NOR controller for SG2042
Date: Fri, 23 May 2025 18:54:48 +0800
Message-Id: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPhTMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3eK0dN3igsy03GRd80RLQwMjS4NUSzMTJaCGgqLUtMwKsGHRsbW
 1AHAnD71cAAAA
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
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=922;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=PDAjNrHei5clcEsWtlb1tcKXX5+6Ez534sPDENqfREs=;
 b=CCKTQTavAwLlkuUXuY4stTPw/85OwemMYUtj6yfdOghqgply89hsXdfJBOkPcCTT9xLG068E0
 Ryh10IHN37YCfwX2Hooj7pBf4WL3JneGkc2cee05xx17dzdi6drcjE4
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_035459_396483_F0432F1C 
X-CRM114-Status: UNSURE (   6.97  )
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
Zixian Zeng (3):
      dt-bindings: spi: Add bindings for SOPHGO SG2042
      mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  6 +++++-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 drivers/mtd/spi-nor/gigadevice.c                   | 17 +++++++++++++++
 4 files changed, 64 insertions(+), 1 deletion(-)
---
base-commit: 99d1d6293ed114e94253ec8b71f57b6c8d938dfd
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
