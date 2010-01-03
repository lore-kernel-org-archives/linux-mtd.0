Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NRPQm-0005Bv-78
	for linux-mtd@lists.infradead.org; Sun, 03 Jan 2010 12:19:40 +0000
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NRPQj-0007nX-CB
	for linux-mtd@lists.infradead.org; Sun, 03 Jan 2010 07:19:33 -0500
Date: Sun, 3 Jan 2010 07:18:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: what's with CONFIG_MTD_PISMO?
Message-ID: <alpine.LFD.2.00.1001030716270.13494@localhost>
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


  at the moment, there is a Makefile reference to a non-existent
Kconfig variable:

./drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PISMO)    += pismo.o

  but there is no definition of Kconfig variable MTD_PISMO.  should
this be defined in a Kconfig file somewhere?

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
