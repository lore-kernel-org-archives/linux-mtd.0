Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from [206.57.94.212] (helo=devel.ftel.com)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11LoSj-0000CH-00
	for mtd@infradead.org; Tue, 31 Aug 1999 15:00:38 +0100
Message-Id: <199908311401.HAA01468@devel.ftel.com>
Date: Tue, 31 Aug 1999 07:01:25 -0700 (MST)
To: David.Woodhouse@mvhi.com
Cc: mtd@infradead.org
From: Mike Kilburn <mkilburn@ftel.net>
Subject: Re[2]: DiskonChip2000
In-Reply-To: <E11LjkT-0003Vg-00@devel2.axiom.internal>
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse <David.Woodhouse@mvhi.com> wrote:
> My drivers don't quite work with the normal firmware yet - although my NFTL 
> driver was written from the specification which M-Systems gave me, there are
> subtle differences between my understanding (and hence my implementation) of
> NFTL and their implementation, which means that their driver doesn't always 
> recognise the NFTL after I've been writing to it.
> 
> I hope to get that fixed soon.

For now read only will do for my tests. The M-Systems drivers README indicates
there may be severe blocking in kernel mode, so much so that mouse movements
may be affected, this is unacceptable for a soft real-time system which is
why I want to use drivers with source code. Do you happen to know what the
special Linux firmware does different than their normal firmware?

Also, they dont work with lilo due to where lilo loads the kernel. This
requires a patch to lilo. Do you know of another boot loader which does
not have this problem?

 



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
