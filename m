Date: Tue, 21 Dec 2004 12:19:01 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Rudresh NB <getrudri@yahoo.com>
In-Reply-To: <20041221120823.80642.qmail@web13205.mail.yahoo.com>
Message-ID: <Pine.LNX.4.58.0412211216340.23254@phoenix.infradead.org>
References: <20041221120823.80642.qmail@web13205.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Dec 2004, Rudresh NB wrote:

> Hi All,
>        Iam using samsung Nand flash (k9f2g08u0m). In
> that there is restriction of random page program. I
> heard that jffs2 takes care. but iam unable to find
> where exactly (In which file ) it is taken care.=20
> Brief explanation is appreciated.
>=20
> Thanx in advance
Hi.

JFFS2 uses a buffer (wbuf) of size =3D NAND page size and accomulates all=
=20
the writes there. When the buffer become full, it flushes it to the=20
correspondent NAND page. See wbuf.c.
=20
> Rgds
> NBR
>=20
>=20
>=20
> =09=09
> __________________________________=20
> Do you Yahoo!?=20
> All your favorites on one personal page =96 Try My Yahoo!
> http://my.yahoo.com=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
