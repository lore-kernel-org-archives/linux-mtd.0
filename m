Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Compile Error: structure has no member named lowest_vol_num
Date: Fri, 3 Jul 2009 09:00:26 +0200
Message-ID: <077E41CFFD002C4CAB7DFA4386A53264F5D812@DEMUEXC014.nsn-intra.net>
In-Reply-To: <1246603942.20721.29.camel@localhost.localdomain>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
	<8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
	<1246603942.20721.29.camel@localhost.localdomain>
From: "Biefel, Reiner (NSN - DE/Munich)" <reiner.biefel@nsn.com>
To: <dedekind@infradead.org>, "Mike Frysinger" <vapier.adi@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
Thanks. This patch worked fine.

BTW: I don't understand why nobody else did have this problem till now.

BR
Reiner=20

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: Friday, July 03, 2009 8:52 AM
To: Mike Frysinger
Cc: Biefel, Reiner (NSN - DE/Munich); linux-mtd@lists.infradead.org
Subject: Re: Compile Error: structure has no member named lowest_vol_num

On Wed, 2009-07-01 at 21:15 -0400, Mike Frysinger wrote:
> the CPPFLAGS in the env changes how make initializes/appends CPPFLAGS
> in sub-makes.  this causes the old ubi utils to find the newer headers
> at ubi-utils/include/ before the ubi-utils/old-utils/inc/.  i'd pose
> the question of whether keeping old-utils makes sense anymore ?  "old"
> sounds to me like "punt" ...

Well, some people use them so far, AFAIK...

> barring that, here is the simple fix:
> --- a/ubi-utils/old-utils/Makefile
> +++ b/ubi-utils/old-utils/Makefile
> @@ -5,8 +5,8 @@
>  KERNELHDR :=3D ../../include
>=20
>  CFLAGS ?=3D -O2 -g -Werror
> -CPPFLAGS +=3D -I./inc -I./src -I$(KERNELHDR) \
> -   -std=3Dgnu99 -DPACKAGE_VERSION=3D\"1.0\"
> +CPPFLAGS :=3D -I./inc -I./src -I$(KERNELHDR) \
> +   -std=3Dgnu99 -DPACKAGE_VERSION=3D\"1.0\" $(CPPFLAGS)
>=20
>  PERLPROGS =3D mkpfi ubicrc32.pl

Thanks!

Reiner, please, check this.

--=20
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
