Received: from server.itc.hu ([195.70.56.227] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DQQV-0001d3-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2001 13:24:59 +0000
Received: from localhost (don@localhost)
	by server.itc.hu (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA25937
	for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2001 15:10:46 +0100
Date: Mon, 10 Dec 2001 15:10:46 +0100 (CET)
From: =?iso-8859-1?Q?P=E1sztor_Szil=E1rd?= <don@itc.hu>
To: linux-mtd@lists.infradead.org
Subject: patch for JEDEC+mixmem
Message-ID: <Pine.LNX.4.21.0112101509230.25933-100000@server.itc.hu>
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

Hi

  While writing the driver for 2 flash memory cards, we (ITC) stumbled upon 
some errors (?) in the jedec code that we were supposed to use. So, for now,
we applied some changes to it and added our driver that was already present
in the 2.2.x series but needed a rewrite for 2.4.

  We would appreciate it if you took the time and looked into the patch at

        ftp://ftp.itc.hu/pub/linux/v2.4/linux-2.4.16-mixmem-patch

and decided if our changes are to be considered. We, however, might have
failed in understanding the code, though our hopes are we made it more
workable. The patch contains comments on the changes in the source.

regards
s.
ITC

            --------------------------------------------------------
            |   Vitality from Vitamins, Brutality from Brutamins.  |
            --------------------------------------------------------
