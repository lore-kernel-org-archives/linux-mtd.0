Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL5BF-0005dL-9s
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 16:06:46 -0400
Received: from [10.1.1.138] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	11 Apr 2005 16:06:44 -0400
Date: Mon, 11 Apr 2005 16:04:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0504111600540.28647@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: why can i select both PHYSMAP and MULTI_PHYSMAP?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  patched my 2.6.11.7 kernel tree with the latest mtd CVS to get the
mphysmap.c and i'm a bit confused.  in the

  Mapping drivers for chip access -->

menu, i can apparently select, simultaneously,

  <*> CFI Flash device in physical memory map
  <*> multiple CFI Flash devices in physical memory map

this seems contradictory, especially since i can deselect the first
while still select the second.  am i misreading what these mean?  or
is this some non-intuitive stuff to be backward-compatible?

rday
