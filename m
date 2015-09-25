Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfOoQ-0005Ds-9A
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 08:57:02 +0000
Date: Fri, 25 Sep 2015 10:56:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)" <karlzhang@micron.com>
Cc: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>, Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "shuangshuo@gmail.com"
 <shuangshuo@gmail.com>, "rnd4@dave-tech.it" <rnd4@dave-tech.it>, "Jeff
 Lauruhn (jlauruhn)" <jlauruhn@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Stefan Roese <sr@denx.de>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150925105616.3afa23d1@bbrezillon>
In-Reply-To: <D067BF0533BDBE4F821CF557AAAE78443B96DEA8@NTXXIAMBX01.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CAA8@NTXXIAMBX02.xacn.micron.com>
 <20150925093023.113ceeb1@bbrezillon>
 <D067BF0533BDBE4F821CF557AAAE78443B96DEA8@NTXXIAMBX01.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 Sep 2015 08:30:23 +0000
Karl Zhang =E5=BC=A0=E5=8F=8C=E9=94=A3 (karlzhang) <karlzhang@micron.com> w=
rote:

> Hi Boris
>=20
> Something else suggestions.=20
>=20
> We know that using the OOB area to store UBI metadata(Backup data) is not=
 a good idea, this is just a thinking, and also do a little work to impleme=
nt it and verification .
>=20
> For paired page issue from MLC is troublesome, we are trying our best to =
deal with it. Although attempt to use some bad ideas.
>=20
> > > Only NAND provides an OOB area.=20
> Some devices(NOR) do not have OOB, simultaneously, they do not have paire=
d page issue, right?  I think they do not need to store a redundant metadat=
a to anywhere.
> AFAIK , only MLC(TLC maybe) NAND need store some metadata for another cop=
y, and try to protected it by ECC.
>=20
> But, if OOB have some unused area (at least 48 bytes) and the chip has pa=
ired page issue , could we take a little advantage of them  to reduce UBI f=
ail rate?=20
>=20
> Above, is just some thinking , wish we can have some better solutions.=20
> As Bean said, most customer do not want UBIFS crash, and so do we.
>=20
> Thanks to your patient to point out my wrong opinion.

Don't be sorry, and there's no wrong opinion: the whole point of this
discussion is sharing our ideas and arguing to find the best solution.

Regarding the use of extra OOB bytes, I'll follow Richard's opinion:
let's keep it as a 'last resort' solution if we fail to find an
acceptable alternative.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
