Received: from tx05.mailwise.com ([216.75.199.108])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IfPQm-0004gn-Rs
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 01:28:12 +0100
Received: from trk06.mailwise.com (trk06.mailwise.com [216.75.199.27])
	by tx05.mailwise.com (Postfix) with ESMTP id 07F1D152C8E
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Oct 2007 20:25:51 -0400 (EDT)
Received: from DELTAMC.deltad.com (63-193-62-24.ded.pacbell.net [63.193.62.24])
	by trk06.mailwise.com (MailWise LLC - Intelligent Email Protection)
	with ESMTP id 997B4243227 for <linux-mtd@lists.infradead.org>;
	Tue,  9 Oct 2007 20:25:50 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Mounting a Jffs2 onto AT45DB642D serial dataflash with ATRM9200
Date: Tue, 9 Oct 2007 17:25:50 -0700
Message-ID: <BEFF30BFC93A214FB7F13D987F13444B13D83C@DELTAMC.deltad.com>
From: "Louay Mouradi" <lmouradi@bms-inc.com>
To: <linux-mtd@lists.infradead.org>
Cc: Louay Mouradi <lmouradi@bms-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
Hi

I'm porting linux 2.6.19 onto an AT91RM9200 ARM920T core processor.

I want to be able to load a Jffs2 filesystem through an AT45DB642D =
serial dataflash.

The U-boot sees and uses this serial dataflash correct.  But I can't get =
the kernel to see the serial dataflash.

When I run the cat /proc/mtd, I don't see the serial dataflash.  I can =
see the SPI driver, mci driver showup in the sys folder.

How can I get the kernel to see the serial dataflash?  Is the mmc driver =
needed, I have enabled mmc, SPI and MTD options.

Thanks,


L.M.

=20
