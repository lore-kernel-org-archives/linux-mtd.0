Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXwb2-0005QJ-7C
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 12:25:01 +0000
Date: Mon, 3 Aug 2009 14:20:27 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [Patch 1/1] don't suspend erase for erase in cfi_cmdset_0002
In-Reply-To: <OF421EAE7A.7052F119-ONC1257607.0042E5EF-C1257607.00432D9F@transmode.se>
Message-ID: <Pine.LNX.4.63.0908031412500.17084@redbean.intranet.gw-instruments.de>
References: <Pine.LNX.4.63.0908031237170.17084@redbean.intranet.gw-instruments.de>
	<OFB6C7C37A.2F2E4229-ONC1257607.00415F5E-C1257607.0041DA2F@transmode.se>
	<OF421EAE7A.7052F119-ONC1257607.0042E5EF-C1257607.00432D9F@transmode.se>
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



On Mon, 3 Aug 2009, Joakim Tjernlund wrote:

> 
> 
> >
> > >
> > >
> > > Hi,
> > >
> > > came around this problem while stress testing jffs2. From time to time the
> > > block erase failed and the file system overflows. I don't know if there
> > > are any Nor chips out there which allow a new erase to start when in erase
> > > suspend. However, the chips on my board dont't. And even when it doesn't
> > > make much sense to suspend an erase operation for another erase.
> > >
> > > Patch below fixes the problem for me.
> > >
> > > Have fun and take care,
> > >
> > > Peter
> > >
> > > Signed-off-by: Peter Wippich <pewi@gw-instruments.de>
> > > ---
> > > diff -Naur a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c   2007-07-10 20:56:30.000000000 +0200
> > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c   2009-08-02 19:55:34.000000000 +0200
> > > @@ -521,6 +521,10 @@
> > >     case FL_ERASING:
> > >        if (mode == FL_WRITING) /* FIXME: Erase-suspend-program appears broken. */
> > >           goto sleep;
> > > +      if (mode == FL_ERASING) {
> > > +         printk(KERN_INFO "attempt erase suspend with mode FL_ERASING\n") ;
> > > +         goto sleep;
> > > +      }
> > >
> > >        if (!(   mode == FL_READY
> > >              || mode == FL_POINT
> > >
> >
> > This change looks bogus. You are not supposed to need the extra test.
> > I do think this test is faulty though:
> >
> >    if (!(   mode == FL_READY
> >             || mode == FL_POINT
> >             || !cfip
> >             || (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))
> >             || (mode == FL_WRITING && (cfip->EraseSuspend & 0x1)
> >           )))
> >
> > What happens if cfip is NULL?
> 
> eeh, and what if erase suspend isn't supported at all?
> Take a hint from cfi_cmdset_0001.c

Just double checked the data sheet (it's a SST39VF6401B). Erase suspend is 
supported. And the suspend seems to work fine. Just the subsequent second 
erase during suspend seems to fail. In chip_good() at the end of the 
erase it reads 0x1985 ..... instead of 0xffff. 

Actually this continues for all blocks until the suspended erase is 
resumend. After that everything works fine again. 

Will check the other issue you pointed out later on. 

Peter 
 

|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
