Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IBsi-0002ER-00
	for mtd-list@infradead.org; Mon, 15 Jan 2001 15:49:16 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14IBsg-0002EJ-00
	for mtd@infradead.org; Mon, 15 Jan 2001 15:49:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0101151730520.31216-100000@godzilla.axis.se> 
References: <Pine.LNX.4.21.0101151730520.31216-100000@godzilla.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: mtdpart.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Jan 2001 15:48:17 +0000
Message-ID: <2692.979573697@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
>  I also tried dropping the HEAD of mtd in the cvs over my 2.4.0 and
> reboot, but that made the problem worse:
>
> Axis flash mapping: 200000 at 50000000
> Axis flash: Found 1 x16 CFI device at 0x0 in 16 bit mode
> Number of erase regions is zero
> cfi_probe erred 0

The changes over the weekend to fix cfi_read_query() broke it. I've cleaned 
them all up and removed the extra argument from cfi_read_query, because 
it's pointless now it's not doing any scaling of its own.

It should work for all types of device now.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
