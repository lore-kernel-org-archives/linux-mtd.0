Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eFOk-0006JV-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 12:29:14 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13eFOi-0006JP-00
	for mtd@infradead.org; Wed, 27 Sep 2000 12:29:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13eFI9-0003GD-00@pearl.tao.co.uk> 
References: <E13eFI9-0003GD-00@pearl.tao.co.uk> 
To: "David Given" <dg@tao-group.com>
Cc: mtd@infradead.org
Subject: Re: journalled fs on partitioned flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Sep 2000 12:29:31 +0100
Message-ID: <6998.970054171@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  The mtdblock device doesn't actually work

dg@tao-group.com said:
>  Do I take it that I can't burn a cramfs image into a raw partition,
> and then mount /mnt /dev/mtdblock/1 -t cramfs 

s/doesn't actually work/work reliably/

YMMV - if you're using it read-only and never writing to any other parts of 
the same flash chips, you ought to be fine. If it ever has to 
sleep in the request function, boom.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
