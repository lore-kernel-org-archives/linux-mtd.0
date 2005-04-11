Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DL2Hh-0003nz-5g
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 13:01:14 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j3BH1EkU028012
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 13:01:14 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j3BH1ETw051226
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 13:01:14 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j3BH1E9G019284
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 13:01:14 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
	<f96d234e050411035522064e02@mail.gmail.com>
	<Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 11 Apr 2005 12:01:11 -0500
Message-Id: <1113238871.7520.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-11 at 07:32 -0400, Robert P. J. Day wrote:
> On Mon, 11 Apr 2005, Cliff Brake wrote:
> 
> > I am using the MTD mechanism for defining the physical area where the
> > flash lives on several PXA systems:
> >
> > CONFIG_MTD_PHYSMAP=y
> > CONFIG_MTD_PHYSMAP_START=0x0
> > CONFIG_MTD_PHYSMAP_LEN=0x4000000
> > CONFIG_MTD_PHYSMAP_BANKWIDTH=4
> >
> > You can then use the kernel command line to define the partitions:
> >
> > mtdparts=phys_mapped_flash:256k(boot)ro,0x1C0000(kernel),-(root)
> 
> that's exactly what i was looking at to see if it could do what i
> want, but for more than one chip.
> 
> > The only tricky part was figuring out the above name
> > (phys_mapped_flash).  From reading the documentation, I thought I
> > could leave the name blank, but did not work for me.
> 
> based on what i've read, i'm pretty sure you need a non-empty mtd-id,
> even if you have only one chip.  certainly, a quick glance at
> cmdlinepart.c seems to suggest it has to have some value (see the
> mtdpart_setup_real() routine).
> 
> > >   i need to be able to concatenate 2 16M chips into a single 32M
> > > address space, then partition into 5 or 6 partitions.  am i being too
> > > optimistic about not needing my own driver map program if i can use
> > > the "generic" one?
> >
> > I have not used the above with multiple chips.  MTD layer does have a
> > CONFIG_MTD_CONCAT config parameter ...
> 
> i did a bit more reading last night and concluded that the PHYSMAP
> stuff would let me define a single flash chip but no more.  so if i
> want multiple chips, it *appears* that i have to write a maps file.

See drivers/mtd/maps/mphysmap.c

josh
