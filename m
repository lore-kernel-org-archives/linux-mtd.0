Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD10C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:58:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB8A6143E
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB8A6143E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJtaQJusggOHOeWzlqehTRsi0SkjLwY6pXo0EZqtJcw=; b=OYgqmawpbT3dC7OyOrZm2AoUtV
	Cm1inIy7vII4mn5ZJZhjuMhpheiVVf2R6HJ4H0xCD9XO0L6SEGs/2iJabknFs+uSnpujpfpe3oG1m
	mGgCPAqcYm1n5pAg0ppnbl/dQLKbwQGj+MEa2CWUEJ0WDg7NXvqi83CQnBt+Nyt5LO8O57YFre56V
	SBjCICX7bGCR+YdB2P4J1xfhExprwO5oMnbhI9B7ytDf6eWYTe0wXAyWey2GtQMZ+g4gFaGWZydI0
	RZYkL1g7cG8eqT6wHTRWNYim7CDMZA/bctw/WYtnPpj0H7FzogZ1Mjn6Bjy2VaNpWtHFW0FNRGc3M
	M2ftdkXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc92m-0060xf-Lx; Thu, 29 Apr 2021 15:57:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc92j-0060x8-2y
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 15:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=HpaxG8rm84ZVuaYd7aNZxfINyI92WQzUWLGtZtmfac8=; b=QtdB5H9ri8j+rDHl67VXH6WPct
 uyHZmDG/PMz+xWwwpUYFsocFunREJPnI8Q7ZNH4XfugcLmp6t3DirU6Y3dFoSshN4IDcLQ/mJXuPD
 e+rGfLqLolxQb6YJqpgdQheB3F5ZHhuw0p53k319dlss108DwPPJce9OSY1TrLQqvP49fXLT+Rncq
 BaG4D68FNJuMPsMqFfh5LbRK0Tk9mbgFm35Gj3kjMP5PETH5z6ZLUQmB7qhWAd8tA7pb++6yTDOqK
 rys2Xb98yt/sSCbWiDb87nv4od7IVGXJGw/PXdBpaz0mNYNcrSoetbNRgljBs+x4JYueDA+ATns3X
 ygmFHvoA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc92g-000k0Z-5a
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 15:57:31 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 14E4F22173;
 Thu, 29 Apr 2021 17:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619711848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HpaxG8rm84ZVuaYd7aNZxfINyI92WQzUWLGtZtmfac8=;
 b=gJZKOFRG8OKB8slf+vsoR1ECI/6/hpvbWhABptC0NI6f5mYWP5cvSDzBwG2yFRsIsJkjA+
 R+M05qxI2IaYvO3ox4VrS4bKoxuBWh7NrFvHe0mHOqmtYT6w2o4sDk9r8InyaLP254EmS9
 7gUQqsndTdpv3XGzRYBjgPmciTEDEGo=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alexander Williams <awill@google.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 0/2] mtd: spi-nor: support dumping sfdp tables
Date: Thu, 29 Apr 2021 17:57:11 +0200
Message-Id: <20210429155713.28808-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_085730_381977_CC950B49 
X-CRM114-Status: GOOD (  18.24  )
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

Add the possibility to dump the SFDP data of a flash device.

More and more flash devices share the same flash ID and we need per device
fixups. Usually, these fixups differentiate flashes by looking at
differences in the SFDP data. Determining the difference is only possible
if we have the SFDP data for all the flashes which share a flash ID. This
will lay the foundation to dump the whole SFDP data of a flash device.

This is even more important, because some datasheets doesn't even contain
the SFDP data. Fixups for these kind of flashes are nearly impossible to
do.

I envision having a database of all the SFDP data for the flashes we
support and make it a requirement to submit it when a new flash is added.
This might or might not have legal implications. Thus I'd start with having
that database private to the SPI NOR maintainers.

Changes since v2:
 - use .dev_groups of the driver to attach the attributes
 - add manufacturer attribue
 - rename attribute name to partname
 - add ABI documentation

Changes since v1:
 - use sysfs_emit()
 - add comment about the allocation of the sfdp dwords
 - free SFDP memory in the error path
 - use BIN_ATTR_RO(sfdp, 0)
 - use spi_nor_read_sfdp()

Changes since RFC:
 - Don't read SFDP data after probe. The flash might already be switched to
   8D-8D-8D mode. Instead, cache the SFDP data
 - add two sysfs files: jedec-id and name
 - change the file mode of the sfdp file from 0400 to 0444. There is no
   hardware access anymore.

Michael Walle (2):
  mtd: spi-nor: sfdp: save a copy of the SFDP data
  mtd: spi-nor: add initial sysfs support

 .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
 drivers/mtd/spi-nor/Makefile                  |  2 +-
 drivers/mtd/spi-nor/core.c                    |  1 +
 drivers/mtd/spi-nor/core.h                    | 12 +++
 drivers/mtd/spi-nor/sfdp.c                    | 58 ++++++++++++
 drivers/mtd/spi-nor/sysfs.c                   | 92 +++++++++++++++++++
 include/linux/mtd/spi-nor.h                   |  2 +
 7 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
