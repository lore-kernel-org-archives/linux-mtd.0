Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0211CC54EBE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 06:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIhGgtv/MatKHU3FpI5g0NqLw6gzooPfzNMxKHhx5DE=; b=TewLaelx0J7+VrHB5S7K+zmk3N
	PTb0OQlcZO0JY0kJZbSyU/HkmhiDi5B08ZuuiHxxnlntwi0V9Sva7DdU5y5p9dgMAC06Cv+oy+qju
	Q+FhQ5YE7N6MghKHCuad0jMr9zPSNNXK2ydZTTpWjISmjOK/03YH9mXpV5pJ/GOBso0GkZ/jJqYC9
	2UN6Bk2pCrdpZVE/eItzJ/vJGcW6uyB2tVQEBh8Hzpu8Wcej/6Sm5nAWNxu7eQrj6SZXcO3o9yQ1u
	piMkueWuEUG6aQXWMQKgoHuynxhSUittj2zv/1SQwH/6eu2xZFu2CW/SU0EBkwv/dj0+yDHy882n7
	XShXVhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJ42-008r5M-42; Mon, 16 Jan 2023 06:33:50 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJ3x-008r4x-1j
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 06:33:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30G6XcNp063276;
	Mon, 16 Jan 2023 00:33:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673850818;
	bh=1WHyP9q9Pqk2AdB7S3osZSb6dmGzO1SPAsdB0c35P6Y=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=e7PsPjRgufMw6B9qSSB1g/xSFMFErMGgnnsaGskXxMRPIGYAjbOoHcsZBZ4wpx7o6
	 Vru6yTRgIdidXac7AwxfxzRWFlYbGqxc5KHa5Zw8ljwjH5XmyEDwWp1U9IEoB8aF5d
	 no+JJHMUBoLUiwBfYZhnBuLHyqDYXQU2lEXw8IK4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30G6Xcnm098221
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Jan 2023 00:33:38 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 16
 Jan 2023 00:33:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 16 Jan 2023 00:33:38 -0600
Received: from [10.24.69.26] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30G6XaGG083197;
	Mon, 16 Jan 2023 00:33:37 -0600
Message-ID: <f2822fbb-183d-e6f0-b60a-1160837b72a5@ti.com>
Date: Mon, 16 Jan 2023 12:03:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: spinand: Add support for AllianceMemory AS5F34G04SND
Content-Language: en-US
To: Mario Kicherer <dev@kicherer.org>, <linux-mtd@lists.infradead.org>
References: <20230113102412.1398848-1-dev@kicherer.org>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20230113102412.1398848-1-dev@kicherer.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_223345_218125_F973ED74 
X-CRM114-Status: GOOD (  13.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mario,
Thanks for the patch!


On 13/01/23 15:54, Mario Kicherer wrote:
> Add support for AllianceMemory AS5F34G04SND SPI NAND flash
> 
> Datasheet:
> - https://www.alliancememory.com/wp-content/uploads/pdf/flash/AllianceMemory_SPI_NAND_Flash_July2020_Rev1.0.pdf
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
Reviewed-by: Dhruva Gole <d-gole@ti.com>

>   drivers/mtd/nand/spi/Makefile         |   2 +-
>   drivers/mtd/nand/spi/alliancememory.c | 119 ++++++++++++++++++++++++++
>   drivers/mtd/nand/spi/core.c           |   1 +
>   include/linux/mtd/spinand.h           |   1 +
>   4 files changed, 122 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/mtd/nand/spi/alliancememory.c
> 
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
> index b520fe634041..4ec973b8b6bf 100644
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1,3 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0
> -spinand-objs := core.o ato.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
> +spinand-objs := core.o alliancememory.o ato.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
>   obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
> diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
> [...]

-- 
Thanks and Regards,
Dhruva Gole

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
