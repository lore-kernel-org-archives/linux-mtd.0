Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797BCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CYATi5Rm/e0d1Q4hYPWdT/B8iCltPTQUu1FC3KtEk20=; b=c/k+4RlVyAnVla
	XFsH70VKiebfk5XvmgA0RhwGtgnVHzw+YIbAQg0/uZvNvT9/UhJDBrdMuU6DIItMLWe+StcDRQhob
	iEanNY3nmclSjmDIf2P4bGSOHr63k8zECcydLZUZYLCp+/atPz2sA05kDtcxDAW8YrAmyav3/rC+J
	yYN3uf9hSU0Rn5wU+D0Gw6zOH6OkVBpqtvoavftEd67kRkCYa0lbQ3tbOz3MEXTgnYByq062KIV58
	q/H34gOh31tvFjKdBBSAQykhyNTfBKhj7mVUh0fN+zPSDJpGzej3V+Myaw+aoxp2f9dBvK59+jVmg
	lVdDciU1wgV62Gx49MpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL53o-00F3r9-03; Fri, 18 Feb 2022 15:20:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4iy-00EtvO-5b
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645196347; x=1676732347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oPl3hd9ujCsquNcCi9as7ggff9q2Exrkg2DKeD9fC0s=;
 b=xzQODr27LDVibC7LRD9TyW1dAMlYPDfQIZczG9D/Oyhgml0Lr5IT/qnv
 tFlB8Wz3xW8Kn35C4ejT2jxDMtPH5EgK/gsK4XwVEnwsTLny/A6z9x5CL
 iPOeTbL5HtNf2uZMwuF3i3yk3ZkbqO1czAdNY7UniScTh/m6XsJACuixC
 qz96CrM1GQkRvc/jE0NjpKJgjvvLMANLk438DEWGZPCXbvLoajfzdA1Mv
 ieipD1hRekzKspxucY3MH/IWcf9hxaZ2S3yRz9JUMeqgyQzAo4kiMw36e
 I5oNEo5j0hBNh30yR3b0MD6uGK+fGoWD28VBF2Bftr5sbyqzU3Eedb/Bz g==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="162788983"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2022 07:59:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 18 Feb 2022 07:59:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 18 Feb 2022 07:59:01 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Date: Fri, 18 Feb 2022 16:58:56 +0200
Message-ID: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065908_280445_9FB41393 
X-CRM114-Status: UNSURE (   8.48  )
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

There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
when configured in DTR mode. The byte order of 16-bit words is swapped
when read or written in Double Transfer Rate (DTR) mode compared to
Single Transfer Rate (STR) mode. If one writes D0 D1 D2 D3 bytes using
1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will read back
D1 D0 D3 D2. Swapping the bytes may introduce some endianness problems.
It can affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. Fortunately there are controllers
that can swap back the bytes at runtime, fixing the endiannesses. Provide
a way for the upper layers to specify the byte order in DTR mode.

Tested with atmel-quadspi and mx66lm1g45g.

Tudor Ambarus (4):
  spi: spi-mem: Allow specifying the byte order in DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  mtd: spi-nor: core: Introduce SPI_NOR_DTR_BSWAP16 no_sfdp_flag

 drivers/mtd/spi-nor/core.c  | 36 +++++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h  |  6 +++++-
 drivers/mtd/spi-nor/sfdp.c  |  3 +++
 drivers/mtd/spi-nor/sfdp.h  |  1 +
 include/linux/mtd/spi-nor.h | 17 +++++++++++++++++
 include/linux/spi/spi-mem.h |  3 +++
 6 files changed, 58 insertions(+), 8 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
