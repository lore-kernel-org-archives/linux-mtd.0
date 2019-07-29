Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28BFC7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 14:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964EC20679
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 14:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MuvkjQUi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964EC20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qjoPtXOpddS5S+WRxnURN+u02f2k3sTtc7dApwVgK8Y=; b=Muv
	kjQUi62f1Hmkyegc/uRHHG5CxIycgC1D9EKcQCLumZd6llKJKg1odzyilfVncvfvkCMVU4Qx0wkZ0
	qbY/VyI1go/kDDD8bC5m8E/NiBqgWMUIF214qGQ+PqySZVu0HlKve1FJUjYEFsFisBG2l7cmKenb/
	WNP3dtrvF4yEOZ/U2jPyei326A2OkKQGNCh1S2glNt4qQn0451FiqG/vo3ZlptTa3Lq2sy+hYU/wU
	VFzkh3UA/YokagIcvO8YRsVKcw3dWDFyCUCwhgxG/liyPjIS6i6vffKqVKy45yGcboOGcZAWtwKJ8
	ipDdEAwU+RLVxTcLvVEDTNdzFp5XXEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs6bc-0004qI-1y; Mon, 29 Jul 2019 14:26:28 +0000
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]
 helo=herzl.nuvoton.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6bF-0004eq-U7
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 14:26:07 +0000
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x6TEP5TO025571;
 Mon, 29 Jul 2019 17:25:06 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D6FB761FD3; Mon, 29 Jul 2019 17:25:05 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, bbrezillon@kernel.org, yogeshnarayan.gaur@nxp.com,
 tudor.ambarus@microchip.com, gregkh@linuxfoundation.org,
 frieder.schrempf@exceet.de, tglx@linutronix.de
Subject: [RFC v1 0/3] *spi-mem: adding setup and callback function 
Date: Mon, 29 Jul 2019 17:25:01 +0300
Message-Id: <20190729142504.188336-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_072606_352372_A67A7D56 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Lately we have working on Flash interface unit (FIU) SPI driver that 
using spi-mem interface, Our FIU HW module support direct Flash Rd//Wr.

In our SOC (32 bit dual core ARM) we have 3 FIU's that using memory mapping as follow:

FIU0 - have 2 chip select and each one have 128MB memory mapping (total 256MB memory mapping)
FIU1 - have 4 chip select and each one have 128MB memory mapping (total 512MB memory mapping)
FIU2 - have 4 chip select and each one have 16MB memory mapping (total 32MB memory mapping)

Totally 800MB memory mapping.

When the FIU driver probe it don't know the size of each Flash that 
connected to the FIU, so the entire memory mapping is allocated for each FIU 
according the FIU device tree memory map parameters.
It means, if we enable all three FIU's the drivers will try to allocate totally 800MB.

In 32bit system it is problematic because the kernel have only 1GB 
of memory allocation so the vmalloc cannot take 800MB.

When implementing the FIU driver in the mtd/spi-nor we allocating memory address only 
for detected Flash with exact size (usually we are not using 128MB Flash), and in that case usually we allocating much less memory.

To solve this issue we needed to overcome two things:

1.	Get argument from the upper layer (spi-mem layer) 
2.	Calling the get argument function after SPI_NOR_SCAN function. (the MTD Flash size filled in  SPI_NOR_SCAN function)

The attach patch set solving the describe issue by:

1.	Add spi-mem callback function and value to the SPI device 
	for passing an argument from the spi-mem layer to the spi layer
2.	Add spi-mem setup function to the spi-memory operation that running 
	after the spi-mem probe finished.
3.	Implement function callback in the m25p80 driver that execute 
	get Flash size.

The patch set tested on NPCM750 EVB with FIU driver (implemented with SPI-MEM interface).

Thanks for your attention.

Tomer

Tomer Maimon (3):
  spi: spi-mem: add spi-mem setup function
  spi: spi-mem: add callback function to spi-mem device
  mtd: m25p80: add get Flash size callback support

 drivers/mtd/devices/m25p80.c | 12 ++++++++++++
 drivers/spi/spi-mem.c        | 27 ++++++++++++++++++++++++++-
 include/linux/spi/spi-mem.h  | 11 +++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
