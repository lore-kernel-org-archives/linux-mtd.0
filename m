Received: from mail1.navico.com ([194.19.84.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LURVb-00057n-9B
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 20:04:37 +0000
Received: from exch-oslno.SIMRAD.NET.INT (unverified [157.237.5.27]) by
	mail1.navico.com
	(Vircom SMTPRS 4.5.654.13) with ESMTP id <B0007809008@mail1.navico.com>
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2009 21:04:24 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Bad blocks in MLC NAND
Date: Wed, 4 Feb 2009 09:04:22 +1300
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E085309BC@exch01-aklnz.MARINE.NET.INT>
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As far as I can see, the NAND code is assuming that the bad block marker
is always in the first byte of the oob area in the FIRST page of each
block.

This is not true for MLC nand from most manufacturers. As far as I can
tell, only Micron actually place their bad block markers at this
location in MLC nand.

For other manufacturers, the bad block markers are being placed in the
first byte of the oob in the LAST page of a bad block. I have seen this
in the datasheets for NAND from Samsung (eg. K9G8G08UOA) or Numonyx (eg
NAND08GW3C2B).

So my question is - am I missing something, or are MLC nand chips from
these manufacturers not yet supported?

Reuben
