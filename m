Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34947C433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81EE6501C
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81EE6501C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//BwI1Ugo+yhYwyGXamj5rRqPeyGHzxTk/7Rod+K5xk=; b=RrA5he65bLc2Jbf9aYR3C7K3Zy
	ZTAtIfcrtri9qWrsC3/VbPGaOjF19rFioH78AdVhRIfpPyool/3We09ppT5MQk0bPBR/tcggMJmab
	woxVz870Md6C5KU0tSBL50UOZcOvV+lR2FemYdd54aobH7K106o3Isr9StHaZlcwiPKa5SK+2ObG/
	RZNXb7EDhszFhsREew3mJF8eVsufaXudjP8QwO4KRlR6rKybbS0GoVyUOsYkQC+e7jAeMWNfApri8
	WvzbBamZW69Mdx5AE414WgBw2jIFVEKSeKR+9jYra9V2vPH6cE6RtJTiLq04WGZBvIK3AdJPrlwxG
	BtTlamNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lITa0-002iTe-Md; Sat, 06 Mar 2021 09:50:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lITZf-002iQ7-2i
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 09:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615024215; x=1646560215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6d8k/C2zcO7dRNE3vNUlOTglcHwp5T6AxxIZYwQ4r5s=;
 b=ogxYXXw9iDIJwrkCjRdI30Z7aiGTllKIJcjHPNyjUsP09tSWP5wMjnvV
 vM7781MJwDvdhpo3cMhQy3xg+6RCy+1aXT4x4ibMxM9xOGfEFrlkX9ujM
 vXZsyjweCNcvjebP9KIuqtsYEIutIDqJF/XBjOYXbQA0IACgNLseWk0BS
 aEWGtHdy+eKc0bzG8qLy7PBVtL8jBO2FSN528tUcAB7oVjSJDG6yQ5Cxd
 19NFhl04b5zk8zO0YDmE16AwhBx+PpY6Ptb6gBkOplqqh2pgzODGhuzIO
 E16oEvnD5T34XV5ovNHmmo4tfp2dYS+LCIF/hv37VUIAZFlUK2zKLtfNg Q==;
IronPort-SDR: B0sdHwEu5mieVwBAIOzkyI2zj3sWNnjSNt+LzVp1hxIWYbZBpMO5f5cQKh1yUjjwRPTxC+QL/6
 cebMLn81i/5I2KFGfetRZjWgwC8dzlwo8l212evjJoM9SJ7W2OERLcMEC+C/2Dk0eQXuVSnoug
 vK5Mn7d2HUZw45+TXJPmziVgzMaWEhGQj5NIfVMoF2JK9aqe7lMH6npY9UV+N3f0HWi4Pl8oSG
 ftMHjMfSeTj2LkZeI8SkhKEqAgkzmxutS6ekBX+Ki9sC6L8ewBCkFmG1bZcmxpc7QnL8zzAomV
 4hQ=
X-IronPort-AV: E=Sophos;i="5.81,227,1610434800"; d="scan'208";a="46513037"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Mar 2021 02:50:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 6 Mar 2021 02:50:08 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 6 Mar 2021 02:50:06 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 0/5] mtd: spi-nor: Cleanup patches
Date: Sat, 6 Mar 2021 11:49:57 +0200
Message-ID: <20210306095002.22983-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_095015_684807_5D9F8FE7 
X-CRM114-Status: UNSURE (   6.11  )
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

Various cleanup patches done while reviewing contributions.

Tudor Ambarus (5):
  mtd: spi-nor: core: Advance erase after the erase cmd has been
    completed
  mtd: spi-nor: core: Add vdbg msg for spi_nor_erase_multi_sectors()
  mtd: spi-nor: Get rid of duplicated argument in spi_nor_parse_sfdp()
  mtd: spi-nor: Move Software Write Protection logic out of the core
  mtd: spi-nor: swp: Drop 'else' after 'return'

 drivers/mtd/spi-nor/Makefile   |   2 +-
 drivers/mtd/spi-nor/core.c     | 432 ++-------------------------------
 drivers/mtd/spi-nor/core.h     |  10 +-
 drivers/mtd/spi-nor/issi.c     |   3 +-
 drivers/mtd/spi-nor/macronix.c |   3 +-
 drivers/mtd/spi-nor/sfdp.c     |  72 +++---
 drivers/mtd/spi-nor/sfdp.h     |   3 +-
 drivers/mtd/spi-nor/spansion.c |  12 +-
 drivers/mtd/spi-nor/swp.c      | 419 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c  |   3 +-
 10 files changed, 479 insertions(+), 480 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/swp.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
