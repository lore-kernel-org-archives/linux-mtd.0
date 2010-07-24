Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OcUEm-0005Xh-Ih
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 02:13:17 +0000
Received: by wwd20 with SMTP id 20so1221585wwd.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jul 2010 19:13:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <17c9bf88c97c51f5ef538d16715a148c@localhost>
References: <5a5041da4e200221d33e0e25594438e3@localhost>
	<17c9bf88c97c51f5ef538d16715a148c@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 23 Jul 2010 22:12:53 -0400
Message-ID: <AANLkTinZ1W_Lu5bObmnbaQb1=cqTnZfP-wFzi3wunEdY@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd-utils: clean up compile warnings
To: Kevin Cernekee <cernekee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 23, 2010 at 20:47, Kevin Cernekee <cernekee@gmail.com> wrote:
> -static char *helptext =3D
> +static const char *helptext =3D

might as well fix this while you're changing things:
static const char helptext[] =3D

> -static char *revtext =3D "1.60";
> +static const char *revtext =3D "1.60";

here too

> - =C2=A0 =C2=A0 =C2=A0 printf ("Copied %d bytes from address 0x%.8x in fl=
ash to %s\n",len,offset,filename);
> + =C2=A0 =C2=A0 =C2=A0 printf ("Copied %d bytes from address 0x%.8x in fl=
ash to %s\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)len,offset,filena=
me);

please fix the format strings instead of casting away the types.  this
should be %zu instead of %d for the len.  i imagine there are a bunch
of similar changes in this patch that should be fixed correctly.
-mike
