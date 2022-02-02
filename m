Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C611C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QWyFyl5gagypayeB9JqJBxHyXiH0BhsAA3BiBx2gikI=; b=DoV5ypG7HKUeGB
	egeFplqjZ7B0QAWtGAXtriYfP6OCxsg7UPL1ii9CKm8IPWWt88+2Sl+EgGPMq018dfCsTvxppTvw1
	UCZExBjU4CBdKHZ4lYpxs/vvuDH8ETVn+qPMJ5BykhnIDWtX/i8D0dpb8Qi7C2eyZZ5o8BEwY1gMF
	C7W0RplSjrdZtjvZRfo/D7Sdu3vwUs4LENPvMwr/BGg5JIXRQOwAX4m0719PtlI0JBNQd8NSmsT/E
	KJzLbcvEVJ1Btf+KIk97F2Jz91jpVyaoakciEwZweBYc5G6Vum1XxXv1RqCtOj9aTs5l+aMootVfO
	HowNjYDqqslQrw/I7yjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFH7i-00FsEr-Bo; Wed, 02 Feb 2022 15:00:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH68-00FrTY-HI
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:07 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1FEF422247;
 Wed,  2 Feb 2022 15:59:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TY7Wrnm/WHimiGDX0u4wyobL0QT4VxUa6F+zVTftJjU=;
 b=DDT5KuEp90oEdhuX6vaJ9ObisD1ds7fRwJ631WZZMi5Nfls8BVzVxCm+BlQrks0GfOcumZ
 KONVefzg6JiUyOb9k00p1eMpeMuv9/FBdMq7FByhUAc8Psdwp3k+RcPJLO4OD3tHhOYUQ2
 RPKBqB2doec5L8PCCb95n0XvgZ1QD7c=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 00/14] mtd: spi-nor: move vendor specific code into vendor
 modules
Date: Wed,  2 Feb 2022 15:58:39 +0100
Message-Id: <20220202145853.4187726-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065904_802751_9F7E3F6E 
X-CRM114-Status: GOOD (  10.45  )
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

It turns out that most of the special status register handling is
specific for a particular vendor. I.e. Xilinx has some different
opcodes for the status register read, Micron has an additional FSR
register and Spansion has these flags integrated into the SR.

Create a callback to ready() where a flash chip can register its
own function. This will let us move all the vendor specific stuff
out of the core into the vendor modules.

Please note that this is only compile-time tested.

For sake of consistency and better readability of the code flow,
I also converted the setup() callback to be optional.

Michael Walle (14):
  mtd: spi-nor: export more function to be used in vendor modules
  mtd: spi-nor: slightly refactor the spi_nor_setup()
  mtd: spi-nor: allow a flash to define its own ready() function
  mtd: spi-nor: move all xilinx specifics into xilinx.c
  mtd: spi-nor: xilinx: rename vendor specific functions and defines
  mtd: spi-nor: xilinx: correct the debug message
  mtd: spi-nor: move all micron-st specifics into micron-st.c
  mtd: spi-nor: micron-st: convert USE_FSR to a manufacturer flag
  mtd: spi-nor: micron-st: fix micron_st prefix
  mtd: spi-nor: micron-st: rename vendor specific functions and defines
  mtd: spi-nor: spansion: slightly rework control flow in late_init()
  mtd: spi-nor: move all spansion specifics into spansion.c
  mtd: spi-nor: spansion: convert USE_CLSR to a manufacturer flag
  mtd: spi-nor: renumber flags

 drivers/mtd/spi-nor/core.c      | 265 ++------------------------------
 drivers/mtd/spi-nor/core.h      |  70 ++++-----
 drivers/mtd/spi-nor/micron-st.c | 225 ++++++++++++++++++++++-----
 drivers/mtd/spi-nor/spansion.c  | 133 ++++++++++++----
 drivers/mtd/spi-nor/xilinx.c    |  79 +++++++++-
 include/linux/mtd/spi-nor.h     |  18 ---
 6 files changed, 417 insertions(+), 373 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
