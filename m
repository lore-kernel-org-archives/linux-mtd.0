Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C588C77B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E2HvUu+PeN0tmy0ih/MPYe5LZ/avgHglXjyCmZMfDAs=; b=4RLfAXjw7If4KJ
	WW1gVFzozSKlShbCuOucT/TE/hCN3pU9w5jixZyvfmkfA7kxsVQ9fiGJcjXm37KKj2NQmqqgpXrzA
	12fqnhCChmjyXHAcCHg2oDcj6vKFMqPR+E+aA+p+Z+SxDLEjF2MUNldjKFpLTRNRyqU/Sw1QoDR6M
	JG+jYdH020+5SvgoUJWQTAovvGsAELVdGJuyRD5ckqk7NfDbhmzj7n187N98/M6wwvF5ygQiQ3HOJ
	rMb+7DhqExb7JKXwmzgzFUqwT3STeZWrN1PL0MwSqN9mkIuuYGSI8+8GzeHOIT5JgW9mjLU2hmDoN
	eo+fmCl7WwFlz2X89fYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pttAx-0028Vh-2S;
	Tue, 02 May 2023 16:48:27 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pttAm-0028SN-2b
	for linux-mtd@lists.infradead.org;
	Tue, 02 May 2023 16:48:26 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pttAS-0000UL-0r;
	Tue, 02 May 2023 18:47:56 +0200
Date: Tue, 2 May 2023 17:47:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: [PATCH 0/4] mtd: ubi: behave like a good MTD citizen
Message-ID: <cover.1683043928.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_094816_840002_E0F18A9A 
X-CRM114-Status: GOOD (  12.51  )
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

As of now one can easily trigger the existence of "ghost" UBI devices
or even worse by removing e.g. the SPI bus driver which previously
provided access to an SPI-NAND chip.

Make UBI behave more like other MTD users and create/remove UBI devices
based on MTD notifications. As removing could previously fail in case
of an ubiblock device still being in use, make sure there are no
excuses preventing release of an already gone MTD partition.

This makes it possible to attach UBI devices immediately after the MTD
partition becomes available, which will allow using UBI volumes as
nvmem-cells provider in the future [1]. Introduce new device tree
compatible "linux,ubi" to be used on MTD partitions which should be
attached.

In order to make sure ubiblock devices are still created according to
the module or kernel parameters, let ubiblock creation from parameters
be triggered by UBI_VOLUME_ADDED notifications instead of trying only
once during boot.

[1]: https://forum.openwrt.org/t/asus-tuf-ax4200-support/155738/44?u=daniel

Daniel Golle (4):
  mtd: ubi: block: don't return on error when removing
  mtd: ubi: block: use notifier to create ubiblock from parameter
  dt-bindings: mtd: partitions: add linux,ubi
  mtd: ubi: attach MTD partition from device-tree

 .../bindings/mtd/partitions/ubi.yaml          |  49 +++++
 drivers/mtd/ubi/block.c                       | 158 ++++++++-------
 drivers/mtd/ubi/build.c                       | 189 ++++++++++++------
 drivers/mtd/ubi/cdev.c                        |   4 +-
 drivers/mtd/ubi/ubi.h                         |   6 +-
 5 files changed, 271 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi.yaml


base-commit: b5fda08ef213352ac2df7447611eb4d383cce929
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
