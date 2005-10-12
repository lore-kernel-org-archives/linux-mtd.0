Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPdwo-0006N8-Ec
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 06:35:26 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.100.58])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay01.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 12 Oct 2005 10:34:52 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id EF5E662B3
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Oct 2005 12:33:57 +0200 (CEST)
Message-ID: <434CE6CB.9040509@gmail.com>
Date: Wed, 12 Oct 2005 12:34:51 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: How to determine MTD/JFFS2 RAM consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm trying to measure some memory requirements and would be glad if I 
got some clues from the experts.

- "Static" requirements

Memory needed to run/use MTD/JFFS2 at all.
I don't wanted to dig as deep into the source code to analyze some 
malloc()s, so I tried a very very simple thing like this:
	cat /proc/meminfo
	insmod jffs2.ko
	cat /proc/meminfo
I really don't know if this method is adequate at all. Is it?...


- "Dynamic" requirements

RAM allocated due to write operations on mounted JFFS2.
According to JFFS white paper there should be a struct jffs2_inode_cache 
and a struct jffs2_raw_node_ref in memory for each (i)node after all.
structs jffs2_raw_inode, jffs2_raw_dirent, jffs2_full_dnode are freed 
after creating/writing around.
struct jffs2_inode_info is reclaimed under pressure.
(What about struct jffs2_node_frag?)
Thus, memory consumption can be calculated out of the size of the two 
structs jffs2_inode_cache and jffs2_raw_node_ref. Right?...


- Some questions to the "cat /proc/slabinfo | grep jffs" below:

JFFS2 is existing, e.g. .ko inserted:
 > jffs2_inode_cache      0      0     24  156
 > jffs2_node_frag        0      0     28  135
 > jffs2_raw_node_ref     0      0     16  226
 > jffs2_tmp_dnode        0      0     12  290
 > jffs2_raw_inode        0      0     68   58
 > jffs2_raw_dirent       0      0     40   96
 > jffs2_full_dnode       0      0     16  226
 > jffs2_i                0      0    340   11

JFFS2 mounted (empty):
 > jffs2_inode_cache      1    156     24  156
 > jffs2_node_frag        0      0     28  135
 > jffs2_raw_node_ref    64    226     16  226
 > jffs2_tmp_dnode        0      0     12  290
 > jffs2_raw_inode        0      0     68   58
 > jffs2_raw_dirent       0      0     40   96
 > jffs2_full_dnode       0      0     16  226
 > jffs2_i                1     11    340   11

10 files (<<4KiB) written
 > jffs2_inode_cache     11    156     24  156
 > jffs2_node_frag       10    135     28  135
 > jffs2_raw_node_ref   103    226     16  226
 > jffs2_tmp_dnode        0      0     12  290
 > jffs2_raw_inode        0      0     68   58
 > jffs2_raw_dirent       0      0     40   96
 > jffs2_full_dnode      10    226     16  226
 > jffs2_i               11     11    340   11

- Why are there 64 jffs2_raw_node_refs after mounting an empty JFFS2?
- Why are there 103 jffs2_raw_node_ref after writing 10 (small) files?
- What about jffs2_node_frag and jffs2_full_dnode?
- What about the num_objs numbers (156, 135, 226,...)?

Thank you very much, Regards,
Bernhard
