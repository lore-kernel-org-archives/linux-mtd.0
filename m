Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UfBu-0005Ob-00
	for mtd-list@infradead.org; Fri, 01 Sep 2000 02:00:22 +0100
Message-ID: <39AF00C6.DA335C86@mvista.com>
Date: Thu, 31 Aug 2000 18:05:10 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: ahennessy@mvista.com, mtd@infradead.org
Subject: Re: MTD support for 8x16 devices
References: <39AC4D1F.BFBEEA21@mvista.com>  <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> <9503.967625312@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> ahennessy@mvista.com said:
> >  Has any of this already been checked in recently?  And what is the
> > procedure?
>
> St=E9phane already pointed you at the latest CVS. If you want write acc=
ess,
> let me have a SSH public key and a sample of your work :)

Ok, I will do that.  I also just found out  that I need to subscribe to t=
he
mtd-cvs list to follow what is being checked in?

>
>
> Can you confirm the mapping of the flash chips - you've got two interle=
aved
> 16-bit devices ('2_by_16') but you can only actually access them a byte=
 at
> a time? What is the CPU? What happens if you _do_ try to read a whole w=
ord
> instead of only a byte?

One product has two interleaved 16 devices and is recognized as such by
cfi_probe_new_chip() and can be read as a whole word.

The other product has a single strata chip (8x16 variety) set in byte mod=
e so
the bus width is 1.  The cfi ident info is requested at address 0xaa and =
read
starting at 0x20 so this is new code that I've added.   I'll  merge my co=
de to
make use of the new define CFI_DEVICETYPE_X8 which I'm assuming was added=
 for
this purpose?

The CPU is  PPC405GP.

>
>
> ahennessy@mvista.com said:
> >  I'm also thinking about different ways for the partition sizes to be
> > set outside of physmap.c.   - any opinions?   Perhaps board specifics
> > should be contained in a header file and be set via menuconfig or
> > command line or ?
>
> I think it's probably best to keep it in a header file or in physmap.c
> itself. The driver can default to no partitioning, and we can set up so=
me
> #defines at the beginning which allow people to change it as they see f=
it.

Ok.

>
>
> ahennessy@mvista.com said:
> > 4.   I need to implement a char device where the customer wants to
> > write to the flash and have all the erase details handle by the
> > driver.  They want to simply do a dd into the device.
>
> No. Erase is a single ioctl() call, or a single invocation of the
> 'eraseall' utility. The customer is wrong. :)

Sooo,  I need to do the extra logic outside the driver level. ;)

> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Thanks,

Alice




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
