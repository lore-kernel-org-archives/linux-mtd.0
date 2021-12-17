Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67C6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p1GFBw9y2dYQZfVlaDmr9ZJNbu2NTbKkcaUzSw9KhQE=; b=IwH88qJpYvQk27
	s9DktYHaWCB2nWsIITBh+TrW4AkccOzT2XMGPHaDfPDL09W3v0vPlTGRtIIH6LYxvMZnBeyl2yKtm
	qZSUbJyJsp/lmySA4DxaIe1CdX6zDKodJ9U+fp96lh95LlnsjKUblaeBkvjvgao5hoyzQmnsFEiBr
	QDBmeQTrRAVaaMzoje5QNkobGufOT8qrx/ufBPgzSsuIwjoLzxkVAgKCgxi+MUmBNbDKSeZINkdsK
	uJHhpVHjsUIi3mgO0A+7pd2vcJMeZqpaAIBvK9GVp/ACAUS/75EddoFNHdjTtuole5umvb5w4PI7r
	JN9Lz+Bo/QBzXCXt5QwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCJy-00A7gh-An; Fri, 17 Dec 2021 12:26:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCJv-00A7fT-BR
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639744003; x=1671280003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ICp7QxieuNlzA7BpoPg0TL4ThrGqa6z9393qkPh+MrU=;
 b=qv0pSiUc9MgrTcBUtoo72lELIrXwdOSo7LSHaiq8uytcQmYQKE6PMOYh
 RYwMbcfb5nLWHQMihxqILOOLXcLkFX8k9/3zYUoVoeX0VCH6KbTDye2I6
 TwQxt8GbyxFV3RdR0qy0Akz4ID1dmAyArsT6V7GVRqIlw7yNDn7XadZcD
 SmHOfNRs6+j21/XHb0jO9gTILbuvfZtIQhk+3MPPLiuMJZh5AROHxmAm3
 hIMd5VtVfYaSqUq0XkxzYKHqmYboWj2peOJIUpVuMGIoChAfAb6vsDFLv
 DbItN1oEvfeIbsgHFzA5LE0lT5Q0GyHugDdVFT/U589WRNFgNnBIRSGWK g==;
IronPort-SDR: jgvwM4SbcnBvPoY2piZfAoPn9qE189AnRcCXzxHnOMkbJzZCZDsNvl1umomrOdRnNi2nV7ibLf
 AE+EAw0WUIIp6TKCJyHAzxlk2Wc49MGzonwAD1OmyZuHMRPs7NkSSGDfRd0t3JUd/aoQ1jIgRn
 Z0uA6ASZACinBfnslpetC+sGi9rEjq2VcGo0nVw5nkJ4pL6KQeMfg9TVbCVnxFKWaOz8833pmK
 uCLjKAKhGpzb/GVEBVUvLSrEL4gMRuiGrQKijgJdXDKcpRezypZZMd/0iKjOgSr79E/qitBt8o
 A7VDQpNzJC8uh0/StU0eb5MN
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140126594"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 05:26:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 05:26:41 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 05:26:39 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <zhuohao@chromium.org>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] mtd: core: Remove partid and partname debugfs files
Date: Fri, 17 Dec 2021 14:26:34 +0200
Message-ID: <20211217122636.474976-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_042643_538634_FC662354 
X-CRM114-Status: UNSURE (   6.01  )
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

SPI NOR has equivalent sysfs device attributes, thus let's remove the
duplicated debugfs entries. There's no one else using partid and partname
debugfs files, thus remove them from the mtd core as well.

If you find the idea acceptable, I would like to queue these through
spi-nor/next, I'll have some other patches that will depend on these.

Tudor Ambarus (2):
  mtd: spi-nor: Remove debugfs entries that duplicate sysfs entries
  mtd: core: Remove partid and partname debugfs files

 drivers/mtd/mtdcore.c      | 35 +----------------------------------
 drivers/mtd/spi-nor/core.c | 12 ------------
 include/linux/mtd/mtd.h    |  3 ---
 3 files changed, 1 insertion(+), 49 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
