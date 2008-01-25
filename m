Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JIJ4D-0000mi-1S
	for linux-mtd@lists.infradead.org; Fri, 25 Jan 2008 07:33:43 +0000
Subject: Re: Error compiling libubi with latest mtd-utils snapshot
From: Artem Bityutskiy <dedekind@infradead.org>
To: Chase Maupin <cem8101@gmail.com>
In-Reply-To: <2c8de1360801240739oae8135bg55d829ff75642048@mail.gmail.com>
References: <2c8de1360801240739oae8135bg55d829ff75642048@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 25 Jan 2008 09:31:14 +0200
Message-Id: <1201246274.6934.49.camel@sauron>
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

On Thu, 2008-01-24 at 09:39 -0600, Chase Maupin wrote:
> All,
>=20
> I downloaded the latest mtd-utils snapshot from
> git://git.infradead.org/mtd-utils.git and did a "make clean" followed
> by "make".  The snapshot I downloaded was commited Jan 24, 2008 at
> 11:21 with commit tag e292b5fb39de2c6907ffe751391ae3bbd5603b91.
>=20
> During the compile I received the following errors:
>=20

I've removes all __be32 and the like occurrences from ubi-header.h.
Please, update (git-pull) and try again.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
