Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14gFJU-0007AQ-00
	for mtd-list@infradead.org; Fri, 23 Mar 2001 00:20:20 +0000
Received: from natsemi-bh.nsc.com ([204.163.202.66])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14gFJS-0007AK-00
	for mtd@infradead.org; Fri, 23 Mar 2001 00:20:18 +0000
Message-ID: <3ABA95DC.C72761AC@nsc.com>
Date: Thu, 22 Mar 2001 17:16:28 -0700
From: "Raymond Danks" <Raymond.Danks@nsc.com>
MIME-Version: 1.0
To: "Raymond Danks" <ray@rbtech.org>,
        "Sanjay Gajendra" <Sanjay.Gajendra@nsc.com>
cc: "Brian Otteman" <brian.otteman@ia.nsc.com>, mtd@infradead.org
Subject: Re: MTD,JFFS on JEDEC devices with uClinux-2.0.38.1pre7
References: <000001c0b107$4a8fcf40$a34c57d8@rbtech.org>
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Stephen,

Hi.  Thanks for the advice.  I also checked out the mtd@infradead.org list.
I went and got the latest snapshot that I think David Woodhouse is
maintaining.  He has edited the jedec.c a little from what is in the 2.4
kernel to resolve the compilation issues with bank_size and bus_width.  I
also changed the do_cfi_probe to do_jedec_probe in physmap.c and enabled
CONFIG_MTD_JEDEC.

Everything compiles correctly, however, I still cannot get to the flash.

I am getting:

physmap flash device: 2000000 at ffe00000
Failed to ioremap
physmap.o: init_module: Input/output error

This is the same as what I was getting when running do_cfi_probe.  I looked
at physmap.c and it looks like the ioremap is being run before
do_jedec_probe, so it seems that my problem lies elsewhere.  I know that I
have the correct addressing and bus width, so I am wondering whether I have
to tweak the ioremap.  Do you know anything about this or about how the
2.4.0 kernel remaps io addresses.

The other possibility I guess is that I am loading these modules
incorrectly.  The way I configured it, I have 10 modules:

cfi_cmdset_002.o
cfi_probe.o
cfi_jedec.o
cstm_cfi_jedec.o
jedec.o
map_rom.o
mtdblock.o
mtdchar.o
mtdpart.o
physmap.o

I went into cstm_cfi_jedec.c because the failure output was a little more
informative.  After putting my flash addressing into this file I managed to
come up with the same error that I am getting with physmap.o, so I'm back to
square one.

Do you have any recommendations??  I may go back and build this stuff into
the 2.2.18 kernel in the meantime.

Thanks for any help,

Ray

Raymond Danks wrote:

> -----Original Message-----
> From: root [mailto:root]On Behalf Of Stephen Brasher
> Sent: Monday, March 19, 2001 4:23 PM
> To: Raymond Danks
> Subject: Re: MTD,JFFS on JEDEC devices with uClinux-2.0.38.1pre7
>
> Raymond Danks wrote:
> >
> > Stephen or whoever else can help,
> >
> > This thread caught my attention because I am attempting to set up an
> > AM29F016D Flash device under the 2.4.0 kernel.
>
> These chips are jedec, not cfi.  You need to configure the kernel for
> jedec
> chips and fix the jedec code in mtd/kernel/jedec.c.  Also, in version
> 2.0.38,
> there is no way to specify the starting address of the jedec chips.  I
> had
> to use physmap and modify it to call jedec_probe to find the flash
> chips.
> Also had to modify physmap.c to do the reads and writes from the flash.
> Don't
> know what you will have to do on 2.4 to get jedec support.
>
> Also, the sector size of you flash chips is 64K.  JFFS does not work
> well
> with large sectors.  In my environment, I have 4 chips interleaved with
> 256k sectors and am in the process of modifying jffs to handle this
> large
> size.  JFFS looks like it works well with flash cards and cfi chips, but
> doesn't work well with jedec.
>
> If you have any questions, email me direct.
>
> Good luck,
>
> Steve




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
