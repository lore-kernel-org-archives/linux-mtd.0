Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZUxR-0000Yt-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 10:05:25 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZUxN-0000Yn-00
	for mtd@infradead.org; Thu, 14 Sep 2000 10:05:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13ZGzr-0002Zs-00@pearl.tao.co.uk> 
References: <E13ZGzr-0002Zs-00@pearl.tao.co.uk> 
To: David Given <dg@tao-group.com>
Cc: mtd@infradead.org
Subject: Re: sbc-mediagx 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 10:04:51 +0100
Message-ID: <25904.968922291@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dg@tao-group.com said:
>  ...and here is a patch to devfsify mtdchar. I even got a chance to
> test it,  and the previous patch, and it all seems to work. 

Doesn't look like it'll work on 2.2 without devfs. I've littered it with 
appropriate (but ugly) ifdefs. We should probably put the devfs stuff into 
compatmac.h

I'd go for /dev/mtdblock/%d

It'd be nice if we could get it to create the device nodes only when 
devices are present.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
