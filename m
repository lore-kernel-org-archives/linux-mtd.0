Received: from ext-ch1gw-5.online-age.net ([64.37.194.13])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATRYn-0001oA-KS
	for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2003 20:00:49 +0000
Received: from int-ch1gw-1.online-age.net (int-ch1gw-1 [3.159.232.65])
	id hB8JwJJ6002942	for <linux-mtd@lists.infradead.org>;
	Mon, 8 Dec 2003 14:58:26 -0500 (EST)
Received: from uswaumsxb1medge.med.ge.com (localhost [127.0.0.1])
	id hB8JwEWH010404	for <linux-mtd@lists.infradead.org>;
	Mon, 8 Dec 2003 14:58:18 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD667620A0F5E@uswaumsx07medge.med.ge.com>
From: "Howard, Michael (MED)" <Michael.Howard@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 8 Dec 2003 13:58:07 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Where are cleanmarker nodes supposed to go on NAND?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

In jffs2_check_nand_cleanmaker() I'm finding that the read_oob() call to to
the flash is going to the wrong spot.  Where are the cleanmarker nodes
supposed to be located?

My NAND flash is organized as:
128k erase block = 2k page + 64 byte OOB + 2k page + 64 byte OOB, etc...

The read_oob() call to the driver is currently trying to get from the OOB
region which I thought was only used for the ECC.  I look at other JFFS2
images and they appear to place the cleanmarker nodes at the beginning of
the 1st page.  Should I be going there to get cleanmarker, badblock and
failure counter?  Or is it all supposed to go into the 64 byte OOB region
between pages?  I'm a little confused, can anybody give me a hint?

Thanks
Mike
