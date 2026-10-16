Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D0ECC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5MP5/wqSfSMcOuPg20BpRrF+JVNC2kXiELg1QXlODn8=; b=uEVoPRAgRB6wPn
	6/zozVwDboNU044Z/ucT69tg88uZdnq+X6gdYycV+wgwIgr2NHKURKo9f9AapEwHpD51HIW6ilQ+S
	yLZ53tdA3nN1ddr2rwWA133n9EBL7P8s6mrpgOFHlPsZ8dfsci+JLRVQEaMPjuBjI2zyd+E1E2hiC
	W5KiJqDDPGZWTeV/AzHawhSnPIheoKmc9qtdtgmEsT0cZ/X2TMF6r0yY89kpE56dLlg3P7Uwvmv8L
	6YFGysC34mO4jXYTC3l2S0Fo2svRMECPcSEREb+g06oDaAC4KVZRRoDaA1yQS7OCelkDtpuv6sn6a
	hbWLKP5mbplStEDkzDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYss-00000001sBf-3mS7;
	Fri, 16 Oct 2026 03:45:30 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYso-00000001s9m-33Ef
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:29 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-8241a56cd70so3923355a34.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122325; x=1792727125; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4WHEpxc2DD2ytlbPtn5avsBXgnpM96h97oyzf0HJ4eg=;
        b=BzsCNDMfAjxc+NFkapFx9DKLWS9h55/C/WpU8MJ/ewXRNSpX6PFtuNWKSO+7h0i/qt
         C2lFLuKK5RhcPwgHDgCrL1L5SnA0PT98swsJHQpnVr0+JI/MWEgeujBPcL/0QUA6I8qL
         BOVWsdKiBenvCB7cC4/3T8ZQyP65Oj0+zI7URJhPanvQb4emeUUwZUhisDTQ0qcr6udz
         +goHDuPS835qkvupr9d9tvUbxj3v22Nfi41bn9uLWLcMQK2aSH+k+aZ68rYzP4t3f7GI
         Mo63dbSkqYS5+FAEv6OLjdERmciZjr3qfPUjD8lccP8HXyiZX4PlcVBzb1u/jj6mul3R
         sNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122325; x=1792727125;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4WHEpxc2DD2ytlbPtn5avsBXgnpM96h97oyzf0HJ4eg=;
        b=S/NnquhvqDMmkjFLZp89pIbLhBIPufEL6lDfniEbTifyZ5z4lr0YK2F5bc1LBdA/p3
         KAeR5vPiDQhqHJS8pgsMUc53ryqZnRL6cWF+p5xY+ny7MRkZiYgsEnIMWxnNlY+dhMhg
         uCx9AyqRRhs2v8QYRxVx/T+F4tCMGesIrZYsaO2M7ZCj5lWKmYYs2fCdegHhUJRqWg9p
         xPtEDVwVADs3s6fid1WDVu1NYxJ6Yoq5OhjBtM/g29xbVK7iWqdbWopZTPp1orEqLX/d
         14pgQrmPihXaCXAxo9aJO4Ev3n2vQCZ9J7b60OfyHgjqAsM4PcJ8g/EsmTjvuvt3CmIn
         80Nw==
X-Forwarded-Encrypted: i=1; AKwUvBz3kzSO81FiYs+IBzN318tPC9VcYqFGTo4MdGmvaqv3yeL9oJwQjb33dI/deqOJTxBFB16AmhfI9jo=@lists.infradead.org
X-Gm-Message-State: AFq9FYK4UjqdX+CHIwdRDTLGqAfXtY1guyZtKxEXF4j4mqik4ttsjvyq
	T4+HZoAPbu6fd6eQlb787HvTNQPpfZlQ7MZl46vSQag+3GD+OVd9fHrj
X-Gm-Gg: AYBFou2ftzkjfM/9g88KnV+BuX++q+37Y//xzFoZMhKvIhFqkasJWFHtebCVj0XRfAg
	rS0XiuWqsXmD1laTR82cz0E7gXIJXkIGnfpNfsJRmp1AfFjCryHoea/FB0u6cckpLW/QTDNsXhj
	TtHXIzoBZyl4lVL8KpDaPfkpZv6fg0l+0KRMiob4ky+Eda+L/R6mNjtNsGIjLmw/7JduTJnSKBt
	88BVIiyHzkfU23S5cGIVqBdJO8mmgVXeQoyOeRBDi2rASJzN0LhwhEBwkcwKC5TVxAMrELVtleI
	oSR/si7f9B+4IRvp+pV8ZCisL+lKHrQq8KQdXzd/LWVy9bXSPOAc7s8ZyFTDLe5ZUaxIAOyE216
	aIctht47ejCZsFj7RR0hnCdt3ypGJu1T0UgyoxnsPLZiNr7lFVVv2IS/0g7xLy1ZYKuVsZQEfi0
	vu2LxUHr/h2AOVRB4yvFVwfWv+Hrzg1EBriExYKVneNpu8EzMe38O7npeQFOCQAEYOSvL4pOvdz
	c4yUJFmeb78+QMysfv24okAwNSiEuZ+cISdWIsH9zCj4AZnuJ3V/Enpuqqw8Wz8Q8LzmbLzG1Ix
	kKJ8KWn4phkQxvChmJfHRoph0n9/SdD6T+m1Pf1tTdtCXQ+v+v6LGf9CraNd2wTfgnyATqt9X/A
	7hNs4JH4mhv5iZsR7ooHttQ==
X-Received: by 2002:a05:6830:6d11:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-83090c28e88mr19746730a34.4.1792122325170;
        Thu, 15 Oct 2026 20:45:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 00/17] mtd: rawnand: sunxi: fix transfers and support
 randomized OOB
Date: Thu, 15 Oct 2026 21:45:15 -0600
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTWrDMBAF4KsErauikWRJzqr3KF2M/hKV2Cq2Y
 xKC7145hdaNNw4IxIPhm+HdSB+6FHqy391IF8bUp9yWYF52xB2xPQSafMmEM66YAUb7s23SUL7
 2kmiLradjaH3uaM6WnvCazwMdgQYBID0w52pHCvbVhZgu90XvHz+5SJ/BDbM+TxxTP+Tuer9kh
 Hnu6aXlMSqVMJVAkOjrt0OD6fTqckPmpSP/Y2smN7O8sBY40zJKdKgfWbFk682sKKwRxllmESq
 5YuWCBb6ZlXMJqKQNvpacr0qolqzYzFaF1V4DMK1QxdW1aslu71YVlkfLjIyB6QoeWf3LAnuC1
 YWtvIhOoece/7HTNH0Dt/OVCvgCAAA=
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
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204526_791369_51C3F201 
X-CRM114-Status: GOOD (  18.29  )
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

Patches 1-15 address the existing driver independently of the Allwinner
randomized-OOB format in patches 16-17. Please review and apply that prefix
regardless of whether the format extension is accepted. It preserves the
existing on-flash ECC geometry, bad-block-marker representation and raw
callbacks.

Patch 1 centralizes OOB handling without changing behavior. Patches 2-11
fix logical-step lengths, read and write error handling, completion reuse,
pattern handling, duplicate program confirms, small-page read commands
and the H6/H616 user-data register limit. Patches 12-15 then reduce repeated
status reads, column changes, chip setup and length-register accesses.
The pattern fixes precede status caching so correctness can be reviewed
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

Patch 16 documents the opt-in binding; patch 17 implements the format
through separate OOB callbacks and an attach helper. Its geometry,
page-wide classification and contiguous parity reads stay together.
Without the property, existing format selection and callbacks are unchanged.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v8:
- Add a separate fix for the pre-existing zero-pattern overwrite reported
  by Sashiko. Preserve synthesized data and OOB in the existing-format
  read path without treating zero chunks as erased.
- Place the fix after pattern-ID selection and update the later status
  caching conversion to use the same pattern check. Keep the initial
  refactor behavior-preserving and the Allwinner format callbacks unchanged.
- Recheck the remaining command/DMA events after draining a timed-out
  handler, as suggested by Sebastian Andrzej Siewior. Accept completion
  during cleanup and balance IRQ disabling even when the recheck succeeds.
- Link to v7: https://patch.msgid.link/20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com

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
James Hilliard (17):
      mtd: rawnand: sunxi: centralize OOB handling
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: preserve synthesized zero-pattern data and OOB
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
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1547 ++++++++++++++------
 2 files changed, 1074 insertions(+), 483 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
