Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwGvr-0008Cj-Ne
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 13:22:12 +0000
Subject: Re: ubifs image file confusion!
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10805130541w132a1757paea415f5564b23ec@mail.gmail.com>
References: <bae050c10805080217r77c9724aya0777ccf5f59a293@mail.gmail.com>
	<1210243730.3645.66.camel@sauron>
	<bae050c10805090005g50b657c2jf8d471cd51244da7@mail.gmail.com>
	<bae050c10805092120u14177a03td46fa8175f89aa66@mail.gmail.com>
	<1210671861.5708.5.camel@sauron>
	<bae050c10805130541w132a1757paea415f5564b23ec@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 14 May 2008 16:20:00 +0300
Message-Id: <1210771200.5708.50.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-05-13 at 20:41 +0800, Nancy wrote:
>    Cause I was writing ubi-util, sure I show this issue at UBI standpoint=
.
If you want me to understand you and properly answer, you should try to
formulate things better. I understand language difficulties and this is
all right. I just ask you to try better, may be re-reading what you have
composed and trying imagine me reading your mail and imagine which part
could be not very clear for me.

>    OK, what mkfs.ubifs for? generate image file used by ubiupdatevol.
OK.

> It should contain the necessary data. What is necessary data? at least
> the data should be writen down on the Nand flash. On the standpoint of
> UBI, those data should be mapped.  It does not make sense to contain
> data(LEBs which contents are all 0xFF).
OK.

>  ubiupdatevol have to play a
> trick to avoid writing those 0xFF to Nand.
OK.

>    As I fool understand which I have plase after that mail:
Cannot parse this sentence, sorry.

> > >        #ubiupdatevol /dev/ubi0_0 ubifs.img   also write the unmapped
> > > LEBs to Nand flash.
> > It does not write them, but it creates them if the image size is less
> > then amount of space on the volume. What else do you expect?
>    I do not mean that part of 0xFF.  I mean the unmapped part in the imag=
e file.
Cannot understand what we are talking about here. What
'ubiupdatevol /dev/ubi0_0 ubifs.img' doing is:
1. Wipes out whole volume ubi0_0 which technically means unmapping all
LEBs.
2. Puts date from ubifs.img to the volume, starting from LEB 0.
3. If the ubifs.img file is less than the ubi0_0 volume, some amount of
LEBs at the end will be unmapped.


> pls:
>       1. ubinize tool do not check whether vol_id or vol_name's
> uniqueness which may cause unexpected error.

OK, will be fixed but a bit later.

>       2. ubinize tool's volume size check do not aligned to LEB size.
Cannot parse this.

> I can't use an image file which taken up of its all volume space.
> eg. LEB size =3D258048  , .cfg defined vol size =3D 100MiB ,
> vfat.img(407LEBs)     fail
> it say something like the image file size exceed the volume size. I'm
> home now, can't plase the original error message here. sorry.
Sorry, do not understand this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
