Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB1C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=std7kxZXrmekREe4z2h0PC6tMLtSNGhX9sdv59FtfnA=; b=skMWWY4watMoeWIFvBq+LLeV4y
	pnXGawg5KFSmVqqtdm1VdsoAX3Cfrv94+JUyMinK+NiO8jbXjJkHGL8G/78lBm9eg+qd0sdtT3e4n
	d9KnISdRxWk+UU4iZz7Rgr85uEBX2PceEnnBam+LM+j/kL+1yYP/IEJvbx3VvrACiAHnNMUQjXVRJ
	SvJPCA2xgBATb2s2gEbc3kYKmzRCOtBbHOePWpr6Of+or4djeJLs+0MgjrKjP9u+4mQ3A9Cw5RbOJ
	QPUq8aLReobf9/RCIIZ3+6qeixKBW9hw2kKMgjdXHp3XsV0522E7UQdj6cS5PN9aR5dffxAa932dT
	zDvEIMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHwi-00A3lL-1k;
	Tue, 24 Oct 2023 13:59:48 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHwe-00A3ih-0g
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 13:59:46 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 559ED51;
	Tue, 24 Oct 2023 15:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698155981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxfTWwLqWiscErmNY4HXyWwckkGlMHguK39Y+D1k5Iw=;
	b=UW4mbEC/Rc+9Q5J/kpMvIGqUuDn7hgdYP3iTca4EuQOhPXbZ5JvX2iE2seBxiMfdjn2yCl
	FSJkWWEkj1FP67OEGr8ommn+wEiY9H1FKUfEpX3lRzHuf/bbppp/e+UrCZzV4vlZOheOQ+
	BOtUoR6ceow573lYnjYPN7QypERQ0qdzePF7aZntbi6J6Yz92PFJGTyjY/mA+SBe06jTCm
	/fQRtvk4Cc4z1CdhnG4D4/kzNhhnpWDnOz+tttnGx6DSB7Hktm8fUE98Ly6JNEsiUzgNNB
	R+FuD5dgPTynFEjac/8YVGroZNsyD6Ls00/1OyWpqT1GD+5AVjlSqBE+3bOv8g==
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 15:59:41 +0200
From: Michael Walle <michael@walle.cc>
To: Fabio Estevam <festevam@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 tkuw584924@gmail.com
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
In-Reply-To: <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
References: <20231023213800.2599704-1-festevam@gmail.com>
 <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
Message-ID: <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_065944_401262_899864D8 
X-CRM114-Status: GOOD (  12.53  )
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

>> > +             .id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
>> > +             .name = "mt25qu01g",
>> > +             .size = SZ_128M,
>> 
>> Not needed, parsed by SFDP.
>> 
>> > +             .flags = NO_CHIP_ERASE,
>> 
>> Is it fair to assume that this is the usual case for multi die chips?
>> See also,
>> https://lore.kernel.org/linux-mtd/cover.1680849425.git.Takahiro.Kuwano@infineon.com/
>> 
>> So "if n_dice > 1" will implicitly be NO_CHIP_ERASE. n_dice should be
>> parsed from SFDP.
>> 
>> > +             .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>> 
>> .no_sfdp_flags are legacy and shouldn't be used with new flashes.
> 
> I tried your suggestion and tested with the change below:

You'd need to change the core to assume there is no chip
erase support if "n_dice > 1". So first step would be that
your SPI flash will successfully parse the SFDP and set n_dice
correctly. Then adapt the core to set SNOR_F_NO_OP_CHIP_ERASE
if "n_dice > 1".
The goal here is to avoid any entry in our database at all and
support this flash out of the box by just parsing SFDP correctly.

Which leaves us with this damn USE_FSR..

> ~# cat 
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> 20bb21104400
> ~# cat 
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> st
> ~# cat 
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> mt25qu01g
> ~# xxd -p  
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 53464450060101ff00060110300000ff84000102800000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
> 273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
> 03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
> ffffffffffffffffffe7ffff21dcffff
> ~# md5sum  
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 9d28d1b11de8b15ba9152644219d9a78
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

thanks!

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
