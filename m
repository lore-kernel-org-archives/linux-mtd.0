Received: from mail-db5eur01on0108.outbound.protection.outlook.com
 ([104.47.2.108] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkQEp-0000GW-Ju
 for linux-mtd@lists.infradead.org; Thu, 15 Sep 2016 06:33:37 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: UBIFS - strange behaviour after enabling chk_index
Date: Thu, 15 Sep 2016 06:33:07 +0000
Message-ID: <AM4PR0701MB21307808BDB62C97DB81DCD3FEF00@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <AM4PR0701MB213063EE7BE9DDE08ADAB177FEF10@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <adef444f-b333-4b2c-49d1-1bc08697a587@nod.at>
In-Reply-To: <adef444f-b333-4b2c-49d1-1bc08697a587@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richad,

> -----Original Message-----
> From: Richard Weinberger [mailto:richard@nod.at]
> Sent: Wednesday, September 14, 2016 11:39 PM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> Subject: Re: UBIFS - strange behaviour after enabling chk_index
>=20
> Marcin,
>=20
> On 14.09.2016 10:28, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
> > (Plain text now)
> >
> > Hi Richard, list
> >
> > During some power-cut tests I accidently came across strange case.
> > The test script is here (I could attach it this in thread later).
> >
> > http://pastebin.com/daNrf6yG
> >
> > Result of running this on HW and Qemu is the same, and it ends like bel=
ow
> (logs from Qemu).
> >
> > It does not reproduce if I use flash with 256KiB sectors (both Qemu
> > and HW), or do not enable index integrity checks.
> > Could it be real life case?
>=20
> Is this the SPI-NOR device you talked about on IRC?
Yes.

> Maybe the check is broken, maybe it uncovers a hard to hit issue on your
> flash. Both could be.
>=20
> Do you emulate exactly the same device in qemu?
Yes, this part of HW is virtualized in Qemu, in fact the same SW build runs=
 on Qemu and HW.
Since it reproduce on both it allows to think that this is SW related (at l=
east for now),
but sure does not mean that this is UBI/UBIFS.

Back to problem, it seem that this could be a debug facility issue, since f=
ile system and data
are not corrupted. If data on flash are correct (I have done many test and =
all passed,
so currently I assume that drier is working properly), it could be that dat=
a in debug structure
in this case are somehow outdated/bad (d->old_zroot).
In test script, if I copy the same file twice (instead of three times) the =
problem does not
reproduce.=20
I will try to debug this more, maybe you have any inside where to look?

Thanks,
Marcin
>=20
> Thanks,
> //richard
