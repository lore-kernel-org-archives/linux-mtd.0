Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gfh1Y-0005ls-E4
	for linux-mtd@lists.infradead.org; Thu, 02 Nov 2006 13:10:51 -0500
Received: from archite by server37.tchmachines.com with local (Exim 4.52)
	id 1Gfh1H-00075W-Jh
	for linux-mtd@lists.infradead.org; Thu, 02 Nov 2006 13:10:27 -0500
Message-ID: <45924.69.30.123.186.1162491027.squirrel@www.architechnical.net>
Date: Thu, 2 Nov 2006 13:10:27 -0500 (EST)
Subject: Clarification on PLACE -vs- AUTO with JFFS2 cleanmarkers.
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've written a custom driver for the ST 512R3A 8-bit NAND under 2.6.16 and
ported it to 2.6.18.  Because of some chip and system peculiarities I was
unable to use the NAND framework and wrote it using solely MTD (except for
software ECC).  The problem occurs when mounting a JFFS2 file system: the
cleanmarker is written to bytes 0-7 (ECC, bad block marker) instead of
8-15 of the OOB, as instructed by the write_ops call with ooboffs=0,
ooblen=8, and mode=MTD_OOB_PLACE.  My understanding is that MTD_OOB_AUTO
should be used to put the cleanmarker into the the free bytes; am I
mistaken?  I've corrected what we thought were other problems with len and
ooblen in wbuf.c but it looks like that patch came out Monday.

Thanks for any clarification,
Pete MacKay
