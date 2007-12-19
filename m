Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4yE2-0004zQ-Fz
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 12:40:44 +0000
Subject: Re: Limited support of NAND features in MTD.
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1198061571.13978.733.camel@pmac.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
	<20071218165758.GA11634@old.davidb.org>
	<20071218165648.GH1741@lazybastard.org>
	<1198001672.2590.35.camel@shinybook.infradead.org>
	<Pine.LNX.4.64.0712191046130.14911@pentafluge.infradead.org>
	<1198061571.13978.733.camel@pmac.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Dec 2007 13:57:23 +0200
Message-Id: <1198065443.18962.40.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Brown <davidb@davidb.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-12-19 at 10:52 +0000, David Woodhouse wrote:
> On Wed, 2007-12-19 at 10:49 +0000, Alexey Korolev wrote:
> > Hmm I did not heard about this. Could you please give more details on
> > how partial page read can suffer from lack of ECC?
>=20
> If your ECC covers the whole page, you have to read the whole page in
> order to check ECC.
>=20
> Of course, if you do ECC in sub-pages in the first place, you can read
> only a single ECC block. But you still can't just read arbitrary byte
> ranges.

Sure, but as the guys showed, even this gives substantial JFFS2
performance growth. Providing their figures are correct, subpage reads
are more then worth using.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
