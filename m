Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E173C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129FB613FE
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129FB613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e1zH2ULX62V2Qsf+p5yWzjyRtq5IcjZL+zDFtsNpSbQ=; b=PaaTOylCh53Hw5
	zOB8Q0eK7jr9fKv1epDWMuyd4hSnoAe4iWjmUtBGLUcs9MXxnGxZMWrGcHc2QvIZR7xTDpqXtyyOn
	xUng/hfhoO6qDvLdPpwEyWXPkc5h4x2lQGhB+vdwgaGNolthgbH0zi/8OB3Au+ynqP0WxI4vpJKIg
	9+ipwHaUFpCQRwjW5hxpcZG90P8n1WfR2x1UAA7blJF01mNvJbXtTl9PUPEMQ7yqf3x3p/bxRozbx
	UkqA9sQ/wfjN1geOG3/YniQIxA5BQqVM76D3UbDGIr139UVVgIWml4r+zwB3h/YHckt7WKunA7Bs+
	xiRE/fXgugVmUYkJ+BZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKM8-003HXo-8Z; Fri, 02 Jul 2021 14:41:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKM4-003HXJ-IY
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236880; x=1656772880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mgcrHVPQSpEiHc+qvPL6zjFcBlaNJ96na3UUkiEk2VM=;
 b=eD7TH4wiIokOcs0nIFbmUJQBaOm7wZeb5R0jlnFo3X/KEhRynVqcaNlg
 k6xLBJ0S5tWNVycTLh/OppwXMj6IOnzIsHhRP8NOC0A3uQlZhiHm+6J5i
 55ZAyACGncUOWaoTM/hyzYs7Yuykmosq7toWxIJcTJFIUjhNUcTjEapWW
 WLo2qHt+Eyip47OkBTQ6Ooy1hBNHx+Ii6DFZ6jWMX+qhdeWZrQ/EQWjDy
 Srm1wMp9idNdUhqo851WjhKce+ZdDELHmfAJqd62JnNcg31+lhttDAMk4
 rxwQ0sIr/vIkkfXqhfx7u7eFPGF1eT5bcJU7hVMfkd1mgLJfJPVn4m/tM A==;
IronPort-SDR: vhVIM/MGeqnbHpAAzh8XWfCHWjdDRQHvVf+HEU4GCHAgWajejRA37AztD+e/E3cdHiT1VhPZ6h
 st6jGaqCilADRdeQ51RjuwteHdgvxlEQ5sgZJJrMAyydSWPhgCDQZ0x2Ts4gWKvuTB/HuNX9Ps
 zHyK6M3AJxAY43fu14yPDFiY18RSkcBnibNCed4iw0a0VFo8C6/C0N2gzz85cvuA4HpB8oLA/f
 5nPDXC11KqN0Vwvu48yl9H/RUoYJBo4dPSf4w6L5SAQ3SzXlJDaBgvmeTEKADYVEE+f9SHuB/d
 ClY=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="134398738"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:13 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 0/7] mtd: spi-nor: Handle flash ID collisions
Date: Fri, 2 Jul 2021 17:41:03 +0300
Message-ID: <20210702144110.250481-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074120_688372_BC6115D5 
X-CRM114-Status: GOOD (  13.28  )
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

I've started working on the flash ID collisions problems, and also on the
read SFDP first idea, to stop the spagetti init of params. I see the
ID collision thing is a hot topic, so I post the first part of the work,
to gather comments. Entire series is just compile tested.

Introduce the manuf-id-collisions driver in order to address ID collisions
between manufacturers. manuf-id-collisions will be the place to add new
flash additions, where the manufacturer is ignorant enough, to not
implement the ID continuation scheme. flash_info entries will be added in
a first come, first served manner. Differentiation between flashes will be
done at runtime if possible. Where runtime differentiation is not possible,
new compatibles will be introduced, but this will be done as a last resort.
Every new flash addition that define the SFDP tables, should dump its SFDP
tables in the patch's comment section below the --- line, so that we can
reference it in case of collisions.

I can't dump the SFDP tables for the new flash additions, I'll need
support in case someone wants to add them.

Tudor Ambarus (7):
  mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
  mtd: spi-nor: core: Report correct name in case of ID collisions
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L3233F and
    MX25L3205D
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L12805D and
    MX25L12835F
  mtd: spi-nor: Introduce Manufacturer ID collisions driver
  mtd: spi-nor: manuf-id-collisions: Add support for xt25f128b
  mtd: spi-nor: manuf-id-collisions: Add support for xm25qh64c

 drivers/mtd/spi-nor/Makefile              |  1 +
 drivers/mtd/spi-nor/core.c                |  9 ++++-
 drivers/mtd/spi-nor/core.h                |  5 +++
 drivers/mtd/spi-nor/macronix.c            | 49 +++++++++++++++++++++--
 drivers/mtd/spi-nor/manuf-id-collisions.c | 24 +++++++++++
 include/linux/mtd/spi-nor.h               |  2 +
 6 files changed, 85 insertions(+), 5 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
