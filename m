Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Wy7f-00026a-00
	for mtd-list@infradead.org; Thu, 07 Sep 2000 10:37:31 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Wy7e-00026U-00
	for mtd@infradead.org; Thu, 07 Sep 2000 10:37:30 +0100
Message-ID: <39B762C0.B6DE4B0D@arcom.co.uk>
Date: Thu, 07 Sep 2000 10:41:20 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: jffs_mknod: bogus imode when creating sockets
References: <39B756F3.7D89AB9A@arcom.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Vrabel wrote:

> Creating sockets on JFFS results in
>     jffs_mknod: bogus imode (nnnn)
> messsages.
>

Never mind.  Thinking about it some more (should do this more often). 
I've realized something else is not setting the mode correctly for
sockets (I'm sure it shouldn't be 140755 but 6).  Hmmm... shouldn't the
socket check be in there anyway?

> ps. What's a imode? :->

Another lack of clues here... Obviously it means inode->i_mode not a
misspelling of inode...

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
