Received: from mail-he1eur01on0130.outbound.protection.outlook.com
 ([104.47.0.130] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1FYa-0005mt-0Z
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 16:03:16 +0000
From: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
To: Richard Weinberger <richard@nod.at>
CC: "CN, Aananth (A.A.)" <caananth@visteon.com>, "Gunasundar, Balamanikandan
 (B.)" <bgunasun@visteon.com>, "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "gnanachandran@gmail.com"
 <gnanachandran@gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
Date: Fri, 13 May 2016 16:02:51 +0000
Message-ID: <20160513161226.GA9073@visteon-gnana>
References: <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at> <20160511112630.GB22640@visteon-gnana>
 <573345F4.9070203@nod.at> <57348554.6010805@nod.at>
 <20160513095004.GA6195@visteon-gnana> <5735DC82.2010309@nod.at>
In-Reply-To: <5735DC82.2010309@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1F325D0D7450246B45FBC6CC9DAB778@eurprd06.prod.outlook.com>
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

On Fri, May 13, 2016 at 03:54:10PM +0200, Richard Weinberger wrote:
> Am 13.05.2016 um 11:40 schrieb DHANAPAL, GNANACHANDRAN (G.):
> > Richard,
> >=20
> > I believe CRC value for a node  is calculated in RAM before writing the=
 node in NAND.=20
> > In this case, node CRC and calculated CRC are matching. so Will there b=
e possibility=20
> > for corrupting key type area (32 bits) and keeping others intacted. or =
any other=20
> > possibility for node getting corrupted.
>=20
> I have to correct myself, the branches of an index node are covered by
> the node header CRC.
> This makes the whole picture more strange.
>=20
> You said you're facing the same issue on another unit.
> Is the corruption really the same? Bad key type 5?
>=20
> Thanks,
> //richard

Yes Richard, We have received two more units for exactly same issues and sa=
me bad key type 5.

Cheers
Gnana=
