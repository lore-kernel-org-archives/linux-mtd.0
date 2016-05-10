Received: from mail-db3on0129.outbound.protection.outlook.com
 ([157.55.234.129] helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b08yW-00086h-N2
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 14:49:32 +0000
From: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: "CN, Aananth (A.A.)" <caananth@visteon.com>, "Gunasundar, Balamanikandan
 (B.)" <bgunasun@visteon.com>, "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "gnanachandran@gmail.com"
 <gnanachandran@gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
Date: Tue, 10 May 2016 14:49:03 +0000
Message-ID: <20160510145836.GA18568@visteon-gnana>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
In-Reply-To: <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79053268A1EAB946A057EF75FFAFDCCB@eurprd06.prod.outlook.com>
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

On Tue, May 10, 2016 at 03:58:58PM +0200, Richard Weinberger wrote:
> On Tue, May 10, 2016 at 2:14 PM, DHANAPAL, GNANACHANDRAN (G.)
> <gdhanapa@visteon.com> wrote:
> > Hi There,
> >
> > We have i.MX6d based platform that has FSL BSP 3.10.17 running.
> > There is SLC Micron NAND of size 2GB with 512K Block size and 4K min I/=
O  used
> > for software storage. This NAND has got 7 partitions, Among that two pa=
rtitions
> > have Read-Write ubifs file system for runtime data and one has Read-onl=
y ubifs
> > file system that has all the system files. Recently we have observed a =
issue that
> > one of RW ubifs partition failed to mount due to invalid key type in on=
e of index
> > node in ubifs. we have seen the same issue in two units out of 1000 uni=
ts running
> > in the field.
> >
> > Following is the index node that has  invalid key in its first branch.
> > key type =3D 0xa917dd4c >> 29 =3D 5 (invalid key)
> >
> >         magic          0x6101831
> >         crc            0x944add59
> >         node_type      9 (indexing node)
> >         group_type     0 (no node group)
> >         sqnum          378678
> >         len            148
> >         child_cnt      6
> >         level          2
> >         Branches:
> >         0: LEB 569:280144 len 108 key (bad key type: 0x000001, 0xa917dd=
4c)
> >         1: LEB 446:349792 len 108 key (5595, inode)
> >         2: LEB 584:361528 len 108 key (5822, inode)
> >         3: LEB 602:255360 len 108 key (6050, inode)
> >         4: LEB 613:480280 len 188 key (6258, inode)
> >         5: LEB 614:373784 len 88 key (6521, data, 25)
> >
> > Please help us to understand following points
> >
> >         1. Did this happen because abrupt power cut ? if so, how could =
CRC of the node still be intact?
> >         2. Could there be any bit flip ? but still again CRC intact.
> >         3. Would the key pointed by  corrupted branch be  UBIFS_DENT_KE=
Y or  UBIFS_XENT_KEY ?
> >                 Because  29 bit of key[0] (0xa917dd4c  & 0x1FFFFFFF) se=
ems to have some kind of  hash value.
> >                 but node (at leb 569:280144)  that is pointed by corrup=
ted branch seem to be index node.
> >         4. This corrupted entry is always seen  in first branch of an i=
ndex node  in two failed units. Could there be reason?
> >         5. Since CRC is intact, would there be any possibility or scena=
rio that corrupted node can be written with valid CRC?
>=20
> Hmm, this looks like some UBIFS inconsistency.
> If the header CRC is correct it should be be any kind of bitflip or
> power cut issue.
>=20
> Can you please share the whole UBI image (a nanddump) such that I can
> inspect it?
>=20
> --=20
> Thanks,
> //richard

Thanks for the reply, Richard.=20
Please find two files in google drive share.

	1. dump_mtd7_ecc.log   - /dev/mtd7 dump with ecc
	2. leb_peb_map_22706.log   - LEB to PEB map. This information is taken by =
having print in table.

Share:
	https://drive.google.com/open?id=3D0B7tYZDLZ_KAZMFd4MENlQkJuNjA

Cheers
Gnana
