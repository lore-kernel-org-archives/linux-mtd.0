Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A6CC3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnvZzI7IBoep4fw3uu7UhYGg3BpJrEIzQjc6ZUL6U4Q=; b=QwI44t6UeVecG3
	6vcZfBYdFJlor/wFT6GQdn+Lko5syXTWdFUCbbi6tOhudkBpBmR6UdBv0qnxhYn3E2tbultGB9ReB
	Fdbg3eRe9glrcj4aGaruXlS2dLQfdh0mIw+O5V7b+HhGptlPpst8VmINOFTNf+ipQaiRVzCLwc3HY
	aBQ5wAX4k5sstD1gZU2oS8CjL7b4Le5NpVMfbREtFbb21tjMhyqrGscg7cTvws23d30YstmcuHL4q
	tHQYYDvCIuadDL6wVqXA6NcmrSzJ94JxlxTryNuXD5uKcriDv/uju6IqHEhgC/sN+toJ5NoDl1Isz
	R9epbEYDzq1UrxS06GOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNIj-0000000GXcG-2Ost;
	Thu, 18 Jul 2024 09:19:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNIf-0000000GXaO-48i6
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 09:19:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGz-0002U5-TA; Thu, 18 Jul 2024 11:18:01 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGr-000PqF-MB; Thu, 18 Jul 2024 11:17:53 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGr-003zXS-1Y;
	Thu, 18 Jul 2024 11:17:53 +0200
Date: Thu, 18 Jul 2024 11:17:53 +0200
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
Message-ID: <20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
References: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
 <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
 <20240709114302.3c604ef3@xps-13>
 <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
 <20240717101948.2e99f472@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717101948.2e99f472@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_021946_046863_2E7CFC5C 
X-CRM114-Status: GOOD (  23.00  )
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

Hi Miquel,

On 24-07-17, Miquel Raynal wrote:
> Hi Marco,
> 
> > > > > Overall I think the idea of getting rid of these misc/ drivers is goes
> > > > > into the right direction, but registering directly into NVMEM makes
> > > > > more sense IMO.    
> > > > 
> > > > So you propose to have two places for the partition handling (one for
> > > > MTD and one for NVMEM) instead of one and moving the code into NVMEM
> > > > directly?  
> > > 
> > > Why two places for the partitions handling? Just one, in NVMEM. Also  
> > 
> > Without checking the details I think that converting the MTD
> > partitioning code into NVMEM partitioning code is a bigger task. As you
> > said below there are many legacy code paths you need to consider so they
> > still work afterwards as well.
> > 
> > > usually EEPROMs don't require very advanced partitioning schemes,
> > > unlike flashes (which are the most common MTD devices today).  
> > 
> > As said in my cover letter EEPROMs can become quite large and MTD
> > supports partitioning storage devices which is very handy for large
> > EEPROMs as well.
> 
> Did you had a look at nvmem-layouts ? In particular the fixed-layout.

Yes I had a look at nvmem-layouts and we use them within a
mtd-partition. Using them instead of a mtd-partition is not sufficient
since they:
 1) don't support user-space write (I send a patch for it but it doesn't
    seem to be accepted soon).
 2) If write would be supported the user-space need to write the
    complete cell e.g. no partial writes.

> Is there anything you would like to achieve already that is not
> possible with nvmem but is with mtd?

Please see above.

Regards,
  Marco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
