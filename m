Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D2C41535
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 00:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Al3/BX1cvJL0IHvduFyy5X675I+GUMZPvLU0Q7gQxxU=; b=sU4ivHEXsAhu/6
	CoDPwOUUvSMfT9bQbVW06wBt53mpHz0SVggBrBwwoNmDWtKeZIytkh+QxKXKtJvlwhWExygmClo7W
	PUmDFdg3urHp04/nZ19OiPBEf95c/K6LDupB9kcbZsrorRqtChV9tsr2rnMx5N5mCpN2gvjkarhWz
	7Nn870sftL5vutOvwaK4CiB6AgVZRWFirn7Wi5jUjnEy5WSV0wxgHFVWKgHse4SR1ctS91QMCYCN3
	92fqKVbu9EHVf1/pSf/Zd4ELVljYixDsCtrm8uQ3gePntEYO6v7JARsVsxHuw6Wnz7odRrGIyNKc2
	Ii46uMgr5F1gSUDoD8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEejB-006srX-39;
	Sun, 17 Dec 2023 00:09:53 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEej4-006sqY-26
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 00:09:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rEeie-00064Q-1p;
	Sun, 17 Dec 2023 00:09:21 +0000
Date: Sun, 17 Dec 2023 00:09:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] mtd: ubi: allow UBI volumes to provide NVMEM
Message-ID: <cover.1702770711.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_160946_698967_F0EA950A 
X-CRM114-Status: GOOD (  21.13  )
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

Similar to how MAC addresses and Wi-Fi calibration data would be
stored inside an MTD partition on devices coming with NOR flash, a UBI
volume is used by some vendors in the same way on devices with NAND
flash.

The goal of this series is to support such embedded Linux devices which
got NVMEM bits stored inside a UBI volume.

Representing the UBI volume in the Device Tree and adding a phandle to
be referenced by NVMEM consumers allows such devices to come up with
their correct MAC addresses and device-specific Wi-Fi calibration data
loaded.

In order for NVMEM bits to be available for other drivers, attaching
UBI devices has to be moved from late_initcall (which is too late for
other drivers) to happen earlier. As an alternative to the existing
kernel cmdline parameter the Device Tree property 'compatible =
"linux,ubi";' inside an MTD partition can be used to have that MTD
device attached as UBI device. MTD partitions which serve as UBI
devices may have a "volumes" subnode with volumes, and volumes may
have an "nvmem-layout" object which will trigger the creation of an
emulated NVMEM device on top of the UBI volume.

In this way, other drivers (think: Ethernet, Wi-Fi) can resolve and
acquire NVMEM bits using the usual device tree phandle, just this time
the NVMEM content is read from a UBI volume.

This series is a follow-up and contains most patches of the previous
series "mtd: ubi: behave like a good MTD citizen"[1] which was meant in
preparation for implementing the NVMEM provider.

[1]: https://patchwork.ozlabs.org/project/linux-mtd/list/?series=353177&state=%2A&archive=both

Changes since v4:
 * split ubi_open_volume_path() breaking out reusable parts for
   new match_volume_desc() function as suggested by Richard Weinberger.
   Doing the same for ubi_open_volume_nm() doesn't work as we are working
   on struct ubi_volume_info in match_volume_desc() while ubi_open_volume_nm()
   is working on struct ubi_volume. That reduces the common part to a string
   comparision and length check which doesn't seem worth breaking out of the
   existing function.
 * drop patches and changes not strictly needed for NVMEM use-case:
   - don't handle ubi detach on MTD removal notification. It was not done
     until now and the locking hell I was facing when trying to implement
     that is non trivial.
   - don't relocate the call to ubiblock device creation to the
     notification handler
   - change ubiblock only as far as needed to handle creation from cmdline
     parameter when a volume is added.
 * improve commit messages and comments

Changes since v3:
 * dt-bindings fixes as requested

Changes since v2:
 * include dt-bindings additions

Changes since v1:
 * include patch to fix exiting Kconfig formatting issues
 * fix typo and indentation in Kconfig

Daniel Golle (7):
  dt-bindings: mtd: add basic bindings for UBI
  dt-bindings: mtd: ubi-volume: allow UBI volumes to provide NVMEM
  mtd: ubi: block: use notifier to create ubiblock from parameter
  mtd: ubi: attach from device tree
  mtd: ubi: introduce pre-removal notification for UBI volumes
  mtd: ubi: populate ubi volume fwnode
  mtd: ubi: provide NVMEM layer over UBI volumes

 .../bindings/mtd/partitions/linux,ubi.yaml    |  75 +++++++
 .../bindings/mtd/partitions/ubi-volume.yaml   |  40 ++++
 drivers/mtd/ubi/Kconfig                       |  12 ++
 drivers/mtd/ubi/Makefile                      |   1 +
 drivers/mtd/ubi/block.c                       | 136 ++++++-------
 drivers/mtd/ubi/build.c                       | 154 ++++++++++----
 drivers/mtd/ubi/kapi.c                        |  56 ++++--
 drivers/mtd/ubi/nvmem.c                       | 188 ++++++++++++++++++
 drivers/mtd/ubi/ubi.h                         |   3 +
 drivers/mtd/ubi/vmt.c                         |  44 +++-
 include/linux/mtd/ubi.h                       |   2 +
 11 files changed, 579 insertions(+), 132 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
 create mode 100644 drivers/mtd/ubi/nvmem.c

-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
