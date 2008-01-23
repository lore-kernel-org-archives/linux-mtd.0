Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHfTh-0006Et-GR
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 13:17:23 +0000
Date: Wed, 23 Jan 2008 14:16:12 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
In-Reply-To: <20080123130144.GD24953@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0801231410410.25733@lnxricardw.se.axis.com>
References: <20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
	<Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
	<20080123105713.GC24953@lazybastard.org>
	<Pine.LNX.4.64.0801231248400.25733@lnxricardw.se.axis.com>
	<20080123130144.GD24953@lazybastard.org>
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

> On Wed, 23 January 2008 12:57:09 +0100, Ricard Wanderlof wrote:
>>
>> Perhaps it's possible to devise something that at least accomplishes par=
t
>> of the goal. Such as when writing a new block, also write some statistic=
al
>> information such as the number of read accesses since the previous write
>> (or power up), or the reason for writing (new data, gc because of
>> bitflips, ...) and a write counter. Something of that nature.
>
> I'm still fairly unconvinced about the read accounting.  We could do
> something purely stochastic like accounting _every_ read, but just with
> a probability of, say, 1:100,000.  That would still, within statistical
> jitter, behave the same for everyone.  But once we depend on the average
> mount time of systems, I'm quite unhappy with the solution.

I think you are right. An error counter should be sufficient to get enough=
=20
statistics to determine if a block has begun to go bad.

>> I'd be a bit wary of this with NAND chips some of which have a 100 000
>> maximum erase/write cycle specification, though. And I think that
>> especially when nearing the maximum value and going beyond it, that ther=
e
>> is some bit decay occurring over time and not just from reading.
>
> It doesn't really matter whether the data degrades from a number of
> reads or from time passing.  With a constantly high write rate, there is
> less time for degradations then with a low write rate.

If we have a system that is only used (=3D powered on) rarely, then any=20
degradation from time passing could become significant.

> Problematic would be to have a high write rate for a while, then a very
> low write rate that allows data to rot for a long time.  And also this
> depends on your numbers being representative for every flash chip. ;)

Yes. And the latter is very true. Our tests were only of a certain chip=20
type from a certain manufacturer, and of course other chips might behave=20
differently.

The only input I have got from chip manufacturers regarding this issue is=
=20
that with inreasing bit densities and decreasing bit cell sizes in the=20
future, things like the probability of random bit flips are likely to=20
increase. (Somewhere there is a limit when the amount of error correction=
=20
needed to handle this things grows too large to make the chip practically=
=20
useful; say 10 error correction bits per stored bit or whatever).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
