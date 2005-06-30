Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Do04q-0007Dp-N8
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2005 15:31:41 +0100
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (Motorola/Motgate7) with ESMTP id j5UEeEW9029815
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2005 07:40:14 -0700 (MST)
Received: from il02exm15.corp.mot.com (il02exm15.corp.mot.com [10.0.111.27])
	by il06exr04.mot.com (8.13.1/8.13.0) with ESMTP id j5UEZgmj009348
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2005 09:35:42 -0500 (CDT)
Message-ID: <53F44AF77A9F9B458DCE1910C2E626381227BBB5@il02exm15.corp.mot.com>
From: Lindstrom James-A19027 <A19027@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 30 Jun 2005 09:31:24 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: something drastic (relocating the BNAND media header)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi gang,

I've written twice this month asking for help getting my MD2202-D384 DoC
working.  I've got the kernel (2.4.18 (with cerf patches) plus snapshot
2005-03-04 plus my hacks to get it to build) to recognize my controller,
but the issue was that it wasn't finding a BNAND media header.  I tweaked
my page size from 0x4000 down to 0x2000 and sure enough the code found a
BNAND media header at 0x2000 (not a boundary it was checking, clearly,
using the larger page size).  Strangely, though, using that page size, and
given the size of my DOC (384MB), there were >= 32768 pages and, thus, the
mtd code complained that the nMultiplierBits was too small or something 
like that.  I removed that check just to see if the mtd code could even see
the partitions or anything.  It did see two partitions (which was correct)
but things were clearly screwed up.

( The back story is this: the previous engineer using these chips had used
the MSYS drivers and formatted two EXT2 partitions onto it. )

So here's where the fun comes in.  Diskonchip.c doeesn't see the BNAND 
media header at pagesize=0x4000, but at pagesize=0x2000 it sees it and says
that nMultiplierBits isn't sane.  Does anyone think I'd have any luck if I hacked in some code that reads my media header, writes it to 0x4000 and then
use pagesize=0x4000 as though everything were normal?  What I'd hope is that
if I do that, and set the nPartitions to 0, then I'd be able to fdisk the 
/dev/mtdX (X=4 in my case, as I've got 0-3 for flash).  

How badly will this probably screw things up?  Should I have a fire
extinguisher near by?  Is this likely to hose the DOC?

jbl
