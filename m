Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cher6-00051V-Su
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2004 21:07:02 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id iBO1xCPU016035
	for <linux-mtd@lists.infradead.org>; Fri, 24 Dec 2004 09:59:13 +0800
Message-ID: <41CB7C03.5050003@avantwave.com>
Date: Fri, 24 Dec 2004 10:16:35 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Cramfs crash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
    I don't know whether i put the right question on the right mailing 
list. If it is not, please tell me.

    I have a strange problem on loading a video driver on my ARM9 
development board. when i finish loading the driver, no error comes out 
, and i run most of my apps fail, e.g. madplay. The error msg stated 
that apps can not load e.g. /lib/libm.so and i have checked the kernel 
msg by dmesg. The result like this
Error -3 while decompressing!
c01b59f4(2001)->c0680000(4096)
Error -3 while decompressing!
c01b61c5(1910)->c0c03000(4096)
Error -3 while decompressing!
c01b693b(2125)->c0fb3000(4096)
Error -3 while decompressing!
c01b7188(2126)->c0fb2000(4096)
Error -3 while decompressing!
c01b79d6(2052)->c0a63000(4096)
Error -3 while decompressing!
c01b81da(1793)->c0a62000(4096)
Error -3 while decompressing!
c01b88db(831)->c0f73000(4096)

    My root filesystem is cramfs. I have checked the driver is run on 
similar development board but with different flash start address. The 
only cause for that i can imagine is the dma allocation when driver 
loading. My question is Could DMA allocation cause this type of problem?

    I am getting into a trouble. Please help! Thanks a lot

Mike,Lee
