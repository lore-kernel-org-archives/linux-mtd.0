Received: from julia.math.ucla.edu ([128.97.4.5])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0VOj-0002s9-Mq
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 00:33:01 -0400
Received: from xena.cft.ca.us (pool-71-104-218-155.lsanca.dsl-w.verizon.net
	[71.104.218.155])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "Jim Carter",
	Issuer "UCLA-Mathnet Root Certificate" (verified OK))
	by julia.math.ucla.edu (Postfix) with ESMTP id A221C51B7D
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jun 2007 21:32:54 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by xena.cft.ca.us (Postfix) with ESMTP id 090343BC79
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jun 2007 21:32:53 -0700 (PDT)
Date: Mon, 18 Jun 2007 21:32:53 -0700 (PDT)
From: Jim Carter <jimc@math.ucla.edu>
Sender: jimc@xena.cft.ca.us
To: linux-mtd@lists.infradead.org
Subject: Stomping bad block
Message-ID: <Pine.LNX.4.64.0706182124410.5105@xena.cft.ca.us>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a Nokia 770 Internet Tablet with 128 Mb of NAND flash memory
containing the root filesystem etc. as JFFS2.  It's using kernel 2.6.16
for TI OMAP-1710 (ARM family).  I believe I have two adjacent bad bytes
(16 bits): the symptom is that every few months a system file (e.g.
/usr/lib/libopera.so) will turn up with an incorrect checksum from a
tripwire-type program I wrote, and plausibly related buggy behavior will
be seen (so far not fatal, cross fingers).  I use "od" on the desktop
machine to compare the file from the flash image with the file currently
on the Nokia 770, and I always find two adjacent bytes of 0.

At that point I use rsync -I to copy the image file to a temporary name
on the device, and it then renames the new instance replacing the
corrupt file, which then has no links and is removed (allocated blocks
abandoned).  My understanding is that the garbage collector would sooner
or later erase the abandoned erase blocks.  Then when new data was
written, or when old data was churned for wear leveling, a read check
would fail, and if this happened three times in succession, the block
would be marked bad permanently.

But the bad erase block is still in service.  My guess is that upon 
rewriting it can be read-checked without errors, but after some time 
passes, seconds to weeks, the bits return to zero.  How could I stomp this 
block manually?  I think the answer will have two parts: how do I translate 
an offset in a JFFS2 file to an erase block number, and what do I do once I 
have this number (i.e. how do I alter the out of band byte 5)?


James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)
