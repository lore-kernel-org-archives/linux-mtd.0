Return-path: <David.Woodhouse@mvhi.com>
Received: from 3dyn68.delft.casema.net
	([195.96.104.68] helo=rosie.bitwizard.nl ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111EWj-0004iR-00
	for mtd@infradead.org; Mon, 5 Jul 1999 20:35:41 +0100
Message-Id: <199907051935.VAA01519@cave.BitWizard.nl>
Subject: Re: FFS2 and MTDs (flash)
In-Reply-To: <E111E4d-0002HU-00@devel2.axiom.internal> from David Woodhouse at "Jul 5, 99 08:06:38 pm"
To: David.Woodhouse@mvhi.com (David Woodhouse)
Date: Mon, 5 Jul 1999 21:35:09 +0200 (MEST)
Cc: jgg@ualberta.ca, mtd@infradead.org, linux-kernel@vger.rutgers.edu
From: R.E.Wolff@BitWizard.nl (Rogier Wolff)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> Think of CFI-compliant flash mapped into the host's address space. Why cache 
> it in RAM when you can just point a page table at the original?

One of the things is that the ROMs and flash devices that you're
talking about are usually only 8 or 16 bits wide. That means that you
get worse access times than 32- or 64-bit wide RAM. If you just copy
the page from the device into main memory the only thing that YOU'll
notice is that it is a whole lot faster than a disk. Once you start
executing code out of it, the first thing you'll notice is that it's
slower than RAM.... ;-)

XIP is useful though for very cramped machines. Say one with 4M RAM
and 16M flash. You might even want the kernel to stay put in the
flash. Possibly have the choice of running the one important
application (e.g. the mp3 decompressor in the empeg-car) get copied
over to RAM before execution....

			Roger.

-- 
** R.E.Wolff@BitWizard.nl ** http://www.BitWizard.nl/ ** +31-15-2137555 **
*-- BitWizard writes Linux device drivers for any device you may have! --*
------ Microsoft SELLS you Windows, Linux GIVES you the whole house ------



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
