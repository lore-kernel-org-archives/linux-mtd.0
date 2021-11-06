Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA0BC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:16:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2C161360
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D2C161360
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aGke3VCGoeeEpYXHGnz9Ay0ihZ5zUp3lsNnz1K0YRnY=; b=wmCSj/UJ9sH9fM
	pUQZrIq0xzEXal8Hgu7lL763n+/DOrM+aJUziGfO5u04LaK9FcaXKoOyCmR7dhdoRG+Y9HAWi43DE
	rTZgh6Yf6Xyu2pvle8Mxyp6diEOe99nApjsuVOk+qWqacOYkU9lpz0lsfkD+avLnhAVSWiU/6wbhW
	IWca8i48Ino9t+lPOdE6c0c++aqpcBSdrc53Hxx9WKW8QQHeC0MroHfrC8I9OdoijfuYBJAj7lbU/
	a0ZOHTYgr4/SKoGBdHuEAh1RL+X1W+GZuv8iDS1yzpP9/Je2nfbX1oqeVgghpkNESgsCFjDG/c7Id
	ShnYbCsIfAIQ3OP0FswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPI0-00DGlr-Ok; Sat, 06 Nov 2021 17:15:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOq1-00D8Rw-Bc; Sat, 06 Nov 2021 16:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217201; x=1667753201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t6jmEyKP3SmXpiAIWGvC3tTg81iQ+9/seejJHz2LmEU=;
 b=i4sgNncDklb7pOmEvQwClwJuDTupYiESy2lYfuy4zyT5XW9dPcSq/TjQ
 H+55opFwxbGrCXI8h9urjYwyDjuB3oAe+teATVuxA+XpRlnL/jW+d+XLd
 0Jx/sjSLCMZkLxgma4jr/UdP7OD0HJvCmGxeLMlMVi9pgu8bADdK/dAkr
 4C6892Wo++tEuiQ9S6gfJglnkByYlzzPL/etb+HfsrH33NfksQCW5tWiV
 2lWXe9UNW9tvGKCa77EaLn0z+2oFpfWOIqKkyV77jaNDDwK2S/WBf2F0l
 5eb+NUORrUiT5F39DvKPAEBwhOm9iqqVAAQXBcnQsSVdzvpgfX8oCtEAe g==;
IronPort-SDR: ZUF37sqacR45W2DnlSFjiN4G8ZRu2sXgVcQknowzoingSWpX3FGSAfK5/f/cWfgkdNhkBljGGm
 S8Enbr+VomBl2J0gGA7+UFU5/kv/N/pTv8MIhccLi5OeZtubR6hbuIklcZ6OSKt1hZR16NpZz3
 4ZOVUajr9VKWLQd7ejXI913BCXFkZGqLTMVBoiecBuAiNkyzls4yKSl9IhdCjqBCoG6fPxYIU8
 8OCVtiqircVEytBgfYFlZA/cKrTUnhM914F/BbjBjVLFquwuj+V4GlSv62PqKImJ9L+uIyzMbk
 q+wvkjcuPaSdhANvWSsSf5TH
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="150948746"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:03 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:36:59 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 0/6] mtd: spi-nor: Handle ID collisions
Date: Sat, 6 Nov 2021 13:36:51 +0200
Message-ID: <20211106113657.172690-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094641_460880_D655E29C 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Depends on:
https://lore.kernel.org/all/20211029172633.886453-19-tudor.ambarus@microchip.com/T/

Tested with MX25L3233F.

Changes in v3:
- report correct manufacturer name in ID collisions driver
- use fixup name of the first flash, not of the one that collide
- use xxd to dump sfdp (where I had the flash)
- drop locking support on xt25f128b
- constify flash_info fixups hook


Tudor Ambarus (6):
  mtd: spi-nor: core: Report correct name in case of ID collisions
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L3233F and
    MX25L3205D
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L12805D and
    MX25L12835F
  mtd: spi-nor: Introduce Manufacturer ID collisions driver
  mtd: spi-nor: manuf-id-collisions: Add support for xt25f128b
  mtd: spi-nor: manuf-id-collisions: Add support for xm25qh64c

 drivers/mtd/spi-nor/Makefile              |  1 +
 drivers/mtd/spi-nor/core.c                | 10 +++-
 drivers/mtd/spi-nor/core.h                |  1 +
 drivers/mtd/spi-nor/macronix.c            | 47 +++++++++++++++++--
 drivers/mtd/spi-nor/manuf-id-collisions.c | 57 +++++++++++++++++++++++
 drivers/mtd/spi-nor/sysfs.c               |  4 +-
 include/linux/mtd/spi-nor.h               |  6 +++
 7 files changed, 119 insertions(+), 7 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
