Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9F606A32D
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G+reW1bK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcz8x5Ao
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=osfiTkIMdh/T3OxUXDBrhrnB01YJF1ozX8F1uHGktdg=; b=G+reW1bKBd2T4zsb6asqaTKRcU
	vBIc9LkLaqtBn2RspuL/4hWAQsy1MG8aw5xERA8SXQDaFQLiHhy41RSI0U9y8irgnhTA4s6Hmj4QR
	qHVuDhQ1VdcCpGg2LixNuQnmuwhiZ5VXGCNm8VCBmlGHaR7WUu73Aew0ctUHOSqqeUP6QSbeufV08
	ofIw0LJAJZRn9F4UQbUi5S7rmb1YmGLnXOsjVmuIUjDjP2K+gVvPH2WcL1KYpVOoyJjKzs2nxxyoi
	9LUaWB6GHIeK0AR6QTCAlz2Jx/6VGSMR4x4RLwvJKub4JBmeqCVPMg3ALsJitqsLI9Cl+Wfoo/iYW
	USwXV+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyH5-0000000GvOk-3b7h;
	Fri, 27 Nov 2026 15:54:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyH3-0000000GvOD-2JYa
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 15:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF3F94017E;
	Fri, 27 Nov 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795794848;
	b=vWDp3wtacIyAkFAB/hcAA7lfWy9DChUe6M/D8qSVg+9LO5/jkvDpax8QG6GKCie5JwVN
	 jd1Od8mRcTZcHbmeCRvMJBTf8/bJZdYvIfeYwVrsyn1WrCD/kvcmYPtEeMMhAtC1mrRoV
	 zPKT6NKuwmSsKK+gAOFcZ42erpf1UPw+TNdPWwhDoNtRN7pGV4A1AJCSaplTIfQBMaE4e
	 nu6wsJKJKaXCEgerXoi97iP/xHGm7kRkVa2DuWgmWxvxEZPGkw9EEOQPHwvqpZJ+RJMnn
	 RpfioiA3rxU2JTHOmVcJtj8cZ28b9bawVwrp0sL+M+8Kc41bGNR7DHNkIiqnoNrkW6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795794848;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6g6ZI+hsoAuv2wbSNdnlQlqw5V1HwTl2uBKo04pneSo=;
	b=uEzPklga+VMhUrnUi+7fF1UaHls1ojYKDH66r7uJnYnhnmdjLgmkg/eTmLq3OZKuy0qg
	 YF1hg5IDhszElhsBM7mvSzSx6vdDcW4n2b4cDU9dmCJZCkN5haQ4CRH6gPtrD9T++rl2B
	 E7RjGDvaOAVse+V4QllW0iDuyjsKiY1HkuYZo2gEl+Dixk+eWh/pM8aFeHC847g6SpWPC
	 dXX2X/bQffabhmVW2/UgxGSyR6Gi432V+HiEeGV4tdtY3fn0nN5S+QgOPKCabK7Dq0H2g
	 8w0H6CHtudDkcNld7JDaCI1BtFcJxB9Ms6IpT4KK2FNJ9ZWboKU3cyfcsyRFSo3EGVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BF2D1F000C1;
	Fri, 27 Nov 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794848;
	bh=6g6ZI+hsoAuv2wbSNdnlQlqw5V1HwTl2uBKo04pneSo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kcz8x5AoOuC78BRXKvweI/KfGBj0auKFqIbBKsRWMi8mGEk+lL40G1JZ+brrXJzXX
	 cNcm4BZCUpffl2FZHu9FC2had2j/cL6NT62K2/ecxzrsQ5RDQrTeocq1jaGiOWdN6b
	 ZbZ5KY3yQ05Q6cX3d/psJZbtDo3+F3AY6SMN8MrQ0zcRKMzEYjJX8GaOYyDxXZjtpH
	 RG0N6eTBAl9cXop1j+0DUiLc4YHdoBH8l9vZ4enDzJfy3OvFqixmTWZm8FqzqWUicy
	 uIzYEG6PIYcGYHou+FeMciJdk6bMyGhkaO6f4OhDNo064SvzWmgrNnjfONsB3z9O47
	 M2t2jICHGNj6g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9DC104DC90;
	Fri, 27 Nov 2026 15:54:04 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v5 0/3] Add Cortina Systems CS7542 NAND controller support
Date: Fri, 27 Nov 2026 18:54:03 +0300
Message-Id: <20261127-b4-cs7542-nand-v5-0-45b1a92bd13d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBCG4auYrq2ZaUt/XHkP4wLKoDUKhiLRE
 O5uwQ3R6PJL5nlnYJHaQJFtVwNrqQ8xNHUa2XrF/Cmvj8RDmTYTIDSikLxQ3EeTKcHrvC65Nc4
 ZkgBgHEvo1lIVHnNwf3jveC/O5LupMl2cQuya9jl/7HG6+xnvkQM3ntA4D4gkdsdrHi4b31zZF
 O/Ffy4Sd6WrwGqwmVSfXC559sVl4lDoEhV6BEGfXC25/uIqcWlJWVvpyha45OM4vgBATUvXewE
 AAA==
X-Change-ID: 20261123-b4-cs7542-nand-87997e300079
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795794843; l=5336;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=F5YtniD0ib6ly+NKYZzzn7PEEsJXdIDIA6xlLE7enB4=;
 b=RFOtm1GOy3mGhQFdr4ehHVUU8dOFTiPFUQmRBvMoqTktUNPDYu8R8N9P2QNxCJImXyC7UwF6+
 obymGsacxLtDWv/XOSpFOSl1JXQeR21am0HoNu4ggd++ptQ1S/qnN+U
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the CS7542 programmed-I/O NAND controller independently of the
platform series and ARCH_CORTINA_ACCESS.

Describe the hardware's two chip selects, 8/16-bit bus and Hamming/BCH
capabilities in the binding. The initial driver supports one connected
8-bit target on either CS, on-host Hamming with 256-byte steps, software
ECC and raw transfers. ECC_NONE is rejected: the core installs split
raw-page callbacks for that mode, which are not safe for this sequencer. It preserves firmware bus timing by retaining
the AXI clock rate. The optional flash reset is acquired without a pulse;
PIO polls completion without claiming the flash IRQ or shared SSP DMA.

Validate generic operation descriptors separately from execution. Use
NAND core page-operation builders in the hardware ECC callbacks instead
of assembling read/program opcodes independently. Preserve the existing
Almond+ Hamming/OOB layout.

Retained v4 validation (the on-host Hamming path is unchanged in v5):
- Full ARM vmlinux/modules builds with the driver =y and =m, without the
  platform series and with COMPILE_TEST=n; software Hamming enabled.
- Binding/example validation and strict source checkpatch.
- Actual NAND core builders and the driver validator: 9815 cases each
  against native and OpenWrt 6.18 headers, GCC and Clang ASan/UBSan.
- Actual hardware-ECC sequencing versus v3: 240 cases per compiler,
  including command/address registers, CS/bank selection, main/ECC/OOB
  ordering and fault cleanup.
- Exact driver compilation with the installed OpenWrt 6.18.64 headers.

The v4 NAND driver booted on Almond+ in a combined OpenWrt
6.18.64 RAM kernel. It read 56 MiB of protected regions with matching
SHA-256 and matched raw/generic 64-byte OOB reads in all four banks.
The real UBI stack created a temporary two-LEB volume, wrote/compared
two 253952-byte patterns, physically erased both LEBs and read back ff.
The temporary volume was removed and the normal reserve restored to
80 blocks (free 0/bad 0, original five volumes intact). The independent
fixed-deadline watchdog returned to installed OpenWrt automatically;
all 13 protected hashes and all configuration hashes matched, and the
four LCD services and normal 30-second watchdog were running.

The RAM run tested the retained hardware Hamming layout. Software ECC
was checked by compilation and the core-operation host tests, rather
than changing the ECC format of the existing flash. No kernel image
was installed by the RAM test. Native driver source bytes were identical
to the tested 6.18 integration; the native full builds are separate.

New v5 checks: full native ARM vmlinux/modules with COMPILE_TEST=n,
exact Linux 6.18 ARM object compilation with Werror, and 52 actual-source
attach/child-selection cases per compiler under GCC/Clang ASan/UBSan.
These cover a disabled CS0 sibling with enabled CS1 and rejection of
ECC_NONE while retaining software ECC. The board uses a single enabled
CS0 with on-host Hamming; these changes do not alter that tested path.
No new hardware write test or installation is claimed for the v5 delta.

---
Changes in v5:
- Select the available NAND child, including CS1 when CS0 is disabled.
- Reject ECC_NONE; retain software ECC and monolithic raw transfers.
- Check the changed attach and probe paths with actual-source tests.
- Link to v4: https://patch.msgid.link/20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com

Changes in v4:
- Address Miquel Raynal's binding and driver review on v2.
- Describe controller capabilities rather than only the initial driver.
- Add the AXI clock, flash IRQ, optional reset and data aperture binding.
- Separate supports_op() and remove the NAND opcode whitelist.
- Use core page helpers for hardware ECC; allow software ECC/raw transfers.
- Support either chip select and reject multiple connected targets explicitly.
- Preserve bus timing through clock rate exclusivity; do not pulse flash reset.
- Clarify the vendor EXTADDR convention; retain the existing Hamming layout.
- Link to v3: https://patch.msgid.link/20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (3):
      dt-bindings: mtd: Add Cortina CS7542 NAND controller
      mtd: rawnand: Add Cortina CS7542 controller support
      MAINTAINERS: Add Cortina CS7542 NAND controller entry

 .../bindings/mtd/cortina,cs7542-nand.yaml          |  90 +++
 MAINTAINERS                                        |   7 +
 drivers/mtd/nand/raw/Kconfig                       |  12 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/cs752x_nand.c                 | 744 +++++++++++++++++++++
 5 files changed, 854 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-nand-87997e300079

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
