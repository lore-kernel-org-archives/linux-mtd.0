Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618DBC04A94
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3GKQiBZA7u7ZeuBjvbfoq0ObzU0f3eR8CcgWSZXyHU=; b=Ug+oS0bF0V/dT9
	GJZWp+mXx9IVMQcJmhIVkgMGQf3/FrJed94ANkZqiNoyOAOU+1tqOM5drlY8Lw7RBG9FGZPh0pCHJ
	UJlaUitVMdTNar3Z6XM6Pb+9ihU4aX3TsrNVsNdsEyeTrqM1PJCW7b19UdGeLLU9LQRDXdmAhOw0u
	eGySkX+JvYXze9d/KatHvzOVx3/01uj12gE0QGSIZtFQZcYngVrxUrrXEC8uz1n+FQWV5lLb39I+k
	PrzM5jc2YHfrmbEeaJk0P5JK1LmOgqKp2DK/sCOl80RnTUe/n79R/tEAEu6Uq8KV+MuXWLO9xTnpx
	Zf3O5tLKqmU7r2tXrjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH5D-0094vC-1l;
	Fri, 11 Aug 2023 01:36:55 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH59-0094uM-1b
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 01:36:53 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qUH4h-00052h-2s;
	Fri, 11 Aug 2023 01:36:24 +0000
Date: Fri, 11 Aug 2023 02:36:03 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] mtd: ubi: allow UBI volumes to provide NVMEM
Message-ID: <cover.1691717480.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_183651_580928_0531535B 
X-CRM114-Status: GOOD (  16.69  )
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

The series is a follow-up and contains all patches of the previous
series "mtd: ubi: behave like a good MTD citizen"[1] which was meant in
preparation for implementing the NVMEM provider.

The goal is to support embedded Linux devices which got NVMEM bits
stored inside a UBI volume. Representing the UBI volume in the Device
Tree, adding a phandle to be referenced by NVMEM consumers allows such
devices to come up with their correct MAC addresses and device-specific
Wi-Fi calibration data loaded.

In order to be available for other drivers, attaching UBI devices has
to be moved from late_initcall (which is too late for other drivers) to
happen earlier. As an alternative to the existing kernel cmdline
parameter the Device Tree property 'compatible = "linux,ubi";' inside
an MTD partition can be used to have that MTD device attached as UBI
device. MTD partitions which serve as UBI devices may have a "volumes"
firmware subnode with volumes which may be compatible with
"nvmem-cells".

In this way, other drivers (think: Ethernet, Wi-Fi) can resolve and
acquire NVMEM bits using the usual device tree phandle, just this time
the NVMEM content is read from a UBI volume.

[1]: https://patchwork.ozlabs.org/project/linux-mtd/list/?series=353177&state=%2A&archive=both

Changes since v3:
 * dt-bindings fixes as requested

Changes since v2:
 * include dt-bindings additions

Changes since v1:
 * include patch to fix exiting Kconfig formatting issues
 * fix typo and indentation in Kconfig

Daniel Golle (8):
  dt-bindings: mtd: add basic bindings for UBI
  dt-bindings: mtd: nvmem-cells: add support for UBI volumes
  mtd: ubi: block: don't return on error when removing
  mtd: ubi: block: use notifier to create ubiblock
  mtd: ubi: attach MTD partition from device-tree
  mtd: ubi: introduce pre-removal notification for UBI volumes
  mtd: ubi: populate ubi volume fwnode
  mtd: ubi: provide NVMEM layer over UBI volumes

 .../bindings/mtd/partitions/linux,ubi.yaml    |  66 ++++++
 .../bindings/mtd/partitions/nvmem-cells.yaml  |   5 +-
 .../bindings/mtd/partitions/ubi-volume.yaml   |  36 ++++
 drivers/mtd/ubi/Kconfig                       |  12 ++
 drivers/mtd/ubi/Makefile                      |   1 +
 drivers/mtd/ubi/block.c                       | 186 ++++++++++-------
 drivers/mtd/ubi/build.c                       | 160 +++++++++++----
 drivers/mtd/ubi/cdev.c                        |   4 +-
 drivers/mtd/ubi/nvmem.c                       | 189 ++++++++++++++++++
 drivers/mtd/ubi/ubi.h                         |   6 +-
 drivers/mtd/ubi/vmt.c                         |  32 +++
 include/linux/mtd/ubi.h                       |   2 +
 12 files changed, 579 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
 create mode 100644 drivers/mtd/ubi/nvmem.c

-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
