Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MShTN-0002N8-6h
	for linux-mtd@lists.infradead.org; Mon, 20 Jul 2009 01:15:24 +0000
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1MShTI-0000cH-Fv
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 21:15:16 -0400
Date: Sun, 19 Jul 2009 21:12:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: MTD_DATAFLASH_VERIFY_WRITE typo
Message-ID: <alpine.LFD.2.00.0907192111220.17927@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  there appears to be an inconsistency here:

drivers/mtd/devices/mtd_dataflash.c:#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
drivers/mtd/devices/mtd_dataflash.c:#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */
drivers/mtd/devices/Kconfig:config MTD_DATAFLASH_WRITE_VERIFY

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================
