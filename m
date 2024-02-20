Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12685C48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 20:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOi+YBFyDqY05oATe81cRVYVvmFqrbCZPeSJ/ME6gNA=; b=oTY/ip/0UyVxho
	eewpUci5iTARefOUa71zDUP2goHhGmVsg6CK5F9wz1NTcPr9B0a5jt26J8V1192mok8AVpy9Rd6eK
	QaL3ovB66QRN67XAD+6diuzGhknXykvLeZH/4mZOifWPWfYq7L2/wyVrijyCu8Y6hJZL0REUE2F5n
	9OMKmnswTRmsY2tLxEAqwkLOcJdwcxQq94iWa3b+WfuHTtE45Dmoz25FEV6nUERiHa9q1ux5umalP
	gBZQjrys53WPXQVmNtqlU6BDCtrz9MzmSW/FRsnmSEOwBIUnP7+h7pOFH+1c2NJsiFzYTp6bPgRAf
	IZbLn+oDcT2InIT8UplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWWR-0000000G58n-0pDm;
	Tue, 20 Feb 2024 20:15:23 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWWO-0000000G54a-2UD4
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 20:15:22 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CA4952F4;
	Tue, 20 Feb 2024 21:15:09 +0100 (CET)
Mime-Version: 1.0
Date: Tue, 20 Feb 2024 21:15:09 +0100
Message-Id: <CZA6KB8QFMAB.3DOO2VSKCZZMR@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
Cc: "David Bauer" <mail@david-bauer.net>
From: "Michael Walle" <mwalle@kernel.org>
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
In-Reply-To: <20240220200325.19089-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_121520_806495_26F0CA21 
X-CRM114-Status: GOOD (  25.60  )
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

Hi,

On Tue Feb 20, 2024 at 9:03 PM CET, Christian Marangi wrote:
> From: David Bauer <mail@david-bauer.net>
>
> Add MTD support for the BoHong bh25q128as SPI NOR chip.
> The chip has 16MB of total capacity, divided into a total of 256
> sectors, each 64KB sized. The chip also supports 4KB sectors.
> Additionally, it supports dual and quad read modes.

Thanks for your patch!

> Datasheet is public and can be found at the referenced link.
>
> Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.
>
> Link: https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf
> Signed-off-by: David Bauer <mail@david-bauer.net>
> [ reworked to new flash_info format ]
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Read/write/erase test are done by flashing and installing an OpenWrt
> image on the spi and by using overlayfs on it confirming correct
> read/write.
>
> root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
> bh25q128as
> root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
> 684018
> root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
> bohong
>
> root@OpenWrt:/# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450000101ff00000109300000ff68000103600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b42bbeeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> ffffffffffff003600279ef97764fcebffff

Thanks! That's surprising, because in the past thread we were told,
this flash doesn't have SFDP :) Even better then. But..

>
> root@OpenWrt:/# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> e2e374124e998c9c430a5a4c368ded374186637f48301dcb3943b81af2987995  /sys/bus/spi/devices/spi0.0/spi-np
>
> root@OpenWrt:/tmp/tmp2# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp 
> 00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0...|
> 00000010  68 00 01 03 60 00 00 ff  ff ff ff ff ff ff ff ff  |h...`...........|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
> 00000040  ee ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
> 00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 00000060  00 36 00 27 9e f9 77 64  fc eb ff ff              |.6.'..wd....|
> 0000006c
>
> root@OpenWrt:/tmp/tmp2# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> e2e374124e998c9c430a5a4c368ded374186637f48301dcb3943b81af2987995  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>
> root@OpenWrt:/tmp/tmp2# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
> Supported read modes by the flash
>  1S-1S-1S
>   opcode	0x03
>   mode cycles	0
>   dummy cycles	0
>  1S-1S-2S
>   opcode	0x3b
>   mode cycles	0
>   dummy cycles	8
>  1S-2S-2S
>   opcode	0xbb
>   mode cycles	2
>   dummy cycles	2
>  1S-1S-4S
>   opcode	0x6b
>   mode cycles	0
>   dummy cycles	8
>  1S-4S-4S
>   opcode	0xeb
>   mode cycles	2
>   dummy cycles	4
>
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode	0x02
>
> root@OpenWrt:/tmp/tmp2# cat /sys/kernel/debug/spi-nor/spi0.0/params
> name		bh25q128as
> id		68 40 18
> size		16.0 MiB
> write size	1
> page size	256
> address nbytes	3
> flags		HAS_16BIT_SR
>
> opcodes
>  read		0x03
>   dummy cycles	0
>  erase		0xd8
>  program	0x02
>  8D extension	none
>
> protocols
>  read		1S-1S-1S
>  write		1S-1S-1S
>  register	1S-1S-1S
>
> erase commands
>  20 (4.00 KiB) [1]
>  52 (32.0 KiB) [2]
>  d8 (64.0 KiB) [3]
>  c7 (16.0 MiB)
>
> sector map
>  region (in hex)   | erase mask | flags
>  ------------------+------------+----------
>  00000000-00ffffff |     [ 123] | 
>
> Changes v2:
> - Drop wrong copyright header
> - Drop name
> - Add requested info about sfpd and others
>
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/bohong.c | 18 ++++++++++++++++++
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  4 files changed, 21 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/bohong.c
>
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 5e68468b72fc..c8849cf5124f 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -2,6 +2,7 @@
>  
>  spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
>  spi-nor-objs			+= atmel.o
> +spi-nor-objs			+= bohong.o
>  spi-nor-objs			+= eon.o
>  spi-nor-objs			+= esmt.o
>  spi-nor-objs			+= everspin.o
> diff --git a/drivers/mtd/spi-nor/bohong.c b/drivers/mtd/spi-nor/bohong.c
> new file mode 100644
> index 000000000000..8ba4f3a32040
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/bohong.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info bohong_parts[] = {
> +	{
> +		.id = SNOR_ID(0x68, 0x40, 0x18),
> +		.size = SZ_16M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

.. the SFDP will likely make your patch superfluous, because all of
this should be parsed from the SFDP. Did you try your flash without
any flash_info entries at all?

Regarding your question about the names, the identification should
work by the IDs only. Maybe there will be a userspace tool which
will have a flashdb instead. That is a mapping from IDs to
manufacturer and part name.

-michael

> +	},
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_bohong = {
> +	.parts = bohong_parts,
> +	.nparts = ARRAY_SIZE(bohong_parts),
> +};
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4129764fad8c..29c28ee683a1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2037,6 +2037,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
>  
>  static const struct spi_nor_manufacturer *manufacturers[] = {
>  	&spi_nor_atmel,
> +	&spi_nor_bohong,
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
>  	&spi_nor_everspin,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index d36c0e072954..c293568ae827 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -601,6 +601,7 @@ struct sfdp {
>  
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
> +extern const struct spi_nor_manufacturer spi_nor_bohong;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
