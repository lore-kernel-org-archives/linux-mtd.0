Received: from kirsty.vergenet.net ([202.4.237.240])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rx9Df-0005oC-Ga
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 03:38:20 +0000
Date: Tue, 14 Feb 2012 12:38:10 +0900
From: Simon Horman <horms@verge.net.au>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 0/7] SH Mobile sh_flctl driver brush up
Message-ID: <20120214033810.GF21094@verge.net.au>
References: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
 <1329140515.22240.145.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1329140515.22240.145.camel@sauron.fi.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>,
 Bastian Hecht <hechtb@googlemail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 13, 2012 at 03:41:55PM +0200, Artem Bityutskiy wrote:
> On Sat, 2012-02-11 at 12:44 +0100, Bastian Hecht wrote:
> > This patch series brushs up the sh_flctl.c a bit to make it work with
> > the mackerel board. The hardware has changed and this needed to be
> > reflected in the NAND host driver.
> > On the road some minor enhancements have been incorporated.
> 
> I cannot even compile-test this patch because I get the following error:
> 
> 
> sh4-linux-gcc: error: command line option '-m4-nofpu' is not supported
> by this configuration
> 
> 
> with the cross-compiler downloaded from here:
> 
> http://kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.0/x86_64-gcc-4.6.0-nolibc_sh4-linux.tar.bz2
> 
> Could you please describe how could I compile-test it?

You may find it easier to build a kernel for mackerel using
arch arm and defconfig_mackerel.

Personally I have had good experience using Code Sourcery (now part of
Mentor Graphics?) G++ lite to compile both arm and sh kernels.
