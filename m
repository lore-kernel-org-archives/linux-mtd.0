Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CZPqL-0005th-9D
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2004 03:28:10 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id iB18MM4r022634
	for <linux-mtd@lists.infradead.org>; Wed, 1 Dec 2004 16:22:22 +0800
Message-ID: <41AD826A.3030809@avantwave.com>
Date: Wed, 01 Dec 2004 16:35:54 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 minimum mtd block size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
    I want to ask about minimum mtdblock size which jffs2 need . Why i 
ask is because i try to make a 128kbyte mtdblock for my system status 
storage, it fails. And i repartition to 1MB, it consumes the flash 
nearly 600KB without any data.
    Am i do something wrong? or there is a minimum size for jffs2.
    If it is, Could i conclude that jffs2 do not suit to store small 
size of data. And which filesystem expertise can suggest me for this 
purpose?

best regard
mike,lee
