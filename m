Received: from dcn237-231.dcn.davis.ca.us ([168.150.237.231]
	helo=rusty.jkmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LLSBE-0000C8-Am
	for linux-mtd@lists.infradead.org; Sat, 10 Jan 2009 00:58:24 +0000
Received: from [10.10.1.107] (dcn237-230.dcn.davis.ca.us [168.150.237.230])
	by rusty.jkmicro.com (8.12.8/8.12.8) with ESMTP id n09LKQU0025405
	for <linux-mtd@lists.infradead.org>; Fri, 9 Jan 2009 13:20:26 -0800
Message-ID: <4967F2B2.4060405@jkmicro.com>
Date: Fri, 09 Jan 2009 16:58:26 -0800
From: Adam Yergovich <ayergo@jkmicro.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Access entire device with mtdblock0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello MTD,

There was a grand feature in the 2.4 flavor of MTD that i used wherein 
mtdblock0 was assigned the entirety of the device.  This made updating 
the flash image very easy.

I've since started messing around with 2.6 flavors, and while i have a 
working map that gives the partitions i can no longer access the entire 
device.  I've tried a few things without success to get it to work.

Any recommendations on a simple way to create a partition using the 
entirety of flash?

-Adam
