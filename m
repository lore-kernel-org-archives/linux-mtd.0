Received: from cpe-203-51-197-227.qld.bigpond.net.au ([203.51.197.227] helo=august.hainsworth.net.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mYzh-0001HO-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 13:10:49 +0100
Received: from ike.hainsworth.ath.cx (red@ike.hainsworth.net.au [10.0.0.9])
	by august.hainsworth.net.au (8.11.6/8.11.2) with ESMTP id g84C3YE13925
	for <linux-mtd@lists.infradead.org>; Wed, 4 Sep 2002 22:03:34 +1000
Message-Id: <4.3.2.7.2.20020904213938.00cb9410@10.0.0.8>
Date: Wed, 04 Sep 2002 22:10:38 +1000
To: linux-mtd@lists.infradead.org
From: Andrew Hainsworth <andrew@hainsworth.ath.cx>
Subject: DoC Geometry
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello folks

I am wondering if there is a problem with my DOC's physical/logical 
geometry.  It is reporting as this:

  1 heads, 64060 sectors, 1 cylinders

This is different from when I first got the device.  Then i was able to 
make multiple partitions, now I can make only one.  Does anyone know the 
default setting for C/H/S?

Cheers
Andrew
