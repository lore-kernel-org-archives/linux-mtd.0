Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Duu3n-0002LE-IK
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 11:31:12 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Duu35-0002yR-MI
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 17:30:23 +0200
Received: from s0106000024c002e0.ss.shawcable.net ([70.64.46.12])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 17:30:23 +0200
Received: from jbi130 by s0106000024c002e0.ss.shawcable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 17:30:23 +0200
To: linux-mtd@lists.infradead.org
From: jbi130@yahoo.com
Date: 19 Jul 2005 09:26:23 -0600
Message-ID: <87u0iq7r6o.fsf@nimrod.unx.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@sea.gmane.org>
Subject: Support for Intel strataflash.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I recently receive a PPC8555 evaluation board with 8 MB Intel
strataflash ROM.  I'm using 2.6.12 and am trying to get this setup as
an MTD device for use with JFFS2.

On boot all I see is:
physmap flash device: 800000 at ff800000

(the flash is at physical address 0xff800000).

I also had to enable 'Support for ROM chips in bus mapping' for this
physmap to take place.

I'm assuming that the CFI probe isn't properly detecting this chip.
Does that mean that it isn't fully supported?  I use similar options
on a similar board that uses AMD flash and it works fine.

Thanks for any input.
