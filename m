Received: from nz-out-0506.google.com ([64.233.162.233])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEwZo-0003e5-8G
	for linux-mtd@lists.infradead.org; Wed, 16 Jan 2008 00:56:20 +0000
Received: by nz-out-0506.google.com with SMTP id z3so51500nzf.27
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jan 2008 16:52:21 -0800 (PST)
Message-ID: <f17812d70801151652s739fd05eyfc82ab569d8efdd7@mail.gmail.com>
Date: Wed, 16 Jan 2008 08:52:21 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: spodstavin@ru.mvista.com
Subject: Re: [PATCH] basic pxa3 nand controller support
In-Reply-To: <1200051862.1727.75.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <loom.20080107T001557-159@post.gmane.org>
	<1200051862.1727.75.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jan 11, 2008 7:44 PM, Sergey Podstavin <spodstavin@ru.mvista.com> wrote:
> This is a fixed version for pxa3 nand controller,
> working on pxa300 Zylonite

great, thanks for trying this. It looks like a bunch of things are added back
from previous marvell released packages :-)

1. io mapping is not recommended for peripheral drivers, we instead use
   ioremap() in the nand driver, so it's not a must to map those registers
   when pxa_map_io()

2. as I said, those DRCMRxx macros can be well replaced by DRCMR(xx),
   the original DRCMR(xx) macro has an issue, which is corrected by
   recent patch sent to RMK, and is supposed to be merged in recent
   .24-rc7

3. partition tables should be moved outside of the driver into platform
   code

Apart from the above, could you let me know which modifications you
made this work? You know it's a big patch, and is difficult for line to line
comparison with my original one..., thanks!

>
> Best wishes,
> Sergey Podstavin.
>
>
> >eric miao <eric.y.miao <at> gmail.com> writes:
> >
> >> Early feedback is welcome, thanks!
> >
> >Hi Eric
> >
> >Overall the patch looks good, just a few comments.
> >
> >The patch does not apply cleanly unless I remove the spurious newline before
> >line 1284 resulting in the following error:
> >patch: **** malformed patch at line 1284: pm_message_t state)
> >
> >The DRCMR97 register is not defined anywhere, at lest not in 2.6.24-rc6:
> >drivers/mtd/nand/pxa3xx_nand.c:542: error: 'DRCMR97' undeclared (first use in
> >this function)
> >
> >The registers and bit definitions should be moved to pxa-regs.h, not?
> >
> >I had my troubles getting it to work on a custom PXA320 board. I kinda figured
> >out what platform data it needs, but still can't seem to get it to work properly:
> >pxa3xx-nand pxa3xx-nand: failed to detect flash
> >
> >What kernel does your patch apply to? What CPUs/boards did you try it on? Can
> >you provide an example platform integration required to make it work?
> >
> >Cheers
> >
> >Marcel
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>



-- 
Cheers
- eric
