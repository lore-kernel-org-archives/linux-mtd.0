Received: from smtp-sh2.infomaniak.ch ([128.65.195.6])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1co7hw-0000NR-3O
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 12:07:14 +0000
Subject: Re: Timeout in denali.c on Micron nandflash (Altera SoC)
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <58BEB65B.3050003@idquantique.com>
 <CAFLxGvy=PHU1Yc74TgQ-S9+Q_jRnYEUVywzYqbhdmQRGHk_vJA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "laurent.monat@idquantique.com" <laurent.monat@idquantique.com>
From: Thorsten Christiansson <thorsten.christiansson@idquantique.com>
Message-ID: <58C92E56.90207@idquantique.com>
Date: Wed, 15 Mar 2017 13:06:46 +0100
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy=PHU1Yc74TgQ-S9+Q_jRnYEUVywzYqbhdmQRGHk_vJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Follow-up:

> > I'm using Linux on an Altera SoC (Arria V), on which I'm using UBIFS
on a
> > nandflash from Micron (MT29F8G08ADADAH4).  I have a 400Mb r/w
partition on
> > which I have a sqlite3-based database. We're running an application t=
hat
> > reads/writes fairly small blocks. After running for about a week at
moderate
> > load, I get an error message, and the filesystem becomes read-only.
> >
> > The message I get is a timeout, originating in the denali.c driver.
> > [11744.733748] timeout occurred, status =3D 0x0, mask =3D 0x4
> > [11745.733685] timeout occurred, status =3D 0x0, mask =3D 0x120

> Well, 4.4. is not very fresh. Maybe it saw fixes in recent version.
> Can you please give MTD tests a try?

I have now got a clean 4.10 up and running, and the MTD tests show the
same error even quicker:
# insmod /lib/modules/4.10.0/kernel/drivers/mtd/tests/mtd_stresstest.ko
dev=3D1
[  488.721072]
[  488.722575] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  488.728337] mtd_stresstest: MTD device: 1
[  488.732342] mtd_stresstest: MTD device size 536870912, eraseblock
size 131072, page size 2048, count of eraseblocks 4096, pages per
eraseblock 64, OOB size 64
[  488.748845] mtd_test: scanning for bad eraseblocks
[  488.756947] mtd_test: scanned 4096 eraseblocks, 0 are bad
[  488.762322] mtd_stresstest: doing operations
[  488.766601] mtd_stresstest: 0 operations done
[  490.243583] timeout occurred, status =3D 0x4, mask =3D 0x3
[  492.003933] timeout occurred, status =3D 0x4, mask =3D 0x3
[  493.363590] timeout occurred, status =3D 0x4, mask =3D 0x3
[  494.483584] timeout occurred, status =3D 0x4, mask =3D 0x3
[  495.603585] timeout occurred, status =3D 0x4, mask =3D 0x3
[  496.723582] timeout occurred, status =3D 0x4, mask =3D 0x3
[  498.083600] timeout occurred, status =3D 0x4, mask =3D 0x3
[  499.203582] timeout occurred, status =3D 0x4, mask =3D 0x3
[  500.323921] timeout occurred, status =3D 0x4, mask =3D 0x3
[  501.523590] timeout occurred, status =3D 0x4, mask =3D 0x3
[  502.723584] timeout occurred, status =3D 0x4, mask =3D 0x3
[  503.843583] timeout occurred, status =3D 0x4, mask =3D 0x3
[  505.203584] timeout occurred, status =3D 0x4, mask =3D 0x3
^C[  506.883588] timeout occurred, status =3D 0x4, mask =3D 0x3
[  506.913867] mtd_stresstest: aborting test due to pending signal!
[  506.919940] mtd_stresstest: error -4 occurred
[  506.924320] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Any ideas on how to go forwards from here are very welcome.


regards,
Thorsten Christiansson
Security Engineer
ID Quantique
thorsten.christiansson@idquantique.com
<mailto:thorsten.christiansson@idquantique.com>
Tel: +41 22 301 8373 Fax: +41 22 301 8379

<https://www.linkedin.com/company/id-quantique-sa>
