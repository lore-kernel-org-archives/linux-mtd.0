Received: from dsl-62-3-66-203.zen.co.uk
	([62.3.66.203] helo=crown.nexus.co.uk ident=foobar)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1APMtl-0001kp-Bv
	for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2003 14:13:37 +0000
Received: from dsl-62-3-66-201.zen.co.uk ([62.3.66.201]
	helo=dobblers.nexus.co.uk)
	by crown.nexus.co.uk with esmtp (TLS-1.0:DHE_RSA_3DES_EDE_CBC_SHA:24)
	(Exim 4.24)	id 1APMsG-0002zM-R0
	for linux-mtd@lists.infradead.org; Thu, 27 Nov 2003 14:12:04 +0000
From: John Stirling <js@reciva.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1069942310.4574.62.camel@dobblers.nexus.co.uk>
Mime-Version: 1.0
Date: 27 Nov 2003 14:11:51 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: NAND support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm in the process of updating our kernel (2.4.19-rmk7-pxa1) to include
support for NAND flash. 

I'm working with cvs snapshot mtd-snapshot-20031117.tar.bz2. 

It installed successfully via 
./patchin.sh -c -j /home/jgs/proj/ir_intel_db/source/linux_lubbock/
I applied patch ilookup-2.4.23.patch.


Can someone tell me which kernel options I should enable to give me a
good starting point to port to our NAND flash device (samsung
k9f2808u0m) ? I have read the jffs-how-to document but can't see the
settings required for nand flash support.

Regards
John
