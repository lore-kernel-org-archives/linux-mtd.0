Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148IBU-00007c-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 08:31:44 +0000
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD, generic physmap memory, MTD_BLOCK
Date: Mon, 18 Dec 2000 21:31:43 +0000
Content-Type: text/plain;
  charset="US-ASCII"
Cc: Nicolas Pitre <nico@cam.org>, <mstumpf@pobox.com>, <mtd@infradead.org>
References: <Pine.LNX.4.30.0012172223230.15911-100000@imladris.demon.co.uk>
In-Reply-To: <Pine.LNX.4.30.0012172223230.15911-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Message-Id: <0012182131432A.11759@www.easysolutions.net>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sunday 17 December 2000 22:24, David Woodhouse wrote:
> Unless there's something missing (or I'm being dim) that code doesn't do
> XIP. It still copies from the cramfs into the page provided to
> cramfs_readpage.
>
> What you want to do is make up some struct pages to represent the pages
> of the ROM chip and pre-populate the page cache with those pages directly
> - marked readonly, of course.


Hehe, no, it's not an XIP implementation.  I think I mentioned in my message, 
even if I didn't make it clear (probably not) that this only made cramfs read 
directly off of the flash, taking one layer of abstraction out.  It kills the 
buffer, and the copy to buffer that would usually be associated with a dev 
device, so it speeds up performance of cramfs on a flash device.  It's _only_ 
a performance hack at this point.

But we are working on XIP for cramfs.  But this requires either expanding the 
inode, or stealing a bit or two away from GIDS, or UIDs.  This is only a 
"linear addressing" patch.

Thanks,
Shane.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
