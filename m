Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlMFy-0002DN-3S
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 21:35:12 +0000
Received: by mail-pg0-x22b.google.com with SMTP id t3so5298620pgt.0
 for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2017 14:34:49 -0700 (PDT)
Date: Fri, 25 Aug 2017 14:34:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: atmel: Relax tADL_min constraint
Message-ID: <20170825213446.GD77953@google.com>
References: <20170823184501.7665-1-boris.brezillon@free-electrons.com>
 <20170825040913.GA68252@google.com>
 <20170825082306.3df4941e@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170825082306.3df4941e@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Aug 25, 2017 at 08:23:06AM +0200, Boris Brezillon wrote:
> On Thu, 24 Aug 2017 21:09:13 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > So I take it you're fine with falling back to this case, where you just
> > get the "max" (and "max" is not quite 400ns)?
> 
> Right, max in this specific case is 71, and AFAIK the maximum master
> clock frequency we have on atmel boards is 200MHz (cycle = 5ns), so
> we'll actually get 5 * 71 = 355ns. Given that all atmel platforms I
> know have at most ONFI 2 compliant NANDs connected on it, and
> ONFI 2 says tADL_min should be 200ns, we should be good.
> 
> BTW, I think it would be good to handle timing differences between ONFI
> versions. Right now I took the most constraining timing among all ONFI
> versions and put it in the nand_timings table, but it might be better
> to adjust some timings based on chip->onfi_version to avoid problems
> like the one I'm fixing here.

I haven't read ONFI specs in a while, but that sounds sorta reasonable.
I don't know why ONFI updates would retroactively change timings
though...

> > 
> >         /*
> >          * Let's just put the maximum we can if the requested setting does
> >          * not fit in the register field.
> >          * We still return -ERANGE in case the caller cares.
> >          */
> > 
> > Could be nice if there was some kind of sanity check still (e.g., don't
> > allow 1ns when we requested 1000ns), but I'm not sure what that would
> > be.
> 
> I can add a min_cycles argument to the atmel_smc_cs_conf_set_timing()
> function to let the caller decide what is appropriate.

Perhaps I'm not thinking through well enough, but I don't know how the
caller would make a reasonable decision about this. It sounds more like
something needed fixed in the ONFI handling, like you mention above. If
the device actually allows 200ns, we shouldn't be passing in a 400ns
specification.

Anyway, I don't think this is an immediate concern, so not worth hacking
up this patch.

> > 
> > Unless I hear screaming, I'll queue this up and send it out within a
> > day.
> 
> Thanks a lot.

Pushed to linux-mtd.git.

Brian
