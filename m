Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13TwHW-0004D1-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 02:03:10 +0100
Received: from cerberus.colubris.com ([207.35.116.195] helo=mail.colubris.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13TwHV-0004Cv-00
	for mtd@infradead.org; Wed, 30 Aug 2000 02:03:09 +0100
Message-ID: <39AC5D30.B1D30347@colubris.com>
Date: Tue, 29 Aug 2000 21:02:40 -0400
From: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: Alice Hennessy <ahennessy@mvista.com>
CC: mtd@infradead.org
Subject: Re: MTD support for 8x16 devices
References: <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> <39AC4D1F.BFBEEA21@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi Alice,

The cfi_probe.c and cfi_cmdset_0002.c files have been modified in the CVS version
to support more bus bandwidths and chip modes.

It would seem you're working with an old version.  You should get the latest CVS
files (see how on http://www.linux-mtd.infradead.org).

-Stephane

Alice Hennessy wrote:

> Hi,
>
>  I am using the MTD driver  to accomodate two different products,  one  with
> an AMD
> and one  with an Intel Strata.   Both are the 8x16 variety.   I have several
> questions:
>
> 1. The Strata is placed on the board as a byte wide device so I've added
> another check in cfi_probe_new_chip() to try accessing the cfi ident info at
> address 0xaa as well as the 0x55  (for buswidth of 1) and return an
> "cfi_ident_adjustment" so that cfi_cfi_probe can correctly access the cfi
> ident info (since the cfi ident field InterfaceDesc hasn't been read yet).
> Is this an acceptable method to handle this?
>
> 2.  I've added code to support  1_by_8 functions in cfi_cmdset_0001.c for the
> strata.  I've also added big endian and unaligned support in
> cfi_amdext_write_2_by_16().   I've also added some support to handle different
> erase sector sizes within one chip.  Has any of this already been checked in
> recently?  And what is the procedure?
>
> 3.  For both products, I have made use of  my own combo of physmap.c and
> nora.c so that the flash address and len can be set in menuconfig and the
> flash can be partitioned.    It seems that this version of physmap.c can be
> used in a very generic way if we also move buswidth into menuconfig.   I'm
> also thinking about different ways for the partition sizes to be set outside
> of physmap.c.   - any opinions?   Perhaps board specifics should be contained
> in a header file and
> be set via menuconfig or command line or ?
>
> 4.   I need to implement a char device where the customer wants to write to
> the flash and have all the erase details handle by the driver.  They want to
> simply do a dd into the device.  They don't need a file system
> implementation.   Has there been any thought about doing this type of thing at
> the driver level?
>
> Alice
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
