Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE2AC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Dec 2022 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QPFf8NXa80/Aj4jEJPeYiW+MajAoXTtwIcImwGzYsCM=; b=4AYtCGrOyQj2aL
	7Ak1MyNEagluQpVexkGCQI/nTHOk67xIjt062DmPeE0bD2IntkFFvOoJIYjqZ+7dLgW6v+A8coZH8
	JtvP8kqTvf0eNFE47ZzJjBjQY+BRUuccYhdk0qNDK48KfgXZ3tRSnA3t+s2gqwFXoWW5eoAHMMbg+
	43htmpg0cXsQe3Y4PsOy9ef55ZpEj1Ft6U6Wl8Qc1EU/DGo+GdMa9SMx6nqzujmogOnyi5WH3UF8e
	Z9ZzvspZONtH4daI4S8JTupxfXWqjVLED55GXlcVFE6V7SpuETh54eMTqcGnJmPyhG0zlNTfj3nIR
	641ODc9vJEUhr5aeexyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RK0-00Fx3T-Ks; Thu, 22 Dec 2022 19:33:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RJM-00FwZz-3Y
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2022 19:33:01 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1p8RJE-0004Um-1f;
	Thu, 22 Dec 2022 20:32:52 +0100
Date: Thu, 22 Dec 2022 19:32:46 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/2] ubi: wire up parent device
Message-ID: <cover.1671737443.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_113300_276831_238437A8 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

Wire up device parents of UBI devices and ubiblock devices (UBI volume
devices are already correctly wired to their parent UBI device). This
makes more sense than having UBI devices free-standing in
/sys/devices/virtual/ubi/ without any connection to their parent MTD
device, and ubiblock devices in /sys/devices/virtual/block/ which would
be better hosted by the UBI volume device they belong to.

The purpose of these changes is to allow downstream tools to more
easily identify UBI<->hardware relationship, and potentially also
improve power management and scheduling performance in future.

Daniel Golle (2):
  mtd: ubi: wire-up parent MTD device
  mtd: ubi: block: wire-up device parent

 drivers/mtd/ubi/block.c | 2 +-
 drivers/mtd/ubi/build.c | 1 +
 drivers/mtd/ubi/kapi.c  | 1 +
 include/linux/mtd/ubi.h | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)


base-commit: e45fb347b630ee76482fe938ba76cf8eab811290
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
