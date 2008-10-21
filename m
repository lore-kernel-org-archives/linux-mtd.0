Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KsAeQ-0008Lf-1F
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 06:23:30 +0000
Subject: Re: [NAND flash driver] What would mtd do if read returns -EBADMSG
	(ecc failed)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Du Zhongdong <axdududu@gmail.com>
In-Reply-To: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
References: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 21 Oct 2008 09:21:59 +0300
Message-Id: <1224570119.4466.99.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-10-21 at 14:11 +0800, Du Zhongdong wrote:
> Hi,
>=20
> I'm doing a NAND flash driver, and I suppose if ecc cannot be
> corrected while read something from NAND flash, that block should be
> marked bad, is that right?
>=20
> Reading through nand_base.c I notice that mtd->read =3D nand_read;
> nand_read() [MTD Interface] calls nand_do_read_ops() [Internal] to do
> the work,  and in nand_do_read_ops():
>         if (mtd->ecc_stats.failed - stats.failed)
> 		return -EBADMSG;
> -EBADMSG then is returned to the MTD layer. I tried to trace this
> information in the MTD code, but there seems to be so many and I
> cannot be sure how MTD handles this "-EBADMSG".  Any help or
> information is appreciated.

Hi, -EBADMSG means an uncorrectable ECC error. MTD layer user should
treat it like "MTD returned some data, but it is probably corrupted,
because there was an uncorrectable ECC error".

Glance drivers/mtd/ubi/io.c if you are interested about users which
handle this -EBADMSG.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
