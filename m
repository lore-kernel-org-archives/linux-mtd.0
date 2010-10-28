Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE009.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PBHJD-000329-TI
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2010 01:29:40 +0000
Received: from mail107-va3 (localhost.localdomain [127.0.0.1])	by
	mail107-va3-R.bigfish.com (Postfix) with ESMTP id 3BCB38E8201	for
	<linux-mtd@lists.infradead.org>; Thu, 28 Oct 2010 01:29:37 +0000 (UTC)
Received: from VA3EHSMHS017.bigfish.com (unknown [10.7.14.244])	by
	mail107-va3.bigfish.com (Postfix) with ESMTP id C3EDC177004C	for
	<linux-mtd@lists.infradead.org>; Thu, 28 Oct 2010 01:29:36 +0000 (UTC)
Received: from az33smr02.freescale.net (az33smr02.freescale.net
	[10.64.34.200])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o9S1TY5U028202	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2010 18:29:34 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	o9S1TY67010998	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2010 20:29:34 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Content-Class: urn:content-classes:message
Subject: RE: [PATCH 1/1] MTD: Fix wrong check register_blkdev return value
Date: Wed, 27 Oct 2010 18:30:01 -0700
Message-ID: <09EC74FE2C9E8444BF2FF67BD36E1D69CBB6@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <1288062139-2192-1-git-send-email-Frank.Li@freescale.com>
References: <1288062139-2192-1-git-send-email-Frank.Li@freescale.com>
From: Li Frank-B20596 <B20596@freescale.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Why no one review my patch? That's fix a bug when major is zero at mtd
blktrans layer.

> -----Original Message-----
> From: Li Frank-B20596
> Sent: Tuesday, October 26, 2010 11:02 AM
> To: linux-mtd@lists.infradead.org
> Cc: Li Frank-B20596
> Subject: [PATCH 1/1] MTD: Fix wrong check register_blkdev return value
>=20
> register_blkdev return 1..255 when major =3D 0.
>=20
> if (ret ) {
> 	printk(KERN_WARNING "Unable to register %s block device on
> major %d: %d\n",
> 		tr->name, tr->major, ret);
> 	      mutex_unlock(&mtd_table_mutex);
> 	return ret;
> }
>=20
> Above code will return fail when register_blkdev return allocated
major
> number.
>=20
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> ---
>  drivers/mtd/mtd_blkdevs.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index a919587..63790e9 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -502,13 +502,16 @@ int register_mtd_blktrans(struct
mtd_blktrans_ops
> *tr)
>  	mutex_lock(&mtd_table_mutex);
>=20
>  	ret =3D register_blkdev(tr->major, tr->name);
> -	if (ret) {
> +	if (ret < 0) {
>  		printk(KERN_WARNING "Unable to register %s block device
on
> major %d: %d\n",
>  		       tr->name, tr->major, ret);
>  		mutex_unlock(&mtd_table_mutex);
>  		return ret;
>  	}
>=20
> +	if (ret)
> +		tr->major =3D ret;
> +
>  	tr->blkshift =3D ffs(tr->blksize) - 1;
>=20
>  	INIT_LIST_HEAD(&tr->devs);
> --
> 1.7.1
