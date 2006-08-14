Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GCQuj-0005uJ-Ka
	for linux-mtd@lists.infradead.org; Sun, 13 Aug 2006 21:06:55 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J3Y00A29R35ND@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Aug 2006 10:06:41 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPSA id <0J3Y00HBJR34J6@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Aug 2006 10:06:41 +0900 (KST)
Date: Mon, 14 Aug 2006 10:06:58 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: Re: OneNAND - Cannot mount jffs2 partition (Amit kumar Sharma)
To: linux-mtd@lists.infradead.org
Message-id: <001b01c6bf3d$f12b39d0$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=euc-kr
Content-transfer-encoding: 7BIT
Cc: =?euc-kr?B?J8GkvcLB+C9GbGFzaLHiyLmx17fsIFwouN648LiuXCkgL0U1IFwo?=,
	=?euc-kr?B?J7Hov7Ww7yc=?= <younggon.kim@samsung.com>,
	=?euc-kr?B?w6XA01wpIC+777y6wPzA2ic=?= <seungjin.jung@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi John 

For creating JFFS2 on One nand image use these options 

./flasheraseall -j /dev/mtd partition

./mkfs.jffs2 --pad=0x3e80000 (ur mtd onenand partition size) -s 2KiB -m
none -e 128KiB(block size) --root=empty/(source directory for image ) -o
jffs2.image(output file)

Use nandwrite from mtd utils for image writing 

Thanks	
Amit
