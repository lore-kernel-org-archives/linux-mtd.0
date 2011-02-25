Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pstfr-0002Pw-1M
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 09:09:20 +0000
Date: Fri, 25 Feb 2011 10:09:15 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
In-Reply-To: <1298623342.2798.9.camel@localhost>
Message-ID: <Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: David Peverley <pev@sketchymonkey.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 25 Feb 2011, Artem Bityutskiy wrote:
>=20
> > On Thu, 2011-02-17 at 11:04 +0100, Ricard Wanderlof wrote:
> > Which all goes to say that as Cooke notes in his document above, it is=
=20
> > necessary for the software to keep track of the number of erase cycles,=
=20
> > and not just rely in the erase/write status that the chip itself report=
s.
>=20
> Yeah, in UBI we do keep have erase counters, but we do not actually use
> them to make decisions about whether to mark a block as good or bad.
> Probably we should.

It's a difficult call. How bad is bad? If the spec says 100 000 cycles,=20
should we mark a block bad after that time, or could we in a certain case=
=20
go to 200 000 cycles and still get reasonable performance? It would all=20
depend on the application and the also specs of the actual chip in=20
question, which is something that cannot be read from the chip so it would=
=20
have to be configured.

I think the best way is for UBI to provide only wear levelling, in order=20
to use the flash optimally, then it's up to the system designer to design=
=20
the system so that the maxium erase cycle spec is not exceeded for the=20
life of the system.

Hm, perhaps there could be a tuning option, first to enable bad block=20
marking when the erase counters reach a certain value, and secondly a=20
parameter specifying the number of cycles. Most users would probably not=20
bother about this, but it would be there for those who want to make sure=20
that blocks are not used that potentially could be out of spec.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
