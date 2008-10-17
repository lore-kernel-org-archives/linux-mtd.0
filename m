Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KqqJ9-0006Iv-HM
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 14:28:03 +0000
Subject: Re: [PATCH] ubifs: ubifs_compress() returns void
From: Artem Bityutskiy <dedekind@infradead.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
In-Reply-To: <Pine.LNX.4.64.0810171613360.9240@vixen.sonytel.be>
References: <Pine.LNX.4.64.0810171613360.9240@vixen.sonytel.be>
Content-Type: text/plain; charset=utf-8
Date: Fri, 17 Oct 2008 17:25:57 +0300
Message-Id: <1224253557.4466.37.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-10-17 at 16:16 +0200, Geert Uytterhoeven wrote:
> Update the comment for ubifs_compress(), which incorrectly states that it
> returnsa success/failure indicator.
>=20
> Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Pushed to ubifs-2.6.git tree, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
