Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WyG0-00028j-00
	for mtd-list@infradead.org; Thu, 07 Sep 2000 10:46:08 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13WyFy-00028d-00
	for mtd@infradead.org; Thu, 07 Sep 2000 10:46:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39B762C0.B6DE4B0D@arcom.co.uk> 
References: <39B762C0.B6DE4B0D@arcom.co.uk>  <39B756F3.7D89AB9A@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: jffs_mknod: bogus imode when creating sockets 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Sep 2000 10:44:59 +0100
Message-ID: <23608.968319899@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  Never mind.  Thinking about it some more (should do this more often).
>  I've realized something else is not setting the mode correctly for
> sockets (I'm sure it shouldn't be 140755 but 6).  Hmmm... shouldn't
> the socket check be in there anyway?

No, 140755 is correct for a rwxr-xr-x socket. And yes, the socket check 
should be there, but it's harmless as it doesn't affect the operation, only 
makes it whinge when it shouldn't. You're not actually getting any 
behavioural problems, are you?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
