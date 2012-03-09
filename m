Received: from perceval.ideasonboard.com ([95.142.166.194])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5z92-0002Jr-OV
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 12:42:06 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 0/7] SH Mobile sh_flctl driver brush up
Date: Fri, 09 Mar 2012 13:42:22 +0100
Message-ID: <6053811.8ZSk0nULEX@avalon>
In-Reply-To: <1331296632.29445.18.camel@sauron.fi.intel.com>
References: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
 <1351292.ArCFK2UoQF@avalon> <1331296632.29445.18.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>,
 linux-mtd@lists.infradead.org, Bastian Hecht <hechtb@googlemail.com>,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 March 2012 14:37:12 Artem Bityutskiy wrote:
> On Fri, 2012-03-09 at 13:14 +0100, Laurent Pinchart wrote:
> > ARCH_SHMOBILE is an ARM platform (defined in arch/arm/Kconfig).
> 
> Hmm, ok, thanks. So you say that
> 
> http://www.renesas.eu/products/soc/assp/mobile/sh_mobile/mt1/index.jsp
> 
> saying "CPU core: sh4a" actually means ARM? I must be very confused :-)

Don't trust marketing materiel ;-)

I'm not sure about that exact chip, but the SH-Mobile architecture supported 
by the Linux kernel (and renamed to R-Mobile for recent Renesas products) is 
ARM-based, with an SH-based multimedia coprocessor in most (all ?) models.

-- 
Regards,

Laurent Pinchart
