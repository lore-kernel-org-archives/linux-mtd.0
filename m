Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xhg6-0001GL-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 13:25:11 +0100
Received: from ledzep.americas.sgi.com (ledzep.americas.sgi.com [137.38.226.97])
	by tolkor.sgi.com (8.12.2/8.12.2/linux-outbound_gateway-1.2) with ESMTP id g6PCP9K3006050
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 07:25:09 -0500
Received: from archer.americas.sgi.com (archer.americas.sgi.com [137.38.88.26]) by ledzep.americas.sgi.com (SGI-SGI-8.9.3/americas-smart-nospam1.1) with ESMTP id HAA45174 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 07:25:09 -0500 (CDT)
Received: from sgi.com (localhost [127.0.0.1]) by archer.americas.sgi.com (8.8.8/ASC-news-1.4) with ESMTP id HAA138621 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 07:25:09 -0500 (CDT)
Message-ID: <3D3FEE24.49D26D61@sgi.com>
Date: Thu, 25 Jul 2002 07:25:08 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Integrating new MTD/jffs2 into 2.4.18 kernel
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I am running on an ARM platform using the 2.4.18 kernel with 2.4.18-rmk7
patch.  I'm using the MTD NAND flash support, and I'm having problems
running a jffs2 filesystem on a NAND flash device  (not a root
filesystem,
just a writable "scratch" directory).

Using a snapshot from yesterday, I tried to integrate the jffs2 from
the snapshot into my kernel.  But there were a few issues:
- include/linux/crc32.h but expected by the files in fs/jffs2
- zlib.[ch] were not in the jffs2 dir as they were previously

I tried fixing these, but still ended up missing the zlib_deflate*
functions.....

So my question is:   is there a place I can grab the MTD/jffs2 stuff
to drop directly into a 2.4.18-rmk7 kernel?   Or, is there a
procedure somewhere describing how to integrate the latest MTD
from CVS (especially jffs2) into the latest 2.4.x kernel?

Thanks in advance!

Steve


-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
