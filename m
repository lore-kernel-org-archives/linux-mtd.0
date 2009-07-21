Received: from dakia2.marvell.com ([65.219.4.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTNnX-0004y4-J9
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 22:27:04 +0000
Date: Tue, 21 Jul 2009 18:26:50 -0400 (EDT)
From: Nicolas Pitre <nico@marvell.com>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] register orion_nand using platform_driver_probe
In-Reply-To: <1248209196-15705-1-git-send-email-u.kleine-koenig@pengutronix.de>
Message-ID: <alpine.LFD.2.00.0907211822330.30629@xanadu.home>
References: <alpine.LFD.2.00.0907141211260.3138@xanadu.home>
	<1248209196-15705-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463811582-1355685401-1248215215=:30629"
Cc: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lennert Buijtenhek <buytenh@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811582-1355685401-1248215215=:30629
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Jul 2009, Uwe Kleine-König wrote:

> orion_nand_probe lives in .init.text, so using platform_driver_register
> to register it is wrong because binding a device after the init memory
> is discarded (e.g. via sysfs) results in an oops.
> 
> As requested by Nicolas Pitre platform_driver_probe is used instead of
> moving the probe function to .devinit.text as proposed initially.
> This saves some memory, but devices registered after the driver is
> probed are not bound (probably there are none) and binding via sysfs
> isn't possible.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: Lennert Buytenhek <buytenh@marvell.com>
> Cc: Saeed Bishara <saeed@marvell.com>
> Cc: Jörn Engel <joern@logfs.org>
> Cc: Nicolas Pitre <nico@marvell.com>
> Cc: Tzachi Perelstein <tzachi@marvell.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org

Acked-by: Nicolas Pitre <nico@marvell.com>

Thanks.  BTW Tzachi's email address is no longer valid.

> ---
>  drivers/mtd/nand/orion_nand.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 7ad9722..cb9d13b 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -171,7 +171,6 @@ static int __devexit orion_nand_remove(struct platform_device *pdev)
>  }
>  
>  static struct platform_driver orion_nand_driver = {
> -	.probe		= orion_nand_probe,
>  	.remove		= __devexit_p(orion_nand_remove),
>  	.driver		= {
>  		.name	= "orion_nand",
> @@ -181,7 +180,7 @@ static struct platform_driver orion_nand_driver = {
>  
>  static int __init orion_nand_init(void)
>  {
> -	return platform_driver_register(&orion_nand_driver);
> +	return platform_driver_probe(&orion_nand_driver, orion_nand_probe);
>  }
>  
>  static void __exit orion_nand_exit(void)
> -- 
> tg: (4b0a840..) t/platsection/orion_nand_driver (depends on: linus/master)
> 
---1463811582-1355685401-1248215215=:30629--
