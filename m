Received: from mail.theptrgroup.com ([71.178.251.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHTKU-000302-R9
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 02:28:07 +0000
Received: from [10.11.13.34] (unknown [10.11.13.34])
	by mail.theptrgroup.com (Postfix) with ESMTP id 3282145E3
	for <linux-mtd@lists.infradead.org>;
	Sun,  6 Dec 2009 21:28:22 -0500 (EST)
Message-ID: <4B1C682D.1020603@theptrgroup.com>
Date: Sun, 06 Dec 2009 21:27:57 -0500
From: Jeff Angielski <jeff@theptrgroup.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: What filesystem for NAND flash with OOB 218
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I was wondering what type of filesystem everybody is using for the newer 
  NAND flash with OOB>=128 bytes.  For me, this is the Micron 
MT29F8G08AAA which has an OOB=218.

It seems that the JFFS2 tools are out of date and don't work with 
anything less than or equal to 64bytes of OOB.

YAFFS2 does not compile in the latest kernel source trees (2.6.31 in the 
DENX linux-2.6-denx git tree).  Is this filesystem dead?

As far as I can tell, that only leaves UBIFS.  Is UBIFS ready to 
deployed in the field?

Is there any other choice for these parts?


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
