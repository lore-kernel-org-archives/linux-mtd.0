Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvD6M-000531-MS
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:02:03 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l54DxrEx009983
	for <linux-mtd@lists.infradead.org>; Mon, 4 Jun 2007 15:59:53 +0200
Date: Mon, 4 Jun 2007 15:58:01 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [Yaffs1] mkyaffs exits with "MTD Erase failure"
In-Reply-To: <f412p4$b20$1@sea.gmane.org>
Message-ID: <Pine.LNX.4.64.0706041549010.3966@lnxricardw.se.axis.com>
References: <f412p4$b20$1@sea.gmane.org>
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


On Mon, 4 Jun 2007, Martin Egholm Nielsen wrote:

> I have run into a problem: By "accident", we changed the die of our NAND
>  without paying attention to the new timing parameters.
> Hence, the read-operation (with fixed timing!) reported ready before
> data was actually ready on the NAND. Consequently, this caused checksum
> errors, and several blocks was erroneously marked bad!
>
> So, I fixed the timing in the kernel and tried erasing the flash again.
> But with no luck - mkyaffs refuses to erase/program the flash:

Mtd refuses to erase blocks that have been marked bad. There is no=20
workaround on a running kernel, but it is possible to patch the kernel to
do this.

The patch depends on whether or not you have a flash-based bad block=20
table. Most do, but my only experience has been without the flash-based=20
BBT. In this case, you simply remove the if clause around=20
nand_block_checkbad() in mtd/nand/nand_base:nand_erase_nand(), recompile,=
=20
and use that kernel to erase the blocks that have accidentally been marked=
=20
bad.

If you're using a flash-based BBT you need to fiddle with the table to=20
unmark the bad blocks. Probably not too difficult, but I've never done=20
that myself. AFAIK, mtd doesn't mark the actual blocks as bad, so you=20
don't need to erase the bad block markers in the offending blocks in this=
=20
case, only clear the blocks in the BBT.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
