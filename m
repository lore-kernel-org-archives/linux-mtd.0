Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pXKJ-0001d1-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 16:23:35 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pXKI-0001cv-00
	for mtd@infradead.org; Tue, 17 Apr 2001 16:23:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000301c0c74f$10768340$0a01a8c0@Win1> 
References: <000301c0c74f$10768340$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: kd@flaga.is, mtd@infradead.org
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 16:23:26 +0100
Message-ID: <31299.987521006@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


joakim.tjernlund@lumentis.se said:
>  We are doing our own custom board(PPC860) with 3 "banks" of Intel
> Flashes. Each bank consists of 2 flashes in 16 bit mode, 2-chip
> interleave, 32-bit data bus. Now I want to make a partition that spans
> more than one flash bank(or at least crosses a bank boundary). Is that
> possible? Any special tricks or just do an add_mtd_partition() call? 

Special tricks, if they're really in separate banks and you can't just use 
a single mapping driver which will detect all the flash in one go. The code 
can deal with aliases appearing between devices, but can't deal with empty 
space between them - although you could play tricks in the mapping driver 
to make that disappear.

What physical addresses are the flash chips mapped to?

If they have to be in separate mappings, you'll need to write wrapper 
functions similar to the ones in mtdpart.c, which munge the offset and pass 
through to the function in the appropriate MTD device.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
