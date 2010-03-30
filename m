Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwabN-0004ci-UE
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 12:31:29 +0000
Received: from guests.acceleratorcentre.net ([209.222.173.41]
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NwabM-00066o-Vz
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 08:31:25 -0400
Date: Tue, 30 Mar 2010 08:29:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: simplifying the linux MTD Kconfig/Makefile structure
Message-ID: <alpine.LFD.2.00.1003300824320.6061@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  it seems like the various Kconfigs and Makefiles related to MTD
could be tightened up a bit.  for instance, in drivers/mtd/Makefile:

  obj-$(CONFIG_MTD_UBI)           += ubi/

but given that selection, it's kind of redundant to then have
drivers/mtd/ubi/Makefile start with:

  obj-$(CONFIG_MTD_UBI) += ubi.o

is it not?  why not just "obj-y"?

  along those lines, again from drivers/mtd/Makefile:

obj-y           += chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/

obj-$(CONFIG_MTD_UBI)           += ubi/

  why not be consistent and have:

obj-y           += chips/ lpddr/ maps/ devices/ nand/ onenand/

obj-$(CONFIG_MTD_UBI)           += ubi/
obj-$(CONFIG_MTD_TESTS)         += tests/

which would *massively* simplify drivers/mtd/tests/Makefile, would it
not?

  i can submit some patches if there's any interest.  i suspect some
of the other directories could be similarly tidied up.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
