Received: from ext-nj2gw-3.online-age.net ([216.35.73.165])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ASNwc-0001X4-VS
	for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2003 21:57:03 +0000
Received: from int-nj2gw-5.online-age.net (int-nj2gw-5 [3.159.236.69])
	id hB5LsqDF027153	for <linux-mtd@lists.infradead.org>;
	Fri, 5 Dec 2003 16:54:52 -0500 (EST)
Received: from uswaumsxb1medge.med.ge.com (localhost [127.0.0.1])
	id hB5Lspd5004067	for <linux-mtd@lists.infradead.org>;
	Fri, 5 Dec 2003 16:54:51 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD667620A0F4E@uswaumsx07medge.med.ge.com>
From: "Howard, Michael (MED)" <Michael.Howard@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 5 Dec 2003 15:54:45 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: Why restrict to page aligned writes in nand_write_ecc() ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

My nand flash has a 2k page size.  This restriction causes all JFFS2 writes
to fail.  Cleanmarkers can't be written (12 bytes) and inodes that come in
at 68 bytes are also rejected.  In order to get JFFS2 working, is it better
to remove this restriction at the driver level or must all nodes be padded
out to 2048 bytes in JFFS2?

Thanks
Mike
