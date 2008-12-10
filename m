Received: from mail3.raymarine.com ([213.206.137.1]
	helo=RMUKMAIL.raymarine.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAPHf-0002bn-Hu
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 13:39:25 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Mounting UBIFS fails intermittently
Date: Wed, 10 Dec 2008 13:39:19 -0000
Message-ID: <B8993E4AF7E2B44A80FE742A85665EF00ADA1D74@rmukmail.raymarine.com>
References: <B8993E4AF7E2B44A80FE742A85665EF00ADA1BF3@rmukmail.raymarine.com>
	<1228913998.13686.275.camel@sauron>
	<B8993E4AF7E2B44A80FE742A85665EF00ADA1D73@rmukmail.raymarine.com>
	<1228915942.13686.282.camel@sauron>
From: "Manish Jain" <Manish.Jain@raymarine.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can you please suggest any alternate to ubiformat, I would like to try =
that out.

Kind Regards,
Manish

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: 10 December 2008 13:32
To: Manish Jain
Cc: linux-mtd@lists.infradead.org
Subject: RE: Mounting UBIFS fails intermittently

On Wed, 2008-12-10 at 13:12 +0000, Manish Jain wrote:
> Thanks Artem.
>=20
> I'll try tests for case 1.
>=20
> With respect to case2:
>=20
> Within our flash, we have two partitions. And there is singe image of =
flash contents(namely er.ubi).
> We flash our file image using ubiformat command.:
>=20
> Ubiformat /dev/mtd5 -y -s 512 -f /CFCard/er.ubi

well, providing your sub-page size is really 512 bytes, this should be
doing the right things. Although I do not utilize ubiformat myself, so I
am not 100% sure it does not have bugs which may lead to what you see.

--=20
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
