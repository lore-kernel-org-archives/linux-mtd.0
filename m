Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pq0jN-00073y-MP
	for linux-mtd@lists.infradead.org; Thu, 17 Feb 2011 10:05:03 +0000
Date: Thu, 17 Feb 2011 11:04:57 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Peverley <pev@sketchymonkey.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
In-Reply-To: <AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 15 Feb 2011, David Peverley wrote:

> I did some more Googling and found a couple more interesting articles
> ; I don't know if you've read them (I assume you probably have!) but
> thought I'd repost for anyone else interested as this seems to be a
> really fascinating and not often discussed topic! :
>  http://www.broadbandreports.com/r0/download/1507743~59e7b9dda2c0e0a0f7ff=
119a7611c641/flash_mem_summit_jcooke_inconvenient_truths_nand.pdf
>
> I found the following also really interesting, especially for the
> analysis of lots of devices with a plot of numbers of initial bad
> blocks marked which I'd always wondered about! :
>  http://trs-new.jpl.nasa.gov/dspace/bitstream/2014/40761/1/08-07.pdf

Thanks for the links. I have actually seen the first of these, but not the=
=20
second (which however in parts seems to draw heavily from the first one).

A couple of years ago I actually did some tests on a few 256 Mb SLC NAND=20
chips in order to better understand the failure modes. These were=20
specified as withstanding a maximum of 100 000 erase/program cycles.=20
Indeed, in one portion of the test, after 1.7 million erase/write cycles,=
=20
repetetive reading the same block would result in uncorrectable ECC=20
failures (i.e. two bit errors per 256 bytes) after 1.6 million read=20
cycles. This is, with some margin, in tune to Cooke's rule of thumb that=20
a maximum of 1 million read cycles should be done before rewriting the=20
block (the block in question started exhibiting correctable (i.e. 1-bit)=20
errors after a mere 40000 read cycles, but then again I was way over the=20
spec in terms of erase/write cycles).

One part of Nasa's analysis confused me. They attempt to erase factory=20
marked bad blocks and include them in the rest of the tests in order to=20
compare the characteristics of the known bad blocks with the rest of the=20
memory array.

However, data sheets often mention that one should not attempt to write or=
=20
erase bad blocks (e.g. the Samsung K9F1G08X0B data sheet simply says 'Do=20
not erase or program factory-marked bad blocks.'), and I've read=20
application notes explaining that bad blocks may have failures that can=20
cause unreliable operation of the rest of the chip if it is attempt to use=
=20
them. I.e. bad blocks do not necessarily just contain bad bit cells,=20
indeed there could be any other failure in the die causing irregular=20
operation when for instance internal erase voltages are applied to the=20
block.

Therefore, erasing bad blocks and including them in the test is basically=
=20
violating the device specification to start with.

The fact that bad blocks can not be replicated by simple testing is also=20
well documented by flash manufacturers, either in data sheets or=20
application notes. I remember reading that in order to determine whether a=
=20
block is bad, a number of tests are run at the factory, in much more=20
severe conditions that the average use case. I don't know if this just=20
involves testing at abnormal voltages and temperatures, or if the die is=20
also examined visually (or some other non-electric way) for errors prior=20
to being packaged, or if undocumented chip access modes are used during=20
the tests.

Indeed, in ST's application note AN1819 which you refer too (as sourced=20
from Micron, I think this is simply because Micron bought out Numonyx=20
which bought out ST's flash division, or however the exact economic=20
transactions went), mentions that "The invalid [i.e. bad] blocks are=20
detected at the factory during the testing process which involves severe=20
environmental conditions and program/erase cycles as well as proprietary=20
test modes. The failures that affect invalid blocks may not all be=20
recognized if methods different from those implemented in the factory are=
=20
used.".

So as far as I'm concerned it is well documented that it is not possible=20
to determine which blocks were marked bad at the factory from the user's=20
point of view.

Indeed, erasing or writing bad blocks could put the integrity of the whole=
=20
chip in question.

I second their conclusion however that most often bad blocks after erasure=
=20
seem to function just as well as good blocks. From time to time I've had=20
flash programmers screw up and mark a large portion of blocks as bad.=20
Erasing the whole chip, including factory-marked bad blocks, yields a=20
workable chip again, seemingly without any adverse affects at least in a=20
lab environment. I would not try and sell a unit whose factory-marked=20
flash bad blocks had been erased however, but it seems perfectly fine for=
=20
everyday use as a development platform.

I have yet to come across a chip with hard bad block errors, on the other=
=20
hand I can't say that I've come across more than a handful of chips who=20
have had their initial bad blocks erased.

>> If you have a block that is wearing out, due to a large number of
>> erase/write cycles, it will exhibit several failure modes at an increasi=
ng
>> rate, in particular long-term data loss. At some point one could argue t=
hat
>> the block is essentially worn out, and mark it as bad, even though an
>> erase/write/verify cycle actually might be successful. I don't think tha=
t is
>> what is happening in your case though.
> That's all to do with what one considers a "Bad Block" - I'd agree
> that the repeated failures can show that there might be an issue but
> all the literature I've read today state that only permanent failures
> are regarded as showing a bad block and these are reported via the
> flashes status read. In fact I found a Micron Appnote AN1819

In the torture testing I mentioned above on the 256 Mb chips, one part of=
=20
the test involved erase/write/read-cycling four blocks over and over again=
=20
until an erase or write failure was reported by the chip. In this=20
particular case, 3.7 million cycles were performed before mtd reported an=
=20
'I/O error' (probably due to a chip timeout) on erase.

However, after this, I performed a complete reflash of the chip, which=20
didn't result in any errors reported at all. A couple of more erase/write=
=20
attempts showed that sometimes an error during write would be reported,=20
sometimes not, never during erase (as had initially been the case).

The tortured block endured a mere 550 reads before the ECC 'correctable'=20
counter started increasing, and a mere 10000 reads before the ECC 'failed'=
=20
(2-bit errors) counter started increasing.

While this is a bit of an artificial test, being well over the specified=20
endurance specficiation, it does show a couple of things.

When an erase or write error is reported by the flash chip, the block in=20
question may be well over its specified erase/write endurance cycle=20
specification. So just using the chip's own failed erase or write=20
indication is not really sufficient or reliable. Indeed, as shown, after=20
3.7 million erase/write cycles, some writes still performed flawlessly,=20
but read performance was very lacking. Most likely read performance would=
=20
have been just as bad after say 3.5 million erase/write cycles, before any=
=20
write or erase errors had been reported by the chip.

Which all goes to say that as Cooke notes in his document above, it is=20
necessary for the software to keep track of the number of erase cycles,=20
and not just rely in the erase/write status that the chip itself reports.

> We're looking into these possibilities as well - However as is often
> the case, such problems provoke testing of less used code paths so
> it's quite a good thing to look at the right thing to do in this event
> in conjunction with fixing the root cause of the problem...

I agree.

Sorry for the long-winded reply. I'm not trying to prove I'm correct, but=
=20
I do want to share my experiences and value input from others, as there=20
doesn't seem to be a lot of hard information out there on these issues.=20
Besides, there seems to be a lot of misconceptions which I think can be=20
cleared up by discussion.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
