Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXyBc-0007Jy-4a
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 14:06:54 +0000
Date: Mon, 3 Aug 2009 16:02:18 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [Patch 1/1] don't suspend erase for erase in cfi_cmdset_0002
In-Reply-To: <OFFB406BDC.E5A2549B-ONC1257607.0049E3EA-C1257607.004A0DC0@transmode.se>
Message-ID: <Pine.LNX.4.63.0908031541080.17084@redbean.intranet.gw-instruments.de>
References: <Pine.LNX.4.63.0908031237170.17084@redbean.intranet.gw-instruments.de>
	<OFB6C7C37A.2F2E4229-ONC1257607.00415F5E-C1257607.0041DA2F@transmode.se>
	<Pine.LNX.4.63.0908031457390.17084@redbean.intranet.gw-instruments.de>
	<OFBAEDF1C6.8F5FCB39-ONC1257607.00490427-C1257607.0049B758@LocalDomain>
	<OFFB406BDC.E5A2549B-ONC1257607.0049E3EA-C1257607.004A0DC0@transmode.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Jocke, 

On Mon, 3 Aug 2009, Joakim Tjernlund wrote:

> Joakim Tjernlund/Transmode wrote on 03/08/2009 15:25:10:
> >
> > Peter Wippich <pewi@gw-instruments.de> wrote on 03/08/2009 15:07:30:
> > >
> > >
> > > Hi Jocke,
> > >
> > > On Mon, 3 Aug 2009, Joakim Tjernlund wrote:
> > >
> > > > linux-mtd-bounces@lists.infradead.org wrote on 03/08/2009 12:50:44:
> > > >
> > > > >
> > > > >
> > > > > Hi,
> > > > >
> > > > > came around this problem while stress testing jffs2. From time to time the
> > > > > block erase failed and the file system overflows. I don't know if there
> > > > > are any Nor chips out there which allow a new erase to start when in erase
> > > > > suspend. However, the chips on my board dont't. And even when it doesn't
> > > > > make much sense to suspend an erase operation for another erase.
> > > > >
> > > > > Patch below fixes the problem for me.
> > > > >
> > > > > Have fun and take care,
> > > > >
> > > > > Peter
> > > > >
> > > > > Signed-off-by: Peter Wippich <pewi@gw-instruments.de>
> > > > > ---
> > > > > diff -Naur a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c   2007-07-10 20:56:30.000000000 +0200
> > > > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c   2009-08-02 19:55:34.000000000 +0200
> > > > > @@ -521,6 +521,10 @@
> > > > >     case FL_ERASING:
> > > > >        if (mode == FL_WRITING) /* FIXME: Erase-suspend-program appears broken. */
> > > > >           goto sleep;
> > > > > +      if (mode == FL_ERASING) {
> > > > > +         printk(KERN_INFO "attempt erase suspend with mode FL_ERASING\n") ;
> > > > > +         goto sleep;
> > > > > +      }
> > > > >
> > > > >        if (!(   mode == FL_READY
> > > > >              || mode == FL_POINT
> > > > >
> > > >
> > > > This change looks bogus. You are not supposed to need the extra test.
> > > > I do think this test is faulty though:
> > > >
> > > >    if (!(   mode == FL_READY
> > > >             || mode == FL_POINT
> > > >             || !cfip
> > > >             || (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))
> > > >             || (mode == FL_WRITING && (cfip->EraseSuspend & 0x1)
> > > >           )))
> > > >
> > > > What happens if cfip is NULL?
> > >
> > > Checked this one. Because the Chip is jedec probed (not cfi) and there is
> > > no fixup cfip should be NULL. Then the above will evaluate to :
> > >    mode == FL_READY = FALSE
> > >    mode == FL_POINT = FALSE
> > >    !cfip       = TRUE
> > >    (next two skipped, hopefully ...... ;-)
> > >
> > > End ! TRUE = FALSE -> we will not go to sleep ! Actually, it is not quite
> > > clear to me what the intention of this expression was. But if the original
> > > intention was to only allow erase suspend when requested mode is FL_READY
> > > or FL_POINT it is obviously wrong.....
> 
> > Probably:
> > if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
> >     !(mode == FL_READY || mode == FL_POINT ||
> >      (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))
> >
> > Pehaps you can remove the
> >   if (mode == FL_WRITING) /* FIXME: Erase-suspend-program appears broken. */
> >  goto sleep;
> > too? ( in a separate patch though)
> 
> Oh, you will have to fake/construct a cfip too for you JEDEC chip.
> 
>      Jocke
 
I would prefer something more readable and less tricky. How about 
something like this. 

#define ERASE_SUSPEND_NONE	0
#define ERASE_SUSPEND_READ	1
#define ERASE_SUSPEND_RW	2


if(   !( mode==FL_READY  || mode==FL_POINT) 
   ||  ( cfip && cfip->EraseSuspend==ERASE_SUSPEND_NONE)  ) 
	goto sleep ; 

For CFI probed chips or chips with fixups this will allow disabling erase 
suspend support by setting cfip->EraseSuspend an will assume at least 
erase suspend for reads on all others. 

Ciao, 

Peter   
   


|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
