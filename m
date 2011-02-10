Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnYDT-0005Tk-Tf
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:13:57 +0000
Received: by gyg4 with SMTP id 4so606608gyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Feb 2011 07:13:54 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1297350106-16383-3-git-send-email-agust@denx.de>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-3-git-send-email-agust@denx.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 10 Feb 2011 16:13:31 +0100
Message-ID: <AANLkTi=Jtc7cUZ3puU_krmxm34P1LB605i8FE6Rti1jp@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
To: Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anatolij.

2011/2/10 Anatolij Gustschin <agust@denx.de>:
> When initializing mtd->writebufsize, we must take into account
> possible flash chip interleaving. Wrong writebufsize initialization
> caused UBIFS recovery issues resulting in unmountable UBIFS file
> system on NOR flash partitions.
> - =C2=A0 =C2=A0 =C2=A0 mtd->writebufsize =3D 1 << cfi->cfiq->MaxBufWriteS=
ize;
> + =C2=A0 =C2=A0 =C2=A0 mtd->writebufsize =3D cfi_interleave(cfi) << cfi->=
cfiq->MaxBufWriteSize;


This is exactly what I told you (
http://lists.infradead.org/pipermail/linux-mtd/2010-December/033559.html
).

Could you examine the (not compilable) patches I attached and merge
them with your current patch ?

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
