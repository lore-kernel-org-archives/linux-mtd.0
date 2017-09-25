Received: from mail-cys01nam02on061d.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::61d]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwOOR-0008Ew-Ix
 for linux-mtd@lists.infradead.org; Mon, 25 Sep 2017 08:05:34 +0000
From: Mathias Thore <Mathias.Thore@infinera.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: Regression for NOR flash with multiple erase block regions
Date: Mon, 25 Sep 2017 08:05:03 +0000
Message-ID: <f00b3228ec334c1baaff72c6dec25728@sv-ex13-prd1.infinera.com>
References: <4762f230bbd3437990b9f5baa61ab095@sv-ex13-prd1.infinera.com>
 <74af973f5ae542c3b53240c95949628c@svr-chch-ex1.atlnz.lc>
 <20170922220455.04f89f08@bbrezillon>
 <a1416ffa136946f4bc6006324315ffb1@sv-ex13-prd1.infinera.com>
 <20170925093004.0e0af91e@bbrezillon>
In-Reply-To: <20170925093004.0e0af91e@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: den 25 september 2017 09:30
>=20
> On Mon, 25 Sep 2017 06:28:18 +0000
> Mathias Thore <Mathias.Thore@infinera.com> wrote:
>=20
> > > From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> > > Sent: den 22 september 2017 22:05
> > >
> > > On Fri, 22 Sep 2017 18:27:42 +0000
> > > Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> > >
> > > > Hi Mathias,
> > > >
> > > > On 23/09/17 01:12, Mathias Thore wrote:
> > > > > Hello,
> > > > >
> > > > > Commit 1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 included in
> > > > > Linux
> > > 4.13 (
> > > > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c
> > > ommit/d
> > >
> rivers/mtd/mtdpart.c?h=3Dv4.13&id=3D1eeef2d7483a7e3f8d2dd2a5b9939b3b814
> > > dc549
> > > > > ) introduces a regression for NOR flash with multiple erase
> > > > > block regions of different sizes.
> > > > >
> > > > > Only the largest erase block size seems to be considered when
> > > > > determining if partitions are aligned. Partitions in smaller
> > > > > regions will be mounted as read-only. With Linux 4.12 and
> > > > > earlier, read/write access was available for these partitions.
> > >
> > > I don't understand how this could work before this patch? I mean, we
> > > were previously using mtd_mod_by_eb() to check part alignment and
> > > this functions is just returning the remainder of the off /
> > > erasesize division. So, assuming the erasesize of your NOR did not
> > > change between 4.12 and 4.13, I don't see how this commit could
> > > cause the regression you're describing here.
> >
> > Looking at the earlier code, in the call to mtd_mod_by_eb, the paramete=
r
> is slave->mtd. The slave mtd struct holds the correct erase size. The new
> code uses wr_alignment for all alignment tests, which comes from
> master/parent, and seems to always hold the largest possible erase size.
>=20
> Oh indeed! I didn't notice that the initial mtd_mod_by_eb() test was done
> against the slave dev and not the master one.
>=20
> Can you test the following patch and let me know it it solves your proble=
m?

The patch does not compile in my 4.13 tree. However,

	if (!(slave->mtd.flags & MTD_NO_ERASE))
		wr_alignment =3D slave->mtd.erasesize;
or
	if (!(master->flags & MTD_NO_ERASE))
		wr_alignment =3D slave->mtd.erasesize;

do, and both work equally well to solve my problem.

>=20
> --->8---
> From cdc8a5078ee330a645d1076a8289b411cffc4257 Mon Sep 17 00:00:00
> 2001
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> Date: Mon, 25 Sep 2017 09:14:00 +0200
> Subject: [PATCH] mtd: Fix partition alignment check on multi-erasesize
> devices
>=20
> Commit 1eeef2d7483a ("mtd: handle partitioning on devices with 0
> erasesize") introduced a regression on heterogeneous erase region devices=
.
> Alignment of the partition was tested against the master eraseblock size
> which can be bigger than the slave one, thus leading to some partitions b=
eing
> marked as read-only.
>=20
> Update wr_alignment to match this slave erasesize after this erasesize ha=
s
> been determined by picking the biggest erasesize of all the regions
> embedded in the MTD partition.
>=20
> Reported-by: Mathias Thore <Mathias.Thore@infinera.com>
> Fixes: 1eeef2d7483a ("mtd: handle partitioning on devices with 0 erasesiz=
e")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/mtdpart.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c index
> 5736b0c90b33..8802185b7729 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -581,6 +581,14 @@ static struct mtd_part *allocate_partition(struct
> mtd_info *parent,
>  		slave->mtd.erasesize =3D parent->erasesize;
>  	}
>=20
> +	/*
> +	 * Slave erasesize might differ from the master one if the
> master
> +	 * exposes several regions with different erasesize. Adjust
> +	 * wr_alignment accordingly.
> +	 */
> +	if (!(slave->flags & MTD_NO_ERASE))
> +		wr_alignment =3D slave->erasesize;
> +
>  	tmp =3D slave->offset;
>  	remainder =3D do_div(tmp, wr_alignment);
>  	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
