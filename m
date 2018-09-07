Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyGZh-0005xA-97
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 13:13:28 +0000
Date: Fri, 7 Sep 2018 15:13:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: mtdconcat: add dt driver for concat devices
Message-ID: <20180907151301.3a25f7e4@xps13>
In-Reply-To: <345a1f1e-23e8-d7b5-02f5-5b2ae0ec7209@nospam.obeliks.de>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906161413.6335-4-kernel@nospam.obeliks.de>
 <20180906204717.7cc4a6a3@xps13>
 <345a1f1e-23e8-d7b5-02f5-5b2ae0ec7209@nospam.obeliks.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bernhard,

Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote on Fri, 7 Sep
2018 00:54:01 +0200:

> Hi Miquel,
>=20
> thanks for your review, I've applied most of your suggested changes, exce=
pt:
>=20
> On 06/09/18 20:47, Miquel Raynal wrote:
> > =20
> >> +static int virt_concat_remove(struct platform_device *pdev)
> >> +{
> >> +	struct of_virt_concat *info;
> >> +	int i;
> >> +
> >> +	info =3D platform_get_drvdata(pdev);
> >> +	if (!info)
> >> +		return 0;
> >> +	platform_set_drvdata(pdev, NULL); =20
> > Is this really useful? =20
> I believe this is indeed useful, as `virt_concat_remove()` is also called=
 as cleanup in error cases of `virt_concat_probe()`. Then it seems to be co=
mmon practice to unset the driver data from the device.
>=20
> Am I mistaken here?

That's fine for me. Perhaps you can explain it with a comment.

I'm pretty sure there will be other "deeper" reviews coming on the
series.

Thanks,
Miqu=C3=A8l
