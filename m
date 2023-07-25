Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605DBC0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpAlH2FmCOYQ5mju7mDs8jyEPWMY9Vi90W37HJIP7SU=; b=knsEZy4jsc3e9//bIoW1qVEByv
	EPLUrBTKLbSaA0qpo4HylWAfpUWrzBRFZbXJw2De7LPTnAT0v1uClQQpz/GN38ng82li5KhWxObSt
	q3E5LMHLISkEaDVIc8KjbAIJC/21PrIM5eGAdwcCmEgo4QW8qJJnVEYktyx8oEUBfuPwk+A+RkQDc
	a0odX4puxOQU4CVdYhFz0hl4M+iQGA5sItIBqat5lbMjHTG9HNkDogaAiONr07ErB7/iC2uT2fU7X
	F8GOft3YrXh+iiLS7eVUvHojhVBP1pdWDO5VkV02DSR+Kkcy0up1qOGyiLql4W6Y6oFJQbnCDsz+F
	m3uK3bLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCeu-006dXo-15;
	Tue, 25 Jul 2023 07:40:40 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCep-006dW6-2k
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 07:40:39 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8099AA57;
	Tue, 25 Jul 2023 09:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690270833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsb1Il7WQCB3NIEDpoCby+hdOW5HesuejWfezo8EkoQ=;
	b=OOFWo23P60775QM6n+S52AhVI20zl0FGW7dOSHRKoU53dE9U6oBYyMndOs+gXD78Ja0iEl
	L68wYhxRfampHCag1yIXEddEOgAXir+PORBWecaDj6ZJ479BVaL6j6QCe4/oO+U3tSlFac
	IfrxnuhN6cpnbpC+kyCv+6pDWPstgfExVfhKT1HLUwiKDUvBwW00OG0lFo3EiYIbLh4gJk
	BpyblK07igt63clutz9klF4UFL8DRiJ2yCkVCVSsxCrecqc/gn3wx4wBntFeP/VjWJ2kDu
	jVPi2+fE0HkXP8AzpaDhsS4JloVNzlAxaYZfZNqM84DX26CypxJliOmgaff+fA==
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 09:40:33 +0200
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao.tw@gmail.com>
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <20230725022302.210275-3-jaimeliao.tw@gmail.com>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-3-jaimeliao.tw@gmail.com>
Message-ID: <eb15e38a6bd4929c0afb41cf1c652d98@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_004036_043872_FCD4C38F 
X-CRM114-Status: GOOD (  17.94  )
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

Hi,

> From: JaimeLiao <jaimeliao.tw@gmail.com>
> 
> Adding Macronix Octal flash for Octal DTR support.
> 
> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR 
> operation.
> LW/UW series : Support simultaneous Read-while-Write operation in 
> multiple
>                bank architecture. Read-while-write feature which means 
> read
>                data one bank while another bank is programing or 
> erasing.
> 
> MX25LM : 3.0V Octal I/O
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

Link: tag at the end please. But dead. Redirected to "moved to a new 
home", maybe you
should improve on stable links :) Esp. because you have the version in 
it.

> MX25UM : 1.8V Octal I/O
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf

dead. I've used

https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf

There "For SFDP register values detail, please contact local Macronix 
sales
channel for Application Note.". Could you please send me (privately if 
you
like) the AppNote for the SFDP table?

> MX66LM : 3.0V Octal I/O with stacked die
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

dead

> 
> MX66UM : 1.8V Octal I/O with stacked die
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

dead

> 
> MX25LW : 3.0V Octal I/O with Read-while-Write
> MX25UW : 1.8V Octal I/O with Read-while-Write
> MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

So the stack die information come from SFDP? Can RWW also be read from
the SFDP tables? Do you have vendor SFDP tables where this information
can come from?

> 
> MX25UM51245G : 512Mb flash, with Word mode data output format when 
> Octal DTR read
> MX25UM51345G : 512Mb flash, with Byte mode data output format when 
> Octal DTR read
> 
> Macronix Octal flash with two types, "byte mode" and "word mode".
> Because of word mode flash with byte swap issue when Octal DTR read,
> adding byte mode flash in this patchset only.
> 
> About LW/UW series, please contact us freely if you have any
> questions. For adding Octal NOR Flash IDs, we have validated
> each Flash on plateform zynq-picozed.

Again "us" as in macronix? but then, there is no trace that this commit
is comming from macronix.

> As below are the SFDP table dump.

Thanks!

> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c2943c
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> macronix
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> mx66uw2g345gx0
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66uw2g345gx0
> zynq> hexdump mx66uw2g345gx0
> 0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
> 0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
> 0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
> 0000030 0000 0000 0000 0000 ffff ffff ffff ffff
> 0000040 20e5 ff8a ffff 7fff ff00 ff00 ff00 ff00
> 0000050 ffee ffff ffff ff00 ffff ff00 200c d810
> 0000060 ff00 ff00 7987 0001 1284 e200 04cc 4667
> 0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
> 0000080 0000 0000 0000 237c 0048 0000 0000 8888
> 0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
> 00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
> 00000b0 7172 b803 7172 b803 0000 0000 a390 8218
> 00000c0 c000 9669 0000 0000 0000 0000 7172 9800
> 00000d0 7172 b800 7172 9900 0000 0000 7172 9800
> 00000e0 7172 f800 7172 9900 7172 f900 0000 0000
> 00000f0 0000 0000 1501 d001 7172 d806 0000 5086
> 0000100 0000 0106 0000 0000 0002 0301 0200 0000
> 0000110 0000 0106 0000 0000 0000 0672 0200 0000
> 0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
> 0000130 4514 8098 0643 001f dc21 ffff ffff ffff
> 0000140 ffff ffff ffff ffff ffff ffff ffff ffff

md5sum is missing and please use either xxd or if not
available, "hexdump -C".

> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -179,6 +179,33 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096)

Please use INFO(0xc2843c, 0, 0, 0)

> +		FLAGS(SPI_NOR_RWW)

Maybe one of your proprietary tables indicate RWW capabilites?

> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ 
> | SPI_NOR_OCTAL_DTR_PP)

No NO_SFDP_FLAGS() for new parts.

> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },

You should have a correct "4-Byte Address Instruction Table", therefore
you don't need the FIXUPS_FLAGS.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
