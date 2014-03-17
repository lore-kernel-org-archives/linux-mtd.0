Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPbgb-0001pk-Hs
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 17:50:54 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Huang Shijie
 <b32955@freescale.com>
Subject: RE: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Date: Mon, 17 Mar 2014 17:50:22 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB3C6C@DBDE04.ent.ti.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20140312080605.GB30808@shlinux2.ap.freescale.net>
 <20140313045519.GP31517@norris-Latitude-E6410>
 <20140313080426.GA19311@shlinux2.ap.freescale.net>,
 <20140317164635.GX31517@norris-Latitude-E6410>
In-Reply-To: <20140317164635.GX31517@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: HOUR
 Frederic <frederic.hour@safran-engineering.com>, Kent Li <kent.li@radisys.com>,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
 Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, Mar 12, 2014 at 09:55:19PM -0700, Brian Norris wrote:=0A=
> > On Wed, Mar 12, 2014 at 04:06:07PM +0800, Huang Shijie wrote:=0A=
> > > On Tue, Mar 11, 2014 at 02:11:51AM -0700, Brian Norris wrote:=0A=
> > > > +       /* Check each ECC step individually */=0A=
> > > > +       for (i =3D 0; i < chip->ecc.steps; i++) {=0A=
> >=0A=
> > [...]=0A=
> >=0A=
> > > The gpmi uses a NAND layout like this:=0A=
> > >=0A=
> > >    *    +---+----------+-+----------+-+----------+-+----------+-+=0A=
> > >    *    | M |   data   |E|   data   |E|   data   |E|   data   |E|=0A=
> > >    *    +---+----------+-+----------+-+----------+-+----------+-+=0A=
> > >=0A=
> > >         M : The metadata, which is 10 by default.=0A=
> > >   E : The ECC parity for "data" or "data + M".=0A=
> > >=0A=
> > > If you want to count each sector, it makes the code very complicated.=
 :(=0A=
> >=0A=
> > I see. That does make things complicated.=0A=
> >=0A=
=0A=
I have implemented another version of Brian's patch [1], which eliminates=
=0A=
need for chip->ecc.read_page_raw(). Its tested on OMAP NAND driver,=0A=
and does not degrade too much performance either. Please see if it works=0A=
well with GPMI and pxa3xx-nand controllers too.=0A=
=0A=
[1] [RFC PATCH v2] mtd: nand: add erased-page bitflip correction=0A=
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052625.html=0A=
=0A=
=0A=
with regards, pekon=
