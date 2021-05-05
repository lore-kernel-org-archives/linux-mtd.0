Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C384EC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:15:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51083613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51083613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=96M3BQ8FWMwI3qeQS9JGZf6BOSpPjxGxNSlpQ/DHcjs=; b=KeUfHN7F5fVV1T7UJMOOv/UDS
	FvdgZJF3PyetxNO52tUZj+a3LPRlf+gc0WiBEv5McclfNNhZOsGvY5joXYFn7Vm1WqdSFClXAMnlE
	8Aanc7saeEo7GHdIJcOcTmMcE0pmO2+PpwRoYTiEnfN2j4wwWFepBlZ59V422nkT2P7/xYqKdyF9C
	Nf16+ZKVKJtWEAfOPiVrtSp+E5eo+h8DmcvhMjZjSYj0wVDDO512Z/uapIFH4oos8sE+HNx5JbcPG
	O/v7/8hfVM5AEyVjAtoR5tWTXsul+dxvLJ7H5uUnhJ+djB+CImp9azCG59n8JcD+zDYUrQFRcWtif
	YkgfCVSLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePmi-002TDx-FF; Wed, 05 May 2021 22:14:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDk-002Op9-2k
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=6WeBeTaeSFzoyrwg6bBqGE9g+xehG5REL41pA81+jMo=; b=VT14TdhT9RhFpfxU7um937itUR
 KKl+yDfs1ryhaSxv0ue92ABA2lY71CgYPYJAxrFdvnd+uHrfTKgQ6YO4r5FNzdNXqys6UxjRX87f7
 YpcMBns3OXZOna9DCgDLThKilCMfEToFDy5T50p5HbBp9rypMR2ZZtjHaQSwVfbpRxvBxGPHJmxMF
 S4UV/c59Aspmiig8dHCPmU6lfrvDr3E0GNatzXrcZ7plUiWYrhXnedybrib2Z1PxVJMPiqQR0N/lJ
 0TdJSPfy1ZB3x35Kq3uW/UuUh30AGLvBfst1iLSrUBVBiPaXuZsruNxXx2TQxJzTOwQY/Qy5AKbhi
 LLrz/waw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDh-005IhY-Aq
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:14 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 19D931BF20A;
 Wed,  5 May 2021 21:38:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 19/22] MAINTAINERS: Add myself as co-maintainer of the Arasan
 NAND controller driver
Date: Wed,  5 May 2021 23:37:47 +0200
Message-Id: <20210505213750.257417-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143813_527420_D7E1645A 
X-CRM114-Status: UNSURE (   9.27  )
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

When I submitted the driver I added Naga as Maintainer and forgot to
add myself.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..26c34807d2a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1307,6 +1307,7 @@ W:	http://www.aquantia.com
 F:	drivers/net/ethernet/aquantia/atlantic/aq_ptp*
 
 ARASAN NAND CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
