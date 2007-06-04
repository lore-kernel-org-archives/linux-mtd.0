Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvEGU-0007Pv-Dr
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 11:14:45 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l54FEVZj019147
	for <linux-mtd@lists.infradead.org>; Mon, 4 Jun 2007 17:14:31 +0200
Date: Mon, 4 Jun 2007 17:12:40 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [Yaffs1] mkyaffs exits with "MTD Erase failure"
In-Reply-To: <f41817$vir$1@sea.gmane.org>
Message-ID: <Pine.LNX.4.64.0706041709100.3966@lnxricardw.se.axis.com>
References: <f412p4$b20$1@sea.gmane.org>
	<Pine.LNX.4.64.0706041549010.3966@lnxricardw.se.axis.com>
	<f41817$vir$1@sea.gmane.org>
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

>>> So, I fixed the timing in the kernel and tried erasing the flash
>>> again. But with no luck - mkyaffs refuses to erase/program the
>>> flash:
>
>> Mtd refuses to erase blocks that have been marked bad. There is no
>> workaround on a running kernel, but it is possible to patch the
>> kernel to do this.
>
> But as you see, flash_eraseall on the same device works perfectly fine:
>
> flash_eraseall /dev/mtd0
> ....
> Skipping bad block at 0x0179c000
> Erasing 16 Kibyte @ 1ffc000 -- 99 % complete.

flash_eraseall skips bad blocks while erasing. I don't know how mkyaffs=20
works though.

>> The patch depends on whether or not you have a flash-based bad block
>> table. Most do, but my only experience has been without the
>> flash-based BBT. In this case, you simply remove the if clause around
>> nand_block_checkbad() in mtd/nand/nand_base:nand_erase_nand(),
>> recompile, and use that kernel to erase the blocks that have
>> accidentally been marked bad.
>
> I have a kernel with this patch, yes - and it does work. However, then I=
=20
> remove the factory-marked ones, as well. Not a good idea!

You can always re-mark the factory bad ones, given that you have written=20
down which they were once... if you are using a flash-based BBT, erasing=20
the BBT blocks would suffice, as the bad block management in jffs2 when=20
using a flash-based BBT doesn't touch bad block markers. I would assume=20
from your reasoning that you are not using a flash-based BBT?

In a lab environment, erasing the factory-marked bad blocks will probably=
=20
work well enough not to cause a hassle, as long as you don't use the flash=
=20
for long-term storage.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
