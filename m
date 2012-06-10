Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdrYx-0002Ii-Lo
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 23:28:52 +0000
Received: by wibhn14 with SMTP id hn14so2680970wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 16:28:49 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Is there a bug in the UBIFS?
Date: Mon, 11 Jun 2012 01:28:45 +0200
References: <4FD1BD03.60800@freescale.com>
 <1339148214.6875.117.camel@sauron.fi.intel.com>
 <4FD1CA7C.4040501@freescale.com>
In-Reply-To: <4FD1CA7C.4040501@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201206110128.45829.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B406=E6=9C=8808=E6=97=A5 17:36, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> > On Fri, 2012-06-08 at 16:51 +0800, Huang Shijie wrote:
> >> [ 3526.960000] UBIFS error (pid 389): ubifs_scan: garbage
> >=20
> > UBIFS complains that it read garbage instead of proper UBIFS nodes.
> >=20
> >> I am not sure whether it's a UBIFS's bug, or the gpmi-nand's bug.
> >=20
> > Does not look like a UBIFS issue. You can always validate UBIFS using
> > nandsim.
> >=20
> > modprobe nandsim
> > modprobe ubi mtd=3D0
> > ubimkvol /dev/ubi0 -N test -m
> > mount -t ubifs /dev/ubi0_0 /mnt/ubifs
> > integck /mnt/ubifs
>=20
> ok, thanks a lot.

Did you possibly finally shoot yourself in the leg with this issue that is=
=20
constantly ignored?

http://lists.infradead.org/pipermail/linux-mtd/2012-January/039127.html

>=20
> Huang Shijie

Best regards,
Marek Vasut
