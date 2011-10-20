Received: from comal.ext.ti.com ([198.47.26.152])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGmPN-00072m-CI
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 06:47:19 +0000
From: "Kumar, Goutam" <goutam.kumar@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>, Angus CLARK <angus.clark@st.com>
Date: Thu, 20 Oct 2011 12:17:07 +0530
Subject: RE: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Flash.
Message-ID: <0680EC522D0CC943BC586913CF3768C00590504990@dbde02.ent.ti.com>
References: <0680EC522D0CC943BC586913CF3768C0059050481E@dbde02.ent.ti.com>
	<4E9EEBDC.5000002@st.com> <20111019154913.GA18674@parrot.com>
In-Reply-To: <20111019154913.GA18674@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

Thanks for the input. Can you share the patches, which I can apply and test=
.

Regards,
Goutam

-----Original Message-----
From: Ivan Djelic [mailto:ivan.djelic@parrot.com]=20
Sent: Wednesday, October 19, 2011 9:19 PM
To: Angus CLARK
Cc: Kumar, Goutam; linux-mtd@lists.infradead.org
Subject: Re: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Fl=
ash.

On Wed, Oct 19, 2011 at 04:25:16PM +0100, Angus CLARK wrote:
> Hi Goutam,
>=20
> On 10/19/2011 03:28 PM, Kumar, Goutam wrote:
> >=20
> > There is MT29F2G08ABAEAWP (256MB, 8-bit) NAND device on TI EVM.
> >=20
>=20
> This particular NAND device requires 4-bit ECC.  As far as I can tell, yo=
u are
> using the OMAP2 driver with 1-bit Hamming H/W ECC.  This will throw
> uncorrectable ECC errors (as seen in your log) if there are 2 bit flips i=
n any
> ECC block.  The problem gets worse if there are 3 or 4 bit flips, which i=
s still
> within spec of the NAND device.
>=20
> This may, or may not, be the source of your problem, but it might be wort=
h
> taking a look anyway.
>=20
> The device does include a 4-bit on-die ECC engine, which can be enabled u=
sing
> the 'SET_FEATURE' command.  I don't believe this is available in nand_bas=
e.c at
> present, but it is not too hard to add.  You would also need to disable t=
he
> OMAP2 H/W ECC support to avoid any layout clashes in the OOB area.  Of co=
urse,
> whatever changes you make to the kernel, would also have to be made to u-=
boot.

If your SoC (AM335x) has the same NAND ECC features as the OMAP36xx
(BCH 4/8 bits), then you can also use it to correct NAND errors, up to 8 bi=
t
per 512 bytes; which is better (and safer) than what the manufacturer
recommends.
I have a patch supporting this with the BCH library on 2.6.35 if you're
interested. Not for 3.1 yet, as I'm waiting for a repost of omap2 driver
patches from TI guys on the mtd list to submit my own patch.

BR,
--
Ivan
