Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 1968ay-0008UL-AD
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 13:34:28 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'Thayne Harbaugh'" <tharbaugh@lnxi.com>,
	<linux-mtd@lists.infradead.org>
Date: Thu, 17 Apr 2003 08:34:49 -0400
Message-ID: <000601c304dd$bda75710$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <1050513945.1172.265.camel@tubarao>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: device info in /proc/mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Something like this in /proc/mtd might be nice:
>=20
> dev:    size   erasesize  name       manufacturer chip chip_name
> mtd0: 00080000 00001000 "AMD76X rom" 009d         006e "PMC Pm49FL004"
>=20

It'd also be nice to see the value of CFG_MTD_PHYSMAP_START, maybe as
'base'.
