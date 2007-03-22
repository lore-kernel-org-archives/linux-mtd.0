Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUKcs-0007w6-Lj
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 06:34:35 -0400
Subject: Re: bug in drivers/mtd/onenand/onenand_base.c?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <46024E33.10406@ru.mvista.com>
References: <46024E33.10406@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 22 Mar 2007 12:34:29 +0200
Message-Id: <1174559669.17249.223.camel@sauron>
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

On Thu, 2007-03-22 at 12:36 +0300, Vitaly Wool wrote:
> The problem is, the entry of oobfree past the last valid=20
> one should have length 0.
>=20
> Here it's not the case: all the entries are occupied by=20
> OOB chunks. Therefore, once we get into a loop like
>=20
>         for (free =3D this->ecclayout->oobfree; free->length; ++free) {
>=20
> we might end up scanning past the real oobfree array.

We have this fixed in OneNAND.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
