Received: from mail1.navico.com ([194.19.84.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUVQQ-00044o-03
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 00:15:32 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Bad blocks in MLC NAND
Date: Wed, 4 Feb 2009 13:15:21 +1300
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E08611D43@exch01-aklnz.MARINE.NET.INT>
In-Reply-To: <782515bb0902031457m58ed45c2yb0045b6fbf4896bd@mail.gmail.com>
References: <70F6AAAFDC054F41B9994A9BCD3DF64E085309BC@exch01-aklnz.MARINE.NET.INT>
	<782515bb0902031457m58ed45c2yb0045b6fbf4896bd@mail.gmail.com>
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: "Nishanth Menon" <menon.nishanth@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I thought we can override the defaults by using nand_bbt_descr and
passing it to  nand->badblock_pattern ?
> I had a similar question based on
>
http://lists.infradead.org/pipermail/linux-mtd/2009-January/024138.html

This is not related to the 8x/16x interface differences, rather it is
the difference between BB handling of SLC and (most) MLC nand devices.

The nand_bbt_descr struction contains information on the location of the
bad block marker within a given page, not which page inside a block
contains the bad block marker.

Also, this structure is not used by the nand_block_bad function in
nand_base.c anyway. It would be possible for a driver to override the
nand_chip -> block_bad function to re-impliment nand_block_bad, however
I don't think this should happen at the nand driver level.

Supporting the majority of MLC nand should be something that the nand
layer should do as standard.

Reuben
