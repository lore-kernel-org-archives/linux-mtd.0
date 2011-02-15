Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PpKYX-0002dx-O1
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2011 13:03:02 +0000
Date: Tue, 15 Feb 2011 14:02:57 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Peverley <pev@sketchymonkey.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
In-Reply-To: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
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

> I've noticed that some of the problems we see are exacerbated further by=
=20
> us having CONFIG_MTD_NAND_VERIFY_WRITE enabled. In the case where blocks=
=20
> have occasional 1-bit ECC failures (i.e. normally correctable and not=20
> enough to warrant marking as bad) the generic verify routine will cause=
=20
> nand_write_page() to return failure. I've prototyped a verify routine=20
> that uses an ECC corrected read in our driver and it seems to do the job=
=20
> correctly.

I may be wrong here, but as I understand, normally, bit read errors occur=
=20
after a while (often called 'read disturb' in the literature) as the=20
contents of certain bit cells leak away (either over time, or by=20
accessing), first causing random data, and then after a while settling=20
down into a permanently inverted state, until the data is rewritten.

If this is the case, then a verify performed just after a write (which I'm=
=20
assuming is when it is performed) should yield correct data, unless a=20
given bit cell is in a really bad condition, in which case the block=20
should probably not be used anyway, as there as not been enough time for=20
the bit to decay for whatever reason.

Of course, if there are bit cells which have other failure modes, your=20
idea might help, but again, if a bit is in such a bad state as to not=20
being able to retain data between write and verify, the block should=20
probably be discarded (marked as bad) anyway.

One rationale would be that if you have one more or less permanently bad=20
bit, although it can be handled by ECC, as soon the contents of another=20
bit cell decays, the ECC won't be effective, so in practice, the ECC=20
strength is severely reduced for the page (or sub-page more likely, as ECC=
=20
usually operates over less-than-page sizes in modern flashes) in question.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
