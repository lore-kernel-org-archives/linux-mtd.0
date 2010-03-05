Received: from mail.nethra.us.com ([74.85.3.131])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnOJO-0007Hu-RZ
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 03:34:55 +0000
Received: from [172.32.1.217] (d217.nethra-imaging.com [172.32.1.217])
	(authenticated bits=0)
	by mail.nethra.us.com (8.13.4/8.13.4) with ESMTP id o253Yj1X026647
	for <linux-mtd@lists.infradead.org>; Thu, 4 Mar 2010 19:34:45 -0800
Message-ID: <4B907BC1.4030907@nethra.us.com>
Date: Thu, 04 Mar 2010 19:34:25 -0800
From: Blair Barnett <bbarnett@nethra.us.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ONFI 4GB and beyond NAND support
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

I have two questions for the MTD gang, but couldn't find the answer in 
the archives, nor elsewhere on the web.

1. What's the plan, if any, for the MTD NAND layer to support the ONFI 
standard?
2. What's the plan, if any, for the MTD NAND layer to support 4 GB NANDs 
(and greater)?

The two questions could be linked, as we're looking at Micron 4 GB, 8 GB 
and 16 GB MLC parts that support the ONFI standard, that we'd like to 
use on a board that my company is building.

I've hacked support for the 4 GB part by having the MTD layer recognize 
it as 4 GB - 1 erase block, which gets it inside the uint32_t limit. 
That hack won't really work for 8 GB and beyond. I'd certainly be 
willing to help with the design review and coding if I had a clue what 
folks were thinking.

Thanks in advance for any pointers!

Blair Barnett
