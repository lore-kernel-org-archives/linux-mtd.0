Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OGF9B-0002fx-5V
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 17:39:34 +0000
Received: by pxi1 with SMTP id 1so1213192pxi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 May 2010 10:39:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1274506202.8881.30.camel@localhost.localdomain>
References: <1274176439-22351-1-git-send-email-eballetbo@gmail.com>
	<1274506202.8881.30.camel@localhost.localdomain>
Date: Sun, 23 May 2010 19:39:30 +0200
Message-ID: <AANLkTikhokXCrg5uKIkxnBWYsvBBKQ9QuYmEUvyjstX-@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: Support 4096+64 page sizes.
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
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

Hello,

2010/5/22 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2010-05-18 at 11:53 +0200, Enric Balletbo i Serra wrote:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 !(meminfo.oobsize =3D=3D 64 && meminfo.writesize
>> =3D=3D 4096) &&
>
> Are there flashes with the 4096 page / 64 spare combination? Could you
> refer to one? May be any URL? I thought 4096 comes with 128.

Much to my regret I can't provide a URL because is not public. IGEP v2
board has a Onenand with two dice of 2048/64 spare combination but mtd
views 4096/64. The minimal write page is 4K (2K from first dice and 2K
from second dice).

Best regards,

Enric

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
