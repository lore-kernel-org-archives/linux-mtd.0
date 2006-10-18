Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga9UE-0001UU-2t
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 07:21:36 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9IBLMP1022246
	for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2006 13:21:22 +0200
Date: Wed, 18 Oct 2006 13:22:38 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Reading less than page size from NAND ok?
Message-ID: <Pine.LNX.4.64.0610181315170.25906@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


In the NAND boot code for U-Boot 1.4.4 (which use MTD (albeit an old=20
version)), there is a note that when reading from NAND flash via the mtd=20
layer (i.e. eventually ending up in nand_do_read_ecc()), one should start=
=20
reading on a page boundary and read at least one page of data, in order to=
=20
get proper ECC behavior.

However, when looking at the latest mtd code, it appears that this no=20
longer is the case - when reading bursts of data less than one page, the=20
data is internally buffered and a complete page read so that ECC is always=
=20
applied properly. Is this in fact the case, or have I missed something=20
vital here? (Was there such a limitation once?)

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
