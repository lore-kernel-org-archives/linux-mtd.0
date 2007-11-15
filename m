Received: from smtp.sina.com.cn ([202.108.3.233])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IsUjJ-0007Og-Rq
	for linux-mtd@lists.infradead.org; Wed, 14 Nov 2007 21:45:29 -0500
Received: from mox89b9e5e1226 (unknown [58.247.8.170])
	by smtp.sina.com.cn (SINAMAIL) with ESMTP id F39B35DD8E2
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Nov 2007 10:44:56 +0800 (CST)
Message-ID: <001001c82731$419936e0$5900a8c0@mox89b9e5e1226>
From: "EricLiu" <ericliuhx@sina.com>
To: <linux-mtd@lists.infradead.org>
Subject: DiskOnChip NFTL wear leveling
Date: Thu, 15 Nov 2007 10:26:21 +0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, everyone:

I fdisk my DiskOnChip into two partitions: nftla1 and nftla2. The two 
partitions are both formatted as Ext3 filesystem. I want to protect files on 
nftla1 from corruption, so I mount nftla1 as readonly. While nftla2 is 
mounted as readwrite.
My question is: Will nflta1 be involved into wear leveling even when it is 
readonly?

By the way, I have tried to read the output of mtd utility nftldump, but I 
have no idea of it. I cannot figure out anything from the output of 
nftldump. Is there any document on this?

Thanks and Regards
Eric 
