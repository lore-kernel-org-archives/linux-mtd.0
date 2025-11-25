Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB69CCFD315
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVKuw/kf4InS3TI4NkhPYK0oykRwPl8p8tizOiGWs5c=; b=pbDdXjDGp+zYze
	rdGYBIpH3IFGDd6sm2gFzbTG9mGQWiEzZFDmZxe5HktHtK02grQUNViE4EJ5I8Kudl/gu+jh8PRBs
	2FjeB7UAJZzbAcrNjcK1g6EJ277H2YldM3eIQsill3XUSbRXYJlBFUWcm9BjhEWWqSJvFI2/XHHKd
	eBsFdR/RRWLXp6el6rTUFQt3Xik4543b6Ev3vAH2XipZxdGBrP8eaeXqHBIBvUy6plDK00TTa2C+B
	VFcCPGmKpdwvuV6aYjqbxsPFnm6OEXOvY7DFkHXdD1iiU1BxX9tOgd2ptNqrjZYk8UWvmuCmIm3qc
	2gE6kHRrUaFC+GXH0+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnfx-0000000CuZ7-28Nb;
	Tue, 25 Nov 2025 07:41:25 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnfs-0000000CuWX-2dcF
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 07:41:23 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B32072C3;
	Tue, 25 Nov 2025 08:41:08 +0100 (CET)
Mime-Version: 1.0
Date: Tue, 25 Nov 2025 08:41:08 +0100
Message-Id: <DEHLTTY133NE.1Z1LFJ2HCXFJI@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marc Olberding" <molberding@nvidia.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
 <87jyzfzwpw.fsf@bootlin.com> <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org>
 <87bjkrzvk7.fsf@bootlin.com> <DEGSOCUMG4WZ.3IYU22B83Z2AI@kernel.org>
 <87wm3fyeof.fsf@bootlin.com> <aSTySAFSQCxoFz/t@molberding.nvidia.com>
In-Reply-To: <aSTySAFSQCxoFz/t@molberding.nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_234122_698599_6E5E65FA 
X-CRM114-Status: GOOD (  25.74  )
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

> This data was taken with the original patch, as sfdp didn't populate as I had provided
> the size field in the spi-nor-info table, this seems to cause us to skip any sfdp parsing
> and go down the deprecated path.

But the SFDP should still be parsed. Only if you have the SKIP_SFDP
flag set, parsing is turned off. Which kernel are you using? Which
SPI controller are you using?

> Looking at the info table, it looks like all but 4
> spi chips in the winbond table use the deprecated path. Its not clear to me however,
> why it works on Miquel's board but not mine. 
>
> /tmp/xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060101ff00060110800000ff84000102d00000ff03000102f000
> 00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
> 0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
> f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
> f0ff21ffdcff
>
> md5sum ./sfdp 
> a7b9dbf76e99a33db99e557b6676588a  ./sfdp
>
> cat /sys/kernel/debug/spi-nor/spi0.0/params
> name            (null)
> id              ef 40 21 00 00 00
> size            128 MiB
> write size      1
> page size       256
> address nbytes  4
> flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET
>
> opcodes
>  read           0x6c
>   dummy cycles  8
>  erase          0xdc
>  program        0x34
>  8D extension   none
>
> protocols
>  read           1S-1S-4S
>  write          1S-1S-4S
>  register       1S-1S-1S
>
> erase commands
>  21 (4.00 KiB) [1]

4k erases are parsed correctly as expected..

>  dc (64.0 KiB) [3]
>  c7 (128 MiB)
>
> sector map
>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+----------
>  00000000-07ffffff |     [   3] | no

..but not selected. I guess you don't have
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS set, do you? In that case I'm lost
why it should have been working with this patch applied. Do you see
any differences in the "params" file if the patch is applied?

>> >> My understanding (which may clearly be erroneous) is that most of these
>> >> flashes support 4K blocks but somehow don't advertise it in their SFDP
>> >> data, so every time we describe a chip we must remember to tick that
>> >> flag.
>> >
>> > Which flag? SECT_4K? I don't think that will be used at all, does
>> > it? It's only used in spi_nor_no_sfdp_init_params() which in turn is
>> > only called in spi_nor_init_params_deprecated() (or if SKIP_SFDP is
>> > set). 
>> >
>
> See my above comment about setting the size in the tables. This eventually
> gets used by spi_nor_needs_sfdp. This ends up being most of the winbond chips
> defined today.

Yeah because they were added before we switched to parsing SFDP.

> All in all, I'm a little confused what the difference is between Miquel's and my
> tests. Any direction would be appreciated, in the meantime, I'm going to continue
> debugging on my end.

What are your tests? Did you try the tests in the "minimal testing
requirements" chapter? Did you see any errors?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
