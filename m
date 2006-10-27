Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GdRPV-00042x-DV
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 14:06:10 +0100
Date: Fri, 27 Oct 2006 15:07:26 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: mtd-utils/nandwrite: what if write fails?
In-Reply-To: <1161095820.3260.84.camel@sauron>
Message-ID: <Pine.LNX.4.64.0610271500310.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
	<1161095820.3260.84.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 17 Oct 2006, Artem Bityutskiy wrote:

>On Tue, 2006-10-17 at 16:17 +0200, Ricard Wanderlof wrote:
>> I have a question regarding writes to NAND flash; for instance, in=20
>> mtd-utils/nandwrite.c, prior to writing to a block, it is checked so tha=
t=20
>> it isn't bad (using the MEMGETBADBLOCK ioctl). However, what happens if=
=20
>> the block goes bad during write? If the pwrite() call which writes out t=
he=20
>> page data fails, the application says perror() and exits. Shouldn't it=
=20
>> mark the block as bad, and re-write the data so far written to the block=
=20
>> to the next good block?=20
>
> If we are talking about nandwrite - I would prefer it not to do this. Or=
=20
> do this if an this was specified via an explicit option ...

I could live with an option.

>> As I understand it, mtd doesn't mark a block bad,
>> it is up to the application or overlying file system (e.g. JFFS2).
>
> Yes, not only JFFS2, just any software which works on top of MTD and=20
> knows what it does. For example, UBI can do this. Or some user-space=20
> tools.

I assume that the mtd block devices don't provide any bad block management=
=20
either? (Hm, one could imagine a device which when written to simply=20
skipped bad blocks ... ?)

>> So it won't even help to run nandwrite again as the block has not been=
=20
>> marked bad.
>
> Not sure, put probably yes. You may explore fix this adding a=20
> corresponding option to nandwrite. Or you may write an utility which=20
> does flash torturing and identifies bad eraseblocks, e.g., flash_check.=
=20
> [...] but I personally used it only for debugging purposes.

I would like to use it for writing filesystem images to nand flash, i.e. a=
=20
more production-oriented environment. Either during initial production, or=
=20
during upgrades. So some form of (perhaps option-controlled) bad block=20
management would be nice.

A torture test would be nice too, but it's not really the same thing.=20
Blocks can go bad with time, and when one actually does go bad, it has to=
=20
be handled at that time.

Another option would be to integrate erasure into nandwrite, so that it=20
could erase blocks prior to writing them, to give a completely integrated=
=20
utility. Writing to a non-erased (nand) flash is rather pointless anyway=20
isn't it? Naturally, one would want to set limits for the erasure so that=
=20
not the whole flash would have to be erased just to write a small image.

One would still have to handle the case of erase or write failing though.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
