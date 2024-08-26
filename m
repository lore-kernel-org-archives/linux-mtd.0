Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB6C5472E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjgWlE7/5+QGaEfrkNN9DLfBLDDfspAcfUHMjSs2kVw=; b=l15fbqNPrTqNjW
	QaY/XlVTR9DiW7p+iwcEVjvKYfNTrUSBWAP2ngg69DNvpsVFclcjPJX4uol51dR6ql7IBOt6Bb8Y8
	IFLV7f37EEoevdg7G6hz1ocxR7gsxCvUROew0MXPsxmc4GDCwXHQ6L09tKVxF97N6ZcVVK6fG+3KI
	wyKKrhknl3AXUrID1qpRLJviyg3vwuM71QKmU2MqAa07UaihFDMbYf5/glbNAj0MBUAFOP1cXHdLq
	kzZ+D7Xo5BXKkK/TMMO0b1x+/qTsg/0V/InZ65zzJGrj1rhqCgnqweIYi2M1P+i14ncamplrOySzH
	3iGB1sdJ+jqWUVhwWcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX2J-00000006wdt-3ge5;
	Mon, 26 Aug 2024 10:33:23 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX2G-00000006wcv-0R0k;
	Mon, 26 Aug 2024 10:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668400; x=1756204400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gNhFuofD5zWGUNIriljHUVsJipVG7nNNSIviq4tVXY=;
  b=PBr33TEqAxa6oXIYUqlqogS0qw3ecJ6OaXfrmy2i+mf6viewGaswONx1
   DIk1uTXjDwqGHaTXAZjewxDdli55634Vrwb/sNjUMk8pa1Q8ThCXAAbbE
   AboXODsq5L51l8VqrUehoSwiq7+JzKiuS08QLyBitBjNoTKFT7Zq8MHbd
   r8snKCyH9+feUYwq6In53r/zwqqnxWIIasfGFrtbwPJPE6MzeKGfxvqPL
   FgUkr0OmDRf54L/cz5OUqyipAohoTh6oNKDM61CE0x97oP75LRtWR2TIk
   hc+KONHEW7uK1ubbDC8jbFfwIMVwhLWhbQnTAKch1t5l2dyOXxaAzWsC6
   w==;
X-CSE-ConnectionGUID: IP5I966wRdawPOqVRpDzjQ==
X-CSE-MsgGUID: 6e6aQh8ZSYmABj9rYZ8DHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="13208715"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="13208715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:33:13 -0700
X-CSE-ConnectionGUID: i7pAAaNJSrSUyr5xtjco/A==
X-CSE-MsgGUID: cTuMYcAhT2+25aitr3/fAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62517541"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1siX1d-00000001pi8-1NQC;
	Mon, 26 Aug 2024 13:32:41 +0300
Date: Mon, 26 Aug 2024 13:32:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
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
Subject: Re: [PATCH 0/9] AT24 EEPROM MTD Support
Message-ID: <ZsxZuvY9MLyjog-y@smile.fi.intel.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <Zsi3s9XithGEROwX@smile.fi.intel.com>
 <20240826075110.u3cxc6dootou72eq@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826075110.u3cxc6dootou72eq@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_033320_181791_0B24D4E0 
X-CRM114-Status: GOOD (  36.98  )
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

On Mon, Aug 26, 2024 at 09:51:10AM +0200, Marco Felsch wrote:
> On 24-08-23, Andy Shevchenko wrote:
> > On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> > > This series adds the intial support to handle EEPROMs via the MTD layer
> > > as well. This allow the user-space to have separate paritions since
> > > EEPROMs can become quite large nowadays.
> > > 
> > > With this patchset applied EEPROMs can be accessed via:
> > >   - legacy 'eeprom' device
> > >   - nvmem device
> > >   - mtd device(s)
> > > 
> > > The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> > > to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> > > 
> > > Note: I'm not familiar with Kconfig symbol migration so I don't know if
> > > the last patch is required at the moment. Please be notified that the
> > > list of recipients is quite large due to the defconfig changes.
> > 
> > FWIW, I think that MTD is *not* the place for EEPROMs.
> > 
> > Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
> > historical reasons and absence an umbrella subsystem for them), but it's not
> > the reason to hack them into something which is not quite suitable.
> 
> Thank you for you input. There are two things to mention:
>  1st) I send a RFC patch and asked for feedback and all I got was: looks
>       okay, please send a proper patch [1] which I did.

I was on a long vacation, I haven't had time or even wishes to look at the
patches or patch series. Sorry for that.

Second point, RFC means "request for comments", here is mine. It's up to the
maintainers and you on how to proceed it.

>  2nd) I don't see the hacky part in this patchset.

I haven't talked about patchset, I have talked about architectural / design
point of view. I read the discussion and to me it seems like it solves the
issue with a quite big hammer. If you can prove that on embedded systems with
limited resources it is not a problem, just mention that in the cover letter.

> Anyway the customer doesn't need the nvmem-partitions anymore and
> therefore this patchset can be seen as obsolote.
> 
> [1] https://lore.kernel.org/lkml/20231201144441.imk7rrjnv2dugo7p@pengutronix.de/T/#m1e0e5778448971b50a883f62bd95622f6422b9a2
> 
> > If NVMEM needs to be updated and may cover these cases after all (and do not
> > forget about *small* size EEPROMs that most likely appear on the devices with
> > limited amount of resources!) in a reasonable size and performance, why not?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
