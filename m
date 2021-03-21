Return-Path: <SRS0=NFR/=IT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9590EC433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Mar 2021 23:53:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A2461925
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Mar 2021 23:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A2461925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lv+/6zpAbJME2D2f0KnHqgF+LWyH9MEK583ucN7pMsY=; b=OniruNz2hdoccALEdkz7etowB1
	lrzwWNMpUYLRyGQ4NGhtNYiMx45chlnqpe1RY5njNVKRXVpnQRzadjgPqB7xaAtLc/35OZ7shoAUL
	3HpBS/bjU/14l6TCtLu0v8gRxpBSxqdOVB7yi6sHycuIdMpFgyylBg3UTw70i0bvlG9mwnfjHqmSs
	3wIBRSrpE1iMoUBjvE7Vs18JwyuMJdz/57vgVB5VGdxqnZKE+Sjaw1gPSzMjSIVCel1Ps5/jVN6SI
	JQSqSnE9ul1jHsQnMVjGCfXZRfYjcO6m/a7h+2fDmrX1uKV+7rVIpCuEVfn9iPw9nMyd+SbR7OBvq
	WA/vEENA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lO7sA-00AZ9h-4j; Sun, 21 Mar 2021 23:52:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lO7rS-00AZ6B-Rj
 for linux-mtd@lists.infradead.org; Sun, 21 Mar 2021 23:52:09 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C831622172;
 Mon, 22 Mar 2021 00:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616370707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRI73FnBBYgYB1kw6tkuk7W1q2a0kQd5Ln970HaJOPc=;
 b=VoCbSpQebezGTTgzOcvVGeXw/QDLm5MaA0Yc9h6+/594PnEwSwoKA9WTgvXYohwkt8FPxd
 mfD10HfaJBWJUdNw4jHatg/8cfS2MuIEVhacgJM4pWQElSzLtAqDWI6KiEQWQ2lqazSIhd
 CM3x92dqeR36hOILYP4GTeopg4zkL3M=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 0/3] mtd: spi-nor: OTP support
Date: Mon, 22 Mar 2021 00:51:37 +0100
Message-Id: <20210321235140.8308-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_235205_702404_AD48D9BD 
X-CRM114-Status: GOOD (  12.52  )
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

This patchset implements the MTD OTP functions to allow access to the SPI
OTP data. Specific support is added for Winbond flash chips.

In the past there was already an attempt by Rahul Bedarkar to add this, but
there was no response. These patches are slightly based on his work.

https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/

Changes since v4:
 - s/u_char/u8/
 - dropped extra whitespace
 - moved nor->params->otp.org assignment
 - moved spi_nor_otp_init() after spi_nor_init()
 - keep fixups as last property in struct spi_nor_flash_parameter
 - dropped spi_nor_otp_ops()
 - use i instead of region
 - move otp.o to the list of core objects

Changes since v3:
 - remapped the OTP regions to a contiguous area starting at 0. The
   chips/cfi_cmdset_000[12].c remap the regions, too.
 - with that in place, read/write/lock/erase spanning multiple OTP
   regions are possible
 - picked up Tudors review remarks
 - added new erase support as RFC because MTD API/ABI is still missing.
   Feel free to review, but don't apply it.

Changes since v2:
 - improved commit messages
 - add buffer size check in spi_nor_mtd_otp_info(). just to be sure, the
   buffer is hardcoded to 4k by the mtd subsys
 - moved all code to otp.c
 - dropped the patches introduced in v2

Changes since v1:
 - added methods for Macronix and similar flashes
 - added patch to cleanup/consolidate code in core.c

Michael Walle (3):
  mtd: spi-nor: add OTP support
  mtd: spi-nor: implement OTP support for Winbond and similar flashes
  mtd: spi-nor: winbond: add OTP support to w25q32fw/jw

 drivers/mtd/spi-nor/Makefile  |   2 +-
 drivers/mtd/spi-nor/core.c    |   7 +-
 drivers/mtd/spi-nor/core.h    |  60 ++++++
 drivers/mtd/spi-nor/otp.c     | 384 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c |  17 +-
 include/linux/mtd/spi-nor.h   |   8 +
 6 files changed, 474 insertions(+), 4 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/otp.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
