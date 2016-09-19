Received: from mail-he1eur01on0119.outbound.protection.outlook.com
 ([104.47.0.119] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blt7y-0001Vi-18
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 07:36:36 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: UBIFS - strange behaviour after enabling chk_index
Date: Mon, 19 Sep 2016 07:36:05 +0000
Message-ID: <AM4PR0701MB2130290CAF2D6CF42A75A421FEF40@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <AM4PR0701MB213063EE7BE9DDE08ADAB177FEF10@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <adef444f-b333-4b2c-49d1-1bc08697a587@nod.at>
 <AM4PR0701MB21307808BDB62C97DB81DCD3FEF00@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <a381b47f-37ab-674a-b9e1-0ff50b84e065@nod.at>
In-Reply-To: <a381b47f-37ab-674a-b9e1-0ff50b84e065@nod.at>
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

Richard

> -----Original Message-----
> From: Richard Weinberger [mailto:richard@nod.at]
> Sent: Friday, September 16, 2016 5:59 PM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> Subject: Re: UBIFS - strange behaviour after enabling chk_index
>=20
> Marcin,
>=20
> On 15.09.2016 08:33, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
> >> Is this the SPI-NOR device you talked about on IRC?
> > Yes.
>=20
> The one where you're facing issues after a power cut?
Yes, but more information is available now.
It is possible to reproduce missing master node case on 256KiB and 64KiB fl=
ash.
Also no need to power cut - eg. Watchdog reset can trigger it.
>=20
> >> Maybe the check is broken, maybe it uncovers a hard to hit issue on
> >> your flash. Both could be.
> >>
> >> Do you emulate exactly the same device in qemu?
> > Yes, this part of HW is virtualized in Qemu, in fact the same SW build =
runs
> on Qemu and HW.
> > Since it reproduce on both it allows to think that this is SW related
> > (at least for now), but sure does not mean that this is UBI/UBIFS.
> >
> > Back to problem, it seem that this could be a debug facility issue,
> > since file system and data are not corrupted. If data on flash are
> > correct (I have done many test and all passed, so currently I assume
> > that drier is working properly), it could be that data in debug structu=
re in
> this case are somehow outdated/bad (d->old_zroot).
> > In test script, if I copy the same file twice (instead of three times)
> > the problem does not reproduce.
> > I will try to debug this more, maybe you have any inside where to look?
>=20
> I think chk_index exposes the power cut issue you told me on IRC.
> For whatever reason the index corrupts on your flash. And chk_index
> catches this very early.
In this case it is the UBIFS debug facility issue. Zroot is moving on flash=
,
but debug information is not updated - and at some point I am enabling debu=
gs.
That simple change can fix this:

@@ -575,7 +594,7 @@ int dbg_check_old_index(struct ubifs_info *c, struct ub=
ifs_zbranch *zroot)
        size_t sz;
=20
        if (!dbg_is_chk_index(c))
-               return 0;
+               return dbg_old_index_check_init(c, zroot);
=20
        INIT_LIST_HEAD(&list);

Obviously adding another read in commit is bad idea so it is feauture...

>=20
> Maybe there is an issue in the SPI-NOR code or UBI itself has trouble wit=
h
> your flash (layout).
>=20
It could be, it seem that it is easier to reproduce if UBIFS is placed on a=
lmost all flash area.

Thanks,
Marcin
> Thanks,
> //richard
