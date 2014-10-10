Date: Thu, 9 Oct 2014 21:52:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 0/5] m25p80,spi-nor: Fix module aliases for m25p80; clean
 up chip identification
Message-ID: <20141010045200.GC22169@norris-Latitude-E6410>
References: <1410714624.3040.38.camel@decadent.org.uk>
 <1410714795.3040.45.camel@decadent.org.uk>
 <20140928220300.GB3248@norris-Latitude-E6410>
 <1412041673.9388.75.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1412041673.9388.75.camel@decadent.org.uk>
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

On Tue, Sep 30, 2014 at 02:47:53AM +0100, Ben Hutchings wrote:
> On Sun, 2014-09-28 at 15:03 -0700, Brian Norris wrote:
> > On Sun, Sep 14, 2014 at 06:13:15PM +0100, Ben Hutchings wrote:
> > > Note that these patch are:
> > > - Based on your 'testing' branch
> > 
> > Which testing branch? These two are the only official
> > repos for MTD:
> > 
> >     git git://git.infradead.org/linux-mtd.git
> >     git git://git.infradead.org/l2-mtd.git
> 
> You had a testing branch in
> git://git.infradead.org/users/norris/linux-mtd.git, and that included
> commit af249c3a0ca8 ('mtd: spi-nor: remove duplicated w25q128 entry')
> which this patch series depended on.

That repository is very much unofficial. I have a MAINTAINERS patch
queued up to add git://git.infradead.org/l2-mtd.git (our -next repo) to
reduce future confusion.

Regards,
Brian
