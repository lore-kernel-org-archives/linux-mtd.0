Received: from moutng.kundenserver.de ([212.227.126.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6LxH-0005yB-KY
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 08:45:19 +0000
Received: from [192.168.7.2] ([192.168.7.2])
	by WebServer.mynet (8.13.6/8.13.1) with ESMTP id m5B8jFQH015750
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 10:45:16 +0200
Message-ID: <484F909D.6080709@web.de>
Date: Wed, 11 Jun 2008 10:45:17 +0200
From: Hyphen79 <hyphen79@web.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd caching in kernel 2.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a problem with my mtdblock root device with the 2.6 kernel. When 
I write data to a mtd partition,
which is not the root, the data will be written immediately. But when I 
write something to the root partition,
it will be cached and written to it after a while (~30sec). What could 
this be and how could I deactivate
the caching? - the root is a cramdisk, not JFFS2 - and I have no 
problems with the 2.4 kernel.

Many thanks ahead!
