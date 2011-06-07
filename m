Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QTsaR-0005Wr-5b
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 09:28:35 +0000
Date: Tue, 7 Jun 2011 11:28:29 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] MTD mtdchar: add missing initializer on raw write
In-Reply-To: <1307374082.3112.78.camel@localhost>
Message-ID: <Pine.LNX.4.64.1106071125260.8642@lnxricardw.se.axis.com>
References: <alpine.LSU.2.00.1106061541210.26001@redbean.intranet.gw-instruments.de>
	<1307374082.3112.78.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Peter Wippich <pewi@gw-instruments.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 6 Jun 2011, Artem Bityutskiy wrote:

> On Mon, 2011-06-06 at 15:50 +0200, Peter Wippich wrote:
> On writes in MODE_RAW the mtd_oob_ops struct is not sufficiently=20
> initialized which may cause nandwrite to fail. With this patch
> it is possible to write raw nand/oob data without additional ECC
> (either for testing or when some sectors need different oob layout
> e.g. bootloader) like
> nandwrite  -n -r -o  /dev/mtd0 <myfile>
>=20
> Signed-off-by: Peter Wippich <pewi@gw-instruments.de>

Looks good, thanks. We also need to add this patch to the stable tree.

Ricard, does it solve the issue you reported here

http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html

Yes, it does, it seems to work beautifully. The error messages I reported=
=20
in the post are gone, nandwrite reports success, and the resulting data in=
=20
the flash appears to be ok. Thanks Peter for finding the root cause and=20
the elegantly trivial patch.

Tested-by: Ricard Wanderlof <ricardw@axis.com>

/Ricard

>=20
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 3f92731..797a34a 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -321,6 +321,7 @@ static ssize_t mtd_write(struct file *file, const cha=
r __user *buf, size_t count
>                          ops.datbuf =3D kbuf;
>                          ops.oobbuf =3D NULL;
>                          ops.len =3D len;
> +                       ops.ooboffs =3D 0;
>
>                          ret =3D mtd->write_oob(mtd, *ppos, &ops);
>                          retlen =3D ops.retlen;
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
