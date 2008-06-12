Received: from moutng.kundenserver.de ([212.227.126.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6juy-0008Dc-Rd
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 10:20:33 +0000
Received: from [192.168.7.2] ([192.168.7.2])
	by WebServer.mynet (8.13.6/8.13.1) with ESMTP id m5CAKUa3029760
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2008 12:20:30 +0200
Message-ID: <4850F86D.90505@web.de>
Date: Thu, 12 Jun 2008 12:20:29 +0200
From: Hyphen79 <hyphen79@web.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Last sector of flash root partition will not be flashed
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

the problem is, that the last sector of the mtd root partition 
(cramdisk) will not be flashed:

mtdblock: write on "File System" at 0x1f5e00, size 0x200
mtdblock: write on "File System" at 0x1f6000, size 0x200
mtdblock: writing cached data for "File System" at 0x1f5000, size 0x1000
mtdblock: write on "File System" at 0x1f6200, size 0x200
mtdblock: write on "File System" at 0x1f6400, size 0x200
mtdblock: write on "File System" at 0x1f6600, size 0x200
mtdblock: write on "File System" at 0x1f6800, size 0x200
mtdblock: write on "File System" at 0x1f6a00, size 0x200
mtdblock: write on "File System" at 0x1f6c00, size 0x200
mtdblock: write on "File System" at 0x1f6e00, size 0x200

But the last call to "write_cached_data" will not be done - even not 
after an explicit  "sync".
For example: "mtdblock: writing cached data for "File System" at 
0x1f6000, size 0x1000"
Has anyone an idea?
