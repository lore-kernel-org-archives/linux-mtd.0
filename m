Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF3FC5DF70
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfmNeyjLbL/byFg8x3ZzbjFkivWaoNS+XzfdwbJRrd4=; b=IJpeAeX3lD8GVg
	8lQgHS5lQdHoZ/gF2Kmz0ulvOYqWdeMYAttpdHls2RHEk1yUFmiq76iEN4TX0whk+BFgM2pLMtEHb
	XgRf9g9+ZZriHCZqACL4sIS8OPpICPN0uQMKm4XziiZ6cedDtns1RfVhRTOpMgU8+D1+rYW/jsil9
	Pp+/b5nPtAdECfNlbKF5GZNKuPOzsO8wICBdN1d6CADMfFppx8i+fx+pUvlzdabYYdcmfdAKWwofc
	o19e0dgZe+ABS2yz0eDhK51q5JrThrX2uu1bp0nsd0cMyAhrvkDmOMyFaEq2jqxFjeP3Xvseb1Pvn
	LQcCszTGNHWpxQ6ALx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDYU-00000007Q1G-0j1e;
	Tue, 18 Aug 2026 06:44:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDYP-00000007Q08-0gIj
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 06:44:10 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 16D49103;
	Tue, 18 Aug 2026 08:43:56 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 18 Aug 2026 08:43:55 +0200
Message-Id: <DKRV6XPSSU73.1VF5FG13NPGWE@kernel.org>
Subject: Re: Regression: mx25l12845e stops working on my device after commit
 947c86e481a
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle"
 <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, "Cheng Ming Lin"
 <linchengming884@gmail.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Russell Senior" <russell@personaltelco.net>
X-Mailer: aerc 0.20.0
References: <CAHP3WfMMK8GU3jpwxv4=C=Pc_9H4ZkmqAJqxZ0gN_rYqPDU3XQ@mail.gmail.com>
In-Reply-To: <CAHP3WfMMK8GU3jpwxv4=C=Pc_9H4ZkmqAJqxZ0gN_rYqPDU3XQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_234409_350101_43B3FB11 
X-CRM114-Status: GOOD (  31.16  )
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

Hi Russell,

Thanks for testing and reporting! Did you know

 ./scripts/get_maintainer.pl -f drivers/mtd/spi-nor/macronix.c

That way you get all mail addresses of the maintainers you can add
to your mail. Not everyone is subscribed to the mailinglist.

On Sat Aug 15, 2026 at 12:48 PM CEST, Russell Senior wrote:
> I am running OpenWrt (master branch) on a Buffalo WZR600DHP. This
> particular instance has MX25L12845E SPI NOR chips (I have another
> WZR600DHP with Winbond W25Q128BVFG, but haven't tested there, just to
> say they don't all necessarily use the same flash).

Did you actually look at the chip or do you just know because linux
is printing the name? FWIW, the name linux is printing isn't always
correct due to flash ID reuse. I'm just curious.

> I just built a new firmware version last night, and it started
> unhappily boot looping. The most recent previous build I had done was
> from June. Boot looping messages look like this:
>
> [...]
> [    0.752843] printk: legacy bootconsole [early0] disabled
> [    0.778756] spi-nor spi0.0: supply vcc not found, using dummy regulator
> [    0.785909] spi-nor spi0.0: BFPT parsing failed. Please consider
> using SPI_NOR_SKIP_SFDP when declaring the flash
> [    0.796238] spi-nor spi0.0: probe with driver spi-nor failed with error -22
> [    0.804457] spi-nor spi0.1: supply vcc not found, using dummy regulator
> [    0.824085] i2c_dev: i2c /dev entries driver
> [    0.830852] NET: Registered PF_INET6 protocol family
> [    0.872875] Segment Routing with IPv6
> [    0.876671] In-situ OAM (IOAM) with IPv6
> [    0.880798] NET: Registered PF_PACKET protocol family
> [    0.886278] 8021q: 802.1Q VLAN Support v1.8
> [    0.921429] clk: Disabling unused clocks
> [    0.925661] check access for rdinit=/init failed: -2, ignoring
> [    0.932181] MTD: Couldn't look up '': -22
> [    0.936335] /dev/root: Can't open blockdev
> [    0.940520] VFS: Cannot open root device "" or unknown-block(0,0): error -6
> [    0.947472] Please append a correct "root=" boot option; here are
> the available partitions:
> [    0.955831] 1f00           16384 mtdblock0
> [    0.955843]  (driver?)
> [    0.962379] List of all bdev filesystems:
> [    0.966374]  squashfs
> [    0.966379]
> [    0.970139] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    0.978392] Rebooting in 1 seconds..
>
> Between June and last night, OpenWrt had switched their kernel from a
> 6.12.x to a 6.18.x, so I immediately suspected something in that
> transition was the culprit and demonstrated that by building the last
> commit before the change to the 6.18.x kernel, and it worked. Then
> tested the commit of the change to the 6.18.x kernel and it
> bootlooped.
>
> Then I started looking through the mtd changes between 6.12.x and
> 6.18.x and spotted 947c86e481a.
>
>   commit 947c86e481a027ed5948434096e506f307bd7114
>   Author: Cheng Ming Lin <chengminglin@mxic.com.tw>
>   Date:   Mon Apr 7 15:53:58 2025 +0800
>
>       mtd: spi-nor: macronix: Drop the redundant flash info fields
>
> The following revert of just the part that affected my chip made the
> bootloop vanish:
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index e97f5cbd9aad2..3524ed08ff85d 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -132,7 +132,10 @@ static const struct flash_info macronix_nor_parts[] = {
>         }, {
>                 /* MX25L12805D */
>                 .id = SNOR_ID(0xc2, 0x20, 0x18),
> +               .name = "mx25l12805d",
> +               .size = SZ_16M,
>                 .flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
> +               .no_sfdp_flags = SECT_4K,
>         }, {
>                 /* MX25L25635E, MX25L25645G */
>                 .id = SNOR_ID(0xc2, 0x20, 0x19),

Yeah, that commit removed the size assuming there will only be parts
with SFDP for that ID.

There is already a patch series which addresses that issue, but it
wasn't picked up yet.

  https://lore.kernel.org/all/20260605084837.1875896-1-linchengming884@gmail.com/

Russell, could you try to apply that series to your tree and try
again? If it works, give that series a Tested-by tag?

If you didn't know, there is a tool called b4
(https://b4.docs.kernel.org/en/latest/), which can be used to fetch
the patches from the mailingist (b4 am). Also, if you want to reply
to that patches, you can import the thread into your mailbox using
the "lei" (https://korg.docs.kernel.org/lore-lei.html).

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
