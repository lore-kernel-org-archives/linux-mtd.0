Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19adPP-0001Zn-7j
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 16:32:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: jasmine@regolith.co.uk
In-Reply-To: <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
	 <Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
	 <1057846853.21073.378.camel@passion.cambridge.redhat.com>
	 <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
Message-Id: <1057851161.21073.399.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 10 Jul 2003 16:32:42 +0100
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

On Thu, 2003-07-10 at 16:12, jasmine@regolith.co.uk wrote:
> On Thu, 10 Jul 2003, David Woodhouse wrote:
>=20
> > Hmmm. When sending multiple bytes of address, isn't ALE supposed to
> > remain high for the entire duration, without going low again between
> > cycles? How do you achieve this if it's on the address bus?
>=20
> By waiting to see if the next write is to the same address-  it's not har=
d=20
> to do that sort of thing in an FPGA or SoC.  Since the only line involved=
=20
> is the ALE to the NAND, there's no downside in hanging on a little longer
> before dropping it.

Hmmm. So you deassert ALE only when the _next_ cycle happens and it's
not another write with the appropriate address bit set?

According to the Toshiba datasheet in front of me there are timing
constraints on how long you must delay between deasserting ALE and
performing the subsequent read cycle.=20

After a READ command and address sending cycle, you must deassert ALE at
least 50ns before subsequently asserting RE#, and after a READID command
it's 100ns.

The na=C3=AFve implementation would probably get that wrong. You could
probably arrange to deassert ALE with a _read_ cycle to the 'address'
address, though.

--=20
dwmw2
