Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PUijg-0006aT-8Z
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2010 16:37:24 +0000
Received: by qyk27 with SMTP id 27so3590850qyk.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Dec 2010 08:37:17 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1292539339-25111-3-git-send-email-agust@denx.de>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 20 Dec 2010 17:36:57 +0100
Message-ID: <AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
To: Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

2010/12/16 Anatolij Gustschin <agust@denx.de>:
> Initialize mtd->writebufsize to the value obtained
> by CFI query command at probe time.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -428,6 +428,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *ma=
p, int primary)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->flags =C2=A0 =3D MTD_CAP_NORFLASH;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->name =C2=A0 =C2=A0=3D map->name;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->writesize =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 mtd->writebufsize =3D 1 << cfi->cfiq->MaxBufWriteS=
ize;

What about wbufsize initialized in cfi_amdstd_write_buffers() to
"cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize" ?
I don't know this piece of code, but I just wanted to point it to you.

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
