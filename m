Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eFJo-0006HM-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 12:24:08 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13eFJn-0006HG-00
	for mtd@infradead.org; Wed, 27 Sep 2000 12:24:07 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id MAA11053
	for <mtd@infradead.org>; Wed, 27 Sep 2000 12:24:01 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: journalled fs on partitioned flash
In-reply-to: Your message of "Wed, 27 Sep 2000 10:17:57 BST."
             <Pine.LNX.4.21.0009271015050.4342-100000@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Sep 2000 12:22:25 +0100
Message-Id: <E13eFI9-0003GD-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

[...]
>Yep. The mtdblock device doesn't actually work, and it's used by JFFS
>_only_ to get a handle on the underlying MTD device. Use the character
>device to put your initial image on there instead.

It worked all right when I was playing with it. Admittedly, I wasn't doing any 
real work.

>I'm not sure how effective cloop on JFFS will be - if it's just
>compression you're after, you'd probably be better off implementing
>compression in JFFS - it's not too hard.

I'm using a cramfs FS image in a jffs partition. It works fine, although I get 
a few access-beyond-end-of-device errors when it gets mounted.

Do I take it that I can't burn a cramfs image into a raw partition, and then

mount /mnt /dev/mtdblock/1 -t cramfs

...?

-- 
David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
