Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TMo0-0004Jn-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 11:42:36 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14TMny-0004Jh-00
	for mtd@infradead.org; Thu, 15 Feb 2001 11:42:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200102151111.DAA02064@concorde.cs.ucla.edu> 
References: <200102151111.DAA02064@concorde.cs.ucla.edu> 
To: Jeremy Elson <jelson@ISI.EDU>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: Does JFFS respect partitions? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Feb 2001 11:41:47 +0000
Message-ID: <1018.982237307@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jelson@ISI.EDU said:
>  Interesting - I didn't realize the DOC did internal wear-levelling.

The DiskOnChip doesn't. It's just a bunch of flash chips with a clever ASIC 
to multiplex them and do some ECC in hardware.

The NFTL psuedo-filesystem does. In software. 

> I guess that might mean that there's no point in using JFFS on top of
> the NTFL layer anyway?

True.


> > It's also possible to register the DiskOnChip raw flash as two
> > separate MTD devices, which is how we 'partition' normal flash. Then
> > you let the NFTL code put a filesystem on one of them and use JFFS
> > on the other. 

> This sounds ideal - how does one do this?

You need to get your hands dirty. See the 'add_mtd_partitions' code in 
mtdpart.c and some of the drivers which call it - basically you have an 
underlying MTD device (the DiskOnChip) and you define two dummy devices 
which just add an offset to the address requested and pass through to the 
'real' device's methods. 

It's probably better to take the other route I suggested - have two NFTL
partitions on the DiskOnChip. Clever offset/len args to nftl_format will do
that. The NFTL code ought to be OK with it, and it shouldn't be difficult to
fix if it isn't.

> I don't know the intricacies of the existing jffs2 code or what's left
> to implement, but, will a broomstick speed things up for you?  :-)

Heh - maybe. But stupid quantities of caffeine seem to be working OK at the 
moment.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
