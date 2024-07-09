Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D805C2BD09
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2024 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBGl1DXiRsD45J4VwBuCkNQvWr3Q7HXi8d9WbhjbuwQ=; b=XpnVbaUkXnTsmn
	JYhMBGtFilxvEFP7ZkRtf5tJgODrnKnzivxsMYoE1sWgsoHq06SHICXPy5IVFlqVywxgu4tNjNSaz
	SluiRBOGcRwEsAm3mNjcJIgOF6NFkrsqD8IDa9fknUd96q+x/r8Tea7okMQuVnDcem+pcbbr84um+
	WTZcoerWhbxrGa9IhPKMxaPwGGya9AwMvmkESKd0ipVzAk1nFN6EKasrCTX0UJa9oLDvHbfV9+yMl
	Yd1uu3HZ0+iNEuLJ9mqsAp/CG5j0yX+vqdLnF/ZtmVuXiqdFNIlnxGNIFwMvYhfrhRhGs4yUAtwrC
	X9TbDhNRpQU575+XUIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR8Fy-00000006qNC-2VhN;
	Tue, 09 Jul 2024 10:39:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR8Ft-00000006qMa-2l0q
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jul 2024 10:39:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR8FD-0003rR-B5; Tue, 09 Jul 2024 12:38:47 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR8F7-008G9a-MD; Tue, 09 Jul 2024 12:38:41 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR8F7-006Uv6-1k;
	Tue, 09 Jul 2024 12:38:41 +0200
Date: Tue, 9 Jul 2024 12:38:41 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
 <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
 <20240709114302.3c604ef3@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240709114302.3c604ef3@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_033931_918771_F5873F9B 
X-CRM114-Status: GOOD (  46.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24-07-09, Miquel Raynal wrote:
> Hi Marco,
> =

> > > > > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggest=
ing adding
> > > > > >> EEPROMs to MTD [1]. The main purpose would have been unifying =
the EEPROM
> > > > > >> drivers under a single interface. I am not sure what came of i=
t though,
> > > > > >> since I can't find any patches that followed up with the propo=
sal.    =

> > > > > >
> > > > > > That discussion led to drivers/nvmem after I started to work on
> > > > > > some early prototype, and Srinivas took over that work.    =

> > > > > =

> > > > > So would you say it is better for EEPROM drivers to use nvmem ins=
tead of
> > > > > moving under MTD?    =

> > > > =

> > > > I thought so at the time, but that was more than 10y ago, and I have
> > > > followed neither nvmem nor MTD since so I don't really have an opin=
ion
> > > > there.
> > > > =

> > > > It looks like drivers/misc/eeprom/at24.c has support for nvmem thou=
gh,
> > > > and MTD can be used as an nvmem provider too, so it's not clear to =
me
> > > > why we would want to create yet another variant.
> > > > =

> > > > But again, you shouldn't really ask me in the first place :)
> > > > =

> > > > I'm sure Miquel, Srinivas, and surely others, are much more relevan=
t to
> > > > answer that question.  =

> > > =

> > > More relevant, I doubt, but just a feeling: EEPROMs have their own
> > > subsystem now, NVMEM, which, as Maxime said, was initially written for
> > > that very specific case. EEPROMs don't have the complexity of MTD
> > > devices, and thus pulling the whole MTD subsystem just for getting
> > > partitions seems counter intuitive to me. You can definitely "split"
> > > EEPROM devices with NVMEM as well anyway.  =

> > =

> > I asked for feedback on my RFC [1] and all I got was to merge both
> > drivers into one and make the driver backward compatible, which I did by
> > this commit.
> =

> I'm sorry for not bringing this earlier.

The purpose of the RFC was exactly to figure out the way to go therefore
I'm a bit surprised now :/

> > > Overall I think the idea of getting rid of these misc/ drivers is goes
> > > into the right direction, but registering directly into NVMEM makes
> > > more sense IMO.  =

> > =

> > So you propose to have two places for the partition handling (one for
> > MTD and one for NVMEM) instead of one and moving the code into NVMEM
> > directly?
> =

> Why two places for the partitions handling? Just one, in NVMEM. Also

Without checking the details I think that converting the MTD
partitioning code into NVMEM partitioning code is a bigger task. As you
said below there are many legacy code paths you need to consider so they
still work afterwards as well.

> usually EEPROMs don't require very advanced partitioning schemes,
> unlike flashes (which are the most common MTD devices today).

As said in my cover letter EEPROMs can become quite large and MTD
supports partitioning storage devices which is very handy for large
EEPROMs as well.

> > That doesn't sound right to me either. Also I don't get the
> > point why EEPROMs can't be handled by the MTD layer?
> =

> They can, but should they? Just compile the two layers and observe
> the size difference. MTD is complex and old, carries a lot of history,
> and the user interface is also not straightforward because you need to
> handle pages, blocks, erases, bitflips, ECC stats, OOB bytes and
> positions, two OTP areas... None of that exists in the EEPROM world. So
> why would you want to register into MTD and pull a huge subsystem while
> there is a much more recent, simpler and way lighter subsystem fitting
> much better your device?

Didn't checked the size but the honest, MTD provides many Kconfig
switches to trim the size down. As of now the mtd.o is made of up to 5
(6 if chipreg.o is counted -> should be an opt) files which is of course
larger than the pure misc/eeprom/at24.c driver but not that large. =


Regards,
  Marco

> > The layer already
> > supports devices of type MTD_RAM which are very simple and don't require
> > an erase-op at least I don't see one.
> =

> MTD_RAM has been there forever, probably for "bad" reasons. BTW there
> has been an attempt at removing it which was reverted in _2006_ and then
> felt into the cracks:
> 21c8db9eff95 ("[MTD] Restore MTD_ROM and MTD_RAM types")
> =

> Thanks,
> Miqu=E8l
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
