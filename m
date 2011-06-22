Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZIpS-0002PZ-BC
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 08:30:31 +0000
Received: by iwn35 with SMTP id 35so596907iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 01:30:27 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
References: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Wed, 22 Jun 2011 10:30:07 +0200
Message-ID: <BANLkTimj-1sFRG9hkcFfu0yjpUa4eeP5qA@mail.gmail.com>
Subject: Re: mkfs.jffs2 min erase block size: 4 vs 8 KiB
To: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>
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

Hi Mike,

2011/6/22 Mike Frysinger <vapier.adi@gmail.com>:
> the current mkfs.jffs2 util has in its --eraseblock handling:
> /* If it's less than 8KiB, they're not allowed */
> if (erase_block_size < 0x2000) {
> =C2=A0 =C2=A0fprintf(stderr, "Erase size 0x%x too small. Increasing to 8K=
iB minimum\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0erase_block_size);
> =C2=A0 =C2=A0erase_block_size =3D 0x2000;
> }
>
> but i cant seem to find documentation on where this comes from. =C2=A0it'=
s
> not uncommon to have SPI flashes with 4KiB erase sectors, and removing
> this sanity check and allowing 4 KiB seems to produce an image that
> works OK.
>
> am i missing something ? =C2=A0or should i send a patch to drop this chec=
k ?

This has already be pointed by Fabio Giovagnini :
http://lists.infradead.org/pipermail/linux-mtd/2011-February/033992.html
He patched mkfs.jffs2 to allow "--eraseblock=3D0x1000" and he reported
it works ok.

AFAIK, there should be no problem removing this sanity check.
Artem, david, objections ?

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
