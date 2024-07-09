Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B266BC2BD09
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2024 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2KqQG6eUO1Ql00ne7zzhlMSolrbxqaLl9Gr6pC3lzg=; b=PPfTC4Q87SDDqq
	Yd36S7YwHklo9HICk5nlhKTvw/fciaRE7ImKyQyaHz6vYvjkQaI4VCkjeY44F3mqTz+VWJZy99ekF
	C/PAVLTNkA7ochNdAVWgTj/6CkPM6+/qtKeTauYIxbXU27Cnz+AdV7np0cMC7MBbRTj5D99RdhJVd
	ipDBTwXD+oh98vGcgfaOXj2kJx7S/Ov3dgaNBKI3I5HnTopWjKmhE6rsjVL7ZxYp8Ig5gyd+KfIpT
	c4zCm6KFUqh42pTYO62mqylVxo3c7y5IuhMBvbNmuj4YMWKuMuRVr/sj1BlJ5n6GdUUHI+2Jg0xYG
	kzBBMcMxTnCjkg3yrDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR74s-00000006ak2-00hO;
	Tue, 09 Jul 2024 09:24:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR74p-00000006aid-3HtS
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jul 2024 09:24:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR73F-0004Yx-KQ; Tue, 09 Jul 2024 11:22:21 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR739-008FMs-2o; Tue, 09 Jul 2024 11:22:15 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR738-006U3J-31;
	Tue, 09 Jul 2024 11:22:14 +0200
Date: Tue, 9 Jul 2024 11:22:14 +0200
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
Message-ID: <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708084440.70186564@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_022359_852468_5A7306D5 
X-CRM114-Status: GOOD (  35.39  )
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

Hi Miquel,

On 24-07-08, Miquel Raynal wrote:
> Hi,
> =

> > > >> >> Port the current misc/eeprom/at24.c driver to the MTD framework=
 since
> > > >> >> EEPROMs are memory-technology devices and the framework already=
 supports  =

> > > >> >
> > > >> > I was under the impression that MTD devices are tightly coupled =
by erase
> > > >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices af=
ter all?  =

> > > >> =

> > > >> I was curious as well so I did some digging.
> > > >>   =

> > > [...]  =

> > > >> =

> > > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting =
adding
> > > >> EEPROMs to MTD [1]. The main purpose would have been unifying the =
EEPROM
> > > >> drivers under a single interface. I am not sure what came of it th=
ough,
> > > >> since I can't find any patches that followed up with the proposal.=
  =

> > > >
> > > > That discussion led to drivers/nvmem after I started to work on
> > > > some early prototype, and Srinivas took over that work.  =

> > > =

> > > So would you say it is better for EEPROM drivers to use nvmem instead=
 of
> > > moving under MTD?  =

> > =

> > I thought so at the time, but that was more than 10y ago, and I have
> > followed neither nvmem nor MTD since so I don't really have an opinion
> > there.
> > =

> > It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> > and MTD can be used as an nvmem provider too, so it's not clear to me
> > why we would want to create yet another variant.
> > =

> > But again, you shouldn't really ask me in the first place :)
> > =

> > I'm sure Miquel, Srinivas, and surely others, are much more relevant to
> > answer that question.
> =

> More relevant, I doubt, but just a feeling: EEPROMs have their own
> subsystem now, NVMEM, which, as Maxime said, was initially written for
> that very specific case. EEPROMs don't have the complexity of MTD
> devices, and thus pulling the whole MTD subsystem just for getting
> partitions seems counter intuitive to me. You can definitely "split"
> EEPROM devices with NVMEM as well anyway.

I asked for feedback on my RFC [1] and all I got was to merge both
drivers into one and make the driver backward compatible, which I did by
this commit.

> Overall I think the idea of getting rid of these misc/ drivers is goes
> into the right direction, but registering directly into NVMEM makes
> more sense IMO.

So you propose to have two places for the partition handling (one for
MTD and one for NVMEM) instead of one and moving the code into NVMEM
directly? That doesn't sound right to me either. Also I don't get the
point why EEPROMs can't be handled by the MTD layer? The layer already
supports devices of type MTD_RAM which are very simple and don't require
an erase-op at least I don't see one.

[1] https://lore.kernel.org/all/20231127164623.1008176-1-m.felsch@pengutron=
ix.de

Regards,
  Marco

> =

> Thanks,
> Miqu=E8l
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
