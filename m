Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TMK3-0004AS-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 11:11:39 +0000
Message-Id: <200102151111.DAA02064@concorde.cs.ucla.edu>
From: Jeremy Elson <jelson@ISI.EDU>
To: David Woodhouse <dwmw2@infradead.org>
cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: Does JFFS respect partitions? 
In-Reply-To: Message from David Woodhouse <dwmw2@infradead.org>
   of "Thu, 15 Feb 2001 10:10:11 GMT." <20534.982231811@redhat.com>
Date: Thu, 15 Feb 2001 03:11:20 -0800
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


David Woodhouse writes:
>Having a read-only partition on the _emulated_ block device doesn't help. 
>The blocks of that partition will still be shifted around to perform 
>wear-levelling while you write to the other partition. If the NFTL 
>filesystem gets corrupted (note the BETA in capital letters in the 
>CONFIG_NFTL_RW config option), you've still lost your read-only filesystem.

Interesting - I didn't realize the DOC did internal wear-levelling.  I
guess that might mean that there's no point in using JFFS on top of
the NTFL layer anyway?

I appreciate your advice and knowing that readonly partitions are not,
in reality, readonly from the point of view of the actual flash
blocks.  Our original (non-Linux) system was split into two partitions
to prevent against corruption of the OS filesystem - we didn't want
the readonly boot partition to stop working due to, say, a poweroff in
the middle of a write to a log file on the writable partition.  I
guess I was assuming that, underneath, writes to the DOC sectors were
more or less atomic, and that corruption on that level was much more
unlikely.  I was more worried about a long-lived write failing,
e.g. 30 seconds worth of buffer cache in the OS not being flushed
before a poweroff.

>It's also possible to register the DiskOnChip raw flash as two separate MTD 
>devices, which is how we 'partition' normal flash. Then you let the NFTL 
>code put a filesystem on one of them and use JFFS on the other. 

This sounds ideal - how does one do this?

>> Also, what's jffs2?  Is it safe to use that, and how is it different? 
>
>Pay no attention to the man behind the curtain.

I don't know the intricacies of the existing jffs2 code or what's left
to implement, but, will a broomstick speed things up for you?  :-)

-Jer


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
