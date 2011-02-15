Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PpMPi-0003xA-5g
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2011 15:02:03 +0000
Date: Tue, 15 Feb 2011 16:01:58 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Peverley <pev@sketchymonkey.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
In-Reply-To: <AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
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

> Thats a good analysis ; I've dug around as a result and found an
> interesting tech note from Micron at :
>    http://download.micron.com/pdf/technotes/nand/tn2917.pdf

Yes, that's a good (and one of the few) notes on failure mechanisms.

> They classify NAND failures into various types ; Permanent Failures
> and Temporary Failures, with the temporary failures being split into
> "Program Disturb", "Read disturb", "Over-programming" and "Data loss"
> ...
> From the description of read disturb, it occurs due to many reads
> (hundreds of thousands or millions) prior to an erase. Currently my
> testing is using nandtestc.c and mtd_stresstest.ko - the former tests
> one cycle before re-programming and the latter is random but not
> expected to be more than tens of reads before a re-programme becomes
> statistically likely.

I agree, it doesn't sound like that is your problem.

> Potentially program disturb sounds like it _could_ be the behaviour I=20
> observe but it's not clear.

It seems to fit in with the description, i.e. you get bits programmed that=
=20
were not intended to be programmed. It seems to get worse when not=20
programming whole pages at once (partial page programming).

> My general take on this is that only the permanent type failures i.e.=20
> those involving permanently stuck bits, require marking as bad blocks.=20
> The recovery recommended for the other scenarios is always to erase and=
=20
> re-programme. This potentially opens up a whole can of worms... My=20
> interpretation of this is that if we verify a write and we've had a=20
> (correctable and non-permanent) single bit error the Right Thing To Do=20
> would be to erase and re-programme the block, probably with a very small=
=20
> retry limit. We could argue that it's the responsibility of the=20
> file-system to do this but programatically I think nand_write_page() is=
=20
> best placed to be able to do this.

Either the file system, or some flash management layer such as UBI should=
=20
take care of this, but I know that jffs2 doesn't at any rate. I'd agree it=
=20
makes sense for the lower level to to the best of its capability guarantee=
=20
that the data written actually does get written on the flash.

I think that the application note in some respects simplifies matters a=20
bit. If you have a block that is wearing out, due to a large number of=20
erase/write cycles, it will exhibit several failure modes at an increasing=
=20
rate, in particular long-term data loss. At some point one could argue=20
that the block is essentially worn out, and mark it as bad, even though an=
=20
erase/write/verify cycle actually might be successful. I don't think that=
=20
is what is happening in your case though.

> Certainly the verify failures we see here with a raw read are
> occasional (and not consistently the same blocks) and hence not
> indicative of stuck bits and generally after the block is re-written
> the read is correct. What do you reckon?

It would seem that if you have only occasional faults in arbitrary blocks=
=20
it wouldn't be a wear problem; if the blame is with the flash I would=20
agree it fits in with the 'Program Disturb' description. I must admit I've=
=20
not come across this type of error myself, but that could be because of=20
limited experience or that it occurs extremely infrequently in the types=20
of flash that I've been exposed to so I've never noticed it.

I don't know if anyone else here on this list has any experiences to=20
share. Frankly, if I saw errors of that type I would start looking for=20
hardware problems, or some sort of hardware or software induced contention=
=20
on the flash chip bus. Not that that would necessarily be the right=20
approach, but I've seen errors of that type occurring as the result of=20
out-of-spec level shifters between the MCU and flash chip, or incorrectly=
=20
set up bus timing towards the flash.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
