Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7R5D-0005na-Ds
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 08:58:15 +0000
Subject: Re: Adding -N volume name to ubi utils
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Titmuss <richard_titmuss@logitech.com>
In-Reply-To: <492ADF69.8060602@logitech.com>
References: <492ADF69.8060602@logitech.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 10:56:02 +0200
Message-Id: <1228208162.5029.27.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2008-11-24 at 17:07 +0000, Richard Titmuss wrote:
> I am trying to modify the ubi tools in mtd_utils to allow the ubi volume=20
> name to be specified on the command line, the relevant commands are=20
> ubinfo, ubirmvol and ubiupdatevol. The idea is that you could use any of=20
> the following command arguments to specify a ubi volume:
>=20
>    ubirmvol /dev/ubi0 -N rootfs    # ubi device node and volume name
>    ubirmvol /dev/ubi0 -n 1    # ubi device node and volume id

Looks OK.

>    ubirmvol /dev/ubi0_1    # ubi volume node

Probably also fine.

> Other than consistency the main feature this adds is support for using=20
> -N to specify the volume by name to all the commands.

Right.

> The problem is these commands need different information to work:
> - ubinfo loads information from the /sys file system, it's easy to=20
> support for all the above command arguments.

Yes.

> - ubirmvol needs a ubi device node and a volume id, how can this work if=20
> a volume node is specified?

sysfs contains all the information. Character device gives you
major:minor. UBI _devices_ always have minor=3D0. So you can distinguish
between UBI volume/device chdev nodes. And you may look into all

/sys/class/ubi/ubiX/ubiX_Y/dev

and find the volume. Then you have all the information.

> - ubiupdatevol needs a ubi volume node, how can this work if a device=20
> node is specified?

Similarly. Add corresponding scanning functions to libubi
(mtd-utils/ubi-utils/new-utils/src/libubi.c).

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
