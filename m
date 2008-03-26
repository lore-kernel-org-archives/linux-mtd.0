Received: from [202.75.200.241] (helo=mailgw.cms.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeMr1-0005eV-KO
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 04:03:13 +0000
Received: from [172.19.23.21] ([172.19.23.21])
	by mailgw.cms.com (8.12.11/8.12.11) with ESMTP id m2Q42Kdn013576
	for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2008 09:32:21 +0530
Subject: MTD
From: Aneesh <aneesh_g@cms.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 26 Mar 2008 09:28:29 +0530
Message-Id: <1206503909.3091.2.camel@Aneesh>
Mime-Version: 1.0
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
        I am Using an arm9 processor(kernel 2.6.24) and tried to
implement JFFS2 in parallel flash for data storage.but it failed .
my parallel flash is AT49BV642DT .First i erased the flash and mounted
to a drive .then i created a file there .After that i unmounted the
drive .and
 when i am trying to mount the jffs2 again  ,It is showing an error like
follows
"Magic bitmask 0x1985 not found at 0x007e0078:  0x6d63 instead  "
can you help me to solve this problem ?
                                                    Regards
                                                            Aneesh.
