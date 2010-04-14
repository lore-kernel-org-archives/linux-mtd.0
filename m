Received: from aa012msr.fastwebnet.it ([85.18.95.72])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1vE0-0007Mq-UC
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2010 05:33:24 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: cfi_cmdset_0002: Add reboot notifier for AMD
	flashes
Date: Wed, 14 Apr 2010 07:33:12 +0200
References: <4ccec90e21edfa387822b2cb71c886217c48b4e3@localhost.localdomain>
	<bb2e763d69a8cc1576fd58fbde424ff5f688c409@localhost.localdomain>
	<1271221078.2532.5.camel@localhost.localdomain>
In-Reply-To: <1271221078.2532.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201004140733.12708.fabio.giovagnini@aurion-tech.com>
Cc: dwmw2@infradead.org, Kevin Cernekee <cernekee@gmail.com>,
	saeed.bishara@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Exactly!!!!
Why this is requested?
Is it necessary for the best proper woring mode?

Thanks a lot


In data mercoled=C3=AC 14 aprile 2010 06:57:58, Artem Bityutskiy ha scritto:
: > On Tue, 2010-04-13 at 13:30 -0700, Kevin Cernekee wrote:
> > +static int cfi_amdstd_reset(struct mtd_info *mtd)
> > +{
> > +	struct map_info *map =3D mtd->priv;
> > +	struct cfi_private *cfi =3D map->fldrv_priv;
> > +	int i, ret;
> > +	struct flchip *chip;
> > +
> > +	for (i =3D 0; i < cfi->numchips; i++) {
> > +
> > +		chip =3D &cfi->chips[i];
> > +
> > +		spin_lock(chip->mutex);
> > +
> > +		ret =3D get_chip(map, chip, chip->start, FL_SHUTDOWN);
> > +		if (!ret) {
> > +			map_write(map, CMD(0xF0), chip->start);
> > +			chip->state =3D FL_SHUTDOWN;
> > +			put_chip(map, chip, chip->start);
> > +		}
> > +
> > +		spin_unlock(chip->mutex);
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> Kevin, I'd suggest to document why you do this in the code, just for the
> next generation, or for the archaeologists who will dig MTD code in the
> future.
>=20

=2D-=20
=46abio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
Tel. +39.051.594.78.24
Cell. +39.335.83.50.919
