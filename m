Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C653DC2BA1A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8bj2Y+bw0ARZkp4p4kE3BkSqgM1AVW0XqmnQd05p+o=; b=ysoizHp54nxQsP
	A6nBEKmlRgxkoxyWaOaaQ2a7O8wlfFRvWvD9Yv4Shnk/Ea1BWFesiYTU18xOe2kMs/Rmp+WB1Jg/n
	vyljtqC6sS7ivTLsRU5Xawny34hLdGnhYkZlRrWJaJrmsIe1j8OvMiw+3p2lZMfLLoCoLMeEaZDDb
	a4Uu723JwuoZzBAEjCCrPoq2bXzmEgh41TpPcw4enystUnZHflfnK3zKcGK/QFZK1ljyhbKFSE64o
	5sLwsXNi+5677l/P9sKLV1KIbzzymPqwvx4q4LUzXo8EuxSTDHZkJIatYkS13dBsYdskFzKhX6dHH
	FICJ6MswkMnrd4Cs3vTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZ17-00000008CYZ-2dQ3;
	Fri, 21 Jun 2024 07:49:05 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZ14-00000008CXV-3DP6
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 07:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718956142; x=1750492142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wIlmEkajVgionahbTspK538zjM57VKi+YSPROMBtrCM=;
  b=eQR194WJRNCY0X+H6xXV910oPHimmd3skD4w0WBCwrOs0Mzr71GrFOGa
   mrolbVIVn/iwUsDASsPAozz07dpmH9mNci+0rsVP6GpRU+aRBL4NC4SMw
   8JPQEpsG6MmQbH7wi+qnS4GYao4+PRivnYt9U1FCZ4QqP1YaLiNzHy+8x
   T1+fFVc6+kdyEYML14ZQufvw7uX634IersGUMepTQ9zLa/WnZyEO+M7sl
   MEXPD4vq2IjAgMaDqaxtXA5ZIj0CL2iOVqS9PkK5esVaJuDa+Ne6rZH19
   uvxNN0XhmNot59fGU4yjT/I3bHpG5/gUVBzfb02/dsqCC66LtnK1V7pjX
   w==;
X-CSE-ConnectionGUID: s8GHXRv/SRCOEcMmDwWgyg==
X-CSE-MsgGUID: SQUcTY4bRNqbIS5VTrS2oA==
X-IronPort-AV: E=Sophos;i="6.08,254,1712613600"; 
   d="scan'208";a="37515205"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jun 2024 09:48:59 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9407160A30;
	Fri, 21 Jun 2024 09:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718956135;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wIlmEkajVgionahbTspK538zjM57VKi+YSPROMBtrCM=;
	b=mgMFAjs5PkqL7DA5WhALlYJLzMWua/S6uYkLRX1dtyDPUUkdkChkAN/ZLy6tAht+56Giwf
	IGikV/5Kopjj4czSVeOmOznPBmfGgwxS4nYkeHknIukwuWOedcpGgY9KQEa1ZbWFwWhTC5
	gFn+wfN5MCD6bSU5fKCYXGlXJ3dvQKPN9SubqLy/1xGp0nbxL6p/5KJAP+jzhzdoeWToks
	19nxDRcY/soKwOhotRxhwLVtNwKA25I0wEVoPTKsSH7tlezsVdYjidK76xZjl3wr6WHq79
	LrteIRg4wvOAyXyFaI9PJ9PWASzeGFVBHormvE2TWHDozerE1Ep5AWGNOdONKg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>, Thorsten Scherer <t.scherer@eckelmann.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marex@denx.de>, Imre Kaloz <kaloz@openwrt.org>, Andrew Lunn <andrew@lunn.ch>, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM devices
Date: Fri, 21 Jun 2024 09:48:56 +0200
Message-ID: <114624730.nniJfEyVGO@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <D25I9KDHREE9.29RPCOHXUA70A@kernel.org>
References: <20240604074231.1874972-1-mwalle@kernel.org> <23574950.6Emhk5qWAg@steina-w> <D25I9KDHREE9.29RPCOHXUA70A@kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_004903_290623_66B38016 
X-CRM114-Status: GOOD (  37.80  )
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

Hi,

removing Uwe from CC as this address bounces.

Am Freitag, 21. Juni 2024, 09:09:56 CEST schrieb Michael Walle:
> On Fri Jun 21, 2024 at 8:49 AM CEST, Alexander Stein wrote:
> > Hi everyone,
> >
> > sorry for being late to the party. I just noticed this discussion while
> > reading [1].
> >
> > Am Dienstag, 4. Juni 2024, 09:42:31 CEST schrieb Michael Walle:
> > > These devices are more like an AT25 compatible EEPROM instead of
> > > flashes. Like an EEPROM the user doesn't need to explicitly erase the
> > > memory, nor are there sectors or pages. Thus, instead of the SPI-NOR
> > > (flash) driver, one should instead use the at25 EEPROM driver.
> > > =

> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > Cc: Thorsten Scherer <t.scherer@eckelmann.de>
> > > Cc: Marek Vasut <marex@denx.de>
> > > Cc: Imre Kaloz <kaloz@openwrt.org>
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: Flavio Suligoi <f.suligoi@asem.it>
> > > ---
> > > The referenced binding only supports the true AT25 compatible EEPROMs
> > > where you have to specify additional properties like size and page si=
ze
> > > or cypress FRAM devices where all the properties are discovered by the
> > > driver. I don't have the actual hardware, therefore I can't work on a
> > > proper driver and binding. But I really want to deprecate the use of
> > > these EEPROM like devices in SPI-NOR. So as a first step, mark the
> > > devices in the DT bindings as deprecated.
> > > =

> > > There are three in-tree users of this. I hope I've CCed all the relev=
ant
> > > people. With the switch to the at25 driver also comes a user-space
> > > facing change: there is no more MTD device. Instead there is an "eepr=
om"
> > > file in /sys now, just like for every other EEPROM.
> > > =

> > > Marek already expressed, that the sps1 dts can likely be removed
> > > altogether. I'd like to hear from the other board DTS maintainers if
> > > they seem some problems moving to the EEPROM interface - or maybe that
> > > device isn't used at all anyway. So in the end, we can hopefully move
> > > all the users over to the at25 driver.
> >
> > So instead of spi-nor you want to use at25 for this MRAM devices?
> =

> Yes.
> =

> > AFAICS at25 is a spi only driver, but spi-nor is a spi-mem driver. So I=
 am
> > wondering if at25 driver is capable of using QSPI hosts.
> =

> spi-mem support could be added to the at25 driver. But probably
> mainly because there are SPI controllers out there which only have
> an interface to attach memory (like the FlexSPI from NXP).

Yes, FlexSPI is my current area of interest.

> > Everspin EMxxLXB devices are capable of running in xSPI modes.
> > Regarding QSPI (DSPI/OSPI as well) I assumed spi-nor is a given, but ma=
ybe
> > I am completely wrong here. Maybe someone could clarify this.
> =

> These newer devices should also support the erase command, right? So
> they can be a "real" flash. If they support SFDP, the would even be
> supported out of the box. The mentioned everspin devices are much
> older and behaves more like an EEPROM instead of a flash.

I see this is about older devices, I got misled by the subject.
The new devices EMxxLX devices do not support SFDP. There are erase command=
s,
but unless you want to set sectors/whole chip to a defined state, this seems
unneeded, so SPI_NOR_NO_ERASE would be sensible.
I'm wondering if the comment in [1] is still applicable unconditionally, as
there still is a use-case for spi-nor on flexspi.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-kernel/D0C9NCOMI27O.2VW2U3FNFTSPK@kernel.=
org/
-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
