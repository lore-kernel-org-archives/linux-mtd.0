Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mzJG-0006Pm-00
	for mtd-list@infradead.org; Wed, 03 May 2000 14:35:26 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12mzJF-0006Pg-00
	for mtd@infradead.org; Wed, 03 May 2000 14:35:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E12mz9Z-0006NG-00@infradead.org> 
References: <E12mz9Z-0006NG-00@infradead.org> 
To: rmoya@tsai.es
Cc: mtd@infradead.org
Subject: Re: next step 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 May 2000 14:39:28 +0100
Message-ID: <19057.957361168@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rmoya@tsai.es said:
>  After my problems compiling, I've successfully compiled all the MTD
> files, and now I boot my system from the zip drive and I can even
> 'fdisk /dev/nftla'.

Excellent.

> So, now I have to put the system in the zip drive into the DOC. What
> steps do I need? I've been thinking about:

> fdisk /dev/nftla -> and create a unique partition for linux 

yes. 

> dd if=/dev/sda4 of=/dev/nftla1 

It's probably best to use dump/restore rather than dd. 

> /sbin/lilo -> should I use the patched LILO I suppose?

I assume so - I haven't tried it. I'm working on fixing Grub instead.


> Another thing: it is impossible for me to subscribe to the mailing
> list with my new email address. I always get a response like the
> following:

<<< 550-above.net has multiple open relays and has blocked the ORBS tester.
<<< 550 mail from 208.184.88.8 rejected: administrative prohibition

See http://www.orbs.org/ and possibly change your ISP. You can send mail 
directly to me by using the address David.Woodhouse@mvhi.com, which will 
only warn about the blacklisting, not bounce the messages.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
