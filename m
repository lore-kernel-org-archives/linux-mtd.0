Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Z2wm-0005hZ-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 04:10:52 +0100
Received: from cerberus.colubris.com ([207.35.116.195] helo=mail.colubris.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Z2wk-0005hT-00
	for mtd@infradead.org; Wed, 13 Sep 2000 04:10:50 +0100
Received: from colubris.com (pptp10-50.colubris.com [192.168.10.50])
	by mail.colubris.com (8.10.2/8.10.2) with ESMTP id e8D3Ahj25635
	for <mtd@infradead.org>; Tue, 12 Sep 2000 23:10:43 -0400
Message-ID: <39BEF000.85BADD09@colubris.com>
Date: Tue, 12 Sep 2000 23:09:52 -0400
From: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Anyone using mtd on NAND flash?
References: <000801c00e8b$9a649560$0800a8c0@win95.inteloop.se> <15725.967205759@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On the subject of NAND flash, could some JFFS expert point me on where I should
look for those multiple writes to the same page?

I am currently working on a NAND driver for MTD that takes care of bad blocks
and virtual mapping.  It does ECC, keeps a bad block table and does the virtual
mapping of blocks so that MTD sees a linear block device with 100% good
blocks.  I'm using AMD which actually claims they'll have no bad blocks for the
specified amount of writes (100,000).  For Samsung or Toshiba parts (and AMD,
just to be safe), the driver reserves a certain number of blocks (35) to be
able to remap bad blocks dynamically.

So I think that JFFS should work with such a driver, if we make sure than no
more than 1 write occurs on the same 512-byte page.  [ AMD recommends writing
only once to a page, while Samsung/Toshiba talk of 10 writes ].

Is this a big task (JFFS design affected)?

Thanks,

-Stephane

David Woodhouse wrote:

> bjorn@brannstrom.se said:
> >  I've just been across the hall to strangle our hardware engineer (who
> > happens to also be my boss). He /intended/ to use the AM29LV640 part
> > but had problems finding a reliable source for them so we're using
> > Samsungs KM29U128 part instead.
>
> Don't strangle him. Have him hung, drawn and quartered.
>
> The KM29U128 is an _entirely_ different beast. NAND flash is quite
> different to NOR flash.
>
> With NOR flash, you can keep clearing bits individually until they're all
> zero. With NAND flash you can only do 10 write cycles in each 512-byte page
> before it becomes unreliable and you have to erase it again. JFFS currently
> exceeds that number.
>
> Also, NAND flash is permitted to ship with bad blocks and you're expected to
> work round them. JFFS doesn't, and JFFS-on-NAND should probably use an error
> correcting checksum rather than the simple checksum it currently uses.
>
> He's just replaced something you could use with the current code with
> something we're not going to support for some time, unless you care to do
> the necessary work yourself.
>
> You can't use NFTL, as we do on the DiskOnChip, because it's patented, and
> even if you were only going to distribute within the Free World, the NFTL
> code requires the built-in ECC support provided by the DiskOnChip ASIC.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
