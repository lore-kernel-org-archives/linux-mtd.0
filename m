Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7355606A32E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/8MJVvu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5bnUYNW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JE+91KMRzzDYxe6vxBwjdUKM6GkGEsZ/NNtu56nQQts=; b=g/8MJVvu66xWpCIshMe1NyVYAe
	OmaBJPFZNq5WAUDggAlvXOIdQXqCnxI3pXJbHCiuDg9LJqWKVc4Ufbna++DH1NbhU0ZlFTs8X7JZ+
	lMMkhGpuGjGENW+K9DLi7UwuRBzh+voyJINIpKbih3RCxu16MDLyCgKqmZ8IEM4a72y05yJZTfBno
	o5gAqZ2Q+h0cMBLcL7OMjMJzw+/cJOgeme3Rr8gKN0vX69m7YJtoxWhk9rCxx9yj90BLhXDkDXl6U
	eDjkKVyh2oA0XBudxTpNI9Jr2kutM+Uc65tv/LXhMY3BRGvSs2AxuC3diYUpicrrO3GDG6qhZPizB
	IneCorqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzb-00000004Wl9-1504;
	Mon, 23 Nov 2026 18:42:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzM-00000004WUt-0FTP
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE8F145A1B;
	Mon, 23 Nov 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459323;
	b=GVIDuwaSJGOkot5A+GOYNIDlfMwsIa8gnbqtjCjlMXBM3Wpv3/QcfQerNPsgUK8HlSAm
	 DOoO3YMGiYwns293ZylkUmgPCtmkxuWylIUA7TRn6ZwlhwBV6/VpBxg5yTsgDTpa1JwdM
	 /4rIMFlX/KV6oF3GP5XuzgdCAZD1SmsfD3r/UMuLWt2KwF8BQKq+HsvmBtZ42AQ2CGYBf
	 BEtGSIjySytF21pxKqgVFNuY6bN3r8DD88jJFb2zhZ0COdTwWpwVLM4rf5yvBsaUseHgv
	 S+p+gJwgVjoPvvlGXVVlKCKZRE2mHHQfV7kfbPyyHFBk6UOqeWtda1PDa3QVl9EioMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459323;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=musLNBbvIPP0pZupDcF24ytIpe1LtyyAEg+0w1etnuc=;
	b=tn3Z5xV+86KxjgQGbyQ4r0n0GTD1ko5esdq5b0vb3oQzDQanlW8FNyPzr+f0WS94EgZr
	 FGauu2e1w4Z+WHUlGlkT5KnWHriBeiqwR+64K9oc3kzXOzhvGqNR2XFaVkZYFbqdpbWGQ
	 W3+TBsPsl5828GP6bDfjkoZhT1woGmwJiLKwetdtk90k9NJseW63JHrZGfIJTtrFlo1o0
	 giWviy4G9MhvlzM+pkf74M2aVzfq+iX1d1S+BSwb+xy2cFSJH/X0YXntxk2O1Slac+0Le
	 jrcRrUlK6d21xuxuahPUoEQyM7YylcRDuk95rUSTTSd08BnnSsMXcfjoWbe6738COzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C55D71F00A36;
	Mon, 23 Nov 2026 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459323;
	bh=musLNBbvIPP0pZupDcF24ytIpe1LtyyAEg+0w1etnuc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=P5bnUYNW/qfUnta20rQHeYIbUt9kf6vmumzv3slqe66G0sN/xnN8MfvRX9nYugYxa
	 ZTLpPjD/kQiC1UKElkm8O+Ob+cL9ytdOxX2dFhorBhdtcOt+4RmCVeEsKJbv4nfceH
	 p+JzRQe71SbxG1RMVI2LLj0OQmPaxUkl7pI3ieRlMHtR9e0+gj21pxoNymXA273SM1
	 i0uneKnYgMZf5pwpBLs3bY8xH3CSvxj0wexygHaWE7LX5tGVLheeLVPcd7+d+rk3+8
	 i42x4WYf8YcfGBdtUQn8dR9JPJZoz1FFxHMzXhWj44OjySyy6Kaqzj/OGHjhhHRhDU
	 U1CmlFM8xp6IA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C6344C5DD;
	Mon, 23 Nov 2026 18:41:39 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH 0/3] Add Cortina Systems CS7542 NAND controller support
Date: Mon, 23 Nov 2026 21:41:37 +0300
Message-Id: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMPQ6DMAxA4asgz1jKDzQNV0EMEEwxQ1rFgJAQd
 ydtx2947wShxCTQFCck2ln4HTN0WUCY+/gi5DEbjDIPrY3FocIgrq4Mxj6O+HTeO7JKKechR59
 EEx+/Ydv9LduwUFi/F7iuG0zWVTRyAAAA
X-Change-ID: 20261123-b4-cs7542-nand-87997e300079
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459297; l=2618;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=IP+8zwGE19sgIV+qJrA+fIZvVuRoJTEIEdbCodPzGtU=;
 b=A3paAJAVDb1QxAgUbEX2zezC3SKwCyZzfy5VnRBZ+J1n6SsBvezOi5Eff9QoHtA3VwzJ5DQUH
 yQkgk4XV8vNDssjh4xSkmKy+xk8Iurl0TmNFKohtHc9ZteD1qNEPgcy
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

Add the NAND controller used by the Securifi Almond+ (CS7542, two Cortex-A9
CPUs). This is an independent binding/driver/MAINTAINERS series on
Linux v7.4-rc4; it does not depend on ARCH_CORTINA_ACCESS or the platform
series.

The controller sequences complete command/address/data transactions. Use
exec_op with explicit capability checking and cached ID, ONFI and page reads
for NAND core's split operations. Retain firmware-initialized bus timing.
This version supports large-page, 8-bit NAND with on-host Hamming ECC using
256-byte steps and the existing OOB layout. It uses programmed I/O; DMA and
unverified BCH modes are deliberately outside this initial implementation.

Validation:
- Full independent ARM vmlinux and modules builds, driver both =y and =m,
  COMPILE_TEST=n, without the platform series.
- Binding schema/example and strict source checkpatch pass.
- Actual decoder functions: 292 boundary, address and sequence cases under
  UBSAN. Address packing: 655360 cases cover every Almond+ page and
  two-row-cycle large-page geometries. Actual Hamming correction function: 16389 cases covering every
  single-data-bit position, invalid hardware offsets and error propagation.
- Linux 7.4-rc4 booted in RAM on Almond+. NAND identification, all-device
  bad-block scan, OOB reads and SHA256 of five existing protected regions
  passed without new ECC failures.
- The real UBI stack created a temporary two-LEB volume, wrote and verified
  two 253952-byte patterns, removed the volume and reattached with the
  original bad-block reserve. All 14 protected partition/configuration
  checksums matched after returning to installed OpenWrt 6.18.64; the five
  original UBI volumes and normal reserve remained intact.

No kernel image was installed by these RAM tests. Board integration used
for testing is kept separate from this series.

---
Fil Dunsky (3):
      dt-bindings: mtd: Add Cortina CS7542 NAND controller
      mtd: rawnand: Add Cortina CS7542 controller support
      MAINTAINERS: Add Cortina CS7542 NAND controller entry

 .../bindings/mtd/cortina,cs7542-nand.yaml          |  66 ++
 MAINTAINERS                                        |   7 +
 drivers/mtd/nand/raw/Kconfig                       |  12 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/cs752x_nand.c                 | 826 +++++++++++++++++++++
 5 files changed, 912 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-nand-87997e300079

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
