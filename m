Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E72C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9pL83PuizEW+xnVDFhM3j8cHxDaixtMI6FWsawbchKs=; b=zGJISPN0g3LCou
	xkgyfnIDVnHaYSwwbwSswR9CSIDKxetpZqM9leTrQk9nnr/QkLnNWhC2ArZff1PiX/yTWVqOWIFuu
	0pxDjApZMqcFxSi9VdNyvd6l282Jwn4mCub0XVA0zFrGEdd3qGJDDlc6N69OB+x9JTchn3SxvbyZn
	Z43ntbBVab4I461AFgq7ZR2OCEgFZ9GagsRnTRM0MJ5wVqtBVrK01BYXD0SmfE0ExovEkd5h3ZfCo
	9arp34H1dpM5zhUWRAk9YwWbhAHycnYKkowIDGr3j0ytt1F6/nBDSc+tb+jMuLeWIVSu3EZQEI7YD
	J2RomKHNvQE35i4NGjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndq6d-007oOQ-Jt; Mon, 11 Apr 2022 09:13:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq4F-007mz3-K2
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649668240; x=1681204240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zIRYPCBuYDuGaaJFVQUJJswCne5BuSs6kiWW7gKe1Wk=;
 b=ny8cfY/vGdaGZOt27sZnmV+hkkgu+Bl1OhrmksE0svonZHUYv+XfwyDT
 8mtef8t949G7rgcEb865LQb0UI29RWH1QR17vlNzADufvYa4LAbMcI0pu
 sDDy8gRvUmD7LkcDnMmrqmNpR8hdb3Zb204Fpds/guHEO1az5lJZee3m7
 0lGarrTyqUrITSVcYnJrSlIbBtDTMu6taR0iPI3ajhDJUNhaWBWv/FE1p
 LmSW16FUtG6u73u33IL66OwenOp9AV4pm47QwYo4/mB1bTCFnWsZDET1z
 FcHXpXMNTIZXWuda9YvzUc5wuVLdkkk9edwXw/JJ85uuti+jrjaDIqErB Q==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="152208105"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:10:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:10:37 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 02:10:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v3 0/9] mtd: spi-nor: Rework Octal DTR methods
Date: Mon, 11 Apr 2022 12:10:24 +0300
Message-ID: <20220411091033.98754-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_021039_765136_0281FA8A 
X-CRM114-Status: UNSURE (   5.57  )
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

v3:
- queue patch: "mtd: spi-nor: Introduce templates for SPI NOR operations"
from
https://lore.kernel.org/lkml/20220304093011.198173-1-tudor.ambarus@microchip.com/
The dependancy chain between patches was too long and hard to follow.

- Rework patch "mtd: spi-nor: core: Use auto-detection only once"
according to Pratyush's and Michael's suggestions
- Remove dev_dbg messge from spi_nor_read_id() method and let the callers
use their own message (detection, octal dtr enable/disable)
- detailed version changes in each patch
 
v2:
- Fix bug on octal dtr disable, s/nor->reg_proto/SNOR_PROTO_1_1_1,
because after disable the nor->proto is not yet updated
- update function/macros names to comply with Michael's rename series.

Tudor Ambarus (9):
  mtd: spi-nor: Rename method, s/spi_nor_match_id/spi_nor_match_name
  mtd: spi-nor: Introduce spi_nor_match_id()
  mtd: spi-nor: core: Use auto-detection only once
  mtd: spi-nor: core: Introduce method for RDID op
  mtd: spi-nor: manufacturers: Use spi_nor_read_id() core method
  mtd: spi-nor: core: Add helpers to read/write any register
  mtd: spi-nor: micron-st: Rework spi_nor_micron_octal_dtr_enable()
  mtd: spi-nor: spansion: Rework spi_nor_cypress_octal_dtr_enable()
  mtd: spi-nor: Introduce templates for SPI NOR operations

 drivers/mtd/spi-nor/core.c      | 249 ++++++++++++++++----------------
 drivers/mtd/spi-nor/core.h      | 115 +++++++++++++++
 drivers/mtd/spi-nor/micron-st.c | 142 +++++++++---------
 drivers/mtd/spi-nor/spansion.c  | 161 +++++++++++----------
 drivers/mtd/spi-nor/xilinx.c    |  12 +-
 5 files changed, 405 insertions(+), 274 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
