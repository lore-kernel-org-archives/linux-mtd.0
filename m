Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CAC3064D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpLMJ2qDDFrJSaqzAqrglEroIYraoCkOjTWtwIJ4OAA=; b=PgMENnVNL/yuNB
	13EiKr8mEl2MtNg4IP/SnMlrl4sOuLdvLIjCkwwfch7CIe02/+2IvdTEuKL7AIfNLugKs7a0AZuYZ
	sGO3maPK+9S3fU4BZDZCcRTbrCtgI8r53Mu9nWWPdirB+nUMy+X+IhMw/N5A6km85DHT5i/mO+Om6
	5jpojlHrx75pW+omrJClnq6DAXNkJ09WsB7ZZEV6GZega7cxRBE9LxV5UDwUFGe6/s8qzNaef1pzb
	vAUENfltQfddpeq8VDzPUb72Bvzrut/syNi4rKl2kSUQrsqAvWCPAnywEOJOCV/HoTlU+ZrCd6Ztq
	d6coXELMYQUtjhfiV/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdlq-00000006tl4-45zv;
	Tue, 02 Jul 2024 13:42:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdlj-00000006tjd-16tu;
	Tue, 02 Jul 2024 13:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99CABCE1E02;
	Tue,  2 Jul 2024 13:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF12C116B1;
	Tue,  2 Jul 2024 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927719;
	bh=xIoq5ERoFam9CoYgw94MfcDDBIP2EzSXozZdimkHqf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=krETZqZRZTW0k1iXLzs/FxWIvDBiOf5o+FbJZkpGtilaCd7GZcjqyo6SomGAunMEB
	 BUZlu7wccEG6kossKFkepABl2/j8Nsn7yh5jjmmGZM1zHjJ9xrqOuEtGVXyytIMsr2
	 wG70VQbbYM2x2Z/V9Ig4oLAFMTqYBVlvAMt9/+Ln7Tq6kiinYWiEYV3FCbh+gW1XUs
	 fS2rs45SRfaUC94gwzDWRVv91uNOx//oOHa5IBx4jkma5NwzrumUbaXnlnE+BGlD5D
	 5wo+CtDPOBVAmhVS6Z9McL5acmawuElTWYvsSBGtPlNdIXCvftH0RegptVZxUnYM36
	 rCuzSmxjJO+hA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  Russell King <linux@armlinux.org.uk>,  Joel Stanley
 <joel@jms.id.au>,  Andrew Jeffery <andrew@codeconstruct.com.au>,  Nicolas
 Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Shawn Guo <shawnguo@kernel.org>,  Sascha
 Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Vladimir
 Zapolskiy <vz@mleia.com>,  Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Tony Lindgren <tony@atomide.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Dinh Nguyen <dinguyen@kernel.org>,  Thierry
 Reding <thierry.reding@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  Jonathan =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,
  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin
 <npiggin@gmail.com>,  Christophe Leroy <christophe.leroy@csgroup.eu>,
  "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Huacai Chen <chenhuacai@kernel.org>,  WANG
 Xuerui <kernel@xen0n.name>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-i2c@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  imx@lists.linux.dev,  linux-omap@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-tegra@vger.kernel.org,
  openbmc@lists.ozlabs.org,  linuxppc-dev@lists.ozlabs.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev,  Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
In-Reply-To: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org> (Tudor
	Ambarus's message of "Mon, 1 Jul 2024 17:14:14 +0100")
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
Date: Tue, 02 Jul 2024 15:41:52 +0200
Message-ID: <mafs0ikxnykpr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_064203_683918_E9A46115 
X-CRM114-Status: GOOD (  25.14  )
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

On Mon, Jul 01 2024, Tudor Ambarus wrote:

> On 7/1/24 2:53 PM, Marco Felsch wrote:
>> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
>> as single device isn't always sufficient. There may be partitions which
>> require different access permissions. Also write access always need to
>> to verify the offset.
>> 
>> Port the current misc/eeprom/at24.c driver to the MTD framework since
>> EEPROMs are memory-technology devices and the framework already supports
>
> I was under the impression that MTD devices are tightly coupled by erase
> blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?

I was curious as well so I did some digging.

The Kconfig help says:

    Memory Technology Devices are flash, RAM and similar chips, often
    used for solid state file systems on embedded devices [...]

The FAQ on the MTD documentation [0] says:

    Unix traditionally only knew block devices and character devices.
    Character devices were things like keyboards or mice, that you could
    read current data from, but couldn't be seek-ed and didn't have a size.
    Block devices had a fixed size and could be seek-ed. They also happened
    to be organized in blocks of multiple bytes, usually 512.

    Flash doesn't match the description of either block or character
    devices. They behave similar to block device, but have differences. For
    example, block devices don't distinguish between write and erase
    operations. Therefore, a special device type to match flash
    characteristics was created: MTD.

    So MTD is neither a block nor a char device. There are translations to
    use them, as if they were. But those translations are nowhere near the
    original, just like translated Chinese poems.

And in the section below, it lists some properties of an MTD device:

    - Consists of eraseblocks.
    - Eraseblocks are larger (typically 128KiB).
    - Maintains 3 main operations: read from eraseblock, write to
      eraseblock, and erase eraseblock.
    - Bad eraseblocks are not hidden and should be dealt with in
      software.
    - Eraseblocks wear-out and become bad and unusable after about 10^3
      (for MLC NAND) - 10^5 (NOR, SLC NAND) erase cycles.

This does support the assumption you had about MTD devices being tightly
coupled with erase block. It also makes it quite clear that an EEPROM is
not MTD -- since EEPROMs are byte-erasable.

Of course, the existence of MTD_NO_ERASE nullifies a lot of
these points. So it seems the subsystem has evolved. MTD_NO_ERASE was
added by 92cbfdcc3661d ("[MTD] replace MTD_RAM with MTD_GENERIC_TYPE")
in 2006, but this commit only adds the flag. The functionality of "not
requiring an explicit erase" for RAM devices has existed since the start
of the git history at least.

I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
drivers under a single interface. I am not sure what came of it though,
since I can't find any patches that followed up with the proposal.

Overall, I'd say that while originally MTD was written with flash
devices with erase blocks in mind, the subsystem seems to have evolved
with time to include other types of devices.

I don't see anything obviously wrong with adding EEPROMs to the type of
devices in MTD as well. It doesn't seem to be too invasive to the
subsystem (I do see some dubious code when skimming through the patches,
but nothing unfixable). And the EEPROM drivers can get a common
interface. The other option would be to create a separate subsystem for
EEPROMs, but perhaps that would just lead to a bunch of code being
duplicated.

I'd like to hear if somebody thinks otherwise, and sees reasons to _not_
do this.

[0] http://www.linux-mtd.infradead.org/faq/general.html
[1] https://lore.kernel.org/linux-mtd/20130705201118.GM2959@lukather/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
