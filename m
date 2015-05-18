Received: from spornkuller.de ([5.45.105.28])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuLUl-0005p1-9d
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 13:54:16 +0000
Received: from spornkuller.de (localhost [IPv6:::1])
 by spornkuller.de (Postfix) with ESMTP id BFC6917F432
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 15:53:51 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 May 2015 15:53:51 +0200
From: Johannes Bauer <weolanwaybqm@spornkuller.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Wear-leveling peculiarities
Message-ID: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list,

I keep track of some devices running an embedded ARM Linux which boots 
from NAND flash. On there, ubifs is used. The deployed kernels are:

Linux version 3.0.59 (###@###) (gcc version 4.5.4 20120305 (prerelease) 
(GCC) ) #1 Mon Apr 29 16:36:42 CEST 2013

Target is ARMv7 (omap2).

The units have been deployed for three years now. Recently, we've been 
seeing units fail more often. This warranted some investigation. I 
pulled dd images of the relevant /dev/mtd device (mtd4 in my case) and 
wrote a small Python script that evaluated the UBIFS LEB headers, in 
particular the erase count. I expected to see a uniform distribution of 
erases all around the flash.

But on the contrary, we see the very opposite:

http://imgur.com/a/d5Bhl

Here you see graphs of two units. You can see that the pattern is 
identical: Lots of pages which were written seldomly, lots of pages 
which were written frequently. Very little inbetween. This is what the 
histograms show (erase count on the X axis and their occurences on the Y 
axis).

The other graphs are even more disturbing. It shows the physical layout 
of the NAND flash. Each pixel corresponds to one LEB. Everything upwards 
of 100 erases is red (the scale is linear, shown at the very bottom). 
You can see that in some areas, pages are erased very often while in 
others they're virtually constant.

This is something I'd expect if the FS would not perform wear-leveling 
(files that are written in-place cause page erases at the same locations 
over and over). But ubifs should take care of this, shouldn't it? It 
might well be that my understanding of ubifs is too limited so I don't 
grasp the whole picture. In any case, any advice is greatly appreciated.

Thanks in advance,
Johannes
