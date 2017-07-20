Received: from mail-bn3nam01on0606.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::606]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dY5D8-0007q8-O6
 for linux-mtd@lists.infradead.org; Thu, 20 Jul 2017 06:45:24 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] lpc_ich: Avoton/Rangeley uses SPI_BYT method.
Date: Thu, 20 Jul 2017 06:44:56 +0000
Message-ID: <1500533095.11496.3.camel@infinera.com>
References: <20170718120145.13585-1-joakim.tjernlund@infinera.com>
 <20170719215016.627ade1e@bbrezillon>
In-Reply-To: <20170719215016.627ade1e@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <A0166A0E8B93894A85ABD62F124D1AB2@infinera.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2017-07-19 at 21:50 +0200, Boris Brezillon wrote:
> On Tue, 18 Jul 2017 14:01:45 +0200
> Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:
>=20
> > Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> > ---
> >  drivers/mfd/lpc_ich.c | 1 +
>=20
> This patch touches an MFD driver and you're Ccing the MTD mailing list,
> I guess this is a mistake :-).

Right, I sent it to MTD as it affects the spi-nor driver in MTD but I see
now that LPC ICH MFD has its own maintainer so I just send it there instead=
.

 Thanks
         Jocke =
