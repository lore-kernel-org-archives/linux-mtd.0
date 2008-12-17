Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCwMJ-0004Ms-4K
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 13:22:39 +0000
Subject: Re: ubifs: BUG: scheduling while atomic - when runs out of space
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <4948FC5F.10907@runbox.com>
References: <4948FC5F.10907@runbox.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 17 Dec 2008 15:20:07 +0200
Message-Id: <1229520007.17960.34.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-17 at 08:19 -0500, Cal Page wrote:
> When I run a ubifs partition out of space, I get
>=20
>   BUG: scheduling while atomic: tar/0xffffffff/3324
>=20
> repeated until I stop trying to write the partition.
>=20
> What's wrong? Who went atomic in ubi/ubifs? If I wait a minute, disk=20
> usage drops from 100% to 75%, no doubt due to garbage collection.

Please, provide more information. You probably have stack dump at least?
Did you look at dmesg output?

What is your platform/kernel/flash/UBI volume size?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
