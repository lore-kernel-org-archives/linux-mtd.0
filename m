Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A94C5479D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jan 2023 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MU6GftbOIuchGk2MJV/wFzM/U7SShCUWuOJ8RW8aFF4=; b=ldvNsqPksDQbEbYKJCEUlLRnKL
	OUp2i/c/BmwGOCUdHsvK3zxrjSX2Ytir/ggDWq7SOeLt8Zqv3MNTJUBibI/91haBaGXUk7Sz2A7ns
	gdMVp7c65zypSv7xNFcw4uWpq/Si7dVVORpMZPeb3XRoU0Z8D5wYp+2X5G9+bjPUZW8bHGY7vq5lv
	xn7V1TsIWF7ne0rL/w2R411jmvQvOSosGEHo9TlzrTMb0cFfaTGbhUK98HXUlkzkhRS7nABVwY0NA
	W5qzOgSx8hPibNWnUwRlX6TIf0d4F+XKkyrIL0LBDmmMvgyBeyzqM91dvdTqer06Tw/5wFzZ3rHGj
	RcUs8qVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEnqG-000T1B-RR; Mon, 09 Jan 2023 08:49:16 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEnq9-000SzW-L2
	for linux-mtd@lists.infradead.org; Mon, 09 Jan 2023 08:49:14 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 431F738;
	Mon,  9 Jan 2023 09:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673254140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gluxVvcJmCU0vVgleE42V7l99rpup+5K6uOqI+hdG2w=;
	b=XV+ROy/Eaime+q/+idJ04KuJYgXrzAtTfUhc1/dT4co5hfZnP+PBov+3k8tSg1yrCkI8xv
	LOk0W/BggzyUNS9w+X3TurnTodbPpcxbZqhslXI4GaH6zSU827kwImchNE6vzapDkJCZ5W
	VPHl8zAmgqN1oH4js6APUIYhxR13QXr7kV+qQbsE+bFrDw0Hs+T1hBdlb4VTzM8yRDz29a
	bQ4rzhh5o5aOt+3NL14nhRbZIwyndP60cRM0ky8kGV3pAkYUTQ/XtcHbow+Lychd3ZNBlk
	0ev7VaAAsKSCPadoeIwzwYMoYQnsejDZ0Bop7pSPYwD+1+X/O+KwW0bLlFSfgw==
MIME-Version: 1.0
Date: Mon, 09 Jan 2023 09:49:00 +0100
From: Michael Walle <michael@walle.cc>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, Alexander
 Usyskin <alexander.usyskin@intel.com>
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: add support for mx77l51250f
In-Reply-To: <20230107214345.2524851-1-tomas.winkler@intel.com>
References: <20230107214345.2524851-1-tomas.winkler@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5076cc829fb5a9c5959687a401b120ca@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_004910_254182_5D92B3BB 
X-CRM114-Status: GOOD (  11.15  )
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

Am 2023-01-07 22:43, schrieb Tomas Winkler:
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> mx77l51250f
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c2751a
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> macronix
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060103ff00060110300000ffc2000104100100ff030001020001
> 00ff84000102c00000ffffffffffffffffffe520f3ffffffff1f44eb086b
> 083b04bbeeffffffffff00ffffff00ff0c200f5210d800ff8341bd0082a7
> 04db4403373830b030b0f7a9d55c009e29fff050f985ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffff7f0ff0ff215cdcffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffff3c9b96f0c5a4c2ffffffffffffff
> ffff003600279df9c064fecfffffffffffff
> 
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 36fb8e3e6f82c45bfabea45ec73c08a8
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Thanks for the dumps, as Dhruva mentioned this should go
in the comment section of this patch. But also see below.


> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -100,6 +100,8 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx77l51250f", INFO(0xc2751a, 0, 64 * 1024, 4096)
> +		PARSE_SFDP },

With the newest generic spi nor driver [1] this patch shouldn't
be needed at all anymore. Could you verify, that your flash will work
without it?

-michael

[1] 
https://elixir.bootlin.com/linux/v6.2-rc3/source/drivers/mtd/spi-nor/core.c#L1637

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
