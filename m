Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PTkx1-0001kt-Az
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2010 00:47:08 +0000
Date: Fri, 17 Dec 2010 15:52:19 -0800
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Subject: Re: [PATCH] MTD: NAND: ams-delta: drop omap_read/write, use ioremap
Message-ID: <20101217235218.GU5941@atomide.com>
References: <201012151543.46341.jkrzyszt@tis.icnet.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201012151543.46341.jkrzyszt@tis.icnet.pl>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Janusz Krzysztofik <jkrzyszt@tis.icnet.pl> [101215 06:44]:
> There is a common requirement for not using OMAP specific omap_readw() / 
> omap_writew() function calls in drivers/, but replace them with 
> readw() / writew() on ioremap()ped addresses passed from arch/ instead.
> 
> The patch implements this idea for the Amstrad Delta NAND driver. To be 
> able to use the modified driver, the board file is updated with the 
> platform device I/O resource declaration, which is passed from there.
> 
> Created and tested against linux-2.6.37-rc5, on top of recent patch 
> 'MTD: NAND: ams-delta: convert to platform driver'.

Acked-by: Tony Lindgren <tony@atomide.com>
