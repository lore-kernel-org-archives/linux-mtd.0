Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11Dvkw-0002dl-00
	for mtd@infradead.org; Mon, 9 Aug 1999 21:10:50 +0100
Date: Mon, 9 Aug 1999 14:10:40 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
In-Reply-To: <E11DvSw-0005kV-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990809140731.30444A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 9 Aug 1999, David Woodhouse wrote:

> Also included is Jason's FFS2 implementation. The bootloader stuff is also 
> present, but commented out in the top-level Makefile because I haven't yet 
> upgraded my as86. I'd prefer it if we could make this work without 
> bleeding-edge utilites. Jason, is that possible?

The trouble is that your as86 is from RedHat, they are using a bleeding
edge binutils that doesn't entirely work like the real as86 from bcc -
remove the trailing - from the AS invokation and it will work on both.

Put a big warning on the FFS2 stuff too, it needs more testing :>

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
