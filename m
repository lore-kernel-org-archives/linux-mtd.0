Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A906FC77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPoGF/FUEheiWy575qjghMO0lKXv5CnIx6qBAVuSSzk=; b=Uln3C19S8ZPsT0IrJCTLttKU0m
	/VkRm5ongpe1LOoj20fWnWq6aPmzeH3RvG32GB2/rOvNz6wmtIaljURl08fqRyDS4F3qJpo38MZCd
	snGtDcEI2K4nVsqQo4FuSoUyqorEnrPq+fTdMaAzZhmL40hvwJyGX8TGPRckZj9J0B/oQ1l3/rmME
	Pko0sjdXG5drWplW/KvgNd9yif7k6ZuMHid2KvHIlQX5QugklDkd4CN87IgeUtGad0TfNR80+W9Sl
	ZR3AyAfehJz0Smpzkwe6xy0WaqIiZ0ktxDAbpWvlkBLL4fbkkyH3olaw76sl1jBjGnEZx/3tVr2ih
	mdsF0/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poh76-001O0V-1u;
	Tue, 18 Apr 2023 08:55:00 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poh71-001NzD-1X
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 08:54:57 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1146C87;
	Tue, 18 Apr 2023 10:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1681808089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbaEuI9r2qcBF9wK/9C0l/3woe8iimbkV5mcnK1qhLs=;
	b=lgm+DWx5aE2IXCf5e4v0z3Q4iclLnqNixGRYodS236GWl0oSryvxsvLxtBJNghcQiteJ8A
	ZB+CydcnA3aXDtSS6G2btSLCssJ809oMtujTAPOCxQml8wM88OTKXsEwnS6noGOsNr3blP
	xx4tYFmSanpQ32KQH7DrZ1YsPTa5Y2TU4aa2lqvAV2RLts6AOfJzAOxsG642vkBxpdZ4sk
	jHiowLMQV72ivMry1ItxyCGPXMbTHYBgENbRgtkogcqlqSIzUKumqweru5CPlQbvjmhe8A
	y3WIT8A2rz6V5IoEIm7VsMbV9PX6MF37ohBD0oRQSbHrekQouId3iICDCRMVXQ==
MIME-Version: 1.0
Date: Tue, 18 Apr 2023 10:54:47 +0200
From: Michael Walle <michael@walle.cc>
To: niravkumar.l.rabara@intel.com
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: add support for IS25WP01G
In-Reply-To: <20230417125304.1968382-1-niravkumar.l.rabara@intel.com>
References: <20230417125304.1968382-1-niravkumar.l.rabara@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9ba43cf93ede8ba7934a4461f2f7a640@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_015455_904894_AFE59204 
X-CRM114-Status: GOOD (  13.63  )
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

> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Tested on Intel N5X socdk board,
> random data write, erase, read - verified erase operations
> random data write, read and compare - verified write/read operations
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> ---
> root@n5x:~# cat /sys/devices/platform/soc/ff8d2000.spi/spi_master/
> spi0/spi0.0/spi-nor/jedec_id
> 9d701b
> root@n5x:~# cat /sys/devices/platform/soc/ff8d2000.spi/spi_master/
> spi0/spi0.0/spi-nor/manufacturer
> issi
> root@n5x:~# cat /sys/devices/platform/soc/ff8d2000.spi/spi_master/
> spi0/spi0.0/spi-nor/partname
> is25wp01g
> root@n5x:~# hexdump /sys/devices/platform/soc/ff8d2000.spi/spi_master
> /spi0/spi0.0/spi-nor/sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
> 0000010 0084 0201 0080 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 fffb ffff 3fff eb44 6b08 3b08 bb80
> 0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
> 0000050 d810 ff00 4262 00a9 6482 d302 8dec 4c69
> 0000060 757a 757a a4f7 5cd5 c24a ff2c 30e1 a9fa
> 0000070 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000080 eeff ffff 5c21 ffdc
> 0000088
> root@n5x:~# md5sum /sys/devices/platform/soc/ff8d2000.spi/spi_master/
> spi0/spi0.0/spi-nor/sfdp
> 83440c0ff8676fe5292d207788693900  /sys/devices/platform/soc/ff8d2000.
> spi/spi_master/spi0/spi0.0/spi-nor/sfdp

Thanks for the dump!

> ---
>  drivers/mtd/spi-nor/issi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 400e2b42f45a..79132267cf0d 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -64,6 +64,8 @@ static const struct flash_info issi_nor_parts[] = {
>  		PARSE_SFDP
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &is25lp256_fixups },
> +	{ "is25wp01g",  INFO(0x9d701b, 0, 256 * 1024,  512)
> +		PARSE_SFDP },

There are no special flags, thus this flash should just work with the
generic SPI-NOR driver [1]. No patch needed.

-michael

>  	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128)

[1] 
https://elixir.bootlin.com/linux/v6.3-rc7/source/drivers/mtd/spi-nor/core.c#L1637

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
