Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ePx8-0001fp-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 23:45:26 +0100
Received: from cherry.napri.sk ([194.1.128.4])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ePx6-0001fj-00
	for mtd@infradead.org; Wed, 27 Sep 2000 23:45:24 +0100
Received: from ham.kundrat.sk (root@gw.pkx.sk [194.1.139.234])
	by cherry.napri.sk (8.9.3/8.9.3/Debian/GNU) with ESMTP id AAA26954
	for <mtd@infradead.org>; Thu, 28 Sep 2000 00:45:22 +0200
Received: (from kundrat@localhost)
	by ham.kundrat.sk (8.9.3/8.9.3/Debian/GNU) id AAA16671
	for mtd@infradead.org; Thu, 28 Sep 2000 00:35:51 +0200
Date: Thu, 28 Sep 2000 00:35:51 +0200
From: Peter Kundrat <kundrat@pkx.sk>
To: mtd@infradead.org
Subject: Re: journalled fs on partitioned flash
Message-ID: <20000928003551.A16564@napri.sk>
References: <20000927080515.A15228@napri.sk> <Pine.LNX.4.21.0009271015050.4342-100000@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0009271015050.4342-100000@imladris.demon.co.uk>; from dwmw2@infradead.org on Wed, Sep 27, 2000 at 10:17:57AM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, Sep 27, 2000 at 10:17:57AM +0100, David Woodhouse wrote:
> I'm not sure how effective cloop on JFFS will be - if it's just
> compression you're after, you'd probably be better off implementing
> compression in JFFS - it's not too hard.

Unfortunately time constraints for the project dont allow me to hack jffs now.

I'd prefer to have one r/o partition with cramfs (mounted on /usr) to be able 
to upload the whole filesystem at once even on on the running box. 
Compressed jffs case also would be a bit more difficult to update live.
Even if i had JFFS working, more viable option would be to use partitioned mtd
a'la pnc2000.c.

Not having ext3 for 2.4 leaves me with the option of either using reiserfs
or ext2/minix and living with fsck.


	Regards

		pkx



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
