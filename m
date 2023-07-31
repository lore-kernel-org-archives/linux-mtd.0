Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C7DC00528
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9/JUJj8JGmKrbpnlbKri3GU9q50aaL4332PX7jT+vz8=; b=Ug3Kxq8f7uqSI5
	WYhptCDe2qD9jhTS/9qLT35AmrRbuOtyG4y459uOVawZb9TxDrTmos5i/Myuj3vre6Zk2XG4QM3NT
	8A/5mIaEY7RbJwQDb3jlRGrj9xH5PKLdd4TiocQnhbpcRrbk8LARWQNzeClCcS2lQkj5P1B2rC+0H
	u3+bAQwrkqiZgxAkAfZ66Ijkcb6RTGWwCvV2KpcNJE+W08KwlRuWLz63oTCzMG/JPPB3BYfEZXpGY
	0DAj2wcXKW7Z2vlcoZ5MoZcuBvQhghtjsUDmjKaQ41cmc8jH+H3aCZndLldcUh+On0UgmOHtvIdby
	lgbVZWU7HsDBFpNemiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYIb-00H4oX-1K;
	Mon, 31 Jul 2023 19:11:21 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYIX-00H4mH-2h
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 19:11:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qQYIK-0001gP-0Q;
	Mon, 31 Jul 2023 19:11:05 +0000
Date: Mon, 31 Jul 2023 20:10:47 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] mtd: ubi: allow UBI volumes to provide NVMEM
Message-ID: <cover.1690823629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_121117_871427_462F0654 
X-CRM114-Status: GOOD (  15.52  )
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

Daniel Golle (6):
  mtd: ubi: block: don't return on error when removing
  mtd: ubi: block: use notifier to create ubiblock from parameter
  mtd: ubi: attach MTD partition from device-tree
  mtd: ubi: introduce pre-removal notification for UBI volumes
  mtd: ubi: populate ubi volume fwnode
  mtd: ubi: provide NVMEM layer over UBI volumes

 drivers/mtd/ubi/Kconfig  |  12 +++
 drivers/mtd/ubi/Makefile |   1 +
 drivers/mtd/ubi/block.c  | 186 +++++++++++++++++++++++---------------
 drivers/mtd/ubi/build.c  | 160 ++++++++++++++++++++++++---------
 drivers/mtd/ubi/cdev.c   |   4 +-
 drivers/mtd/ubi/nvmem.c  | 189 +++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h    |   6 +-
 drivers/mtd/ubi/vmt.c    |  36 ++++++++
 include/linux/mtd/ubi.h  |   2 +
 9 files changed, 477 insertions(+), 119 deletions(-)
 create mode 100644 drivers/mtd/ubi/nvmem.c

-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
