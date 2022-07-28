Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10240C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 02:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9xrUkveKRmQe9M/fCpMQ2h1qLkz0eNPG+GayM7CKzg=; b=jqs4egAZJPmGKj
	o1UzlfNY5V9VDcaX4ZFmdDM2XVvsPEMKNOR8TF7cZ1tVo+Wr44oMpNovWkszKlXQQ55uW74+RY4RF
	kJJA0a9u7M1OxAXyHhtXkhCOgqj++IY+l9s5G9ol+ZaHdNwEJimuLferqIDYa0m9wD1Fiqu+V0C6S
	FpC3nvvN296D1lWoeFXmzDYheWfSnWoyxyHfh5Oe8VUWHQ5UZNOkJc4+fD8llyhaLQlmFXT/7YEyP
	uyANyuDWitVeL27YFs4SYqJbXYqoCn74I/h7APOHMTb1WzFsnQWLOhJScYlMsMgZECOY9tHE1X7Ft
	TZ/aDZ6SrNrpky0BmNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtQb-002zcO-8N; Thu, 28 Jul 2022 02:39:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtQX-002zXC-7l
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 02:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658975944; x=1690511944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BXMlQreC9LSzMRoBTPmm2g+VhtFV5fx6UPQhMBwDb5A=;
  b=l2iWRGXJtXwOeRvIDQm82U7PjPrd47cvY1KxxDWrKn24lJ2TPWYtnWYb
   aVdKfu6WFybiuPMgJ3JzcJZcoBNwiJC4LFfGxm+eJZf4sOtGThJQTqBdX
   v0fmlP+Dj/wJT5er1jr3jM26B9W7JNGicq7wUhA6u9DMXXSNMHnSw3OwT
   AId02QdkDGq1NmwuzXmwiiqKyaQFmONuNKtRy62E0mOKSJiE5ictDKLDi
   C37mHy1JxdXKTjapHTNnGuGROVsA4JsF6kwQN94um5gta0QG7qb5hV17z
   w3oh9hXQ4SKm3oDIYGydblvhpK3C4hrhPExCYLwh/vIZW7R9QrMDGEGKy
   w==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="184060215"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 19:39:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 19:39:01 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 19:38:59 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<inux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
	<patrice.chotard@foss.st.com>, <vigneshr@ti.com>, <richard@nod.at>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<christophe.kerello@foss.st.com>
Subject: Re: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
Date: Thu, 28 Jul 2022 05:38:58 +0300
Message-ID: <165897588859.58160.1276614701145818210.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
References: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_193905_297179_DAC28E04 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed, 29 Jun 2022 15:30:13 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> For erase operations, reg_proto must be used as indicated in
> struct spi_nor description in spi-nor.h.
> 
> This issue was found when DT property spi-tx-bus-width is set to 4.
> In this case the spi_mem_op->addr.buswidth is set to 4 for erase command
> which is not correct.
> 
> [...]

Used nor->reg_proto in spi_nor_controller_ops_erase() and applied to
spi-nor/next, thanks!

[1/1] mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
      https://git.kernel.org/mtd/c/7f5ee1a113a9

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
