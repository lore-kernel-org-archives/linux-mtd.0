Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D64606A685
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VRTVOOqx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpGk25qG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Lt7xkRl/r9LIQzakJhF2rj4bOAdGNychM/P9YKMHuDk=; b=VRTVOOqxH/K9tuIfFyVQGphnpc
	Hi0d56Nl0r7v/7Sgoyivb4DQMJLkSiQCOat++1rlft7WKRYrCWoaIEoIQhfNAxBsT+X3lCXYnqecE
	UQNFmTdeoWkNeA9NmN3CFxrXZ5hZegdnF+cOzNRyAzDmCxOV9jQhtR55DD4cBqnsCjyhb+BHghrRY
	6hda7RaRve/qmsdlKhGuVURxGv9UMcgxXkLQRE1AF+hzJZ2dX1e9Fewhs1nBPqcq8KtiVIi/72Ma/
	gXzrX00G8MkcMzNnTnLWsHFBwPr2dFEU398FAHNohpakgjPkCCwYf68TQaxLkgmnqUXv6x6g1PS8S
	kb9inq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYr9-0000000DDKU-2jaN;
	Thu, 26 Nov 2026 12:45:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYr7-0000000DDJ9-40VN
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 12:45:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54094455B6;
	Thu, 26 Nov 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697141;
	b=OQ1ORq3bx52wlmUNwxng8F76T7H1rGHRFRXqWi7ZN+uDnjGGtwt9ydfGhWnsJlAPeTQ0
	 E85MJLY2yNLWm+qG3SRxqgZZ1ROrg2J3MwbYdB0Mr1+yJZfXqS1Up3zwef2JNh1wCyYWm
	 pt4H3AXJggFRTsRIKnTFi2gn+JBk8LSyNsaKFcPbBe2LxFsQKfJqTamVIu6IfDqt3lZyZ
	 S1ybRTfnl1dR5PeLTKjf72Rj+RnjRoC3Y0mr+GWrarkT4AIiDZwxTlDW5D4FULdo3utGF
	 N60fe55p/ivPiB33abcWyXIfsl5vuEXkkyLCYUMnXEiPJ1e3R09mESrAvVU1WxvlLmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697141;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=s19rvmzvb3Jb1aBdaC+tDaVA7/9YuJctSrB218VoRVM=;
	b=2cQhupWwKNNxDX+r8nQnGOT3B1IkAQPtJ3v3ZRpVHYNZ0boQGDrhpcRQREt3KhzvgW0X
	 Vkjuuk61XDYsmBEdLpvtv9gFIvIi3fnXISkCvaMnaNfrgercjOSsjtN6nFYdYyYY+18sx
	 yZoSNilGJ6O2q5aVIEyU+t3a86SJ+4phs82N0eYoP3XW24eZ0vwjG/j5aFWtFB7S//ejD
	 hB5EL3KRUKqLalXbXCTE+AtMtwvMi6Ve1jQgolwhjBQKy+AGe807d7jKGS1+OdWp8MSEs
	 zGj5hLp7W7bIKuz+XpFSGOEN9wnZhY2w4bkIFnuAZpr9+f9KI7mHoeaQrhQxblH8dEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E45C1F000D8;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697141;
	bh=s19rvmzvb3Jb1aBdaC+tDaVA7/9YuJctSrB218VoRVM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=VpGk25qGRQKKDDb5FNIfI692Kk+lsN2f098uy6gJo7zA3m+WVSVmypQgN9wwGJQne
	 TgJWjTPYVrL9GCXKg0m/DZNz2QeFsPsP1Mv72A52Fsiux7HEpCOsw7DPMp/H5XTwDf
	 RzEFuR9dw0ECYmSE1DwoOT4g+qNdvOz3XEFFgZFh4320an4L0mN83CFZR4tQOtosEk
	 0X0RTHoJJCBOkeoygjYmrZg/rEmNp/TPuX56IadhEKKOqqeeu9BAGORObnLVA7rybt
	 wG7NFpRCwTq91fDgMBJdP6VWWzxkVgN3s8gMNlqf2wF5RFPDgcXmrz8Kv7V9uCToLK
	 EW2hPojbb+yFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D26B74D4C6;
	Thu, 26 Nov 2026 12:45:28 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] Add Cortina Systems CS7542 NAND controller support
Date: Thu, 26 Nov 2026 15:45:26 +0300
Message-Id: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrq2ZaQulrryHcQFlgBoBQ5FoC
 He34IZodPmS+f6ZmKfekWeHaGI9jc67rg1D7SJm66ytiLsibCZAJIhC8lxx63WsBG+ztuCpNka
 TBABtWEC3nkr3WIOn83v7e34hOyyV5aJ2fuj65/pxxOXuZ3xEDlxbQm0sIJI4Vk3mrnvbNWyJj
 +I/F4GbwpSQJpDGUn1yueXxF5eBQ54UqNAiCNryeZ5fz+BxRjwBAAA=
X-Change-ID: 20261123-b4-cs7542-nand-87997e300079
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697127; l=4360;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=wQpDUS5b0pYxv/jtguM6xqTqewPkbwxTjWJdoV23J8Q=;
 b=jqEQpn7bmgur8voLImXxF37PWNK0HpjRiGsLyBN4uiuJJihAoHnmHnl3GluetgtBhgI7lX6nt
 SPCdr2NXWWYAKi4UePZq3FYhHXk+UC5byzS29/F4RokceCacFl7OIdM
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
ECC and raw operation. It preserves firmware bus timing by retaining
the AXI clock rate. The optional flash reset is acquired without a pulse;
PIO polls completion without claiming the flash IRQ or shared SSP DMA.

Validate generic operation descriptors separately from execution. Use
NAND core page-operation builders in the hardware ECC callbacks instead
of assembling read/program opcodes independently. Preserve the existing
Almond+ Hamming/OOB layout.

Validation of this v4 candidate:
- Full ARM vmlinux/modules builds with the driver =y and =m, without the
  platform series and with COMPILE_TEST=n; software Hamming enabled.
- Binding/example validation and strict source checkpatch.
- Actual NAND core builders and the driver validator: 9815 cases each
  against native and OpenWrt 6.18 headers, GCC and Clang ASan/UBSan.
- Actual hardware-ECC sequencing versus v3: 240 cases per compiler,
  including command/address registers, CS/bank selection, main/ECC/OOB
  ordering and fault cleanup.
- Exact driver compilation with the installed OpenWrt 6.18.64 headers.

The exact new NAND driver booted on Almond+ in a combined OpenWrt
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

---
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
 drivers/mtd/nand/raw/cs752x_nand.c                 | 743 +++++++++++++++++++++
 5 files changed, 853 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-nand-87997e300079

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
