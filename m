Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAAJ1-00089W-2K
	for linux-mtd@lists.infradead.org; Sat, 12 Mar 2005 12:21:39 -0500
Received: from [10.1.1.102] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	12 Mar 2005 12:21:37 -0500
Date: Sat, 12 Mar 2005 12:20:27 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0503121217090.24583@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: how to access jffs2 partition properties?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  on a PPC system using a 2.4.22 kernel, is there a way to access the
properties for the jffs2 filesystems that have been defined on the two
flash chips this system has?

  it's easy enough to see the devices /dev/mtdblock/[0-4] that
represent the partitions, and the file /proc/partitions contains:

  31     0         64 mtdblocka
  31     1        384 mtdblockb
  31     2        128 mtdblockc
  31     3       3072 mtdblockd
  31     4      29184 mtdblocke

but can i examine, for each of these, its chip, starting address,
ending address, etc?  thanks.

rday
