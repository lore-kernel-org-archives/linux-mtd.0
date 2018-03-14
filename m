Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewC0U-0007WK-6x
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 19:24:15 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: ubi: use put_device() if device_register fail
Date: Wed, 14 Mar 2018 20:25:25 +0100
Message-ID: <3619597.KITkZyk1Wv@blindfold>
In-Reply-To: <20180314195652.59b21594@bbrezillon>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <5d9b08afdad2fbc65bac48d8ae22f4925bb80512.1520592440.git.arvind.yadav.cs@gmail.com>
 <20180314195652.59b21594@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 14. M=E4rz 2018, 19:56:52 CET schrieb Boris Brezillon:
> On Fri,  9 Mar 2018 16:20:49 +0530
>=20
> Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
> > if device_register() returned an error! Always use put_device()
> > to give up the reference initialized.
> >=20
> > Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> > ---
> >=20
> >  drivers/mtd/ubi/vmt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> > index 3fd8d7f..db85b68 100644
> > --- a/drivers/mtd/ubi/vmt.c
> > +++ b/drivers/mtd/ubi/vmt.c
> > @@ -609,6 +609,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct
> > ubi_volume *vol)>=20
> >  	return err;
> > =20
> >  out_cdev:
> > +	put_device(&vol->dev);
> >=20
> >  	cdev_del(&vol->cdev);
>=20
> use-after-free bug here: put_device() has freed the vol obj, and you're
> dereferencing the pointer just after that.

eeek, thanks for looking at more context.
Arvind, while you are right that put_device() is missing, please double che=
ck=20
that freeing the devices is also correct.

Thanks,
//richard
