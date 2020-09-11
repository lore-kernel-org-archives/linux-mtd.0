Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D06C43461
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7EE1222EB
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qKgejzQo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7EE1222EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UafuqeVQdps2tEcj4DRM3L6r7iCmmhPPmmza8U1PHd0=; b=qKgejzQoSIgdYFh3Mi8ArRTinb
	wujzFW129IRHH5wDrmPYiN2+PRrpnTPqQ5LbNZroVn2hkXTT37XBvFnE0841QKGa5NJiDPHzqiPCV
	TNqs49UHfIeibTTs1RlNq0QUcNQyOi6DqzL4agl+K6qlJxaV4L2jkHwgikKpIWAIQf578//Z8LLOL
	+/MdaQN+wlblKFGxeowD4fiRUZ2tWI0lj7pVHa+aK1oMh4WRoudj80QeJOl1iE3GhTGhFrimDHkR6
	lOxHRPXdSmEgFyff5ueFeHXFCpKMW44knFppxFo30jHw4u69NcqvwMARrIDDvQJkCU90Q/37kzFa8
	B9a30CEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGkKn-0006Jr-OX; Fri, 11 Sep 2020 14:47:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkKe-0006H0-CE
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 14:47:22 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKU-0006Pn-NW; Fri, 11 Sep 2020 16:47:10 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKP-0006nZ-2p; Fri, 11 Sep 2020 16:47:05 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 boris.brezillon@collabora.com, michael@walle.cc, j.neuschaefer@gmx.net
Subject: [PATCH 0/3] MTD: SST SPI-NOR fixes
Date: Fri, 11 Sep 2020 16:47:00 +0200
Message-Id: <20200911144703.25409-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_104720_458366_72F2C273 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Patch 1-2: write path fixes
The sst write path is completely broken since v5.7-rc1 and in rare cases
since the support of the sst_write() function (49aac4aec53c).

Patch 3: cleanup

I've tested my patches with a small test app to ensure writes starting
on an odd address and with dd to test even start addresses. My dut was
an public available imx6q-sabrelite (rev.D).
Other testers are welcome :)

Regards,
  Marco

Marco Felsch (3):
  mtd: spi-nor: sst: fix write support for SST_WRITE marked devices
  mtd: spi-nor: sst: add missing write_enable
  mtd: spi-nor: sst: move sst_write_second to local driver

 drivers/mtd/spi-nor/core.c  | 15 +++++++++------
 drivers/mtd/spi-nor/sst.c   | 15 +++++++++++----
 include/linux/mtd/spi-nor.h |  2 --
 3 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
