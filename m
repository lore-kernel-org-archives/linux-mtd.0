Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaiLI-0001Sw-KR
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 17:53:15 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Dan Brown" <brown@osdsun1.nrl.navy.mil>, "Slim" <slimaffi@yahoo.com>,
	<linux-mtd@lists.infradead.org>
Date: Wed, 16 Jun 2004 23:47:20 +0200
References: <20040616161345.33330.qmail@web50802.mail.yahoo.com>
	<083701c453df$c65db960$0100a8c0@superfortress>
In-Reply-To: <083701c453df$c65db960$0100a8c0@superfortress>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406162347.20436.tglx@linutronix.de>
Cc: 
Subject: Re: [PATCH] Towards DiskOnChip support as a NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 16 June 2004 22:23, Dan Brown wrote:
> > ECC - hardware error correction by the device?  Is this an optional
> > enable in the driver?
>
> Yes, the DOC has an ASIC that does ECC computation (for actual error
> correction, software assitance is required).  It's not optional, though it
> could be made so....  Why would you want to turn it off?

It has two advantages over software ECC.

1. The software ECC is a Hamming code which can correct 1 bit errors and=20
detect 2 bit errors. The HW ECC on DOC devices is a Reed Solomon Encoder /=
=20
Decoder which allows to correct and detect more errors

2. In general a HW based ECC generator is a lot faster than the software=20
version as it gets you rid of a ugly loop through all the data bytes on eac=
h=20
read / write.

A small drawback is the error correction for reed solomon, as it is more =20
complex and slower than for hamming codes. This is not too bad as error=20
correction usually starts to happen when the device wears out, but then the=
=20
hamming code which we use in soft ecc can be rather unsufficient.=20
The speed improvement on write and read is really worth to use hw ecc if it=
s=20
thers

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
