Received: from bm-2a.paradise.net.nz ([202.0.58.21]
	helo=linda-2.paradise.net.nz)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CW3LF-0004yw-9t
	for linux-mtd@lists.infradead.org; Sun, 21 Nov 2004 20:50:10 -0500
Received: from smtp-2.paradise.net.nz (smtp-2b.paradise.net.nz [202.0.32.211])
	by linda-2.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0I7K00MCY4LBQI@linda-2.paradise.net.nz> for
	linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 14:39:12 +1300 (NZDT)
Received: from hayes.bluewaternz.com
	(203-96-159-182.paradise.net.nz [203.96.159.182])	by
	smtp-2.paradise.net.nz
	(Postfix) with ESMTP id A8BE49E744	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2004 14:39:11 +1300 (NZDT)
Received: from emma.bluewaternz.com ([192.168.2.44] helo=bluewatersys.com)
	by hayes.bluewaternz.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CW3Ad-0003uN-00	for <linux-mtd@lists.infradead.org>; Mon,
	22 Nov 2004 14:39:11 +1300
Date: Mon, 22 Nov 2004 14:41:24 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
To: linux-mtd@lists.infradead.org
Message-id: <41A143C4.2090304@bluewatersys.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Subject: BUG at dcache.h:276! Causing oops when I rmmod a nand module having
 mulitple partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.  Here is the basic problem, I have a nand module that I want to 
insmod & rmmod.  It has multiple partitions that look like
static struct mtd_partition partition_info1[] = {   
        { name: "part1",                   
          offset: 0,                                                     
          size: 4 * 1024 * 1024 },                                     
        { name: "part2",                      
          offset: 4 * 1024 * 
1024,                                          
          size: 4 * 1024 * 1024 
},                                          
        { name: "part3",                             
                  offset: 8 * 1024 * 
1024,                                  
                  size: MTDPART_SIZ_FULL }
};

I call nand_scan on my device, and then add_mtd_partitions.
When I rmmod the module I simply call nand_release, because it 
automatically calls del_mtd_partitions.

However, this causes a BUG in dcache.h:276.
There is no oops if I only use a single partition.

Any thoughts on what might be going on?

Cheers
Brad
