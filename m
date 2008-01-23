Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHeFA-0000zA-Uq
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 11:58:19 +0000
Date: Wed, 23 Jan 2008 12:57:09 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
In-Reply-To: <20080123105713.GC24953@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0801231248400.25733@lnxricardw.se.axis.com>
References: <20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org>
	<4795AFE3.506@parrot.com> <20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
	<Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
	<20080123105713.GC24953@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 23 Jan 2008, J=F6rn Engel wrote:

>> One problem may be what to do when the system is powered down. If we don=
't
>> store the error counters in the flash (or some other non-volatile place)=
,
>> then each time the system is powered up, all the error counters will be
>> reset.
>
> Exactly.  If the information we need to detect problems is not stored in
> the filesystem, it is useless.  Maybe it would work for a very
> specialized system to keep that information in DRAM or NVRAM, but in
> general it will get lost.
>
> As a matter of principle logfs does not do any special things for special
> systems.  If you have a nice optimization, it has to work for everyone.
> If it doesn't, your systems behaves differently from everyone else's
> systems.  So whatever bugs you have cannot be reproduced by anyone else.

Very true.

Perhaps it's possible to devise something that at least accomplishes part=
=20
of the goal. Such as when writing a new block, also write some statistical=
=20
information such as the number of read accesses since the previous write=20
(or power up), or the reason for writing (new data, gc because of=20
bitflips, ...) and a write counter. Something of that nature.

> High wearout means short time between two writes.  Which also means few
> reads between two writes.
>
> As long as the write rate (wear rate) remains roughly constant, high
> wear doesn't seem to cause any problems.  The block's ability to retain
> information degrades, but that doesn't matter because it doesn't have to
> retain the information for a long time.

I'd be a bit wary of this with NAND chips some of which have a 100 000=20
maximum erase/write cycle specification, though. And I think that=20
especially when nearing the maximum value and going beyond it, that there=
=20
is some bit decay occurring over time and not just from reading.

On the other hand, with 100 000 write cycles total, and assuming a product=
=20
lifetime of 3 years, we end up with over 90 permitted write/erase cycles=20
per day. Depending on the situation, it might be quite ok to take=20
advantage over this.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
