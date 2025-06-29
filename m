Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7485CC83013
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fIh+y1sY9wA0MxyNcZO8OCMclQYVVFBWAW0igN+W59Y=; b=S1Z6IFmCOeRm6V
	tN7KoUQ7uqsJJbZ2745iW8Aq7F2SttrDIBFaIvsvB4Jf1oxIY3gu4/vwlzNCkhJOi4nyIvxjeWFy8
	4J4AnUnPU72tAlSv5ZVj7qVMQJVP0o+MaVhZWOC3LEHTPkcWUJiS1tjcQO5rs/dvn31YDVkDNM+/r
	StbRpNQ8KdPQLEWokKZITTDldoAxQBNXIcu8Kkf9wGdEmpa+y5dzBtycyMEUTcWyAoBHqU+6ClZC8
	D8ttcv0adPfaU+os+SUBhZLWTmM7i37NcCoBJy2YjrOB7OQqaJobJlWn4MaEAdd2Eeqiupnx31Lu0
	U/JXbQB5W07TAShtXZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKD-000000001V0-0YMa;
	Sun, 29 Jun 2025 08:23:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnK8-000000001Ua-2CgO;
	Sun, 29 Jun 2025 08:23:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3139027b825so598881a91.0;
        Sun, 29 Jun 2025 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185419; x=1751790219; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iT8CFBVHA2PHKdhe+MXDUNE+DyeuqyUpTK4o2FEoGw4=;
        b=ekFTyV0NUHejii7aoouUdMrilcYLa/pku0TzqtQGsYQAM0HXsJ1RwAv/x2EM7L6hFF
         H+C4Pn0XxVcjCF7oY2eaikdQ94KIKaz2UaSTiJtN6LqaHQ8Iyo0iUyBdzCoZc1YOWmus
         wVxkxod0p1wr0MzD7oewxxQvaDrNlmsAiwZG1qNjc7UX6eqWn9ad0Xq0OKDtdWS3fnVe
         Q8vHgUN58wdqWPy9pg3pbaZoYA8io1fs147PtCV0sNAxg0BjW5I8CujuolO/5VKwV3li
         DyhAevTYbNnjFjPxy3sCBQNZDammpJys4i1EppUbVDbfA8E5Q+miYQoP7XAPGOly7yWj
         Ow1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185419; x=1751790219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT8CFBVHA2PHKdhe+MXDUNE+DyeuqyUpTK4o2FEoGw4=;
        b=qbCviMmd/2mK44i3MTfIF1pAtpI17hfwUm1kv6VJBRYbtuCFDQnVHO1AEKnvh09gzb
         85+iSrCddjaalh/K8RhSJ+aHhCcgaiHYT7dgwh784b88IF/t9N75lVZoP7iQkRkZNtgM
         OydIjn9yepJpBQPfhZ2T64fD2U/VnSP0I/NT8MVeBnNOlimhKRN2lFpvF+b0CxcF3iNa
         JCYVXWfy6+28ZsXJ1P87NtjQbjfMHbwJCcFMEfvkS6RWeRtP6FRhAnRKZA8o0Wj/8ZiZ
         ToKeBrse4nMV8/74039jjNFo5MeVA36YGyrjiUBWxnwL7Z4ssekrqFF1UHD0R1NTEcnZ
         9qeA==
X-Forwarded-Encrypted: i=1; AJvYcCVmhKo5v6cye9qzPzPt/O/Dt1owd6GoMOpX/rVbXh3YG76AvkYckhJbkh21PcmGiGt2p+8QEmnD0cwNaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX+5KwnXG/uAg/RGG5B1eK5GfPg2TsfFIyMdpw90tJVUEwwZm0
	OtInR0FWkT0uhuaLX8B5C4Bq2NUYsc3QY3LQPW/qfRRc2LEJxSwE4Na/
X-Gm-Gg: ASbGncusHYt6WXRbt1hbdJRBcoApteL4cMS2/go1LrQueSts/PDv3JrgjVW+9M1tlTW
	X6PCcQ0e2E2460fZt3KknV29JeCHEygckJxap8mT4ADsga/PpNXyEGc/cM8fpvPo8KBO18fx0Xa
	2g3/x4Dnzit+rxnZIO8hsY9AH7oQgrjE7899QOCAh2VACYfFokzsf43QK6eF5MTEDLLhphkIRY2
	P5cZBUBNsp7XWvoQpJFfc2iPchE4fUcUe9JwUBsYeYxkChkZWxEj0B84ZGhZuQqD4mGKJ8FtH2T
	EiK+oJYCiHU+9+HV0loa41rY65WNRTnMpH88Kaeyc89yhNY9beZ+Aw==
X-Google-Smtp-Source: AGHT+IGkogtkfd4RaBa+53mBJuGMKYemWXLFm3Z+9Nh+DPGDIY7c7kUnrfh43VEBbsF0oQoW8UIuQQ==
X-Received: by 2002:a17:90b:2e04:b0:311:abba:53c9 with SMTP id 98e67ed59e1d1-318c911cbddmr13750481a91.7.1751185418667;
        Sun, 29 Jun 2025 01:23:38 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:38 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v3 0/4] spi: sophgo: Add SPI NOR controller for SG2042
Date: Sun, 29 Jun 2025 16:23:09 +0800
Message-Id: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO33YGgC/23MQQqDMBCF4avIrJuSTIxiV71H6SLGjA7UKkkJL
 eLdG11Z6PI9+P4Fog/sI1yKBYJPHHl65qFPBbjBPnsvuMsbUKKRBrWI1Is4M41O1LZREhvpm6q
 EDObgid977HbPe+D4msJnbye1vX8zSQkpSkeqcqSpQ3vtR8uPs5tG2DIJj9T8UMzU6lpjW5Gxb
 Xmk67p+ARyza/HfAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=1859;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=LKtaI0pAOsDCmEDvjcAJQIr31hlkW2ymLC+5XkspvJk=;
 b=YLmRX9bJFi28MdqzwGvr0+LQxNtd9EVILDTfJCzRxnX7jC+jYtagrVP82dyF/rrrwfKmhn4WW
 zofIBYJV37jB52dYeAh9hPAMXx8r9Hhfl+kW72Hms+Der4N9sGbaCD1
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_012340_570586_F5EF7E6F 
X-CRM114-Status: UNSURE (   9.55  )
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
      spi: spi-sg2044-nor: Add configurable chip info
      spi: spi-sg2044-nor: Fix reading bytes issue on SG2042
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  5 +---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++
 drivers/spi/spi-sg2044-nor.c                       | 29 +++++++++++++++++++---
 4 files changed, 75 insertions(+), 7 deletions(-)
---
base-commit: 880f18ee6772d4add69519cb7de2fcf9f4769cd6
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
