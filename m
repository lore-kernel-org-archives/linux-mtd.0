Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DKxBp-0002hY-A6
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 07:34:50 -0400
Date: Mon, 11 Apr 2005 07:32:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Cliff Brake <cliff.brake@gmail.com>
In-Reply-To: <f96d234e050411035522064e02@mail.gmail.com>
Message-ID: <Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
	<f96d234e050411035522064e02@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 11 Apr 2005, Cliff Brake wrote:

> I am using the MTD mechanism for defining the physical area where the
> flash lives on several PXA systems:
>
> CONFIG_MTD_PHYSMAP=y
> CONFIG_MTD_PHYSMAP_START=0x0
> CONFIG_MTD_PHYSMAP_LEN=0x4000000
> CONFIG_MTD_PHYSMAP_BANKWIDTH=4
>
> You can then use the kernel command line to define the partitions:
>
> mtdparts=phys_mapped_flash:256k(boot)ro,0x1C0000(kernel),-(root)

that's exactly what i was looking at to see if it could do what i
want, but for more than one chip.

> The only tricky part was figuring out the above name
> (phys_mapped_flash).  From reading the documentation, I thought I
> could leave the name blank, but did not work for me.

based on what i've read, i'm pretty sure you need a non-empty mtd-id,
even if you have only one chip.  certainly, a quick glance at
cmdlinepart.c seems to suggest it has to have some value (see the
mtdpart_setup_real() routine).

> >   i need to be able to concatenate 2 16M chips into a single 32M
> > address space, then partition into 5 or 6 partitions.  am i being too
> > optimistic about not needing my own driver map program if i can use
> > the "generic" one?
>
> I have not used the above with multiple chips.  MTD layer does have a
> CONFIG_MTD_CONCAT config parameter ...

i did a bit more reading last night and concluded that the PHYSMAP
stuff would let me define a single flash chip but no more.  so if i
want multiple chips, it *appears* that i have to write a maps file.

rday
