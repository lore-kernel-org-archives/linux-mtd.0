Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 145uPF-0002RL-00
	for mtd-list@infradead.org; Tue, 12 Dec 2000 18:44:05 +0000
Received: from [195.224.55.237] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 145uPE-0002Qa-00
	for mtd@infradead.org; Tue, 12 Dec 2000 18:44:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0011210948200.12336-100000@xanadu.gn.com> 
References: <Pine.LNX.4.30.0011210948200.12336-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: 2.4 stuff. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Dec 2000 13:24:18 +0000
Message-ID: <11858.976627458@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said (Re CFI code):
>  IMHO this is a must.  Since I'm probably the one who made it break
> for your board please don't hesitate to bother me with that so we
> could fix it.

OK, I've just given Linus a fairly large update for 2.4.0-test12. It's at 
ftp.uk.linux.org:/pub/people/dwmw2/forlinus/mtd-patch-whole

It's got everything in it that I said I was going to send except

1. New CFI code. That's not because I'm intending to leave the CFI code out,
but before I do it, because I wanted to let the discussion about block write
sizes settle, and test the AMD command set code on the new toy that landed
on my desk on Friday.

2. New map drivers. I haven't decided which ones to add yet, if any.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
