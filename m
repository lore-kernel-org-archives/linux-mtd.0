Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IKY5K-0003Ms-NY
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 12:27:48 +0100
Date: Mon, 13 Aug 2007 05:47:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Surya Prabhakar N <surya.prabhakar@wipro.com>
Subject: Re: [KJ-resend]replacing kmalloc with kzalloc in
	drivers/mtd/chips/cfi_probe.c
In-Reply-To: <1186998573.29518.6.camel@bluegenie>
Message-ID: <Pine.LNX.4.64.0708130545510.19318@localhost.localdomain>
References: <1186998573.29518.6.camel@bluegenie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Aug 2007, Surya Prabhakar N wrote:

>
> Hi,
>    Replacing kmalloc with kzalloc and cleaning up memset in
> drivers/mtd/chips/cfi_probe.c. Kindly ignore the previous similar patch.
>
> Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
> ---
>
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index 60e11a0..efb51f7 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -203,14 +203,12 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>  	if (!num_erase_regions)
>  		return 0;
>
> -	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
> +	cfi->cfiq = kzalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
>  	if (!cfi->cfiq) {
>  		printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
>  		return 0;
>  	}
>
> -	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
> -
>  	cfi->cfi_mode = CFI_MODE_CFI;

but that change is not precisely equivalent, it now clears more than
the original code.  as long as that's not a problem.

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
