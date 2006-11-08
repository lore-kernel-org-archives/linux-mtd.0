Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhpzV-0004M1-4g
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 11:09:33 -0500
Subject: Re: UBI and OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <32333290.224521162903965840.JavaMail.weblogic@ep_ml06>
References: <32333290.224521162903965840.JavaMail.weblogic@ep_ml06>
Content-Type: text/plain; charset=utf-8
Date: Wed, 08 Nov 2006 18:09:20 +0200
Message-Id: <1163002160.3800.8.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: John Smith <john.smith@arrows.demon.co.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,=20

On Tue, 2006-11-07 at 12:52 +0000, Kyungmin Park wrote:
> > Yo do not need mtdblock devices to mount JFFS2 at all. JFFS2 anyway
> > works with MTD devices directly and this is just an old way to mount
> > JFFS2. /dev/mtdX are character devices and you cannot feed the mount
> > utility by character devices, so this is why fake block devices were
> > used. Nowadays there is device-less mount support and you may use:
>=20
> > mount mtd7 /mnt/nvm
>=20
> Yes, I can mount ubi with avobe method.

The device-less mount I described is a feature of *JFFS2*. It does not
depend on if there is UBI or not.

You are just trying to do an incorrect thing.

It is similar to LVM - you feed hard drives to LVM, then create LVM
volumes, then mount those LVM volumes, not the hard drives. Similar in
case of UBI. You feed mtd3 to UBI, then you create UBI volumes which are
also accessible as emulated MTD devices, and you mount _those_ MTD
devices.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
