Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RCFy-0002ki-00
	for mtd-list@infradead.org; Tue, 22 Aug 2000 12:30:14 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13RCFw-0002kc-00
	for mtd@infradead.org; Tue, 22 Aug 2000 12:30:12 +0100
Message-ID: <39A26511.240F7998@arcom.co.uk>
Date: Tue, 22 Aug 2000 12:33:37 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: JFFS oopses on mount
References: <399CF6F1.4622CF44@arcom.co.uk> <26879.966589787@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> dvrabel@arcom.co.uk said:
> >  Possibly a message of interest
> 
> > jffs_garbage_collect_now(): free_size == 0. This is BAD.
> 
> I sincerely hope that the latest CVS sources fix this problem. We've been
> chasing it for days, and we _think_ it's fixed.

It's working better than before.

However, it oopsed again and it seems to have lost a file.

I have an image of the flash which causes the oops but I have no idea
what to do with it.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
