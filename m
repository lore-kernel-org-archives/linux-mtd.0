Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DKkDI-0000Md-UW
	for linux-mtd@lists.infradead.org; Sun, 10 Apr 2005 17:43:29 -0400
Received: from [10.1.1.138] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	10 Apr 2005 17:43:30 -0400
Date: Sun, 10 Apr 2005 17:41:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  currently, my 8xx 2.4 kernel-based system defines its flash layout
with a proprietary driver file we installed into the "maps" directory,
but i'd like to simplify that approach.

  certainly, i can use command-line partitioning to define all of the
partitions, making the driver file *way* simpler.  can i somehow avoid
even the creation of that driver file (so i don't have to mess with
the kernel source tree at all)?

  i just read that there is a generic driver for accessing CFI flash
chips on systems that have no specific mapping driver.  does this mean
what i think it means?  that i can somehow take advantage of that
generic driver to avoid having to write my own?

  i need to be able to concatenate 2 16M chips into a single 32M
address space, then partition into 5 or 6 partitions.  am i being too
optimistic about not needing my own driver map program if i can use
the "generic" one?

rday
