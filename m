Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PpLSC-0003EP-CP
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2011 14:00:34 +0000
Received: by iyh42 with SMTP id 42so81379iyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2011 06:00:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
Date: Tue, 15 Feb 2011 14:00:27 +0000
Message-ID: <AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: David Peverley <pev@sketchymonkey.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,

Thats a good analysis ; I've dug around as a result and found an
interesting tech note from Micron at :
    http://download.micron.com/pdf/technotes/nand/tn2917.pdf

They classify NAND failures into various types ; Permanent Failures
and Temporary Failures, with the temporary failures being split into
"Program Disturb", "Read disturb", "Over-programming" and "Data loss"
- I won't paraphrase further here as the Micron document describes it
better than I ever could! :-)

>From the description of read disturb, it occurs due to many reads
(hundreds of thousands or millions) prior to an erase. Currently my
testing is using nandtestc.c and mtd_stresstest.ko - the former tests
one cycle before re-programming and the latter is random but not
expected to be more than tens of reads before a re-programme becomes
statistically likely. Potentially program disturb sounds like it
_could_ be the behaviour I observe but it's not clear.

My general take on this is that only the permanent type failures i.e.
those involving permanently stuck bits, require marking as bad blocks.
The recovery recommended for the other scenarios is always to erase
and re-programme. This potentially opens up a whole can of worms... My
interpretation of this is that if we verify a write and we've had a
(correctable and non-permanent) single bit error the Right Thing To Do
would be to erase and re-programme the block, probably with a very
small retry limit. We could argue that it's the responsibility of the
file-system to do this but programatically I think nand_write_page()
is best placed to be able to do this.

Certainly the verify failures we see here with a raw read are
occasional (and not consistently the same blocks) and hence not
indicative of stuck bits and generally after the block is re-written
the read is correct. What do you reckon?

Cheers,

~Pev

On 15 February 2011 13:02, Ricard Wanderlof <ricard.wanderlof@axis.com> wro=
te:
>
> On Tue, 15 Feb 2011, David Peverley wrote:
>
>> I've noticed that some of the problems we see are exacerbated further by
>> us having CONFIG_MTD_NAND_VERIFY_WRITE enabled. In the case where blocks
>> have occasional 1-bit ECC failures (i.e. normally correctable and not en=
ough
>> to warrant marking as bad) the generic verify routine will cause
>> nand_write_page() to return failure. I've prototyped a verify routine th=
at
>> uses an ECC corrected read in our driver and it seems to do the job
>> correctly.
>
> I may be wrong here, but as I understand, normally, bit read errors occur
> after a while (often called 'read disturb' in the literature) as the
> contents of certain bit cells leak away (either over time, or by accessin=
g),
> first causing random data, and then after a while settling down into a
> permanently inverted state, until the data is rewritten.
>
> If this is the case, then a verify performed just after a write (which I'=
m
> assuming is when it is performed) should yield correct data, unless a giv=
en
> bit cell is in a really bad condition, in which case the block should
> probably not be used anyway, as there as not been enough time for the bit=
 to
> decay for whatever reason.
>
> Of course, if there are bit cells which have other failure modes, your id=
ea
> might help, but again, if a bit is in such a bad state as to not being ab=
le
> to retain data between write and verify, the block should probably be
> discarded (marked as bad) anyway.
>
> One rationale would be that if you have one more or less permanently bad
> bit, although it can be handled by ECC, as soon the contents of another b=
it
> cell decays, the ECC won't be effective, so in practice, the ECC strength=
 is
> severely reduced for the page (or sub-page more likely, as ECC usually
> operates over less-than-page sizes in modern flashes) in question.
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 Fax +46 46 13 61 30
>
