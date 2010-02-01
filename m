Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nbqzl-0005BP-M2
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 07:46:57 +0000
Date: Mon, 1 Feb 2010 08:46:44 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 03/17] blktrans: track open and close calls.
In-Reply-To: <1264863768-27606-4-git-send-email-maximlevitsky@gmail.com>
Message-ID: <Pine.LNX.4.64.1002010845040.13031@lnxricardw.se.axis.com>
References: <1264863768-27606-1-git-send-email-maximlevitsky@gmail.com>
	<1264863768-27606-4-git-send-email-maximlevitsky@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 30 Jan 2010, Maxim Levitsky wrote:

> This patch adds tracking for open and close calls.
> Now trans ->open and ->release are never called twise in a row
> ->release is also called once before mtd device disappers
> ...

> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -128,6 +128,9 @@ static int blktrans_open(struct block_device *bdev, f=
mode_t mode)
> =09if (!get_mtd_device(NULL, dev->mtd->index))
> =09=09goto out;
>
> +=09if (dev->open++)
> +=09=09goto out;
> +
> =09if (!try_module_get(tr->owner))
> =09=09goto out_tr;
>
> @@ -153,6 +156,10 @@ static int blktrans_release(struct gendisk *disk, fm=
ode_t mode)
> =09struct mtd_blktrans_ops *tr =3D dev->tr;
> =09int ret =3D 0;
>
> +=09dev->open--;
> +=09if (dev->open)
> +=09=09return 0;
> +

Just a very minor quibble: if you use if (dev->open++) in one function,=20
why not use if (--dev->open) in the other? Or separate the=20
increment/decrement from the test, depending on you style preferences.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
