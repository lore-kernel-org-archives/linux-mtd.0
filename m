Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13l44d-0003il-00
	for mtd-list@infradead.org; Mon, 16 Oct 2000 07:48:39 +0100
Message-ID: <39EAA48F.1FAB34F5@techno.spb.ru>
Date: Mon, 16 Oct 2000 10:47:43 +0400
From: Nick Maximov <maxs@techno.spb.ru>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Ampro again
References: <Pine.LNX.4.21.0010151510010.20018-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> On Fri, 13 Oct 2000, Nick Maximov wrote:
> 
> >
> > I have got no response from anyone.
> > Just one question -- how safe to deal with mtd drivers and firmware
> > updates (for grub) on Ampro hardware (CoreModule P5e-Q04).
> > One thing stops me -- Ampro has their own format and update
> > utilities which are incompatible with M-Systems' ones.
> 
> Ampro have their own software which is incompatible with the M-Systems
> code but works on DiskOnChip?

YES! Note about that! Ampro manual says: "Do not use M-Systems pformat
and
pupdate utilities. These utilities are incompatible. Use p5format and
p5update
instead." BUT: Using M-Systems binary linux driver for produce TrueFFS
support
under linux works OK, except booting from DoC. Patched version of lilo
does
not works properly. 

I am not sure if I have crashed my bios using M-Systems utilities, but
chance 
to crash BIOS still exists.

Are MTD drivers based originally on M-Systems implementation or you have
writen your own driver set? As I understand if M-System's code
potentially may
crash Ampro DoC2000 BIOS, such code should not be used???

DoC became unavailable is what happened in previous attempt to load new
firmware
as EXB file using doc_loadbios. :(

I do not understand the difference between NAND devices and other
devices. Which
class of device I have installed on my module?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
