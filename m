Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DCPRK-00079i-9v
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2005 16:55:31 -0500
Received: from [10.1.1.102] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	18 Mar 2005 16:55:26 -0500
Date: Fri, 18 Mar 2005 16:54:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0503181635320.31009@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: will auto-formatting span physical flash chips?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  a colleague poses the following problem for which i have no answer:
two 8M flash chips, for which there is defined a single 12M partition
that spans the last 4M of the first chip and all of the second chip.

  the first part of that 12M partition has to contain some data at
ship time so, at a minimum, that part of the flash has to have a valid
JFFS2 filesystem.

  can the second physical chip still be left as all unformatted xFF's?
so that it will be auto-formatted on mount?  apparently, it costs
money to format each chip and, since they're delivered with all xFF's,
it would be nice to leave the second chip that way and save the $$.

  can this be done?

rday
