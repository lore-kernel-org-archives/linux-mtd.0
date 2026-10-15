Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247FBCC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eR0aGuH4aDh5nC1i+gr4EN9bfhg104sG6GCz86VTsiw=; b=LASZ4je/eSi0R2
	6f1onbevMQ6MwuAd7YIkQiDplT+X6s6OyZylnsSWECc5iAyh3XC6Dr4JxZV3Y/6YkORx8sS2ZRK8/
	spnWews9r8jHFeGjtZhBkUJluv7gsB8s+TZMXYogtccPOxhkw4FCDNHOrW+G2uiJ4L5RMLddkMae8
	l2cyNLCykg2MGrRLQjHtJrdd+EJuE8/tMdsfs9MtkCh1C0wh7MpBRLG45gFSjheGu/Ldqw2aMEMMz
	TeoZ4KyJS6FFXXyXDUIpVLDsSCG8/GTdXhemk4pAEHgVAqxCEeh2fheR9PpJ4OoHLKD2f4ZgWXt4k
	YEwQ/+LGXgECb9qemWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMI-0000000GY77-0LW2;
	Thu, 15 Oct 2026 01:34:14 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAME-0000000GY60-3lvc
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:12 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so582261fac.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028049; x=1792632849; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jI+Ive4AxdeL0phc/iy7IBSWWLYJLEaf4nq97ulSuEE=;
        b=gqxFF8IaA6raMneo52a7gHfo6A1QkdRw2rQcwQmFLjtsPknUZifkcmk+oQ3Ak91rs2
         dBpvLsNjaXrLSifiK/vEkt5lblBsz1UJ3BLONpbKOMI9Se7W1A9F0+Wczdh7KlnL2shM
         v20FPbz/zJx0XRsdSQmkfEiqjGhF306fm/vwY47XDC2gF/RElT158pwi4jXMVpXsIkQP
         mM6LVomnYqVOcFmWnyLPx1G8H3emw+S0dDRtjvbtFHICl1wNrktDTYBYlKzwARWzcOzS
         +bXzIPZCHsf5AwrAFHzJ35RZ4tmf6+HteWHfJinO9qxd/JhF93DddUm74Z9/01FIIHQ8
         sxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028049; x=1792632849;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jI+Ive4AxdeL0phc/iy7IBSWWLYJLEaf4nq97ulSuEE=;
        b=cVrkxWxov8bO24F4iX6Hqws/ObilZr6p5349EmgbCsqRHBIUsAFRSjeSa0Tg718xSS
         WWDxRivnzi0p67J+3jXgrKiLTEKg3iV2W1MTSw+l+IkcNHcmC3VoQdiksVu+zdip8qSB
         WFkueK95P2S24QfgVXnVc64YLdft2EI4fnqL8QPKNkkuH5kcH4dDxcXEVVehw/ARYeLZ
         8zFEZSVOXH4QeBwVi70SF8v8vMFlnZe9Qepoav93ON3cbgJxAC9dmLe1VDMIu00iJSvW
         DlMgYzAkWNxMskKZZAsDh2pnUVdxCa0QvR7sNjHksXVQXoRZR0+0fa7FrasrmCr3QQe+
         aMTA==
X-Forwarded-Encrypted: i=1; AKwUvBwEiZCqjo8o0NmDcg3GwXV99tyuzVKGmRYcsiN2Hv59wLHkiRSvCUuw0r+3gTwqTSQjsJfPgs6Fyxk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/CgLRO1adJjeN7KCWFAyXIt1xURNrmOcUQnlTj1iqfi0fKSnc
	diqZ84cQd9ovqI7o9Kv4OBn6xUlg+EJF+qr1uVCMYPr1G5Nt/BpY09Hv
X-Gm-Gg: AYBFou0cSh9aNy3OdO+GrGVA/GZFpFaNkAwC9czgO+rNXrIX/5J+EJlp6deCy137XjN
	AcDJHlMWW2VgYoLixLtQ7Ed/YXtKeSUBZGCN2tC+tFf6cS/+LUrkTqaI1z/vwMJ5FIJhmjUGrJn
	Xv9unR+ok3zY08OC4hdftf4bpSgNfOKdx9J5oWhsi8E09Oziqu3qg4FtxQROkLFJPPJx8m6m5gb
	60cWAJR/YcOpuv5c6CefipDN4bCv+XY8vjxvXcp5FW8xGTp/F9RrLkRS8n1JBoah6eQuV9phkGY
	4qq7SZ8ITURIKook5gJJEnDBO3z96kBFnFvXOolVAQPEL5puROk/W4AfCKiFcF0s3m5UiNxJRLS
	2m8M2ArU93R7MEMiFIZtOUeEwUVRVeaQAFaqFV8aWegzucfUmHFWWc8C4QGD+YU3Ll1gdRYsFFp
	L1twuRLvMWUMG+UuM85iRXERFo/Qlrmg+SRLzivdngRx7TurTAQ021wAlk7K2kehq8ZEpzl2nkg
	p6dNUdDBbOYNK3IHv4x//VnAXVvGvIbl9D5Of9+gTrlPLJTSawsnWcaFmpfYBtS3QrASrNNxqy+
	Bzpe45m1s2ghoXR05jkpAdFzm4BSVMRtL6ZPHQdbNsNqCJlC/1bWga4spZXsrfpX3h/wwitRBlT
	r2I+nDKsDXC76gW7IO47F
X-Received: by 2002:a05:6870:b2d0:b0:493:7742:f0f7 with SMTP id 586e51a60fabf-4a2a896b22bmr15664913fac.11.1792028049365;
        Wed, 14 Oct 2026 18:34:09 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v7 00/16] mtd: rawnand: sunxi: fix transfers and support
 randomized OOB
Date: Wed, 14 Oct 2026 19:33:47 -0600
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTWrDMBAF4KsErasyI40lO6veo3ShPycqsVRsx
 yQE371yuqipNy4IxIPhm+E92BD6GAZ2PDxYH6Y4xJxK0C8H5s4mnQKPvmQmQCioEfhwtV0cy5d
 ukSeTPJ9C8rnnOVt+Mfd8HfmEPEhE8gjONY4V7KsPbbw9F71//OQifQY3LvoycY7DmPv785IJl
 7l/Ly0POClZV9IgGd+8nToTL68ud2xZOolftgHazYrCWhSgqSXjjP7LyjXb7GZlYWtZOwvWYEU
 bllYsit0sLSUYRTb4hoTYlFCtWbmbrQqrvUYErYxqN9eqNbu/W1VY0VqoqQ2gK1yz8zx/A8liD
 TGhAgAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183410_975246_FC2E13BA 
X-CRM114-Status: GOOD (  18.90  )
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

Patches 1-14 address the existing driver independently of the Allwinner
randomized-OOB format in patches 15-16. Please review and apply that prefix
regardless of whether the format extension is accepted. It preserves the
existing on-flash ECC geometry, bad-block-marker representation and raw
callbacks.

Patch 1 centralizes OOB handling without changing behavior. Patches 2-10
fix logical-step lengths, read and write error handling, completion reuse,
pattern-ID selection, duplicate program confirms, small-page read commands
and the H6/H616 user-data register limit. Patches 11-14 then reduce repeated
status reads, column changes, chip setup and length-register accesses.
The pattern-ID fix precedes status caching so correctness can be reviewed
before the register-access optimization.

Here, "user data" means ECC-protected metadata in OOB, not the page's main
data. PIO reuses hardware slot zero for each logical ECC step; DMA can
transfer several steps at once. The patches distinguish logical steps,
hardware slots and packed register offsets, and explain their triggering
conditions independently of the format work that prompted the review.

The IRQ fix retains timeout-only disable_irq() and explains both the
forced-threaded PREEMPT_RT race and the unbounded cleanup/no-priority-
inheritance tradeoff. The small-page fix is limited to read-side
repositioning within existing geometry restrictions. DMA batching preserves
the installed OOB layout rather than capping its allocation.

For devices provisioned with the Allwinner normal-page format, support is
required compatibility with existing flash contents, not a preference for
another layout. Its bad-block marker is randomized: applying the existing
plain-marker compensation can make normal OOB reads and bad-block scans
interpret good blocks as bad. Switching formats is not a transparent
kernel upgrade.

Patch 15 documents the opt-in binding; patch 16 implements the format
through separate OOB callbacks and an attach helper. Its geometry,
page-wide classification and contiguous parity reads stay together.
Without the property, existing format selection and callbacks are unchanged.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v7:
- Put a behavior-preserving OOB refactor first, the correctness fixes next,
  register-access optimizations after them, and the binding and Allwinner
  format last. Keep 16 patches with no external prerequisites.
- Keep logical-step length, read recovery, IRQ lifetime, write failures,
  pattern IDs and DMA limits independently reviewable. Correct pattern-ID
  selection before introducing per-transfer status caching.
- Update both DMA callers with the protected-OOB helper contract in the
  logical-step length fix, before the later batching change.
- Isolate format policy behind its own callbacks and one opt-in attach
  path. Fold packed H6/H616 geometry and contiguous parity reads into the
  final patch, leaving existing format callbacks unchanged.
- Use scrambled_plain_bbm_oob for the existing scrambled profile and
  allwinner_oob for the firmware profile. Keep shared randomizer helpers
  generic and name the H6-generation spare predicate after H6.
- Clarify protected-OOB terminology, logical/hardware indices, transfer
  failures and the limited small-page read scope. Explain the RT timeout
  mechanism and disable_irq() tradeoff discussed with Miquel Raynal.
- Explain installed-format compatibility and that the spare check re-encodes
  ECC-decoded protected OOB rather than rereading physical bytes.
- Drop the standalone OOB-helper renaming cleanup and explicit stable Cc
  trailers; retain Fixes tags and Conor Dooley's binding Acked-by.
- Rebase onto current MTD nand/next.
- Link to v6: https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com

Changes in v6:
- retain the bank-sized first DMA batch, but transfer later logical steps
  individually to avoid PAGE_OP's absolute internally generated main columns
- keep ECC exception mode enabled for randomized reads on all supported
  controllers, using the shared physical-pattern classifier
- classify uniform-pattern steps even when hardware suppresses their ECC
  errors; skip their correction counters and preserve decoded buffers unless
  the page-wide zero override or vendor spare predicate accepts the page
- Link to v5: https://patch.msgid.link/20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com

Changes in v5:
- add a separate small-page command-handling fix: use READ0/READ1/READOOB
  with the page address for rereads and normal OOB access, and select PIO
  instead of the large-page DMA sequencer
- keep physical reread errors visible, preserve the OOB cursor and retain
  the existing ECC geometry requirements, including rejection of 512+16
  with controller ECC
- group the small-page fix and the DMA register-bank fix with the opening
  fixes, ahead of cleanups, bindings, format support and optimizations
- make the DMA register-bank fix independent of randomized-OOB support
  and the later register-access optimizations
- Link to v4: https://patch.msgid.link/20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com

Changes in v4:
- prepend an independent fix for completion reuse and IRQ timeout races:
  initialize the completion once, finish IRQ register updates before
  signalling success, and drain timed-out handlers before clearing their
  interrupt state
- add a separate fix for aggregate protected-user-data register overflow
  by splitting DMA transfers into bounded batches, retaining the existing
  OOB layout, ECC offsets and DMA support
- distinguish logical page steps from batch-local hardware slots, retain
  page-wide ECC accounting and avoid retrying partially transferred writes
- Link to v3: https://patch.msgid.link/20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com

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

---
James Hilliard (16):
      mtd: rawnand: sunxi: centralize OOB handling
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: reuse ECC status within each transfer
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support the Allwinner randomized OOB format

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1537 ++++++++++++++------
 2 files changed, 1065 insertions(+), 482 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
