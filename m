Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTevu-0004RS-DE
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 18:53:51 +0000
Received: by iyb39 with SMTP id 39so4675928iyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 11:53:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29EDD457F13D0846B91A4845A68C3836E466A0@BOSQNAOMAIL1.qnao.net>
References: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
	<BANLkTi=ymbNh93riTAjJ5RVFXogYt9HPYg@mail.gmail.com>
	<29EDD457F13D0846B91A4845A68C3836E4657A@BOSQNAOMAIL1.qnao.net>
	<1307376483.3112.94.camel@localhost>
	<29EDD457F13D0846B91A4845A68C3836E466A0@BOSQNAOMAIL1.qnao.net>
Date: Mon, 6 Jun 2011 21:53:46 +0300
Message-ID: <BANLkTimrmjMXAMg9yJ_Fmi+1oXgYi7A7FQ@mail.gmail.com>
Subject: Re: ubi image only mounts once
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Douglass, Woody" <Woodrow.Douglass@qinetiq-na.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 6, 2011 at 9:31 PM, Douglass, Woody
<Woodrow.Douglass@qinetiq-na.com> wrote:
>
> Artem,
>
> Thanks, you're correct, subpages aren't working properly! First I tried a=
pplying this patch to solve the issue: https://patchwork.kernel.org/patch/7=
49762/
>
> The test still fails. Next, I changed the -s argument to ubinize from 512=
 to 2048; I also added -s 2048 to my ubiformat arguments.
>
> Now, on boot, this happens:
>
> [ =C2=A0357.992767] UBI: attaching mtd4 to ubi0
> [ =C2=A0357.996673] UBI: physical eraseblock size: =C2=A0 131072 bytes (1=
28 KiB)
> [ =C2=A0358.003631] UBI: logical eraseblock size: =C2=A0 =C2=A0129024 byt=
es
> [ =C2=A0358.009185] UBI: smallest flash I/O unit: =C2=A0 =C2=A02048
> [ =C2=A0358.013916] UBI: sub-page size: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0512
> [ =C2=A0358.018646] UBI: VID header offset: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0512 (aligned 512)
> [ =C2=A0358.024505] UBI: data offset: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02048
> [ =C2=A0358.030639] UBI error: validate_ec_hdr: bad VID header offset 204=
8, expected 512
> [ =C2=A0358.038085] UBI error: validate_ec_hdr: bad EC header
> [ =C2=A0358.043426] UBI error: ubi_io_read_ec_hdr: validation failed for =
PEB 0
> [ =C2=A0358.050292] UBI error: ubi_init: cannot attach mtd4
> [ =C2=A0358.057708] UBI error: ubi_init: UBI error: cannot initialize UBI=
, error -22
>
> How can I re set the sub-page size?

Take a look here:
http://linux-mtd.infradead.org/faq/ubi.html#L_vid_offset_mismatch

Also modinfo ubi

If you attach UBI using the kernel boot parameters, use mtd=3DX,2048,
where X is your number.

--
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
