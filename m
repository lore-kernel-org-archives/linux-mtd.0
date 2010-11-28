Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMifY-0004a9-Bq
	for linux-mtd@lists.infradead.org; Sun, 28 Nov 2010 14:56:01 +0000
Received: by bwz5 with SMTP id 5so3322262bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Nov 2010 06:55:57 -0800 (PST)
Subject: Re: Flashing UBIFS over fastboot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTinxyagZ+_5_fv2ei0bF=N3Ww0KJhjSNKqNmQHpr@mail.gmail.com>
References: <AANLkTinzy-qTsYfbZhkhoFN6Tz9G47+JUWsa97KCUAke@mail.gmail.com>
	<1290779883.2552.4.camel@localhost>
	<AANLkTinxyagZ+_5_fv2ei0bF=N3Ww0KJhjSNKqNmQHpr@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 28 Nov 2010 16:55:52 +0200
Message-ID: <1290956152.2032.15.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-11-28 at 17:46 +0900, Leo Barnes wrote:
> Hello again,
> 
> New problem:
> 
> On Fri, Nov 26, 2010 at 10:58 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > I think you can hack ubinize and teach it to add OOB bytes.
> >
> 
> I have now managed to transform a UBIFS image so that it is flashable
> by fastboot. The system then boots once without any trouble (at least
> any immediate trouble), but when I reboot, it refuses to start. I have
> narrowed the problem down to the fact that fastboot does not strip
> trailing 0xFF pages from the blocks and instead writes them as usual.
> As explained in the FAQ this has some nasty consequences. I have no
> way (currently at least) of modifying how fastboot works on the
> device. Is it somehow possible to fill these pages with dummy data and
> tell UBI/UBIFS that it is ok to discard this data when the block is
> erased sometime in the future? Or is there any other way of doing it?

I guess for data and indexing eraseblocks you can just pad the left
space with UBIFS padding nodes (struct ubifs_pad_node).

But then there are special UBIFS areas which go before the data area.
Things might me trickier there. I am not sure the padding node trick
will work there, but it might. If this does not work for some areas,
they can be tricked a different way.

The other ugly option would be to make UBI do ubi_leb_change() for each
eraseblock after scanning. Or only for those which have 0xFFs at the
end.

But I do not have ready solution for this.

> If UBI/UBIFS clones/remaps a block, does it strip empty trailing
> pages?

Yes, it does, this is why ubi_leb_change() will work.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
