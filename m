Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13u0J2-0001g9-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 22:36:28 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13u0J1-0001g3-00
	for mtd@infradead.org; Thu, 09 Nov 2000 22:36:27 +0000
Date: Thu, 9 Nov 2000 22:36:18 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.10.10011091000270.927-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.21.0011092235030.7969-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


OK, I've committed a version which checks for QUEUE_PLUGGED as discussed.
I've defined it as follows:

#if LINUX_VERSION_CODE < 0x20300
#define QUEUE_PLUGGED (blk_dev[MAJOR_NR].plug_tq.sync)
#else
#define QUEUE_PLUGGED (blk_dev[MAJOR_NR].request_queue.plugged)
#endif

The version number is suspect, but I doubt anyone's really running early
2.3 kernels any more so it's not the end of the world.

I still don't have a 2.2 kernel tree at home - so can someone verify that
I've got that version right?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
