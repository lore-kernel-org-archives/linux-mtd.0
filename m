Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05980C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laKK3GWgUcXBEQTU0Xu5p1TleKCChM3AOjxvI8J1Lyo=; b=JDUg75fDbyQYPPJTpzlBPUGqUU
	rGEvzWpLRgIM+bxAawYQK/w6lcHfHloWLMw+1tQ5AgMizRFutSEni84YVRrI62skAYGG+7qW5IChk
	GFhyczkJldUBrkQcA0oC5UCFi4zb//7S9UhdD7d1NtsdRyRyre42ePHsLCb/nZENfqvFL5MBWqvV2
	tk54gzWxwRFs6/oq9NrUYaqxPewuyKr1jQtsFjy1yK347aoqwwXVuD6v9xbvEx3XiuQWanRu5gz6N
	mFf9SGH8GX+UW6HZcg39TcK0xY4iva5O7Ggs2/MQhOCe+41k1i88Mp3LsOZrYDpuNxjfNO71hRTSh
	svkb8DtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r14L7-006Kpx-09;
	Thu, 09 Nov 2023 12:40:53 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r14L4-006KpR-1y
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 12:40:52 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D094DA4F;
	Thu,  9 Nov 2023 13:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699533647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=us8JU723OGPkM9WyUVcLpBm59Vu0CUzHWU3voNw+RjQ=;
	b=ShN06e2/jEw6J4tVMT73HJEyfJJOgt0u2MyIF+HUvpqqascR3rowWUl6d57kZ6VrqDc7bh
	QFHeY4VDOy9iAdNRCyV1Gbep1nqP9x+H+o34lVrEwgGRyNK4x6ArOR89c6VBAuCdo1QMNF
	Sq1wFFObdt5YCfSV9sz6FslLzkUSNj5dbCVJnx/SA+MCteGVpDTSqfxsUX+HqQmA6YeJV9
	kcV5iT22JeWoGxP1iHjPlqhCdaCYBCQkIsjTHopRd51svDVrC2qwY8a3Ktr+ovlMMTCu37
	PgeMO80Mb4z3fJ4sISc2Ama1w7XQvjoiRfZ5BCHDH1EzByOj2d5DF53xKAbIyg==
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 13:40:47 +0100
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
In-Reply-To: <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Message-ID: <f88759f98e865e68da5481fcbb969c47@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_044050_797983_106C2702 
X-CRM114-Status: GOOD (  42.06  )
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

Hi Biju,

>> >> > As per section 8.14 on the AT25QL128A hardware manual[1],
>> >> > IO0..IO3 must be set to Hi-Z state for this flash for fast read
>> >> > quad IO.
>> >> > Snippet from HW manual section 8.14:
>> >> > The upper nibble of the Mode(M7-4) controls the length of the next
>> >> > FAST Read Quad IO instruction through the inclusion or exclusion of
>> >> > the first byte instruction code. The lower nibble bits of the
>> >> > Mode(M3-0) are don't care. However, the IO pins must be
>> >> > high-impedance before the falling edge of the first data out clock.
>> >>
>> >> I'm still not sure what you are trying to fix here. For any quad I/O
>> >> mode, the pins of the controller must be in hiZ during the data phase
>> >> on a read operation. Otherwise the flash couldn't send any data,
>> >> there would be two drivers for one signal. So being in hiZ state
>> >> should be the default and shouldn't depend on any connected flash.
>> >
>> > OK, I will make hiZ state as the default.
>> 
>> I still think this iofv setting is the wrong approach, though. Do you 
>> have
>> a link to the spi controller datasheet where I can look up what the
>> controller is doing.
> 
> Please find the below link.
> 
> https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz-mpus/rzg2l-general-purpose-microprocessors-dual-core-arm-cortex-a55-12-ghz-cpus-and-single-core-arm-cortex-m33#overview

Thanks.

>> This seem to be a general problem with what we are sending during the
>> command phase and I'm curious why there wasn't more reports on non 
>> working
>> micron flashes for now.
> 
> 1-bit mode, we don't have any issue. Once we switch to 4-bit mode we 
> have this
> issue with micron MT25QU512A flash and we need to set the correct IO 
> fixed values.
> 
> Maybe others are testing with 1-bit mode and not testing the full 
> capability of the flash.
> 
>> 
>> >> You've mentioned the micron flash which needs a '1' on its hold/reset
>> >> pin.
>> >> I would have expected a fixup for this flash, not for the flash which
>> >> behaves normal.
>> >
>> > I will drop fixup for Renesas AT25QL128A  and will add fixup for
>> > micron flash.
>> 
>> btw, what will happen if you always use the {3,3,3,1} setting? I guess 
>> the
>> atmel flash will also work? because HiZ should mean "don't care"
>> from
>> the point of view of the flash.
> 
> With atmel flash if use {3,3,3,1} setting, I get below error.
> 
> root@smarc-rzg2ul:/cip-test-scripts# ./rpcif_t_001.sh
> [  144.078854] spi-nor spi1.0: spi-nor-generic (16384 Kbytes)
> [  144.120468] 2 fixed-partitions partitions found on MTD device spi1.0
> [  144.126982] Creating 2 MTD partitions on "spi1.0":
> [  144.133004] 0x000000000000-0x000000200000 : "boot"
> [  144.141879] 0x000000200000-0x000001000000 : "user"
> [  358.476963] jffs2: notice: (230) read_dnode: node CRC failed on 
> dnode at 0xdfe084: read 0x336ebbbc, calculated 0x961503c7
> [  358.488509] jffs2: notice: (230) read_dnode: node CRC failed on 
> dnode at 0xdfd118: read 0xff6a5df6, calculated 0x786a5df6
> [  358.502963] jffs2: notice: (230) read_dnode: node CRC failed on 
> dnode at 0xdfa2d4: read 0x1fc99948, calculated 0xbab22133
> [  358.515357] jffs2: notice: (230) read_dnode: node CRC failed on 
> dnode at 0xdf9368: read 0xffd184a7, calculated 0x3d184a7
> [  358.528175] jffs2: notice: (230) read_dnode: node CRC failed on 
> dnode at 0xdf6524: read 0x5deb2462, calculated 0xf8909c19

Strange. Can't make any sense of this at the moment.

>> > With iofv settings {3,3,3,3} (all pins on Hi-Z state) with Micron
>> > flash
>> > ----------------------------------------------------------------------
>> > -
>> >
>> > ./rpcif_t_001.sh
>> > [   37.950986] spi-nor spi1.0: unrecognized JEDEC id bytes: ff ff ff ff
>> > ff ff
>> 
>> As mentioned earlier, I suspect that HiZ on IO3 means low and the 
>> flash
>> will be in reset. Could you perhaps verify that by probing IO3?
>> I know that other flashes will *either* support RESET#/HOLD# or quad 
>> mode.
>> Thus I was saying, that we probably wont support that and the easiest 
>> fix
>> should be to disable this behavior for the atmel flash (there was nv
>> setting).
> 
> The fix up is invoked only for quad mode, I believe it is safe to add 
> fixup for micron flash
> As it is the one deviating from normal according to you, rather than 
> adding fixup
> for generic flash like ATMEL flash(Now Renesas flash)

Could you please try setting bit 4 in the Nonvolatile Configuration
Register (Table 7) and see if the problem goes away?

Also could you have a look at the schematics, does the IO3/RESET#
have a pull-up? If not, who is in control of driving the correct
value here? If it has a pull-up, I'm puzzled why you need any
other setting than HiZ.

The correct fix would be to the information about the missing
IO state in the "struct spi_mem_op". That is, what should be the
default values of all the IO lines which are unused. For example
if we have a 1s1s4s transaction, what should be the state of IO0,
IO2 and IO3 during the command and address phase. If we have a
1s2s2s, what should be the state of IO0 during the command phase
etc.

That can then be used within your driver to set the corresponding
IOFV values (for each spi-mem op).

But I'm not sure if other SPI controllers will support that, though.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
