Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHd3h-00043q-Io
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 10:42:24 +0000
Date: Wed, 23 Jan 2008 11:41:14 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
In-Reply-To: <20080123101915.GA24953@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
References: <20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
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

>> I would say that correctable errors occurring "soon" after writing are a=
n
>> indication that the block is going bad. My experience has been that
>> extensive reading can cause bitflips (and it probably happens over time
>> too), but that for fresh blocks, billions of read operations need to be
>> done before a bit flips. For blocks that are nearing their best before
>> date, a couple of hundred thousand reads can cause a bit to flip. So if =
I
>> was implementing some sort of 'when is this block considered
>> bad'-algorithm, I'd try to keep tabs on how often the block has been
>> (read-) accessed in relation to when it was last writen. If this number =
is
>> "low", the block should be considered bad and not used again.
>
> That sounds like an impossible strategy.  Causing a write for every read
> will significantly increase write pressure, thereby reduce flash
> lifetime, reduce performance etc.
>
> What would be possible was a counter for soft/hard errors per physical
> block.  On soft error, move data elsewhere and reuse the block, but
> increment the error counter.  If the counter increases beyond 17 (or any
> other random number), mark the block as bad.  Limit can be an mkfs
> option.

Sorry, I didn't express myself clearly. I should have said '...keep tabs=20
on how _many_times_ the block has been read accessed in relation to when=20
it was last written.' If a page has been read, say, 100 000 times since it=
=20
was last written, and starts to show bit flips, it is a sign that the=20
block is wearing out. If it has been read, say, 100 000 000 times since it=
=20
was written and starts showing bit flips, it's probably sufficient just to=
=20
do a garbage collect and rewrite the data (in the same block or=20
elsewhere).

The algorithm you suggest also sounds reasonable. Repeatedly occurring bit=
=20
flips (-EUCLEAN) are an indication that the block is wearing out. Probably=
=20
more efficient than logging the number of read accesses somewhere.

One problem may be what to do when the system is powered down. If we don't=
=20
store the error counters in the flash (or some other non-volatile place),=
=20
then each time the system is powered up, all the error counters will be=20
reset.

>> We ran some tests here on a particular flash chip type to try and
>> determine at least some of the failure modes that are related to block
>> wear (due to write/erase) and bit decay (due to reading). The end result
>> was basically what I tried to describe above, but I can go into more
>> detail if you're interested.
>
> I do remember your mail describing the test.  One of the interesting
> conclusions is that even awefully worn out block is still good enough to
> store short-lived information.  It appears to be a surprisingly robust
> strategy to have a high wear-out, as long as you keep the wear
> constantly high and replace block contents at a high rate.

You're probably right, but I'm not sure I understand what you mean.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
