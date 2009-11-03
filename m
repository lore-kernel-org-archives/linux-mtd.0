Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5D4B-0006pt-0O
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 06:40:35 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	nA36eK5R008975
	for <linux-mtd@lists.infradead.org>; Tue, 3 Nov 2009 08:40:28 +0200
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 08:40:22 +0200
Message-Id: <1257230422.21596.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-03 at 14:15 +0300, Mika Korhonen wrote:
> Add module parameter "parts" to omap2-onenand driver. Parameter format is
> the same as for cmdlinepart except mtd-id must not be specified - it
> gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*
> 
> This allows one to repartition the OneNAND chip and is useful for flashing
> applications that do the partitioning from scratch or want to backup and
> update the partitioning.
> 
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> ---
>  drivers/mtd/cmdlinepart.c   |   35 +++++++++++++++++++++++++++++------
>  drivers/mtd/onenand/omap2.c |   29 +++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 6 deletions(-)

This should not be onenand module parameters actually. This
re-partitioning should be done via an mtd device ioctl instead.

Could you try to introduce a new mtd ioctl?

I know the partitioning in mtd is ugly, so you may hit some challenges.
E.g., all these special cases like

#ifdef CONFIG_MTD_PARTITIONS
        /* Deregister partitions */
        del_mtd_partitions (mtd);
#endif
        /* Deregister the device */
        del_mtd_device (mtd);

make no sense and should die. We should always have partitioning support
instead. So the mtdpart module should also die and partitioning support
should become part of mtdcore.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
