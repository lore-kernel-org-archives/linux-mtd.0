Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPHo-0007mB-Rg
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 11:36:16 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?5q2m5LqVIOWFi+aYjg==?= <takei744@oki.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Questions about ubifs,ubi and mtd?
Date: Thu, 13 Dec 2018 12:35:58 +0100
Message-ID: <1818742.2b902yA6mZ@blindfold>
In-Reply-To: <TY2PR01MB2700C1902D91862C39D966E79DA00@TY2PR01MB2700.jpnprd01.prod.outlook.com>
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <3417318.kOS8JojacP@blindfold>
 <TY2PR01MB2700C1902D91862C39D966E79DA00@TY2PR01MB2700.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Katsuaki Takei,

Am Donnerstag, 13. Dezember 2018, 11:45:36 CET schrieb =E6=AD=A6=E4=BA=95 =
=E5=85=8B=E6=98=8E:
> Dear Richard,
>=20
> We appreciate your precious advice.
> We understood the quality status of kernel 3.2.26.
> From now on, we would like to backport from the latest UBI and UBIFS.
> Do you think that it is enough to backport the next part?
>  - drivers/mtd
>  - drivers/mtd/ubi
>  - fs/ubifs

Under the assumption that the root of the problem is the MTD/UBI stack,
your problem should go away.

Thanks,
//richard
