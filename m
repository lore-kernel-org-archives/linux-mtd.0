Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11jVq2-0000rX-00
	for mtd@infradead.org; Thu, 4 Nov 1999 22:58:39 +0000
Date: Thu, 4 Nov 1999 15:58:12 -0700 (MST)
From: Jason Gunthorpe <jgg@deltatee.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: mtd@infradead.org
Subject: Re: jfs/linux
In-Reply-To: <E11iLRd-0002uk-00@the-village.bc.nu>
Message-ID: <Pine.LNX.3.96.991104155500.11060B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 1 Nov 1999, Alan Cox wrote:

> > All the solutions we currently have for filesystems on flash present a block 
> > device rather than a filesystem interface - that is, both FTL and NFTL act as 
> > an extra translation layer below the actual filesystem, providing 512-byte 
> > random block access for use by a traditional filesystem. 
 
> Ditto with Compact flash (ATAPI). Compact flash according to the docs does
> its own wear levelling.  Im still baffled why people use the other stuff 8)

Primarily I think it is easier (and cheaper) on a board level to connect
up a 8bit linear flash ROM than it is to work up a full blown IDE
interface for compact flash. This is particularly true for things like
boot flash where I don't think you'll see CF ever being used.

Basically, in our product at least, we need to have flash for booting the
system and storing the bios, if we make it a little bigger (2M) the cost
goes up a tiny bit and we can run the OS on there too. 

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
