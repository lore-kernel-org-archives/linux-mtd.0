Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tmmi196-012.telusvelocity.net
	([209.115.196.12] helo=Wakko.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 119FF4-0001dg-00
	for mtd@infradead.org; Tue, 27 Jul 1999 22:58:34 +0100
Date: Tue, 27 Jul 1999 15:58:19 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
Reply-To: Jason Gunthorpe <jgg@ualberta.ca>
To: Mike Panetta <mpanetta@realminfo.com>
cc: mtd@infradead.org
Subject: Re: FFS2 and MTD stuff
In-Reply-To: <19990727163612.B11671@alice.realminfo.com>
Message-ID: <Pine.LNX.3.96.990727154736.21218B-100000@Wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 27 Jul 1999, Mike Panetta wrote:

> What version of as86 do you use?  I cant get the bootloader to compile...
> as86 complains of invalid options...
> My version of as86 is:
> 	GNU assembler version 2.9.1 (i686-pc-linux-gnu), using BFD version 2.9.1.0.4

Erm, that's not as86 (from bcc), that's GNU as - big difference.

You can get the source code for the version of as86 that I am using at:

http://ftp.debian.org/debian/dists/unstable/main/source/devel/linux86_0.14.3.orig.tar.gz

(it is the Debian standard as86)

I'm uncertain if you can get binutils as86 to compile this source code..
it was originally written by the etherboot people to use bcc's as86. (it
uses intel syntax, not at&t)

nasm might also accept it.. donno - whatever you use to compile the boot
code in the kernel should be able to work...

Jason




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
