Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19acHv-0001G7-Pc
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 15:20:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: jasmine@regolith.co.uk
In-Reply-To: <Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
	 <20030708231846.7C10B4431@blood.actrix.co.nz>
	 <Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
Message-Id: <1057846853.21073.378.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 10 Jul 2003 15:20:54 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: Charles Manning <manningc2@actrix.gen.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-07-10 at 14:05, jasmine@regolith.co.uk wrote:
> On Wed, 9 Jul 2003, Charles Manning wrote:
> > I think most people connect CLE and ALE to GPIO pins, but some applicat=
ion=20
> > notes describe driving these via the address bus. you should then be ab=
le to=20
> > drive the lines the way you want by accessing the corresponding address=
es.

Hmmm. When sending multiple bytes of address, isn't ALE supposed to
remain high for the entire duration, without going low again between
cycles? How do you achieve this if it's on the address bus?

>  This is, in some ways, the easiest to implement, though it seems to
> have caused MTD the most problems, though that is mostly because of
> M-Systems' intentional obfuscation tactics.

The main problem wasn't intentional obfuscation. It wasn't really even
lack of documentation either -- we've had docs for the DiskOnChip 2000
and Millennium hardware since 1999.

The problem was really that the DiskOnChip drivers long predated the
generic NAND driver code we have now, and indeed a real understanding of
NAND flash. So all the perceived bizarreness of NAND flash helped to
obfuscate the DiskOnChip driver unnecessarily.

Take a look at the new drivers/mtd/nand/diskonchip.c and it's really not
that obfuscated at all. It'll get a bit more cluttered when I make it
support multiple chips and the DiskOnChip hardware ECC, but it's still
not too bad.

All M-Systems' current devices are supported by Linux=C2=B9, and they seem
interested in ensuring that remains the case. I've been very frustrated
by them in the past, as I know have you -- but they seem to be playing
nicely now.

--=20
dwmw2

=C2=B9 Well OK, with one or two exceptions which we're currently working on=
 fixing.
