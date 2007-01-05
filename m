Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H2kxO-0007BM-Km
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 04:01:49 -0500
Subject: Re: OneNAND: read-while-load
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
References: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jan 2007 11:01:40 +0200
Message-Id: <1167987700.3683.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <hunter.programmer@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin, Adrian,

On Fri, 2007-01-05 at 07:15 +0000, Kyungmin Park wrote:
> I will run regression test with this one during this weekend.
>=20
> And which program (JFFS2 or UBI) do you use.
>=20
> I can't find any performance increase in JFFS2

It depends how you tested it. Surely you notice some performance gain
only if JFFS2 reads more then 2K bytes of data. And this only happens
when you read files's contents, especially if this file's pages were not
compressed to less then 2K.

So a test like:

dd if=3D/dev/udandom of=3D/mnt/jffs2/file bs=3D4K
time dd if=3D/mnt/jffs2/file of=3D/dev/null

would be roughly OK.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
