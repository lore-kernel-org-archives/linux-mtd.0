Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U8nu-0006G0-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 15:25:26 +0100
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 30 Aug 2000 11:23:18 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: GRUB on DOC: 2Mb issues 
Reply-to: miguel@cetuc.puc-rio.br
CC: mtd@infradead.org, Ciro Cattuto <ciro@prosa.it>
References: <1512880772E@mamao.cetuc.puc-rio.br> 
In-reply-to: <16105.967648027@passion.cygnus.co.uk>
Message-ID: <151C6E876B0@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On 30 Aug 00, at 16:07, David Woodhouse wrote:

> Now because the IPL ROM only loads the first half of the page on 512-byte 
> devices, you'll find that whatever type of device you have, you magically 
> get the 'correct' second half of the loader put into offset 256 when it's 
> loaded into memory.

   Yes! That's an even better idea!

> I can hack this up and get it to work on the 512-byte devices if you like.

   Well, I will not have time to do it in the next few days anyway. But 
maybe Ciro will want to implement it.
 
> >     BTW, forgot my suggestion for "loadbios" ioctl... 
> 
> I didn't forget it. You don't like handling it in userspace - I agree. I 
> just don't like handling it in the mtd character device _either_ :)

   Oh, I expressed myself badly...I just want to say: - please, forget 
the loadbios ioctl idea! :) I realized it's not necessary.


Regards,

Miguel Freitas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
