Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Psbnc-0003C0-IO
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 14:04:09 +0000
Date: Thu, 24 Feb 2011 15:04:04 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Navaneethan P <pnavanee@gmail.com>
Subject: Re: Mean Time Between Failure - UBI clarifications
In-Reply-To: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1102241445050.2784@lnxricardw.se.axis.com>
References: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
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


On Thu, 24 Feb 2011, Navaneethan P wrote:

> Hi Linux-mtd users,
>
>
> In our product, we are using 128MB of NAND Flash (Samsung / Micron).
> The whole NAND flash is configured as a single MTD partition. We are
> using UBI over the MTD partition.
>
> With this input, we wanted to calculate the Mean Time between failures
> (MTBF) of our product. In this context,
>
> 1) We wanted to term ?bitflip? as a failure. Is our understanding
> correct or should we only consider a bad block as a failure?

I'd say it's a failure in the sense that the raw data from the flash is=20
not what you expect, but UBI handles this transparently so it's not a=20
failure from the user's point of view. Furthermore, bitflips are inherent=
=20
to the design of nand flashes, and it does not indicate that there is=20
actually anything abnormal about a particular bit.

A bad block is more of a failure in that it can contain bits which are=20
unreliable, or stuck at a particular bit level. At least this is the case=
=20
for blocks that have been detected bad at the factory and marked as such,=
=20
but they are not really part of the equation since they should not be used=
=20
anyway.

The ordinary way for a block to 'fail' is when the number of erase/write=20
cycles performed on the block causes it to physically wear out. A worn-out=
=20
block has lower data retention (i.e. larger susceptibility to bitflips)=20
than other blocks. Usually if an erase or write operation times out (i.e.=
=20
the on-chip erase/write algorithm on the flash times out before the=20
operation is completed, and indicates a failure status to the host) the=20
block is considered 'bad'. However, note that it is not necessarily an=20
either-or situation. The block might not suddenly go dead. Instead, its=20
data retention characteristics and erase/write cycle times can get worse=20
and worse as the block is erased and rewritten. At some time, the on-chip=
=20
algorithm on the flash signals that erase or write took too long, but the=
=20
characteristics of the block might be far below spec before then.

It's up to you as a user to decide when the block is 'bad' in this case.

> 2) Is there any standard way to findout the number of bitflips from
> the UBI? If no, is it suggested to modify the UBI subsystem of the
> Linux kernel to get the bit flip counter?

mtd supplies statistics counters that might help. For each mtd partition=20
there is one counter which is increased every time a read operation=20
requires ECC to correct a bit (i.e. a correctable single bit error), and=20
one counter for ECC failures (two-bit errors).

I don't know about UBI, someone else probably does.

> 3) Is there any standard software / approach which can be used to find=20
> out the reliability / MTBF / MTTF (Mean Time To Failure) of our NAND=20
> Flash?

The manufacturers provide some data, however my experience has been that=20
it is very difficult to get any form of reliability information.

One way would be to take the spec of the number of erase/write cycles that=
=20
the flash can handle (probably 100 000 for your flash), and calculate how=
=20
much data will be written to the flash over a certain amount of time. When=
=20
you reach 100 000 writes to any given block it can constitute a failure.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
