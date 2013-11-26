Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlRsu-0000qL-3B
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 23:17:36 +0000
Received: by mail-ie0-f171.google.com with SMTP id ar20so10274818iec.2
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 15:17:14 -0800 (PST)
Date: Tue, 26 Nov 2013 15:17:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: Setting NAND timings parameters (Re: [RFC/PATCH v2] mtd: nand:
 pxa3xx: Remove redundant device probing)
Message-ID: <20131126231709.GL9468@ld-irv-0074.broadcom.com>
References: <1378811821-14766-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1378811821-14766-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <522F22C9.1050305@gmail.com> <20130910135729.GA32715@localhost>
 <522F2941.4030406@gmail.com> <20130924214653.GA2376@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130924214653.GA2376@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, Daniel Mack <zonque@gmail.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, matthieu.castet@parrot.com,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

I see that the removal of your driver-specific device table stalled on
this issue. Are you planning on picking it up?

On Tue, Sep 24, 2013 at 06:46:54PM -0300, Ezequiel Garcia wrote:
> On Tue, Sep 10, 2013 at 04:14:25PM +0200, Daniel Mack wrote:
> > > 
> > > Right. However, since we can easily add support to configure every controller
> > > parameter (right?) this shouldn't be a problem.
> > > 
> > > What do you think of this change, Daniel?
> > 
> > I always thought that this detail of the pxa nand driver is ugly :) But
> > I'd say before it can be merged, you need to provide code to set the
> > timing from parameters obtained from generic part. Are you working on
> > this? I'd happily test more patches.
> > 
> 
> Returning to this point: it seems we have two different cases: ONFI-compliant
> devices and non-ONFI.
> 
> For the ONFI, we can have a timings parameter table with some index according
> to the ONFI timing mode available or user-selected. This table could be
> generic (as in Matthieu Castet patch [1]) or driver specific (as in
> denali driver).

It looks like denali just uses a module parameter so the user can select
an ONFI timing mode. This isn't flexible or generically useful and
shouldn't be encouraged on new code.

If more drivers need timing information like this, I would like to see a
generic implementation like Matthieu's (although his can be improved, I
think). It's also worth noting that his code only gets information for
the SDR timing modes, not DDR. I don't know if any hardware is utilizing
DDR modes (I haven't tested it on mine), but it's worth considering
if/how this would fit into the framework.

> For the non-ONFI, we could just add platform data / device-tree bindings
> to allow to user to set the timings.
> 
> [1] http://patchwork.ozlabs.org/patch/197506/
> 
> How does this sound?

Brian
