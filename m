Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lp0jU-0001Co-Ec
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 13:44:03 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 1 Apr 2009 15:43:43 +0200
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<ac3eb2510903311651i4c5f6805tc74fe04ee765be9c@mail.gmail.com>
In-Reply-To: <ac3eb2510903311651i4c5f6805tc74fe04ee765be9c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200904011543.44124.jbe@pengutronix.de>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Cc: David Brownell <david-b@pacbell.net>, Kay Sievers <kay.sievers@vrfy.org>,
	dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David, Kay,

On Mittwoch, 1. April 2009, Kay Sievers wrote:
> On Tue, Mar 31, 2009 at 23:18, David Brownell <david-b@pacbell.net> wrote:
> > On Thursday 26 March 2009, David Brownell wrote:
> >> From: David Brownell <dbrownell@users.sourceforge.net>
> >>
> >> Update driver model support in the MTD framework, so it fits
> >> better into the current udev-based hotplug framework:
> >
> > Hmm, no comments? =C2=A0I had understood there was interest over on
> > the MTD side of things in exposing more information through
> > sysfs, to help avoid the need to add Even More Ioctls as part
> > of support for things like NAND chips with 4KB pages, or which
> > handle more than 4GBytes ...
>
> Please have a look at this. We got asked repeatedly to provide better
> hotplug/udev integration, and the patches, and having the parent
> device properly assigned, would solve some of the problems people run
> into currently.

Without patch:
=2D-------------

$ udevadm info -a -p /sys/block/mtdblock0
[...]
  looking at device '/devices/virtual/block/mtdblock0':
    KERNEL=3D=3D"mtdblock0"
    SUBSYSTEM=3D=3D"block"
    DRIVER=3D=3D""
    ATTR{range}=3D=3D"1"
    ATTR{removable}=3D=3D"0"
    ATTR{size}=3D=3D"256"
    ATTR{capability}=3D=3D"10"
    ATTR{stat}=3D=3D"       0        0        0        0        0        0 =
       0        0        0        0        0"

And nearly the same data for the other flash device. No chance to detect if
this one is the NOR or the NAND type...

With the patch:
=2D--------------

$ udevadm info -a -p /sys/block/mtdblock0
[...]
  looking at parent device '/devices/platform/physmap-flash.0':
    KERNELS=3D=3D"physmap-flash.0"
    SUBSYSTEMS=3D=3D"platform"
    DRIVERS=3D=3D"physmap-flash"
    ATTRS{modalias}=3D=3D"platform:physmap-flash"

The second flash device is of NAND type and 'udevadm' shows:

$ udevadm info -a -p /sys/block/mtdblock4
[...]
  looking at parent device '/devices/platform/mxc_nand.0':
    KERNELS=3D=3D"mxc_nand.0"
    SUBSYSTEMS=3D=3D"platform"
    DRIVERS=3D=3D"mxc_nand"
    ATTRS{modalias}=3D=3D"platform:mxc_nand"

\o/

I will try now to define some udev rules to match for my different flash
memories.

Thank you,
Juergen

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228    =
 |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555=
 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/ =
 |
