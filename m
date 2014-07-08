Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4QJ4-0000xE-H1
 for linux-mtd@lists.infradead.org; Tue, 08 Jul 2014 07:59:19 +0000
Date: Tue, 8 Jul 2014 09:58:55 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Message-ID: <20140708095855.29c2fb87@bbrezillon>
In-Reply-To: <20140707235222.GC7537@ld-irv-0074>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074>
 <20140703100522.756f9715@bbrezillon>
 <20140707235222.GC7537@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>,
 kernel@stlinux.com, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, "Gupta,
 Pekon\"" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 7 Jul 2014 16:52:22 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Thu, Jul 03, 2014 at 10:05:22AM +0200, Boris BREZILLON wrote:
> > On Wed, 2 Jul 2014 17:22:37 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> > > On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:
> > > > +
> > > > +	nand_timing0: nand-timing {
> > > > +		sig-setup	= <10>;
> > > > +		sig-hold	= <10>;
> > > > +		CE-deassert	= <0>;
> > > > +		WE-to-RBn	= <100>;
> > > > +		wr-on		= <10>;
> > > > +		wr-off		= <30>;
> > > > +		rd-on		= <10>;
> > > > +		rd-off		= <30>;
> > > > +		chip-delay	= <30>;		/* delay in us */
> > > > +	};
> > > 
> > > You didn't document any of this node. And I don't think we want to
> > > specify every single timing parameter in DT; it may make sense to use
> > > Boris Brezillon's approach (I note this further down, in the driver
> > > code) for mapping non-ONFI NAND timings into a compatible ONFI timing
> > > mode. This will greatly simplify the bindings needed, since it's
> > > standardized and auto-detectable in many cases.
> > 
> > 
> > AFAIR, the NAND timing representation for non-ONFI chips question was
> > left unanswered:
> > 
> > https://lkml.org/lkml/2014/5/20/581
> > 
> > I can definitely respin my NAND timings series, but I'd like to be sure
> > this is how you want it done before doing so.
> 
> Can we start by supporting ONFI-only (or ONFI-only, plus entries in
> nand_flash_ids[]), and have nand_base provide the translation so drivers
> can retrieve the info? Then we can begin supporting new drivers like
> Lee's, and worry about the DT question separately.

So, basically, I just send a new series with patch 1 and 2 from my sunxi
NAND series [1] (including the fixes you suggested, of course), right ?

[1] http://thread.gmane.org/gmane.comp.hardware.netbook.arm.sunxi/7977



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
