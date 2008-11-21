Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3Shq-00048A-7U
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 09:53:42 +0000
Subject: Re: flash_eraseall reports incorrect percentage
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ladislav Michl <ladis@linux-mips.org>
In-Reply-To: <20081118185652.GA32157@michl.2n.cz>
References: <200801301403.13149.sr@denx.de>
	<20081118185652.GA32157@michl.2n.cz>
Content-Type: text/plain; charset=utf-8
Date: Fri, 21 Nov 2008 11:51:38 +0200
Message-Id: <1227261098.3954.49.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-11-18 at 19:56 +0100, Ladislav Michl wrote:
> On Wed, Jan 30, 2008 at 02:03:13PM +0100, Stefan Roese wrote:
> > It seems that the flash_eraseall utility doesn't report the correct per=
centage=20
> > upon completion. After erasing the last sector, the output seems not to=
 get=20
> > updated anymore. This leads to something like this on a partition with =
only 2=20
> > sectors:
> >=20
> > flash_eraseall /dev/mtd6
> > Erasing 256 Kibyte @ 40000 -- 50 % complete.
> >=20
> > I'm just posting this report as a reference. Perhaps somebody has a lit=
tle=20
> > time to fix it.
>=20
> Well, I sacrificed a little time otherwise used to prepare supper, but
> fridge is emty...
>=20
> # flash_eraseall /dev/mtd4
> Erasing 128 Kibyte @ 2800000 -- 100 % complete.
>=20
> flash_eraseall
>  * fix percentage reporting
>  * exit()ing from main() is overkill, just return
>=20
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>


It seems others are busy, so I took a look at this. I think the patch is
OK, pushed to mtd-utils.git.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
