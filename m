Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13NEYu-0006su-00
	for mtd-list@infradead.org; Fri, 11 Aug 2000 14:09:24 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13NEYt-0006so-00
	for mtd@infradead.org; Fri, 11 Aug 2000 14:09:23 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <39914687.2D805542@arcom.co.uk> 
References: <39914687.2D805542@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: JFFS garbage collection(?) fails 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 Aug 2000 14:09:06 +0100
Message-ID: <6392.965999346@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  The JFFS filesystem is now garbled.

I've just committed a 'jffs-dump' program which may be useful in working 
out exactly _how_ your JFFS filesystem is garbled. 

It's currently hardwired to dump the contents only of jffs nodes with 
ino == 425 - because that was utmp on the system on my desk, which is 
happily oopsing on boot at the moment because the size of utmp appears to 
be going negative :)



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
