Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB660A380E
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OCTJCGtl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3jLCfXx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZbXRnQp9whXp4pp6lvgcnE0Dlb+HKXWwxG9iE8Uajwg=; b=OCTJCGtlXLO6PeHpSw+Vkq67bB
	pU2HKMcam8l45MYO5vWSRrDX3YVd6INSCT59O2WJJvC6gKZ7ppaJu40BKkZLTsTYX7/qhgoLlmQeF
	wTLuGRURSvxsj4Hx1NHpmLg7s1RhwdboYs+Q+WRPqtERlEwwWwwWk3K2gFBXW8BxlSXSMXgrjdbDr
	O/NqaOH0rg1/MlGzbjHe6VRYG5DcBqZ9W3RpxMyv7VIOJMfYmCBuQk9+qG75c133q34w4ehKt5D/9
	5vM+3Ei7lhQrzkc8uxEoYi/Dq0UB8Cxvq/AbF4q+vr2NMNIsyJQ/jsl6MuR6ZFAisukb2m3AsM9fa
	aawayrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd9-0000000GZFc-192x;
	Sat, 21 Nov 2026 01:11:03 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd2-0000000GZCM-2UJA
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:00 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-51f2e9e6987so1896957b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223455; x=1795828255; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jqxmKgrhUeW50i3GM0eoV7mLfY/7tQBSWB5JoHqAFCE=;
        b=q3jLCfXxbolxV7/RMQ/BG2MDSE2ckam9BMjTNPlycbxpzihLqw/TzDheF3eznLulhD
         jRazxHhyejEfcvB+hH0QDbQSI9wNv8ruGEdsT6d4HeA6tJd1VVUCkNZ/am1juMBbSYXg
         j95nmE7Tcr64rRh6Z+9hmVS8F7GIewJmxrqTGCHnK3E5oOeQNO7ZwbvejuyuEpIaF4Z9
         PaeFLgZB1gZYREQVuS+Sqh43o4UWXRwLPlcwAgzAwu6GqB8euItFtPUveBsikEUbVbDO
         RHe2asOsZvKWvLevN8KB6TavZRltuANrui5bw2o7mBwqjKokz/i5gnWSXbNjQBzF2GQV
         YKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223455; x=1795828255;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jqxmKgrhUeW50i3GM0eoV7mLfY/7tQBSWB5JoHqAFCE=;
        b=YLInctnTQVMg+BF8NAOficJ4RC1aBJcfIoFb+2p8+Ykwu4231/jtJTdgYJ+HlIuZov
         wTQKDeUkqsViNjjZhM8z0UJZJCQXLdjLtAfyvXK6TROBUU4KNh9Aj8xu96bmcdLfZFZv
         fy6hoZM4nYloh40neskDnTa5d5p02qTIcODgCzBiTiZSh1hWSa/O2sRmu3hPxiZb752V
         GZPRyjmAs4yLEowAifiEmfp2aemsONtNbKI4ZnieV8zbkxzavrjWQqKuPRqv/1aDfU/k
         N9X/7UDpefI2/1S/fkV/bTdzfDnFjP7/a8gb/iig+Kbo+CaHC5j6rFjJFRh4cg2/3TzA
         JX0Q==
X-Forwarded-Encrypted: i=1; AL+hErE5DfTtAc3AEc3qLKZj5L76rxPjSPITjt+dwHBeSxiECYzHaQafpbYgYsxuIesVrKAnVy1m8SRR7PE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+iKc6YffIKzmX11hP8XhxgvUyfQTbV604DPJ/bs55cmHIaKHVT
	6GL+8EcARoW80cqjkrBgfumIM/nrx/ONGwpFjABFWv8ZOsQDYFN0P5l3
X-Gm-Gg: AYBFou3Yh6h5MBU7kcjgtP2Jv+3QLHOHA209sZOgdALcqTcqau7wHhkhA/lIHJQgZvX
	1f6ES3VvZzRsYApST9MRob+VJBKXQN5XHYpTnzsa/ncm2cVHhNGHMoR0qoP51sTZPAK06d56NZt
	ZbMlX5MaLZVU2rtFJ3TWwQdf/YjEdY0eoLsje3MDsjfShsoKlM4HpCSatCc0XrHOYox7dVQxJlP
	0smFwCYiUYqEfZ/V7Gzd8xI2zGImoUIpbGj//huO8KvgacNFnWyc4Pvc8R23JQi2Wlr5/5A+t03
	N/aUez2b5pxzitTWe3LLLRE4MMMRtIBnid0Yfl+y3i/tHsyGOfIL1ZiIsqXqay9hK9i1idqCSdS
	WPf797VFb+97JbK66ZyLJHV6pO7kWcSEtgKDR/mitPNwCm9QdnhqDF0bRiE4QZxCs0Sf5Q+WpnW
	M1tSpvi1T1aTREe8U+fHB4G2gQFjQL/sUELlENbvjHeM9KkU0vjCImood9ZF4hXtG6eqfzZH113
	G5OPHR0FNvEcDpir8Efj6kDo+dlvEUDAPmCY0VtiWFbtjESxMk/jYZ2yqyJ1v50xMcc9rfmRZft
	T9I1c1Nu7Op4yrqTZAxFWwwn+EL+szUOd5Ki6SsDD6jko5GSjR0IvXYDYsxy2oWZz732zXAc70P
	CuGk35W1QvFJDqH3ZZ5M682yOgUqcVnK0LLfpN7VNzvcbXb13V+D8zwZE+IIHWFqyfQgObeyzfj
	dpdIowm7zwpgZfcm4X9h++Op9qEM49BxCxjmNomUHuzHHKTh/z0r2S
X-Received: by 2002:a05:6808:2229:b0:564:3e9e:b4b1 with SMTP id 5614622812f47-5797c0b7852mr5049445b6e.18.1795223454747;
        Fri, 20 Nov 2026 17:10:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 00/26] mtd: rawnand: sunxi: fix page transfers and
 controller error recovery
Date: Fri, 20 Nov 2026 18:10:23 -0700
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XTzU7kMAwA4FcZ9bxBduLmhxPvgTg4iQtZMS20n
 QqEeHdSRlq6M5ciVaqcRJ8dt/5oJhmLTM3t4aMZZSlTGfoaIP45NOmJ+0dRJdeFRoO24BHUdIr
 HMtdX/1ZUz31Wi/R5GNUwRPXM78NpVgsqMYiUEVIKqanYyyhdefvOdP9wjqv0V9K86uuJpzLNw
 /j+XcqC67lfJ60PKLLGt4aROIe7xyOX55s0HJs16aJ/2AC0m9WVjajBUUec2F2yZsuG3ayprDc
 +RYiMLV2xtGFR72ZpbQJbipIDaX3VhHbLmt1sW1mXHSI4y7a7qtZu2f29tZXVXQRPnYBr8ZJ1/
 1iEX7Cusm02XbKcdeYr1m/Zdjfr108WmbzHLor4SzZsWbebDesPZjUlCGJE2ksW4cdF2F9uHR1
 QOTF2VrIO/F+9n+cxHOX1VOd+Ps9mE3kSVferf3uQhOKJYiBvDej13hwTGOGAPkcLDoKzVir2+
 QVL70dfTAQAAA==
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171056_726124_AA03D606 
X-CRM114-Status: GOOD (  21.72  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PIO reuses ECC slot zero for every step, but the protected OOB length
belongs to the logical step. In DMA mode the controller can run out of
user-data registers partway through a page. In both cases the driver
can return or program OOB bytes for the wrong step.

A10 and A23 reserve a fixed number of protected OOB bytes per step.
H616 can vary that number. The first patch selects the two layouts
through controller match data so ECC strength selection and protected
byte placement use the same rules. The next two patches compute OOB
offsets from chip geometry and share ECC read handling between PIO
and DMA.

The transfer fixes handle each logical ECC step at its own OOB offset,
stop after failed NAND commands, and prevent a delayed IRQ handler from
completing the next request. Chip identification is kept separate
from public MTD I/O on the same controller. DMA subpage reads report
ECC results only for the steps the caller requested. Preserve the
bad-block marker on erased or pattern-filled OOB reads, and reject
controller ECC layouts that cannot store the marker at its NAND-defined
position.

Normal reads and writes worked on H616. After an active internal DMA
abort, a controller soft reset alone could leave the next read
displaced. Require the AHB reset and use it for recovery. The in-tree
H616 device tree supplies it; an older DT without the named reset will
no longer probe.

The final two patches reduce register accesses on the normal I/O path.
They reuse ECC results within one transfer and write the packed OOB
lengths once per register instead of updating each field separately.

Models and validation notes: https://github.com/jameshilliard/linux-h616-nand-tla

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v11:
- Preserve the plain bad-block marker on erased OOB reads and reject
  controller ECC when its layout cannot store the marker.
- Keep a failed DMA recovery's error on reads as well as writes.
- Keep ECC results from preceding steps out of DMA subpage reads.
- Rebase on nand/next and omit the three patches already applied.
- Select fixed and programmable protected OOB layouts through match
  data. Share ECC read handling directly between PIO and DMA, including
  on NAND that needs scrambling but stores a plain bad-block marker.
- Distinguish ECC errors, hardware patterns and corrected data in the
  ordinary read path before updating the ECC register accesses.
- Compute protected OOB offsets from chip geometry before the transfer
  fixes. Keep the register-access optimizations at the end.
- Select small-page read commands before propagating errors from column
  changes and erased-chunk checks.
- Fold the absolute OOB column comparison into the transfer-error fix
  so small-page writes keep working at that point in the series.
- Distinguish normal H616 I/O from the soft-reset failure after an
  active DMA abort, following Krzysztof's review.
- Link to v10: https://patch.msgid.link/20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com

Changes in v10:
- Require resets and reset-names for H616 in a binding patch before the
  DMA-abort recovery change.
- Reset the H616 data path after DMA aborts. Require and exercise its
  exclusive AHB reset at probe and reset before releasing the DMA mapping.
  Propagate unexpected reset errors and reject further commands after
  failed recovery.
- Group shared-path preparation before the existing-driver fixes, followed
  by register-access optimizations and the opt-in format support.
- Share buffer command sizing between reads and writes, and use those
  boundaries when decoding a randomized tail spanning multiple commands.
  Keep the decoder correction in the format patch.
- Skip unavailable NAND child nodes before claiming chip selects.
- Scan all chips before publishing MTD devices, with separate registration
  bookkeeping for partial scan and registration failures.
- Limit direct buffer transfers to 1024 bytes per command, independently
  of the advertised SRAM size, and share the limit with the parser.
- Send every address cycle in parser-split instructions, using the subop
  count independently of its start offset.
- Propagate chip clock setup failures before installing timing registers
  or issuing commands, and update the cached rate only on success.
- Carry Sebastian Andrzej Siewior's Reviewed-by for the IRQ lifetime fix.
- Link to v9: https://patch.msgid.link/20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com

Changes in v9:
- Add an independent fix rejecting pages that exceed the controller's ECC
  step limit, as reported by Sashiko. Keep it after the initial refactor and
  retain the final ECC step size when validating explicit or maximized ECC.
- Add missing Reported-by and report links for the IRQ lifetime,
  small-page read and DMA user-data batching fixes.
- Make the existing PIO and DMA OOB-read branches explicit in the initial
  refactor, preserving their transfer ordering and error handling.
- Add a cached pattern-ID accessor with status caching, so the Allwinner
  format can request pattern IDs without duplicating the shared reader's
  register-read conditions.
- Clarify OOB callback indices, buffer and ECC-cache lifetimes, and why
  an empty pending-event mask completes the IRQ timeout recheck.
- Explain packed parity placement and byte-based erased-page classification
  as Allwinner format compatibility rules, distinct from hardware limits.
- Link to v8: https://patch.msgid.link/20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com

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
James Hilliard (26):
      mtd: rawnand: sunxi: select the protected OOB layout from match data
      mtd: rawnand: sunxi: compute protected OOB offsets from page geometry
      mtd: rawnand: sunxi: share ECC read handling between PIO and DMA
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: reject ECC layouts that overwrite the bad-block marker
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: preserve synthesized zero-pattern data and OOB
      mtd: rawnand: sunxi: handle ECC results in the batch reader
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: limit DMA subpage ECC results to the requested range
      mtd: rawnand: sunxi: preserve bad-block markers on erased OOB reads
      mtd: rawnand: sunxi: send all address cycles in split operations
      mtd: rawnand: sunxi: propagate chip clock setup errors
      mtd: rawnand: sunxi: limit buffer transfers to the command byte count
      mtd: rawnand: sunxi: skip unavailable NAND child nodes
      mtd: rawnand: sunxi: scan all chips before registering MTD devices
      dt-bindings: mtd: sunxi: require the H616 AHB reset
      mtd: rawnand: sunxi: reset the H616 data path after DMA aborts
      mtd: rawnand: sunxi: reuse ECC status within each transfer
      mtd: rawnand: sunxi: reduce user-data length register accesses

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |    3 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1465 ++++++++++++--------
 2 files changed, 863 insertions(+), 605 deletions(-)
---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
