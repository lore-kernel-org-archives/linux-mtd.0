Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NmQno-00041V-Q3
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2010 12:02:21 +0000
Received: by fxm6 with SMTP id 6so202073fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Mar 2010 04:02:13 -0800 (PST)
Subject: Re: [PATCH -next] mtd/nand/r852: fix build for CONFIG_PM=n
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <4B8C378B.2090400@oracle.com>
References: <20100301210210.c6f465e6.sfr@canb.auug.org.au>
	<4B8C378B.2090400@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Mar 2010 14:02:09 +0200
Message-ID: <1267531329.10734.1.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	LKML <linux-kernel@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-03-01 at 13:54 -0800, Randy Dunlap wrote: 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix r852 build for the case of CONFIG_PM=n.
> 
> drivers/mtd/nand/r852.c:1039: error: implicit declaration of function 'pci_prepare_to_sleep'
> drivers/mtd/nand/r852.c:1048: error: implicit declaration of function 'pci_back_from_sleep'
> 
> This patch leaves r852_pm_ops untouched.
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
> Cc: David Woodhouse <dwmw2@infradead.org>
> ---
>  drivers/mtd/nand/r852.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> --- linux-next-20100301.orig/drivers/mtd/nand/r852.c
> +++ linux-next-20100301/drivers/mtd/nand/r852.c
> @@ -1007,6 +1007,7 @@ void r852_shutdown(struct pci_dev *pci_d
>  	pci_disable_device(pci_dev);
>  }
>  
> +#ifdef CONFIG_PM
>  int r852_suspend(struct device *device)
>  {
>  	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
> @@ -1081,6 +1082,10 @@ int r852_resume(struct device *device)
>  	r852_update_card_detect(dev);
>  	return 0;
>  }
> +#else
> +#define r852_suspend	NULL
> +#define r852_resume	NULL
> +#endif
>  
>  static const struct pci_device_id r852_pci_id_tbl[] = {
>  
> 
oops, I forgot about that case again..
Acked-by: Maxim Levitsky <maximlevitsky@gmail.com>

Best regards,
Maxim Levitsky
