Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CPGji-00071q-I8
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2004 03:43:24 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id iA38dU4r023337
	for <linux-mtd@lists.infradead.org>; Wed, 3 Nov 2004 16:39:31 +0800
Message-ID: <41889B50.9050608@avantwave.com>
Date: Wed, 03 Nov 2004 16:48:16 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Can i use vfat as the mtd fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all

    I need to do a flash disk for my board. It should be used by windows 
system. So vfat or msdosfs should be use.
    I have try to use mkdosfs to format the mtdblock device, but it is 
unable to get the drive geometry. And i have browsed the source code of 
mtdblock(with linux-2.4.18), there isn't ioctl for check geometry.

    If i want to use vfat with mtdblock , do i need to upgrade the 
latest mtd version? Is this portable to linux-2.4.18 ? Or any portable 
version of mtd i can use?

Best Regard
Mike,Lee
