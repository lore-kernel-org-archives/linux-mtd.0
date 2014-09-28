Date: Sun, 28 Sep 2014 15:03:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 0/5] m25p80,spi-nor: Fix module aliases for m25p80; clean
 up chip identification
Message-ID: <20140928220300.GB3248@norris-Latitude-E6410>
References: <1410714624.3040.38.camel@decadent.org.uk>
 <1410714795.3040.45.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410714795.3040.45.camel@decadent.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 linux-spi <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 14, 2014 at 06:13:15PM +0100, Ben Hutchings wrote:
> On Sun, 2014-09-14 at 18:10 +0100, Ben Hutchings wrote:
> > The first patch in the series restores the module aliases to m25p80, but
> > it does so by duplicating the list of names.  This should be suitable
> > for stable, but it isn't viable in the longer term.
> > 
> > The following patches change the spi-nor interface so that this
> > duplication is no longer necessary.  This includes removing
> > spi_nor::read_id, but it could be re-added after this with a different
> > interface, e.g. returning a flash_info structure (which would need to be
> > defined in spi_nor.h).
> 
> Note that these patch are:
> - Based on your 'testing' branch

Which testing branch? These two are the only official
repos for MTD:

    git git://git.infradead.org/linux-mtd.git
    git git://git.infradead.org/l2-mtd.git

> - Untested by me, aside from compiling and checking that m25p80 has the
>   expected module aliases

Brian
