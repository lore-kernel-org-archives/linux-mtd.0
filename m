Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQyai-0007fE-1v
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 15:44:06 +0000
Date: Tue, 10 Jan 2017 16:43:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Rosin <peda@axentia.se>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: On-die ECC support
Message-ID: <20170110164340.6b3c1f7e@bbrezillon>
In-Reply-To: <d2765cf2-2bf7-89e6-f7b0-19e5847bab24@nod.at>
References: <45d6eb07-d6f0-1ac1-bd50-ef913a2826d8@axentia.se>
 <a00bb5bf-abdb-ce5f-e644-492b54d348c5@nod.at>
 <2679512d-6646-18c0-d000-494642d66f32@axentia.se>
 <d2765cf2-2bf7-89e6-f7b0-19e5847bab24@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

On Tue, 10 Jan 2017 16:30:01 +0100
Richard Weinberger <richard@nod.at> wrote:

> Peter,
> 
> Am 10.01.2017 um 15:54 schrieb Peter Rosin:
> > On 2017-01-09 22:46, Richard Weinberger wrote:  
> >> Peter,
> >>
> >> Am 09.01.2017 um 22:37 schrieb Peter Rosin:  
> >>> Hi!
> >>>
> >>> AFAICT, on-die ECC support [1] (continues in [2]) was never upstreamed
> >>> and the patches no longer applies. I wonder if someone has done the
> >>> work to forward port them to recent kernels?  
> >>
> >> Nope.
> >>
> >> Supporting On-die ECC in a proper way is with the current MTD NAND code
> >> not possible.  
> > 
> > Hmm, has something fundamental changed since the patches were proposed
> > that makes it impossible? Or is it just the same as it was a couple of
> > years ago, but different mechanics (changes to layout handling etc)?  
> 
> No, it turned out to be very complicated to support On-Die for all
> possible NAND controllers.
> Drivers can use existing helper functions or provide their own functions.
> But for On-Die ECC you'd have to hook all of them.
> That's why most On-Die ECC patches touch also a lot of driver code instead
> only the NAND framework.
> 
> Of course it is doable and not rocket science this but it needs more work.
> AFAIK also Boris thought about that while re-factoring the code.

Well, we have 2 problems here:
1/ On-die ECC is usually vendor specific and each vendor implements it
   with its own set of private cmd sequence. We thus need to provide
   generic helpers and ask vendor drivers to implement them correctly.
   Even if this is not enough, this series [1] should help address this
   problem.
2/ NAND controller drivers are free to support only a minimum set of
   cmds (basically, read/program and erase), and the core has
   currently no way to know what's supported by a NAND controller.
   That's IMO the biggest problem here. We need to improve the NAND
   framework to let NAND controller expose what they really support so
   that a decision can be taken at the core level regarding on-die ECC.
   We also need to dissociate the ECC/NAND controller concepts, which
   are usually tightly linked together in NAND controller drivers
   (with no way to disable the ECC engined embedded in the controller).

> 
> >> I stopped working on it since I have no longer access to working
> >> On-die ECC hardware and On-die ECC is a dead horse.  
> > 
> > Maybe so, but here I am with a desire to use a new kernel with old
> > hardware...  
> 
> If you want to continue the work on the patches, you're very welcome.
> Please see also the patches on BENAND support.

Yep, that's really the kind of feature that can help us improve the
NAND framework, so, as Richard said, I'd be happy to help anyone
interested in working on this feature.

Thanks,

Boris

[1]https://lkml.org/lkml/2017/1/9/270
