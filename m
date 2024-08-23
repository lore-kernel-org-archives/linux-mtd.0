Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CDFC5321D
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9arLFU0VEMVGBUXz3MX+skgDG30MtSJ9Bty+mg0uQdw=; b=FyT7AcfEZn04xt
	O+EYyME9BS7En/v188Y7/6sIUWY2wqsmoOY8vBoL6SzQ3Q/UQse024dxo/oBu3ImilhC2tx89Otea
	CIU+rsrLD40og9JDPS6b9gHErqNH4y9Ug03unPcy5L4HrNW7GPqraYj+6XwfY1P7A0dBEyfLmKJ4L
	9UspMOMQVK+0knAyq7iRAjZJwnze9GruQJNCKEM7bBUrJ7T7YZp9P9XD/jciNydi0GHRgtNQDqtRy
	TvHyXcrQmvJ6wFVi24KW+0SVtxe23Gp0gQYgCvxAg13OwpoAtUWVsMt1ydVU/e2cVH9YibLMDcQnu
	TrpniiocFy+32VIJiecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX6Z-0000000HYAF-4Bzk;
	Fri, 23 Aug 2024 16:25:40 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX6X-0000000HY8y-056W;
	Fri, 23 Aug 2024 16:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724430337; x=1755966337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XMbUYBDHmzNIbQnFO5jFhgJPAAWpbvUV37uWE91XYY=;
  b=TEdeqrfcbxLx99L9+0cq0VBP1FYsYkQCqyGgpEXXB7NgjLpHZmGEZM1o
   NQx9TreuB4uzCjjmgwPmZd4TZ4zYq1JJJPbtCS5UWIAgG4VmaQp80lwTX
   UDzzfk3z7DoOLXf17bp1gbFtAz7ALyzMi4oenXbDOjNewuDt53YSbDZ/5
   4UFEQqQ+4RWJSm+o6hc4Rl+j1HvjrGFwfdj7wqu2RbK/LNo/o3iTeK4jz
   ZMGCGPBnYcSyUWhURFT+PZt683e2Pv2B48DjJsthobbO70wbeYaEPWx2Y
   rBIcRHHhvf0+OXYffMtR54DlUuEWXdoL821XPp1c553YjUVva109/sXfB
   Q==;
X-CSE-ConnectionGUID: LDd3H809SVaL0jj1mrdSVQ==
X-CSE-MsgGUID: BOFOAmrXQlqQD8oodvxyNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22504142"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22504142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:25:35 -0700
X-CSE-ConnectionGUID: TyAhmqenSA+fGrOHJsVz6g==
X-CSE-MsgGUID: lexLTyUnSgSoAmUAGKiMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61694525"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:25:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1shX5I-00000000r8v-11Le;
	Fri, 23 Aug 2024 19:24:20 +0300
Date: Fri, 23 Aug 2024 19:24:19 +0300
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
Message-ID: <Zsi3s9XithGEROwX@smile.fi.intel.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_092537_101084_1763B641 
X-CRM114-Status: GOOD (  20.18  )
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

On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> This series adds the intial support to handle EEPROMs via the MTD layer
> as well. This allow the user-space to have separate paritions since
> EEPROMs can become quite large nowadays.
> 
> With this patchset applied EEPROMs can be accessed via:
>   - legacy 'eeprom' device
>   - nvmem device
>   - mtd device(s)
> 
> The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> 
> Note: I'm not familiar with Kconfig symbol migration so I don't know if
> the last patch is required at the moment. Please be notified that the
> list of recipients is quite large due to the defconfig changes.

FWIW, I think that MTD is *not* the place for EEPROMs.

Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
historical reasons and absence an umbrella subsystem for them), but it's not
the reason to hack them into something which is not quite suitable.

If NVMEM needs to be updated and may cover these cases after all (and do not
forget about *small* size EEPROMs that most likely appear on the devices with
limited amount of resources!) in a reasonable size and performance, why not?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
