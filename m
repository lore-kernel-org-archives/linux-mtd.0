Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56286C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s9WHyDJ4jGOR1d4LenGGSYOY2xlcP7tCfVdAO8tEQU8=; b=LZ7yrEcnGcskhn
	gTF8yB3gOGwJjfOkm2yBkF0ZPG5ykzwmmd8ayDPAbmZOS3x062tKlvrj+4bR4876LP9s8zjifLwgi
	FOD13cmTIMHNmhvItE+Yy2vNPcTFEHPWJ0eXNCy7JkDjaepa0TZM+DpEHQgJZCAJOdm6UdwOB9Tgr
	v0SC0QqqRMMjMlvn1f7Vih1AyFKfpTk1SmwUoNm/fVoKxx27L/ee4FLoUR2apoys/GBmo9jIBL0pr
	HulndlUz1fuUaooK2pBAsuy6KERWoX9AmtrifR8NvRFu/bXsv+HL3RtD3qpSpVLcjeZ+NFJFRSIDW
	DJSn1aceYb7J8qgtEMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRxWC-0091xS-0U; Wed, 09 Mar 2022 14:42:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRxW9-0091ww-4d
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 14:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646836941; x=1678372941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VXzSaYAq968hpLq9pjQu4f3W0hi/lLLCGhCMIFyMafw=;
 b=C3BkaDaNMpF6mjSQYrTebGcK6t2IL67vsOdrGU9HoRhxsaeDFrI0h5oA
 jgGEElDq73VIAy66bcQ59OpjxQUX0NfngrOh7849/jN+qKFU24PGfU9uQ
 4n5GUrZdFIrFASiRJOyza85IlbBhBfENhfF3N2jex50dxnR2v40kLWtgA
 OW2/9jbMfxT+bKAJlhz/DP/S9Gvd9KBhxMtze5/sqQWUavRE3tm2iNOj4
 j2l7+4BAP0U9wow1FVSo6jvfpJx9BSGuuXwgLqFYa7i8Gq617un2kH4Yu
 nEtqcUllRB7OYrKgIkOanG53S+kbv+8s9mlyhZtOxtluxgd4LVqnSSK4A A==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="148622984"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 07:42:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 07:42:19 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 07:42:17 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 0/4] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode
Date: Wed, 9 Mar 2022 16:42:11 +0200
Message-ID: <20220309144215.179449-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_064221_264244_494CAA98 
X-CRM114-Status: UNSURE (   7.47  )
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

Get the 4-Byte Address mode method from BFPT and favor it in the detriment
of the "default" set_4byte_addr_mode method or the methods set by vendors.
This may introduce some regressions if flashes have wrong BFPT data. The
fix is to introduce post_bfpt() hooks and fix where needed. We should let
the core/sfdp do the params initialization, and do vendor specific updates
just where needed.

This patch set depends on:
https://lore.kernel.org/lkml/20220304093011.198173-1-tudor.ambarus@microchip.com/
which depends on:
https://lore.kernel.org/lkml/20220228111712.111737-1-tudor.ambarus@microchip.com/

You can find a branch containing the entire chain at:
git@github.com:ambarus/linux-0day.git spi-nor/next-bfpt-4byte-addr

v2: drop quad enable patch

Tudor Ambarus (4):
  mtd: spi-nor: Parse BFPT to determine the 4-Byte Address Mode methods
  mtd: spi-nor: Update name and description of the set_4byte_addr_mode
    BFPT methods
  mtd: spi-nor: Favor the BFPT-parsed set_4byte_addr_mode method
  mtd: spi-nor: sfdp: Keep SFDP definitions private

 drivers/mtd/spi-nor/core.c      |  70 +----------
 drivers/mtd/spi-nor/core.h      |   1 -
 drivers/mtd/spi-nor/macronix.c  |   9 +-
 drivers/mtd/spi-nor/micron-st.c |  32 +----
 drivers/mtd/spi-nor/sfdp.c      | 199 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h      |  57 +--------
 drivers/mtd/spi-nor/winbond.c   |  18 +--
 7 files changed, 234 insertions(+), 152 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
