Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36AFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IroUn5paoPaf+vY8tCmrbUupsL5g7DqkSM1ac+awKxM=; b=Tqj6w3kLyvxDD1DjLV9rFpoCqs
	f1r7GRLNcPFs3kEIumS2QFEwv2w71PvAf4NGjFKppt2sMoKFZzzMYjGN5XbkFAyUwKhX2SbgRILNm
	mqyG8AXOwuGuRcZMJiMsumG5uwkHblIGY+q4o1ULei1BJWI9c3Vg/qk2pVOz4mMzoGbZmEe5ypa31
	zXkdTglaNjHHeI76H7xHGQdzIccwoNxqlKIOGIlqnNsnwDfLEJPju4Djm+lCHDyUCffI4ADNwfz3a
	b5ynxKSsy2c3fZznpxSTMLnGVkz5/FqdzAo/yu1HeRI1O3+d2GexjTVcGjLFA6GI+i2pBE7Wk7Lwx
	wiT8nWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMPXL-008JU0-I1; Tue, 22 Feb 2022 07:24:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMPXH-008JSr-OQ
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 07:24:37 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C0A7722175;
 Tue, 22 Feb 2022 08:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645514672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmjYLUJ8wCZahIKx/WORO78ajQB2KHmM/wb97EESVAA=;
 b=WeJnkk+pFiXKrMU0tBpVG+3QxnGQ8+2PYaE3ayewfYAY6AVQgeqAPk4YKyK1m8GuHr2jDf
 uaZcdlAwEhKHjjia8ME8YKJbOr9Gab3u1Q+zOc+amhD4A+g4aHqpBz74K+Wj7r9I8pl4QZ
 jiq9B7zHcvzZHmb8NdcaGbfjqW8DpnQ=
MIME-Version: 1.0
Date: Tue, 22 Feb 2022 08:24:31 +0100
From: Michael Walle <michael@walle.cc>
To: Potin Lai <potin.lai@quantatw.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Patrick
 Williams <patrick@stwcx.xyz>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: winbond: Add support for w25q01jv-iq
In-Reply-To: <20220222064227.16724-1-potin.lai@quantatw.com>
References: <20220222064227.16724-1-potin.lai@quantatw.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <aedb6f8e3d878f487aa7fef147e352b4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_232436_003480_3138D7A1 
X-CRM114-Status: GOOD (  15.93  )
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

Am 2022-02-22 07:42, schrieb Potin Lai:
> Add support for winbond w25q01jv-iq chip
> 
> root@bletchley:~# cat
> /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> ef4021
> root@bletchley:~# cat
> /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> winbond
> root@bletchley:~# cat
> /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> w25q01jv-iq
> root@bletchley:~# hexdump -C
> /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 00000000 53 46 44 50 06 01 01 ff 00 06 01 10 80 00 00 ff 
> |SFDP............|
> 00000010 84 00 01 02 d0 00 00 ff 03 00 01 02 f0 00 00 ff 
> |................|
> 00000020 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> |................|
> *
> 00000080 e5 20 fb ff ff ff ff 3f 44 eb 08 6b 08 3b 42 bb |. 
> .....?D..k.;B.|
> 00000090 fe ff ff ff ff ff 00 00 ff ff 40 eb 0c 20 0f 52 |..........@.. 
> .R|
> 000000a0 10 d8 00 00 36 02 a6 00 82 ea 14 e2 e9 63 76 33 
> |....6........cv3|
> 000000b0 7a 75 7a 75 f7 a2 d5 5c 19 f7 4d ff e9 70 f9 a5 
> |zuzu...\..M..p..|
> 000000c0 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> |................|
> 000000d0 ff 0a f0 ff 21 ff dc ff |....!...|
> 000000d8

Can you please provide an md5sum or sha256sum of this file?

> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> 
> ---
> 
> Changes v1 --> v2:
> - rework patch to work with new flags
> 
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index 59d53b4c39c8..4c088250fe96 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -131,6 +131,8 @@ static const struct flash_info winbond_parts[] = {
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "w25q01jv-iq", INFO(0xef4021, 0, 64 * 1024, 2048)

name should be "w25q01jvq", see the flash name right before.

With that fixed, and the md5sum above:

Reviewed-by: Michael Walle <michael@walle.cc>

> +		PARSE_SFDP },
>  };
> 

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
