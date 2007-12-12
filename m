Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2S3k-0005Pl-UD
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 13:55:43 +0000
Subject: Re: Limited support of NAND features in MTD.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 12 Dec 2007 15:54:39 +0200
Message-Id: <1197467679.25999.17.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-12-12 at 11:51 +0000, Alexey Korolev wrote:
> It is not a secret that current MTD supports very limited set of NAND
> features. Some of missed features like partial page read or cached read
> are able to improve file system performance and its implementation do
> not require s/w redesign.=20
>=20
> I have a question is there any limitations/restrictions to support extend=
ed features?=20

I do not think so. And it depends on the feature.

For example, partial flash read should not be a problem. If the driver
is asked to read only the first half of the NAND page, and it is capable
of partial page read, it reads only half the page. But nand_base.c would
need to be improved for this.

> Does it make sense to implement these features and manage them
> through nand_chip->options flag, letting people to choose whether to use
> features or not? If it is not a good idea what is the best way to manage
> it?

It again depends on the feature. These partial reads should be
transparent I think.

In general, it is worth trying hard not to introduce new interfaces. And
I think nand_chip structure should be accessed only by NAND
infrastructure.

> Currently my clooeague and I did prototypes of partial page read and cach=
ed read=20
> functionalities showing performance increase. For example partial page re=
ad showed about 20%
> of file open/stat time performance increase in JFFS2 on LP NAND. Cached
> read increases overall read performance but value strongly depends on
> platform IO latencies. Now we are thinking to create and sent patches.

Sounds interesting.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
