Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6318AC79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=59itTJGAI/rF0Qxae6/bw/pc7dTCfJ2+i/uTbIg2bmE=; b=n6fyETP5exA5tH
	L9GqqUpUACXvhuNxq2sxSc3WwDfTj5WYUv6M1LGMkACDTEfWJLvEPI1dWUxJsoDxRxj6ei0gMOmBn
	hhjez1TIrBAOUaM6H+sup3ixaBgqp9jLlNe/DdfofH75tMbj7BxPPcJjGr5MUJNvuFSDWaRQoFaCW
	QroJqHBKGp7ursOuWoyKQvEbtSfKXxTDRMyakK3pYxC0+QkASzUbRxInhMdBW5kPMsRMpwZF0CoOO
	xB2/FlN9D4smsNhIps3LQ2H8R/qE1O48VJhLaaEFxKiXtLXxTyNqTYYWcba6iCjl2fWcrP1DRYK+C
	DQy024AluYadt8g6dGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dho-0000000B6HP-09Yv;
	Wed, 09 Sep 2026 08:30:56 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhl-0000000B6G5-0stJ
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:30:55 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6aca0f482e5so6116430eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942651; x=1789547451; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XwBZV48nMQMCwCRnzKzAzP0Phs409coXoQQ73JPxJAo=;
        b=W/j0QwrH+Zi5Y3cUEq0iL4uFest9RoLu4dDJLLD5PU8hcG6WqM+iqrV+I9sNIvq972
         o31W+6XNkAk0ISzMd6yMaSfzr8GeLt+qGZ2dF2x3LrG7V8h3EXEtoZ/TQVDzuhVZhF+n
         HKzKfeX4uyaZbM6rc/CXEZrWC8hL7JtUq3ZTGUC1EJ1RWIQiLa0pA4HD5pEXL2ImWKPO
         YRV9nnPB5/78ivpR/jZIAcc4oSX+kkOOLZTTdlNToexQun+asKylvgRHW7244MXUjWcM
         HfgmD7LCEBmBHRV1h4iC314jkz2ELQWZktf6SJYqeX8EGMx7G/moJo8toNTriQ05qYmm
         cFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942651; x=1789547451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwBZV48nMQMCwCRnzKzAzP0Phs409coXoQQ73JPxJAo=;
        b=hEIqOxXgmnX02DSPJ6ejwBE3JiGzAJO+UAWpWxa0mKdV8PGDougoecRg4VAGYyGkLJ
         SH2XHI+NA1UWTFQdLMplVrTIW3xtyfT9ysGH9RGEXNaNHhwW63j1XgM6YnKXwD1Xr8Sx
         3vzaoMl+N0z+z1MM3SJiiGHisIyAd1En7VV1xSQA7fbXCBZy2/wK5yp1ibhl2CoHvnx3
         3f1Epsx+kIgSpxx1hNlTAoP0toT39C2U+UQvaBgbTlT/GiptyKaanYilLO7x2crs7YC+
         5BtiLWiN0XSmCrAZD508gwP4VlnQl4Zt5lzfR0uqa4HpXCa6WxJHdsF2bKoqzo0VsmYa
         JgzQ==
X-Gm-Message-State: AFuF++m5STmnlEPd2tg04oT7tojpr8ekukn9TPclzQJKhnkaCSt4RDIM
	6O+gdmgVuqLJA3GIgRTPiibO81WC+xkbjEU9UmKTyw6nr/ysOi5VV9tAzWeyBPPT
X-Gm-Gg: AYBFou2H44VHGIlJ69hSmaBldMimYSEnB24cbW9ObiKojM3kY+Yju8UPM7+MvKJV2Sz
	pjet+U08GW/Ey1gGoNMxKbP9Z66grwKI39ISNt3/kvnBbHIqH4nSh+uhDofox8BgEPjGhVu91p2
	iq9JyW+MN1lA3C0U1b+HCOUfJck5+6LH/sFR64k1fPIBarbzsl/FDGT4jo8i+j+WQdHLNHKvRUt
	RpGu0sgkE5KWnF5aJPMLPGIfXlgsom8uxAGNvN039qlaeLC/EyvToCMurCtfkWUc5H9TukMTmUQ
	W9G2SQK0rQlIRW/xOKQ7JF3TpzRq4NrIihLazO5deFzg3uOQ01VV73n1F0SlkoNHEwnHdgTH1VJ
	fX0uWFhmGwd5fZNbcV7pOfCMa0TY9ALUrm0AdhvHqGqe5nlPyxSRt3deX3M1cgnQcpohzEoAFPI
	54Gy3pPkMDhgH1Ajn+3l4oSm+SPRgGPG7Ku6/61OjQoRSh9uOyQSqbFug5ObNzeh9TuuOlPe084
	ar8v6jedeYFMra+3OlHAOqu038eloZRUnuYaihYRaRpCl3ZKkUdUgnxspXQZ2iXGNWPb+ClxTwZ
	+rUak5UYD42vxlttmG402fC8Ai9NQisY83/OosCMzgZDpabtGzyVAACTG1tGAuLBS3z5NisabCI
	HIe3npWRH9Gx7vXeBBEf6q8eZPzQB
X-Received: by 2002:a05:6820:1893:b0:6b7:8415:d785 with SMTP id 006d021491bc7-6b78415d897mr16470897eaf.48.1788942651425;
        Wed, 09 Sep 2026 01:30:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 00/15] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Wed, 09 Sep 2026 02:30:33 -0600
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOQQrCMBAF0KtI1o4kaaytK+8hLtIkrSNtIkkMl
 tK7m9aFLhUGhg/D+zORYDyaQI6biXiTMKCzORTbDVFXaTsDqHMmnPKSVoxCeDQDxrzsE8FKqyE
 Zq50H5xro5egeERIDUzAmNKNK1Ypk7O5Ni8+16Hx55yzdjIqLvlxcMUTnx/WTxJa7v0vzUBBlU
 e0LyYTU9akbJPY75QaylCb+YWsqfmZ5ZhvG6UG0Qip5+GbneX4BQC0u1kUBAAA=
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_013053_290203_49C06518 
X-CRM114-Status: GOOD (  16.75  )
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

Allwinner NAND firmware leaves the bad-block marker in the randomizer
data stream. On H6/H616 it also places all protected user data before the
first ECC step. These choices differ from the mainline format, which
keeps the physical marker plain and maximizes the H6/H616 user-data area.

Add allwinner,randomized-oob to select the firmware format for the
configured hardware-ECC geometry. Older controllers keep their fixed
four-byte-per-step user-data layout; H6/H616 use four bytes per 1 KiB
step, capped at 16 bytes, packed before the first ECC step. Without the
property, retain the existing marker handling and OOB layout.

Normal hardware-ECC accesses use the controller randomizer. MTD_OPS_RAW
continues to bypass both ECC and randomization and expose physical data
and OOB, including randomized markers stored by firmware.

Address the ECC-error paths as well. In randomized-OOB mode, use the
controller-specific vendor spare-byte erased-page heuristic on the
protected user data from the original hardware read. Older controllers
use exact erased-spare checks, including their first-page and page-127
signatures; H616 requires byte zero and at least nine of ten spare bytes
to be 0xff. Accepted erased pages return all-0xff data and OOB without a
raw reread. An all-zero physical page instead returns a bad marker and
an ECC failure.

Other ECC failures retain the original decoded data and protected OOB for
bad-block and flash-BBT pattern scans. PIO and DMA share this page-wide
classification, including randomized-format subpage reads. Plain-marker
mode keeps its existing physical erased-chunk check.

Prepend independent fixes for PIO OOB lengths, per-step pattern IDs,
read/write error handling and duplicate OOB program confirms, followed by
OOB-helper cleanups.
These fixes also apply when randomized-OOB mode is disabled.

Also combine contiguous unprotected OOB reads and reduce repeated chip
setup and register accesses without changing the page format.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- add a prerequisite fix for the logical OOB length used by PIO transfers
- clarify logical ECC steps versus hardware slots and share protected-OOB
  register indexing
- select the controller-specific vendor spare-byte erased-page check from
  the SoC capabilities, only in randomized-OOB mode and without rereading
  the main data
- retain hardware-decoded data and protected OOB on other ECC failures
  for bad-block and BBT pattern scans (reported by Miquel Raynal)
- retain a bad marker and ECC failure for all-zero physical pages, and
  disable the ECC exception for the vendor format
- share page classification between PIO and DMA, reading complete pages
  for randomized-format subpage requests
- propagate OOB read errors and defer randomized-format ECC accounting
  until those reads have succeeded
- propagate read/program setup, column-change and buffer-transfer errors,
  including extra OOB; stop failed writes and disable ECC and randomization
- discard partial DMA ECC statistics before retrying in PIO, and keep
  correction counts separate from successful OOB-transfer status
- select the current hardware step's pattern ID instead of slot zero
- avoid a second program confirm after an OOB-only write
- avoid redundant column changes before writing extra OOB bytes
- reject oversized ECC steps in randomized-OOB mode before the core can
  fall back to software ECC
- combine adjacent parity and trailing OOB reads in randomized-OOB mode
- remove duplicate chip setup immediately before core page commands
- program each packed DMA user-data length register once per operation,
  and write PIO slot zero directly without read-modify-write
- reuse pattern IDs and packed error counters within a DMA read, while
  refreshing the snapshot after every PIO ECC operation
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com

Changes in v2:
- rebase on the current MTD nand/next branch
- retain the merged protected-OOB allocation, BBM reservation and
  stack-buffer fixes
- clarify that randomization is part of the normal hardware-ECC page
  format while MTD_OPS_RAW continues to expose physical bytes
- explain why a BSP-compatible BBM remains randomized in physical raw data
- document the decoded bad-block and flash-BBT access paths
- reject the firmware OOB format with software or disabled ECC
- document the BSP page-format compatibility contract and the
  older-controller format audit
- Link to v1: https://patch.msgid.link/20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Boris Brezillon <bbrezillon@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (15):
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 948 +++++++++++++++------
 2 files changed, 689 insertions(+), 269 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
