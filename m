Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tXLC-0008F1-00
	for mtd-list@infradead.org; Sat, 28 Apr 2001 17:13:02 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tXLB-0008Ev-00
	for mtd@infradead.org; Sat, 28 Apr 2001 17:13:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010428090021.A21620@stm.lbl.gov> 
References: <20010428090021.A21620@stm.lbl.gov>  <20010427133716.A20218@stm.lbl.gov> <3AE98278.48DA955@daniel.com> <002801c0ceed$28aad830$0a01a8c0@Win1> <3AE98278.48DA955@daniel.com> <22885.988382072@redhat.com> <20010427133716.A20218@stm.lbl.gov> <9152.988454085@redhat.com> 
To: David Schleef <ds@schleef.org>
Cc: mtd@infradead.org
Subject: Re: sharp driver dissimilarities 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 28 Apr 2001 17:11:57 +0100
Message-ID: <17699.988474317@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ds@schleef.org said:
>  I tried and failed, but that may be just my lack of understanding of
> the CFI driver.  The commands, command write locations, and status
> bits have no similarity to other chip drivers.

The commands certainly have some similarity with the cfi_cmdset_0001 code, 
which isn't particularly surprising as command set 0001 is 'Intel/Sharp'.

However, at the time you did sharp.c, I believe that CFI code wasn't 
sufficiently generic to deal with 4x8-bit chips. It ought to manage that 
now, though.

        /* Clear the status register first */
        cfi_write(map, CMD(0x50), adr);

        /* Now erase */
        cfi_write(map, CMD(0x20), adr);
        cfi_write(map, CMD(0xD0), adr);

We really ought to separate the backends which actually drive the chips from 
the probe code.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
