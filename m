Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIpU2-0008Em-ES
	for linux-mtd@lists.infradead.org; Tue, 15 Jul 2008 18:42:43 +0000
Received: from cpe00195b4acfae-cm001868e2bdba.cpe.net.cable.rogers.com
	([99.236.99.222] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1KImcX-00054b-Fo
	for linux-mtd@lists.infradead.org; Tue, 15 Jul 2008 11:39:17 -0400
Date: Tue, 15 Jul 2008 11:38:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: help text for "config MTD_PARTITIONS" is confusing
Message-ID: <alpine.LFD.1.10.0807151135280.2731@localhost.localdomain>
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


  from drivers/mtd/Kconfig:

    config MTD_PARTITIONS
        bool "MTD partitioning support"
        help
          If you have a device which needs to divide its flash chip(s) up
          into multiple 'partitions', each of which appears to the user as
          a separate MTD device, you require this option to be enabled. If
          unsure, say 'Y'.

ok, so far, so good, but ...

          Note, however, that you don't need this option for the DiskOnChip
          devices. Partitioning on NFTL 'devices' is a different - that's the
          'normal' form of partitioning used on a block device.

that's potentially confusing since the text refers to DoC devices,
then NFTL devices, and finally a "block" device, while the reader
might not understand which device refers to what.  is the reader
supposed to appreciate the NFTL *is* used on DoC?  i'm just thinking
that that second paragraph could be clearer.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
