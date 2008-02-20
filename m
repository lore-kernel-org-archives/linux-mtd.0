Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRqca-0007dG-L5
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 15:12:33 +0000
Subject: Re: ubifs: can't mount ubifs as rootfs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10802200700v238b98c4t4eec9a4232395a2b@mail.gmail.com>
References: <bae050c10802200700v238b98c4t4eec9a4232395a2b@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 20 Feb 2008 17:10:27 +0200
Message-Id: <1203520227.3758.40.camel@sauron>
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

On Wed, 2008-02-20 at 23:00 +0800, Nancy wrote:
> Dear all,
>         As you can see at last, ubifs can't mount ubifs as rootfs,
> why? How can I make it right?
>         same kernel image, just different kernel command line.

I think you do not have this patch:

http://git.infradead.org/?p=3Dusers/dedekind/ubifs-v2.6.22.git;a=3Dcommitdi=
ff;h=3D9c04728f3cb585f1e0b3df4f0ae2aec1bf73e392;hp=3Daad43553d81d1b79f64cde=
3c81b71bfc3036d098

You probably use old UBIFS. Keep in mind, it is constantly developed so
you should always try the latest one if you have problems.

There are 2.6.22, 2.6.23, and 2.6.24 ubifs backports BTW,
see http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

AFAIR you use 2.6.22, so here it is:

git://git.infradead.org/~dedekind/ubifs-v2.6.22.git

Just download it - it has all the need patches. But I encourage you to
use the lates development tree.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
