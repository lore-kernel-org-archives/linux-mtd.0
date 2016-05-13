Received: from mail-db3on0115.outbound.protection.outlook.com
 ([157.55.234.115] helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b19aa-0006Of-DU
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 09:40:57 +0000
From: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
To: Richard Weinberger <richard@nod.at>
CC: "CN, Aananth (A.A.)" <caananth@visteon.com>, "Gunasundar, Balamanikandan
 (B.)" <bgunasun@visteon.com>, "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "gnanachandran@gmail.com"
 <gnanachandran@gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
Date: Fri, 13 May 2016 09:40:30 +0000
Message-ID: <20160513095004.GA6195@visteon-gnana>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at> <20160511112630.GB22640@visteon-gnana>
 <573345F4.9070203@nod.at> <57348554.6010805@nod.at>
In-Reply-To: <57348554.6010805@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <604B452DDC864E49B28931D6443CDAAF@eurprd06.prod.outlook.com>
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

On Thu, May 12, 2016 at 03:29:56PM +0200, Richard Weinberger wrote:
> Am 11.05.2016 um 16:47 schrieb Richard Weinberger:
> > Am 11.05.2016 um 13:16 schrieb DHANAPAL, GNANACHANDRAN (G.):
> >> On Wed, May 11, 2016 at 11:22:15AM +0200, Richard Weinberger wrote:
> >>> I had a brief look, the provided dump has more problems.
> >>> The dent node with the bad type is not referenced by the journal,
> >>> so we can ignore it for now.
> >>> The worse problem is that the index references a lot of non-existing
> >>> inodes.
> >=20
> > BTW: Do both MTD tests and UBI tests pass?
>=20
> Gave your issue another thought.
> It is possible that you're facing bitflips in UBIFS meta data
> which is not covered by the header CRC.
> At least this would explain the corruption pattern you're facing.
>=20
> Thanks,
> //richard

Richard,

I believe CRC value for a node  is calculated in RAM before writing the nod=
e in NAND.=20
In this case, node CRC and calculated CRC are matching. so Will there be po=
ssibility=20
for corrupting key type area (32 bits) and keeping others intacted. or any =
other=20
possibility for node getting corrupted.

This system is configured for 16 bit ecc strength including 10 bytes metada=
ta in DATA0.=20
This NAND has 4K i/o Size and 224 OOB size.=20

Cheers
Gnana
