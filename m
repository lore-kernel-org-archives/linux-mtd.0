Received: from stoneboat.aleph1.co.uk ([212.13.198.63] helo=home.wookware.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAHia-00073s-UA
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 20:44:18 -0400
Received: from carnet-gw.aleph1.co.uk ([195.224.76.10] helo=court.aleph1.co.uk)
	by stoneboat.aleph1.co.uk with esmtp (Exim 3.35 #1 (Debian))
	id 1CAHhv-000096-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Sep 2004 01:43:35 +0100
Received: from xios.aleph1.co.uk ([194.70.44.170] helo=xios ident=Debian-exim)
	by court.aleph1.co.uk with esmtp (Exim 3.35 #1 (Debian))
	id 1CAHi4-00063v-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Sep 2004 01:43:44 +0100
Received: from wookey by xios with local (Exim 4.34) id 1CAHhs-0006Se-1w
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 01:43:32 +0100
Date: Thu, 23 Sep 2004 01:43:32 +0100
From: Wookey <wookey@aleph1.co.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20040923004331.GA24050@xios>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Wookey <wookey@aleph1.co.uk>
Subject: Finding which block 'contains' a missing inode  
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello people, I have a JFFS2 NAND rootfs which is giving a single 
'Eep. Child "gpe-filemanager.desktop" (ino #3324) of dir ino #3035 doesn't
exist!' error.

I'd like to know if there is a way of finding out either form the live fs or
from the jffs2 image file which block the offending inode/file should have
been on?

Background: The kernel indicated one 'bad erase block' that is under this
fs, but flasheraseall found no problem, and nandwrite did not skip that
block. I worry that the block in question doesn't actually have the right
data in it - if it corresponded to the above inode then I'd be sure I had
located the problem.

There is also a 'normal' bad block (which gives an IO error when
flasheraseall tries to erase it) - this _is_ skipped by nandwrite as expected.

TIA

Wookey
-- 
Aleph One Ltd, Bottisham, CAMBRIDGE, CB5 9BA, UK  Tel +44 (0) 1223 811679
work: http://www.aleph1.co.uk/     play: http://www.chaos.org.uk/~wookey/
