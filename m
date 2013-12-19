Received: from mail-db9lp0251.outbound.messaging.microsoft.com
 ([213.199.154.251] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtYgD-0006k5-Sn
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 08:10:02 +0000
Date: Thu, 19 Dec 2013 15:39:57 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: GPMI-NAND ECC DT binding (was: Re: [PATCH v3 22/28] mtd: nand:
 pxa3xx: Introduce multiple page I/O support)
Message-ID: <20131219073955.GA15264@shlinux2.ap.freescale.net>
References: <1383656135-8627-23-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131105190432.GQ20061@ld-irv-0074.broadcom.com>
 <20131106011351.GH11759@localhost>
 <CAN8TOE_ZmcsvShKY273KQCaopJEXgtXVR1XY9pP5EKkUK+bUbA@mail.gmail.com>
 <20131106113210.GB2616@localhost>
 <20131118181009.GZ9468@ld-irv-0074.broadcom.com>
 <20131118183325.GC21975@localhost>
 <20131118185059.GB9468@ld-irv-0074.broadcom.com>
 <20131204214125.GC27149@ld-irv-0074.broadcom.com>
 <20131219073138.GB10846@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131219073138.GB10846@norris-Latitude-E6410>
Cc: devicetree@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 18, 2013 at 11:31:38PM -0800, Brian Norris wrote:
> (Trim the CC list)
> 
> Hi Huang,
> 
> On Wed, Dec 04, 2013 at 01:41:25PM -0800, Brian Norris wrote:
> > I'd like to follow up on this question, since you didn't answer it, and
> > it's still relevant, since we haven't yet merged your GPMI DT binding
> > (it's queued for the next merge window):
> > 
> > On Mon, Nov 18, 2013 at 10:50:59AM -0800, Brian Norris wrote:
> > > Do you have a good reason why you needed GPMI NAND to choose the ECC
> > > configuration (a la "miminum ECC") instead of fully specifying your ECC
> > > selection in device tree? I recall most of your arguments were about
> > > using an ECC strength that leaves room for user data in OOB (e.g., with
> > > JFFS2). But you could have done the same thing by creating a proper DT
> > > property to describe the desidered ECC strength, with no real
> > > disadvantage, right?
> > 
> > I'll rephrase it: why can't/don't you define a GPMI binding for the
> > actual ECC level, like:
> > 
> >   fsl,nand-ecc-strength and fsl,nand-ecc-sector
> > 
> > ?
> > 
> > Then, you could still default to the old geometry if these properties
> > aren't present, and you don't have to rely on Linux auto-detecting ECC
> > properties for non-ONFI chips.
> 
> Ping? Do you have any comment here? It seems like a more precise DT
sorry, i did not see this email.

> binding could still be useful for GPMI NAND.
agree.

but i suggest add a more common DT for it. I think other drivers may also
use it.
We have "nand-ecc-mode" now, why not add a more generic dt such as:
    "nand-ecc-strength" 



thanks
Huang Shijie
