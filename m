Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eAM8-0005T5-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 07:06:12 +0100
Received: from cherry.napri.sk ([194.1.128.4])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13eAM7-0005Sz-00
	for mtd@infradead.org; Wed, 27 Sep 2000 07:06:11 +0100
Received: from ham.kundrat.sk (root@gw.pkx.sk [194.1.139.234])
	by cherry.napri.sk (8.9.3/8.9.3/Debian/GNU) with ESMTP id IAA16925
	for <mtd@infradead.org>; Wed, 27 Sep 2000 08:06:07 +0200
Received: (from kundrat@localhost)
	by ham.kundrat.sk (8.9.3/8.9.3/Debian/GNU) id IAA15243
	for mtd@infradead.org; Wed, 27 Sep 2000 08:05:15 +0200
Date: Wed, 27 Sep 2000 08:05:15 +0200
From: Peter Kundrat <kundrat@pkx.sk>
To: mtd@infradead.org
Subject: journalled fs on partitioned flash
Message-ID: <20000927080515.A15228@napri.sk>
References: <E13dhnU-0007fK-00@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E13dhnU-0007fK-00@infradead.org>; from Majordomo@infradead.org on Tue, Sep 26, 2000 at 12:36:32AM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Greetings,

My idea to configure the embedded i386 box with Doc Millenium flash
was to create 2 partitions, with one partition beeing used for cfg
data and the second for cramfs. When trying jffs, i found that it 
required mtdblock to be mounted on. With this requirement i dont see
any other way how to get my desired setup with partitioned flash
(except for ext3 on ntfl, but that doesnt seem to be ported to 2.4 
(i havent checked latest status)).

So it seems i have to use compressed loop over jffs on mtdblock.
Does anybody have such a config working ?

When i tried to dd if=rootfs.jffs of=/dev/mtdblock/0 i got
end_request: I/O error, dev 1f:00 (mtdblock) sector 0 
end_request: I/O error, dev 1f:00 (mtdblock) sector 254
etc. every 254 blocks
and dd hung in D state (__wait_on_buffer+0x4c)

Is it a known problem ? Does any have cloop working on 2.4 (on
first try the compilation choked .. i'll have a closer look
whether it was my fault or not).

	Thanks for any advice,

		Peter



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
