Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11rt6Z-0001F8-00
	for mtd@imladris.mvhi.com; Sun, 28 Nov 1999 01:26:20 +0000
Date: Sat, 27 Nov 1999 18:26:11 -0700 (MST)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: Vipin Malik <vmalik@danielind.com>, MTD <mtd@imladris.mvhi.com>
Subject: Re: Reliability of FLASH data storage 
In-Reply-To: <E11rGzV-0005hk-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.991127182159.14142A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Fri, 26 Nov 1999, David Woodhouse wrote:

> What I really want to do is a filesystem directly on the flash - none of this 
> 'pretend it's a block device' stuff.
> 
> Jason, how's FFS2 coming along? Is it possible to make it POSIX-compliant 
> without a hack as evil as UMSDOS?

I'm afraid I haven't been working on that lately, back at school and no
time for it :< 

But yes, FFS2 directly on flash largely addresses this problem. There are
still some possible problems but those largely reduce down to requiring a
quick 'fsck' type pass on mount. Basicalyl with FFS2 the worst thing that
can happen is that the filesystem looses track of a block, ie you allocate
something but never link it into the filesystem strutures, this reduces
the available space in the filesystem, but does not harm the data or the
filesystem itself.

I think journaling on flash is really a rather overkill, due to the nature
of the device you can do built in journaling cheaply like FFS2 does and
not pay a space premium for a journal.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
