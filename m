Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4dLW-0000qR-Qi
	for linux-mtd@lists.infradead.org; Wed, 10 Jan 2007 08:18:30 -0500
Subject: Re: OneNAND git
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <846526.522131168389817787.JavaMail.weblogic@ep_ml20>
References: <846526.522131168389817787.JavaMail.weblogic@ep_ml20>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jan 2007 15:18:18 +0200
Message-Id: <1168435098.26936.25.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,

On Wed, 2007-01-10 at 00:43 +0000, Kyungmin Park wrote:
> I saw your tree. and please append the last patch, read-while-load in DDP=
 handling.
> also we have to add "[MTD] OneNAND: fix onenand_wait bug".
Yeah, they are there.

> Then what's your opinion of JFFS2 patch?
>=20
>     [JFFS2] Skip ECC position in NAND family flash
>=20
>     In OneNAND it updates the spare ecc area automatically when write the
>     cleanmark in spare area

I think the problem should be fixed by means of MTD_OOB_AUTO option
instead.

> The remaing patches are following.
>=20
> 1. [MTD] OneNAND: add subpage write support

It is cool to support this of course. I just forgot about it.

BTW, here is the idea how to test this. Just report mtd->writesize =3D 512
instead of 2048 temporarily. Then run some JFFS2 tests. O course, this
is just a hack for testing and you should report 2048 in mtd->writesize.

> 2. [JFFS2] fix wrong ref-flash_offset usage.

I think it is not OneNAND-related. I've put it to my
dedekind-mtd-2.6.git tree - will bug dwmw2 to pull from it. OK?


> I think thres's no problem of the removal of cond_resched in OneNAND driv=
er.
> If you don't agree this one, I can revert it.

Revert a revert? :-)

Yes, I do not agree. Having large loops with no cond_resched() is not
nice. For example, MTD may be asked to read 64MiB of data at one go. And
we do this without releasing CPU and cause huge delays. This is bad.

Now I have all the patches in place in my tree. I offer you to consider
to clone my tee and maintain it instead. I do not actually wish to be a
OneNAND maintainer, just collected all the patches and made a bit neater
git tree. Some of them didn't apply cleanly, so I did some hand work.

Also, I change the author of my patch to me instead of you. :-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
