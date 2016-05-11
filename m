Received: from mail-db5eur01on0096.outbound.protection.outlook.com
 ([104.47.2.96] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0OaF-0006kD-JX
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 07:29:29 +0000
From: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
To: Richard Weinberger <richard@nod.at>
CC: "CN, Aananth (A.A.)" <caananth@visteon.com>, "Gunasundar, Balamanikandan
 (B.)" <bgunasun@visteon.com>, "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "gnanachandran@gmail.com"
 <gnanachandran@gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
Date: Wed, 11 May 2016 07:29:04 +0000
Message-ID: <20160511073836.GA22640@visteon-gnana>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana>
In-Reply-To: <20160511065223.GA22220@visteon-gnana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F41371CDEA976B4D8E67D9A9014F9C7F@eurprd06.prod.outlook.com>
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

On Wed, May 11, 2016 at 12:22:23PM +0530, Gnanachandran Dhanapal wrote:
> On Tue, May 10, 2016 at 06:48:24PM +0200, Richard Weinberger wrote:
> > Am 10.05.2016 um 16:49 schrieb DHANAPAL, GNANACHANDRAN (G.):
> > > Thanks for the reply, Richard.=20
> > > Please find two files in google drive share.
> > >=20
> > > 	1. dump_mtd7_ecc.log   - /dev/mtd7 dump with ecc
> > > 	2. leb_peb_map_22706.log   - LEB to PEB map. This information is tak=
en by having print in table.
> > >=20
> > > Share:
> > > 	https://drive.google.com/open?id=3D0B7tYZDLZ_KAZMFd4MENlQkJuNjA
> >=20
> > Hmm, the share contains only log files.
> > I need a pristine dump of your NAND (created by nanddump without OOB da=
ta) to analyze the issue.
> >=20
> > Thanks,
> > //richard
>=20
> Sorry Richard, The file name or its extension "dump_mtd7_ecc.log" might b=
e confusing. but actually this file was created using=20
> command "nanddump /dev/mtd7 -f dump_mtd7_ecc.log". This file of size 510M=
B.
>=20
> dump_mtd7_ecc.log MD5SUM 	=3D 5b04c52f992036047d426fa07691429e
> 		  SHA256SUM 	=3D 28a36d3fc28c18adc29be66525c1a28e68143937ec43be425ee942=
d3375c17a6
>=20
> Please let me know if you have any issue accessing the file.
>=20
> Cheers
> Gnana

Copying CC list=
