Received: from mail-yw0-f172.google.com ([209.85.211.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NkcEj-0004vO-O7
	for linux-mtd@lists.infradead.org; Thu, 25 Feb 2010 11:50:37 +0000
Received: by ywh2 with SMTP id 2so3492716ywh.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Feb 2010 03:50:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1267097527.30247.6163.camel@macbook.infradead.org>
References: <1263743566-26986-1-git-send-email-vapier@gentoo.org>
	<1267097527.30247.6163.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 25 Feb 2010 06:50:12 -0500
Message-ID: <8bd0f97a1002250350y30063ae8u29d13cf038abf76f@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: Blackfin async: rename local funcs to avoid
	common clashes
To: David Woodhouse <dwmw2@infradead.org>
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

On Thu, Feb 25, 2010 at 06:32, David Woodhouse wrote:
> On Sun, 2010-01-17 at 10:52 -0500, Mike Frysinger wrote:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 state->map.name =C2=A0 =C2=A0 =C2=A0 =3D DRI=
VER_NAME;
>> - =C2=A0 =C2=A0 =C2=A0 state->map.read =C2=A0 =C2=A0 =C2=A0 =3D bfin_rea=
d;
>> - =C2=A0 =C2=A0 =C2=A0 state->map.copy_from =C2=A0=3D bfin_copy_from;
>> - =C2=A0 =C2=A0 =C2=A0 state->map.write =C2=A0 =C2=A0 =C2=A0=3D bfin_wri=
te;
>> - =C2=A0 =C2=A0 =C2=A0 state->map.copy_to =C2=A0 =C2=A0=3D bfin_copy_to;
>> +#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
>> + =C2=A0 =C2=A0 =C2=A0 state->map.read =C2=A0 =C2=A0 =C2=A0 =3D bfin_fla=
sh_read;
>> + =C2=A0 =C2=A0 =C2=A0 state->map.copy_from =C2=A0=3D bfin_flash_copy_fr=
om;
>> + =C2=A0 =C2=A0 =C2=A0 state->map.write =C2=A0 =C2=A0 =C2=A0=3D bfin_fla=
sh_write;
>> + =C2=A0 =C2=A0 =C2=A0 state->map.copy_to =C2=A0 =C2=A0=3D bfin_flash_co=
py_to;
>> +#endif
>
> Why add the #ifdef? This driver depends on MTD_COMPLEX_MAPPINGS in
> Kconfig, and rightly so -- it can never work as a 'simple' mapping.

it was to allow for quick build test w/out having to create a valid
configuration file
make drivers/mtd/maps/bfin-async-flash.o
-mike
