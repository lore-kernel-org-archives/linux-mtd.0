Date: Tue, 28 Aug 2012 14:22:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] mtd: orion_nand: remove <mach/hardware.h> include
Message-ID: <20120828142236.2c7e9bd3@skate>
In-Reply-To: <20120828091139.GC31704@lunn.ch>
References: <20120816183708.GT22226@titan.lakedaemon.net>
 <1346110528-30858-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20120828091139.GC31704@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>,
 Albert Stone <albert.stone@canonical.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-mtd@lists.infradead.org, Ian Molton <ian.molton@codethink.co.uk>,
 Yehuda Yitschak <yehuday@marvell.com>,
 Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>,
 Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>,
 Jon Masters <jcm@redhat.com>, Ben Dooks <ben-linux@fluff.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, Chris Van Hoof <vanhoof@canonical.com>,
 Nicolas Pitre <nico@fluxnic.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Maen Suleiman <maen@marvell.com>, Shadi Ammouri <shadi@marvell.com>,
 Olof Johansson <olof@lixom.net>, Eric Miao <eric.miao@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Tue, 28 Aug 2012 11:11:39 +0200,
Andrew Lunn <andrew@lunn.ch> a =C3=A9crit :

> I compiled tested on Dove, Kirkwood, Orion5x and mv78xx0.
>=20
> Tested-by: Andrew Lunn <andrew@lunn.ch>

Thanks! Will Jason take care of merging this on top of the previous
address decoding patches? Note that if you want to keep build
bisectability, it should be merged before my "arm: plat-orion: introduce
PLAT_ORION_LEGACY hidden config option" patch.

> One other driver you might want to look at is:
>=20
> drivers/watchdog/orion_wdt.c
>=20
> It uses <mach/bridge-regs.h>

This driver is:

config ORION_WATCHDOG
        tristate "Orion watchdog"
        depends on ARCH_ORION5X || ARCH_KIRKWOOD

so it isn't selectable with ARCH_MVEBU, so it will not cause problems
for now. Of course, at some point, we'll have a look at the watchdog
driver but for now, it's fine.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
