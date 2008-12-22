Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LEh8i-0007XI-3H
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2008 09:31:53 +0000
Subject: Re: UBIFS option to make volume not do compression
From: Artem Bityutskiy <dedekind@infradead.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
In-Reply-To: <Pine.LNX.4.64.0812221012350.12551@vixen.sonytel.be>
References: <mailman.11.1229706002.1545.linux-mtd@lists.infradead.org>
	<509116.73555.qm@web58907.mail.re1.yahoo.com>
	<1229927039.2756.18.camel@sauron>
	<Pine.LNX.4.64.0812221012350.12551@vixen.sonytel.be>
Content-Type: text/plain; charset=utf-8
Date: Mon, 22 Dec 2008 11:32:47 +0200
Message-Id: <1229938367.2756.34.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Philip Rakity <prakity@yahoo.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-22 at 10:14 +0100, Geert Uytterhoeven wrote:
> > You may find the up-to-date ubifs.txt in the ubifs-2.6.git
> > (see http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source) or
> > in the current Linus's tree.
>=20
> It's not in Linus' current tree.

Indeed. It is scheduled for the next merge window. This is the commit I
referred to:

http://git.infradead.org/ubifs-2.6.git?a=3Dcommit;h=3D553dea4dd531562688ba0=
1c641c7f8fc7abaaf8c

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
