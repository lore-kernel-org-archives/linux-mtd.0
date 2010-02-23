Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NjxKX-0003Nn-36
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 16:09:53 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Tue, 23 Feb 2010 10:09:38 -0600
Subject: RE: MLC nand driver for linux
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9BC47926@dlee01.ent.ti.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
	<Pine.LNX.4.64.1002230947110.29303@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1002230947110.29303@lnxricardw.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Sasa Sasa <sasak.1983@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



>=20
>=20
> On Tue, 23 Feb 2010, Paulraj, Sandeep wrote:
>=20
> > I've used MICRON and SAMSUNG MLC NAND's without any problems.
> >
> > The MICRON NAND's were ONFI devices and even they worked well.
>=20
> What do you do about ECC for these devices? As I understand MLC flash
> requires stronger ECC algorithms than the 1 bit / 256 byte algorithm whic=
h
> is by default implemented in software by mtd. Do the flash chips or the
> system you are using have hardware ECC?

The TI DaVinci NAND controller can do 4 bit ECC for every 512 bytes of data=
.

But most new devices need atleast 8 bit ECC and above=20
