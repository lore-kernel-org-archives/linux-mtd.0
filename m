Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142xw8-00044v-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 15:53:52 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142xw6-00044p-00
	for mtd@infradead.org; Mon, 04 Dec 2000 15:53:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1CBD81818@mamao.cetuc.puc-rio.br> 
References: <F1CBD81818@mamao.cetuc.puc-rio.br> 
To: miguel@cetuc.puc-rio.br
Cc: mtd@infradead.org, ollie@sis.com.tw
Subject: Re: DiskOnChip 2000/Millennium driver merge. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 04 Dec 2000 15:53:11 +0000
Message-ID: <14168.975945191@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


miguel@cetuc.puc-rio.br said:
> 
>    Hummm, this is a little off-topic, but you have just explained me
> why my PIC routines to access DOC2000 were hanging!!! I saw  exactly
> this with a logic analiser, but when using the same DOC on a  PC it
> worked, don't ask me why...(and it never left the WaitReady by
> timeout) 

On a reasonably fast PC, the WaitReady will timeout and you won't lock 
forever. I think we could just change the timeout to something more 
appropriate - rather than a fixed number of loops, repeat until jiffies has 
increased by a certain number of ticks.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
