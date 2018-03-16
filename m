Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewk6f-0000Y8-8d
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2018 07:48:55 +0000
From: Richard Weinberger <richard@nod.at>
To: arvindY <arvind.yadav.cs@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2 v2] mtd: ubi: use put_device() if device_register fail
Date: Fri, 16 Mar 2018 08:50:06 +0100
Message-ID: <1800631.Ura3nHEcOL@blindfold>
In-Reply-To: <5AAAB066.90900@gmail.com>
References: <1521098431-29565-1-git-send-email-arvind.yadav.cs@gmail.com>
 <11250cfc-f092-b299-1044-50334c518bf1@gmail.com> <5AAAB066.90900@gmail.com>
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

Arvind,

Am Donnerstag, 15. M=E4rz 2018, 18:41:58 CET schrieb arvindY:
> On Thursday 15 March 2018 02:17 PM, Arvind Yadav wrote:
> > On Thursday 15 March 2018 01:25 PM, Richard Weinberger wrote:
> >> Am Donnerstag, 15. M=E4rz 2018, 08:20:31 CET schrieb Arvind Yadav:
> >>> if device_register() returned an error! Always use put_device()
> >>> to give up the reference initialized.
> >>=20
> >> Like DaveM said, there is no need to shout and use "!".
> >=20
> > I will fix this and send you update patch.
> >=20
> >>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> >>> ---
> >>>=20
> >>> change in v2:
> >>>          Fix use-after-free bug. move put_device() after cdev_del().
> >>>  =20
> >>>   drivers/mtd/ubi/vmt.c | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>=20
> >>> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> >>> index 3fd8d7f..93c6163 100644
> >>> --- a/drivers/mtd/ubi/vmt.c
> >>> +++ b/drivers/mtd/ubi/vmt.c
> >>> @@ -610,6 +610,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct
> >>> ubi_volume *vol)
> >>>=20
> >>>   out_cdev:
> >>>       cdev_del(&vol->cdev);
> >>>=20
> >>> +    put_device(&vol->dev);
> >>>=20
> >>>       return err;
> >>=20
> >> The more I dig into device code, the more questions I have.
> >> Why is cdev_del() not part of the release function?
> >>=20
> >> Thanks,
> >> //richard
> >=20
> > Yes, It's should be a part release function.
> >=20
> > ~arvind
>=20
> I was wrong, We can not add cdev_del() in release(vol_release)
> function.
> Function's ubi_create_volume and ubi_add_volume both are using
> same release function to release a volume devices.
> ubi_add_volume is registering character device for the volume.
> So we will have to release character device here.

This is not what I meant.
The question was whether we should free all this data structures from the=20
device model's point of view.
That we have to massage UBI code for that is clear.

Thanks,
//richard
