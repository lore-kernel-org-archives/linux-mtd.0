Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGPzC-0007ov-7B
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 06:50:46 +0000
Date: Wed, 19 Oct 2011 08:50:42 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?iso-8859-1?Q?Jean-S=E9bastien_Gagnon?= <jsgagnon@vizimax.com>
Subject: RE: UBIFS recovery fails
In-Reply-To: <225442585F89274EA3A62F88671ECBAC0D33C8F2@prod-svr-1.intranet.str.ca>
Message-ID: <Pine.LNX.4.64.1110190845390.30940@lnxricardw.se.axis.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<20111018153236.GA10466@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8F2@prod-svr-1.intranet.str.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> This would be true, if you could assume that a page reading failure alwa=
ys
>> occurs after a previous read on the same page reports an ecc correction.
>> But this is not the case: we had several unstable pages going from 0 bit=
flips
>> (perfect read) to 2 bitflips (failed read). No way to detect any failure=
, no
>> way to scrub data before it's too late.
>> And the answer from the manufacturer was: you should not use any partial=
ly
>> programmed/erased pages anyway, those should be cleaned up after recover=
ing
>> from a power failure.
>
> This should not append if you use recommended ECC bits count defined by t=
he NAND part.
> Can you verify that, because 1 bit ECC for each 512 byte is only recommen=
ded by older
> SLC flash which are pretty stable.  Newer NAND need more ECC bits, which =
can be
> addressed by using BCH parities.

I would think that the manufacturers ECC recommendation is only valid if=20
the page is properly programmed. If a power failure occurs during the=20
writing of a page, it has not been programmed according to the=20
manufacturer's specification, hence it is not properly programmed, and no=
=20
assumptions can be made as to the validity of the data.

I remember a time in the dark old days of EPROMs, when I programmed an=20
EPROM with too low a programming voltage (Vpp) - like 21V when the device=
=20
required 25V. It verified correctly in the EPROM programmer, but when=20
installed in the system for which it was intended, the data read out was=20
faulty.

That said, it seems to me that power failure during write causing=20
excessive bitflips would be a problem with any flash, not just MLC or=20
modern "unstable" SLC. Ivan, you said you've only seen it with modern=20
flashes, not older SLC ?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
