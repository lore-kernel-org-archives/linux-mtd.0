Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j5Iw-0001AB-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 21:15:30 +0100
Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j5Iu-0001A5-00
	for mtd@infradead.org; Fri, 30 Mar 2001 21:15:29 +0100
Date: Fri, 30 Mar 2001 15:15:17 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Florian Schirmer / TayTron <schirmer@taytron.net>
cc: Kari Davmpsson <kd@flaga.is>, <mtd@infradead.org>
Subject: Re: AW: partitions and erase regions
In-Reply-To: <BKEKLBIBFPNGJKJDEODFMEHEEIAA.schirmer@taytron.net>
Message-ID: <Pine.LNX.4.33.0103301514260.8580-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 30 Mar 2001, Florian Schirmer / TayTron wrote:

> Hi!
>
> >Since there was no protest I just went ahead and commited the "virtual"
> >erase region
> >patch to mtdpart.
>
> Just a short question :-)
>
> Situation:
>
> 2 partitions not aligned to erase sectors. The first jffs and the second
> cramfs. What happens if jffs writes to the last sector (the shared one) and
> just in the second the block was erased the power fails. Data loss on the
> second partition?
>
> If so please make virtual support a selectable option in kernel config. (If
> not already)

If so I would recommend backing it out completely.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
