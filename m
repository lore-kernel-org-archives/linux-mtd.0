Received: from oslab.snu.ac.kr ([147.46.245.249])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IilDI-0000a1-1N
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 07:20:07 +0100
Received: from [127.0.0.1] (september.snu.ac.kr [147.46.245.229])
	by oslab.snu.ac.kr (8.13.2/8.13.2) with ESMTP id l9J6ImEV011804
	for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2007 15:18:48 +0900
Message-ID: <47184C4A.5010504@oslab.snu.ac.kr>
Date: Fri, 19 Oct 2007 15:18:50 +0900
From: Sehwan Lee <trinite@oslab.snu.ac.kr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: FTL or NFTL can support large block NAND (or OneNAND)?
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i couldn't find supoort of large block flash memory through mailing list
because mailing list archives at
"http://lists.infradead.org/pipermail/linux-mtd/" is dead link for a
long time.

anyway, i want to find naive FTL source. but both FTL and NFTL in the
Linux kernel support 512-byte page not 2KB. so i can't use it.

how to use FTL or NFTL on the large block flash memory device?
