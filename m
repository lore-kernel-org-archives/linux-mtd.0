Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCNwz-0003R0-RT
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 03:19:34 +0000
Received: by bwz1 with SMTP id 1so364547bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 20:19:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303115951.2815.35.camel@localhost>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
	<1302873423.3220.45.camel@localhost>
	<BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
	<1303031774.2308.13.camel@koala>
	<BANLkTi=We=H92+DHuJF7TPVUagePgqF48g@mail.gmail.com>
	<1303115951.2815.35.camel@localhost>
Date: Wed, 20 Apr 2011 11:19:31 +0800
Message-ID: <BANLkTim2aXQY5YzJkadHWT_NQ2XNupTHBA@mail.gmail.com>
Subject: Re: UBI memory usage on large page nand
From: Nicholas <ciliwung36@gmail.com>
To: dedekind1@gmail.com
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

Dear Artem,

Sorry for my late reply .

My modification :

build.c

#define MTD_SMALL_SIZE_PAGE_BLOCK_SIZE	0x40000 // block size for 2KB
page of nand flash which we set as an offset.

	if (ubi->peb_size > MTD_SMALL_SIZE_PAGE_BLOCK_SIZE)
		ubi->peb_buf1 =3D vmalloc(MTD_SMALL_SIZE_PAGE_BLOCK_SIZE);
	else
		ubi->peb_buf1 =3D vmalloc(ubi->peb_size);

	if (!ubi->peb_buf1)
		goto out_free;

  if (ubi->peb_size > MTD_SMALL_SIZE_PAGE_BLOCK_SIZE)
		ubi->peb_buf2 =3D vmalloc(MTD_SMALL_SIZE_PAGE_BLOCK_SIZE);
	else
		ubi->peb_buf2 =3D vmalloc(ubi->peb_size);

	if (!ubi->peb_buf2)
		goto out_free;

orphan.c
In ubifs_mount_orphans()
c->orph_buf =3D vmalloc((c->leb_size)/4); // for temporary

lpt.c
In lpt_init_wr()
c->lpt_buf =3D vmalloc((c->leb_size)/4); // for temporary

These modification can work properly, and reduce a lot of memory usage .

I also made modification on super.c in mount_ubifs(), seems more
complicated to handle sbuf & ileb_buf allocation. But i recovered them
to original code since it couldn't boot up properly.

Thanks in advance.

Alex

On Mon, Apr 18, 2011 at 4:39 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Mon, 2011-04-18 at 16:29 +0800, Nicholas wrote:
>> Dear Artem,
>>
>> If I reduce ubi->peb_buf1 and ubi->peb_buf2 with allocation of smaller
>> memory spaces, will they affect to IO ( read / write ) ?
>> Will it cause block data wasted ? Since buffer is allocated less than
>> block size .
>
> Yes, =C2=A0please, make the buffers smaller. Yes, on some setups this wil=
l
> make I/O a bit slower. But I have some ideas how to deal with that.
> Please, do your changes, I'll take a look and then suggest how to
> improve that - but I first want to see how you will do a simple
> thing :-)
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
