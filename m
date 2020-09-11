Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB0DC433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 22:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6912B221EB
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 22:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bnzTw11R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="sQCJlK83"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6912B221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WHjZ6XOEUrW/4kxcrYg/CBtP21nzSab3qo3kVgi2o0E=; b=bnzTw11RbObtaBd6klBdM8CksF
	EZEL95eYdgJ3FmLyBbrPa0UjFlI2lbdncDPyFU4FBR269Rer1XX+hMkwAhE2Vbw9eKhakuS+9M6yX
	p8njQEX9kgfuv8keSDK+xBhzVbv9DCEORHXOYnyVHd+QNKYADmWLEhgg2ZGJBIGf50ybllxiTyXC/
	gRKZpGaIdVvsf7z4bTfJu8U0kEzIgGo6oCBASJa85VwI0RgVoG9MYGYQxvVpaLpz8IXqziD8cNB15
	zT/gupoLALBt9BS+RD2DsEJXPDKvNuafHmwXKcInIlfyKVvkx5/0swWzfCjCkyN9xilAXUaLpmwqU
	0VWOG/5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGrVS-0000L6-TV; Fri, 11 Sep 2020 22:26:59 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGrVN-0000Ir-8f
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 22:26:54 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7199622ED5;
 Sat, 12 Sep 2020 00:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1599863207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y+4gVmaJok+hBPiRs2OkskuBHalIQzIaZsf/KSA3W3E=;
 b=sQCJlK83FWDo9HPakLfSg9jTcS1am9xargZ1hWb/CNC6wopeUsTCoRu+UPo3ey4rMzJWHl
 7bI9PJ+KFp6cnrVulgZrK1Oc9S5wvaPlMC4fjyIbio1wZzkBwB+/ez93MtgqV5FOps2ESs
 cB/VkuFX7PNufWUaNa5NF4jTWHGu4Zg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] mtd: spi-nor: OTP support
Date: Sat, 12 Sep 2020 00:26:30 +0200
Message-Id: <20200911222634.31804-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_182653_560136_8168B877 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset implements the MTD OTP functions to allow access to the SPI
OTP data. Specific support is added for the Adesto, Macronix and Winbond
flash chips.

In the past there was already an attempt by Rahul Bedarkar to add this, but
there was no response. These patches are slightly based on his work.

https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/

Michael Walle (4):
  mtd: spi-nor: cleanup common code
  mtd: spi-nor: add OTP support
  mtd: spi-nor: implement OTP support for Macronix and similar flashes
  mtd: spi-nor: implement OTP support for Winbond and similar flashes

 drivers/mtd/chips/Kconfig      |   2 +-
 drivers/mtd/spi-nor/atmel.c    |  13 +-
 drivers/mtd/spi-nor/core.c     | 769 ++++++++++++++++++++++++---------
 drivers/mtd/spi-nor/core.h     |  61 +++
 drivers/mtd/spi-nor/macronix.c |  13 +-
 drivers/mtd/spi-nor/winbond.c  |  18 +-
 include/linux/mtd/spi-nor.h    |  16 +
 7 files changed, 676 insertions(+), 216 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
