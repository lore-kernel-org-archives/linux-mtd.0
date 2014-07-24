Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAMHS-0004UO-6c
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 16:54:10 +0000
Received: by mail-pd0-f175.google.com with SMTP id r10so4000617pdi.20
 for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2014 09:53:47 -0700 (PDT)
Date: Thu, 24 Jul 2014 09:53:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: nand: define struct nand_timings
Message-ID: <20140724165342.GE3711@ld-irv-0074>
References: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
 <1405064982-11456-2-git-send-email-boris.brezillon@free-electrons.com>
 <20140722120346.0f2d0e77@parrot.com>
 <20140722141219.7f2c2890@bbrezillon>
 <20140724115650.46cbb3cf@parrot.com>
 <20140724121607.135631aa@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140724121607.135631aa@bbrezillon>
Cc: linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 24, 2014 at 12:16:07PM +0200, Boris BREZILLON wrote:
> On Thu, 24 Jul 2014 11:56:50 +0200 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
> [...]
> > > > 
> > > > I did a similar patch [1] (that wasn't merged :( ), and I used reduced
> > > > timing info.
> > > 
> > > I'm sorry it didn't make it to mainline, do you know why ?
> > For the omap part there was a gpmc code rewrite that conflict with the
> > patch.
> > For the mtd stuff, I don't know/remember (I think for was no reply).

Likely. Even today (with me spending more time on MTD), things can still
fall through the cracks :(

> > > Could you point out where "reduced timing info" is defined in the ONFI
> > > specification ?
> > It is not defined on onfi.
> > This was more a simplification of timings in order to simplify the
> > driver side (avoid code duplication). Most controller allow to control
> > nRE and nWE pulse and the setup time.
> > 
> > Do you have drivers that use onfi timings ?
[...]

I have hardware which can use a few timings (tWP, tWH, tRP, tREH, tCS,
tCLH, tALH, tADL, tCCS, tWB, tWHR, tREAD). I don't currently optimize
the timings in my driver, but this work could be useful.

> > > > I also have support for the omap driver
> > > > (http://article.gmane.org/gmane.linux.ports.arm.omap/88606/match=) and
> > > > a controller we use in our chip (not upstream).
> > > 
> > > It should be pretty easy to convert the full timings list into a
> > > reduced one (actually, that's what your patch is doing), and you can
> > > thus port your work on top of these patches.
> > Yes I think an helper will be useful in order to help driver to use
> > these timings.
> > It can be a function that return the reduced version for a onfi mode
> > and edo support.
> 
> I'm not against the helper function (Brian, any opinion), but I'm not
> sure we should call these timings "reduced onfi timings" as they are
> not defined in the ONFI spec.

No argument against a simplifying helper. I think it's good to get the
full timings, but if drivers need some similar computations to calculate
more helpful timings, then that sounds like a good idea.

I agree we should avoid the 'ONFI' name on things that aren't exactly
ONFI.

> > > Anyway, I'm not sure what you have in mind, but unless there is a strong
> > > reason to drop full timings in favor of reduced ones I'd like to
> > > keep them (even if this implies adding a new converter to get reduced
> > > timings list).
> > > 
> > No problem. I have nothing special in mind. I hope this could give ideas
> > how to use the onfi timings in mtd drivers (understanding how to use
> > ONFI timings can be tricky).
> > 
> 
> Okay, as I said I'm not opposed to a new helper function that provide
> what you called "reduced timings", so feel free to propose
> something ;-).

Yes, please! Sometime I'll take a closer look at Matthieu's old patch,
as well as Boris's initial sunxi NAND driver and my own hardware and see
if things align well enough. But patches are welcome. I just merged
Boris's stuff as a starting point (no one uses it yet), since similar
questions were coming up in another NAND driver submission (Lee Jone's
STMicro NANDi (?) driver).

Brian
