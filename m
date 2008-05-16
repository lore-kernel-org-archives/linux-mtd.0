Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jws53-00064j-6d
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 05:02:09 +0000
Subject: Re: [PATCH] NAND subpage read feature as a way to increase
	performance. Take 2.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0805151643360.32186@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0805151643360.32186@pentafluge.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 16 May 2008 08:01:18 +0300
Message-Id: <1210914078.27243.13.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org,
	tglx@linutronix.de, hamish@cloud.net.au
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-05-15 at 17:23 +0100, Alexey Korolev wrote:
> Hi,=20
>=20
> This patch enables NAND subpage read functionality.=20
> If upper layer drivers are requesting to read non page aligned data NAND
> subpage-read functionality reads the only whose ECC regions which include
> requested data when original code reads whole page.
> This significantly improves performance in many cases.=20
>=20
> Here are some digits :
>=20
> UBI volume mount time
> No subpage reads: 5.75 seconds
> Subpage read patch: 2.42 seconds
>=20
> Open/stat time for files on JFFS2 volume:
> No subpage read  0m 5.36s
> Subpage read     0m 2.88s
>=20
> Signed-off-by Alexey Korolev <akorolev@infradead.org>
> -------------------------

Looks good to me,
Acked-by Artem Bityutskiy <dedekind@infradead.org>

Thanks!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
