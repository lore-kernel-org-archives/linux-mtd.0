Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9ECC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE76kKumFrEY89JuYW5iqZ6tdWaDDXEcpQGRVsIBJM4=; b=3n2yUU07h/8x8T7D0gC8H4yLJJ
	ZYjcC9U6Z6zFb9kpQQKmSD9JeOl2tkk19CZZlaj+CVHS/Z69pfAmhDQFaA2kMHKJ9sWtW/qOBOnw+
	xr+xziLPbbLKN+O0HRuHuZR96yl8ghEPyvGDjnOZlQZOz+O/OJHpaxnM1pLhEEKkZGncs8K25sQ17
	IFWi0iEJAyKJ1gIsSkBtu1X84EdJYWXMLbDiw+AqVtzUmwJMtslSrw+OfaAN+JRftBkKfwC/Ecpts
	t4zfDbyB1JEH44QkkMcOgp1wmYRAdh7/s9Uo0ezQoF/dD/6123ld+R6LpQlidSXL3lyPIck29Fyvv
	HUrsU4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevSr-004m5w-Pz; Thu, 14 Apr 2022 09:08:33 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevNx-004jz8-W4
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 09:03:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A91842223A;
 Thu, 14 Apr 2022 11:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649927002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYsTz0AETw+Jo2bhSTzYcAAeYKfM5N1Ra7bU1357urA=;
 b=ir4wCF/1KUj3+6aRDS/Z9w9E9Myrb626mUSIqpljXMGuPyGvI205vKqwMP9CNQT0UrkXEg
 AqIiDztJ9r468vj0L87nk3qRtJ/QYTbJDBy+ScwLT6J5fXuF2zyo9ZOqzdTqh9WXJ7Cu9H
 ORqyhvHLkEjeE04v2r4mMCaLOWr0uYs=
MIME-Version: 1.0
Date: Thu, 14 Apr 2022 11:03:21 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode methods
In-Reply-To: <20220411125346.118274-2-tudor.ambarus@microchip.com>
References: <20220411125346.118274-1-tudor.ambarus@microchip.com>
 <20220411125346.118274-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <63b485a1e48d3116f8f49cc427049f81@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_020330_271703_66A5FAF4 
X-CRM114-Status: GOOD (  14.86  )
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

> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..2e40eba3744d 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -401,6 +401,93 @@ static void
> spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
>  	}
>  }
> 
> +/**
> + * spansion_set_4byte_addr_mode() - Set 4-byte address mode for 
> Spansion
> + * flashes.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @enable:	true to enter the 4-byte address mode, false to exit the 
> 4-byte
> + *		address mode.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)

Mh, so now some callback functions are in the core like the quad enable
methods and some are in sfdp.c. I think there should be only the parsing
in sfdp.c and all the callback methods should be in core.c; as they are
potentially used by the vendor modules.

> @@ -606,6 +693,24 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		break;
>  	}
> 
> +	switch (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK) 
> {

I was wondering why this is encoded as single bits and not as an
enumeration. To me it looks like it is intended to support
different methods at the same time. Thus I think there might be
multiple bits set in each entry and exit mask at once. The spec
lists all the entries as x_xxx1, x_xx1x, ..

> +	case BFPT_DWORD16_4B_ADDR_MODE_BRWR:
.. then this will only match if exactly these two bits are set.


> +		params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;

Shouldn't this be getting a neutral name? The quad_enable methods
were renamed once, too.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
