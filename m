Received: from tomts22-srv.bellnexxia.net ([209.226.175.184])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LYSM-0001mb-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 01:08:46 +0100
Received: from superbt.com ([65.93.120.40]) by tomts22-srv.bellnexxia.net
          (InterMail vM.5.01.04.19 201-253-122-122-119-20020516) with ESMTP
          id <20020622000845.XNRQ25645.tomts22-srv.bellnexxia.net@superbt.com>
          for <linux-mtd@lists.infradead.org>;
          Fri, 21 Jun 2002 20:08:45 -0400
Received: from localhost (ilatypov@localhost)
	by superbt.com (8.11.4/8.11.4) with ESMTP id g5M08jf18694
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 20:08:45 -0400
Date: Fri, 21 Jun 2002 20:08:39 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: a ROM BIOS extension can interfere with GRUB/DoC
Message-ID: <Pine.LNX.4.44.0206212001100.18637-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Leaving a jumper 3-4 of the set JP1 on Advantech's PC/104 PCMCIA adapter 
PCM-3112 will cause the adapter to run a ROM BIOS extension which prevents 
BIOS from seeing DiskOnChip 2000 ROM extension.

The adapter's extension displays a signature containing the name Prestico 
and the version 2.02.  Once the jumper is removed, the DiskOnChip's 
extension is recognised by BIOS again.

Ilguiz
