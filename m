Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QDTx-00045q-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 19:08:53 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14QDTw-00045k-00
	for mtd@infradead.org; Tue, 06 Feb 2001 19:08:52 +0000
Date: Tue, 6 Feb 2001 19:08:44 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: "Ian Eure <Ian Eure" <ieure@insynq.com>
cc: <mtd@infradead.org>
Subject: Re: NFTL Performance
In-Reply-To: <14976.15788.166844.107972@pyramid.insynq.com>
Message-ID: <Pine.LNX.4.30.0102061906020.2237-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 6 Feb 2001, Ian Eure <Ian Eure wrote:

> a more important problem that i see is that when blocks are being
> flushed to the DOC, certain parts of the system (mouse, maybe others) stop
> responding until the write is complete.

More likely to be the busy-wait in _DoC_WaitReady():

 while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B) && --c)
                ;

Try... 
	while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B) && --c) {
		if (current->need_resched)
			schedule();
		else
			udelay(1);
	}

But I think you have to protect against being re-entered by using a 
'state' variable to mark that you're currently writing to the chip, and 
probably also a spinlock to protect that state variable. The NOR flash 
drivers do all this if you're after an example.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
