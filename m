From: splee@plexio.com (Stephen Lee)
Date: 31 Mar 2003 08:31:24 -0800
Subject: mtd devices inaccessible
In-Reply-To: <3E88683E.65177484@thales-e-transactions.com>
References: <3E885040.41874936@thales-e-transactions.com>
 <1049124294.15393.190.camel@ralph.plexio.private>
 <3E88683E.65177484@thales-e-transactions.com>
Message-ID: <1049128283.23625.196.camel@ralph.plexio.private>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I presume you meant a 2.5.62 kernel below. Could it be a bug in the mtd
subsystem with that developmental kernel? Are you using the MTD cvs
patches and if yes, do you really need them? Did you run "make dep"
before "make bzImage"?

Stephen
On Mon, 2003-03-31 at 08:09, Eric DEJONC wrote:
> Well, good advice, the menu seems to have been updated,
> But mtdlink.o is still required at the end of compilation:
> arm-linux-ld:cannot open drivers/mtd/mtdlink.o
> Is this the mtd driver or can I remove it from the makefile?
> 
> 
> 
> Stephen Lee a ?crit :
> 
> > On Mon, 2003-03-31 at 06:27, Eric DEJONC wrote:
> > > I'm sorry to ask so many question but,
> > > I hadn't made a clean, that's why I got a stange error, but now, I can't
> > > compile the new kernel:
> > > missing mtdlink.o
> > >         I had to modify the makefile of the drivers/mtd and remove the
> > > ifeq($below25),y) but I have a 2.5.6.2 kernel.
> > >
> > If you haven't done so, copy .config somewhere safe, run "make
> > mrproper", copy .config back and then rerun "make menuconfig" and the
> > rest of the steps to compile the kernel.
> >
> > Stephen
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
