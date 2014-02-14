Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEGGn-0005HV-KH
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 10:45:22 +0000
Date: Fri, 14 Feb 2014 11:44:53 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH 1/2] mtd/ts5500: Add dependency
Message-ID: <20140214114453.4e8aa74c@endymion.delvare>
In-Reply-To: <1392373926.783869053@f323.i.mail.ru>
References: <20140214112824.27b98f1d@endymion.delvare>
 <1392373926.783869053@f323.i.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Fri, 14 Feb 2014 14:32:06 +0400, Alexander Shiyan wrote:
> =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0, 14 =D1=84=D0=B5=D0=B2=D1=80=
=D0=B0=D0=BB=D1=8F 2014, 11:28 +01:00 =D0=BE=D1=82 Jean Delvare <jdelvare@s=
use.de>:
> > There is no point in displaying the TS5500-specific driver entries if
> > TS5500 board support itself isn't enabled.
> >=20
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> > ---
> > drivers/mtd/maps/Kconfig |    2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > --- linux-3.14-rc2.orig/drivers/mtd/maps/Kconfig	2014-02-14 11:21:15.11=
6363700
> > +0100
> > +++ linux-3.14-rc2/drivers/mtd/maps/Kconfig	2014-02-14 11:23:53.2868633=
74
> > +0100
> > @@ -124,7 +124,7 @@ config MTD_NETSC520
> >=20
> > config MTD_TS5500
> > tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
> > -	depends on X86
> > +	depends on TS5500 || (X86 && COMPILE_TEST)
>=20
> TS5500 && (X86 || COMPILE_TEST) ?

Hmm, no. The way I wrote it is correct I believe. TS5500 itself depends
on X86. The driver is only needed on TS5500, but can be test-built in
any X86 kernel if needed.

--=20
Jean Delvare
Suse L3 Support
