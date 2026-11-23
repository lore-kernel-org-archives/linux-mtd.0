Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1C0606A31E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ULKy1bn2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W88mcr2l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=av9Zto8by7ygwlGVkJcxVGJ5RRpg75wCKl0jsWDOk0E=; b=ULKy1bn2+nLX2Z9ub3335EcSM9
	o3JyGgexlN4UZDMxcae6oFyRh0hDL7EL0bqoSGZW51c0ZhE16wtztBLtn8NfObHR45k87wz99q6Zq
	uTR4WbrGU+k9m3iUfGX0bTtXjn4/XTGMNOjlCMDULJ9Ene3mAeEXlUqqod58oHbSIw4F5kLbazzp5
	KM9RPIdIe8Uu7pEbjc9i9Yx7AQH4EHO/QEXnJKJglPwEHQqrBmKB4b5L9zoa/Fzw6oQ7nEYOVOLkA
	ACRgP/XmNwtQsw2R/VOVbZLZ2EKaIM6tOrwhqKR+TWna4aGclxxFAS6xtVjExdv6qOU3zsU7ofuNd
	MxjKqRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadl-00000004pOW-3tWk;
	Mon, 23 Nov 2026 20:27:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadF-00000004p6j-3L1F
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 20:27:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42450624B6;
	Mon, 23 Nov 2026 20:27:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465641;
	b=EYOFHS0d7nM+XgK+28CrO26PAyyz/+AMVYFQNKIB6s7fqQcC1oahtllXj8GNtACmvKSK
	 09yVkdz2HDXuxlalCAq68PJ1v4CQNei7/GB4azLJ5lnWVI+GH6zwgeded7hWOc1gRUKSo
	 syWHdMzDwf0QFzIRqP25H2vUm5SxKEeht+EuJTzwt2QBAFyYZtvrIzkAahd1ai5NCyTXz
	 cqTVy18K2A+uXybC5kxr24PZ/PEjfuLQON/2cBPzKoZoXrYMKDLV37wa3mBOZMTQkGwsx
	 nGFAyOfz3FItLaJEINVlPdvFVpOc5K5te95T/TGoNCePABayyj2vMLPdLNPYO/FtqXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465641;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=T+F/DW5lUrlR4g96z84d//vVqKFn8tQXsf1l2txmob0=;
	b=Bk2eQqVz7bQMpeWCXfzsLFeRMZxB2midTWs74+tIgdD3yCryEXsfI0D8fRwZBfod0gyd
	 ClG0DWFJLwvV37viYazQUYCHVYi5fw6EwEUgRtAts+wMilly2Rq+/fnN9eRN7jozuY7GU
	 BsrRB7qsNyzW15uF6Rvuq4eU99vOE7Q6ewdvJBCESP0QE87PgWiAzp9C6pZb78Y2jH66a
	 IBmB9+pAxyO6pfU5ixk1E3hrHYC+G0cg+DVGHmzHtc2zPbKLBCacmer6uy+L85LzKI8CK
	 yyzLJdSMdC6Ynjq3sQ5ccwIL4J5UAXZDbx2FnerW2z8xJtZRuyJQnUoWd3luneUACVg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBD3B1F000F4;
	Mon, 23 Nov 2026 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465641;
	bh=T+F/DW5lUrlR4g96z84d//vVqKFn8tQXsf1l2txmob0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=W88mcr2l6WPGN/h13jrN1KkfE/RhD9P/vRYsCOxw2G+U0j1/aqKQ9B/CWFGCqW56W
	 upcOcXvT3MEw7vnyAJ93W/aFBpmfF2QxUg221iK1CN67joZwmBdMvB/ktaUWaklv/1
	 yFS/BiRoZNXHUjRov+TbqMcf3bI3cYIr+G1bHd5/qK2sMPe1WGNCs88tZeBelHMKZA
	 bjGHn2BRwzNx/VIAb6vbW0QWM/DEIRkhet5zcAheYNOnPxzduJ5i12yn2MEiDM/7Pn
	 JjyRtwOhv/XZCyp2jBUcMKlhIP6DT919pQuuLP5xMWx9Xt5Pd+uu6UwA1BL75VBuiY
	 hclkajPm53M9w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C7CD04C6CB;
	Mon, 23 Nov 2026 20:27:07 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Add Cortina Systems CS7542 NAND controller support
Date: Mon, 23 Nov 2026 23:27:05 +0300
Message-Id: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhOQWtdeQ/DAsoIY6SYFomG9
 O4Crl2+5P33Z4gchCOcsxkCTxJl8AvoXQauq3zLKM3CoJU+Eukc6wJdNIdCo698gydjreFcKWU
 sLKNn4Ju8t+C1/HF81Xd241pZjU7iOITP9jjR6v2NT4QKjWMy1iki1pe2r+Sxd0MPZUrpC8NT8
 Ze+AAAA
X-Change-ID: 20261123-b4-cs7542-nand-87997e300079
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465626; l=3818;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=CnW3IPcIRfA3pOK4CTKSutOWjUTb2QhePCtMerwXwmM=;
 b=EWpf3pbSTn1PjACXwwAPbv4LFFS+vK9dbcLo7X6u1FYRZCFt2Yl21BlnswC4JvMVEkHNMbamN
 EhHEFlY29SBA1HTe64v6KHSDO1AGwLAodz5tZ3oSF3TIIIQOZKfK4+8
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
  two-row-cycle large-page geometries. Actual Hamming correction function: 20485 cases covering every
  single-data-bit position, invalid hardware offsets and error propagation.
- Linux 7.4-rc4 booted in RAM on Almond+. NAND identification, all-device
  bad-block scan, OOB reads and SHA256 of five existing protected regions
  passed without new ECC failures.
- The real UBI stack created a temporary two-LEB volume, wrote and verified
  two 253952-byte patterns, removed the volume and reattached with the
  original bad-block reserve. All 14 protected partition/configuration
  checksums matched after returning to installed OpenWrt 6.18.64; the five
  original UBI volumes and normal reserve remained intact.

V2 adds 630 actual attach-function geometry/ECC cases and repeats the full
independent ARM =y/=m builds. V2 also booted Linux 7.4 in RAM with a single
read-only partition: identification, bad-block scan, OOB reads and hashes
of six protected regions including calibration passed, with no new ECC
failures and automatic return to installed OpenWrt. The previous UBI
write test above was on v1; it was not repeated on v2.

No kernel image was installed by these RAM tests. Board integration used
for testing is kept separate from this series.

---
Changes in v2:
- Reject unsupported page/OOB layouts and incompatible ECC requests.
- Use 64-bit arithmetic before extracting the page bank.
- Reject invalid hardware error-bit indices, preserve DT labels,
  use the core OOB write helper and standard final-read polling.
- Link to v1: https://patch.msgid.link/20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (3):
      dt-bindings: mtd: Add Cortina CS7542 NAND controller
      mtd: rawnand: Add Cortina CS7542 controller support
      MAINTAINERS: Add Cortina CS7542 NAND controller entry

 .../bindings/mtd/cortina,cs7542-nand.yaml          |  66 ++
 MAINTAINERS                                        |   7 +
 drivers/mtd/nand/raw/Kconfig                       |  12 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/cs752x_nand.c                 | 807 +++++++++++++++++++++
 5 files changed, 893 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-nand-87997e300079

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
