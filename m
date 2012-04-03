Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SF1Bd-0000ty-0u
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2012 10:42:06 +0000
Received: by iaky10 with SMTP id y10so6784874iak.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Apr 2012 03:42:03 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <alpine.DEB.2.00.1204031228470.4560@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203252302310.5527@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203252325100.5527@eristoteles.iwoars.net>
 <1332837188.31549.14.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203291639200.912@eristoteles.iwoars.net>
 <1333377383.22146.14.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1204021645070.29393@eristoteles.iwoars.net>
 <1333378674.22146.18.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1204031228470.4560@eristoteles.iwoars.net>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 3 Apr 2012 12:41:42 +0200
Message-ID: <CAJpamw7rXn_tLcFSE07AK4nrh9QXLBNzuehzLhB+rUbMv9UePA@mail.gmail.com>
Subject: Re: [patch] UBIFS: Add cryptographic functionality when a key is
 passed to the compress / decompress functions
To: Joel Reardon <joel@clambassador.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2012/4/3 Joel Reardon <joel@clambassador.com>:
> =C2=A0no_compr:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(out_buf, in_buf, in_len);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_len =3D in_len;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0*compr_type =3D UBIFS_COMPR_NONE;
> + =C2=A0 =C2=A0 =C2=A0 goto encrypt;

This goto seems unneeded here.

> +
> +encrypt:
> + =C2=A0 =C2=A0 =C2=A0 if (crypto_key) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 iv[UBIFS_CRYPTO_KEY=
SIZE];
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(iv, 0, UBIFS_CR=
YPTO_KEYSIZE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ubifs_aes_crypt(out_bu=
f, *out_len, crypto_key, iv);
> + =C2=A0 =C2=A0 =C2=A0 }




--=20
Guillaume LECERF
OpenBricks developer - www.openbricks.org
