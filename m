Subject: Re: [patch] mtd: silence compile warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20100322115819.GA21571@bicker>
References: <20100322115819.GA21571@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:14:51 +0300
Message-ID: <1270714491.6754.99.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-03-22 at 15:02 +0300, Dan Carpenter wrote:
> This gets rid of a compile warning:
> drivers/mtd/maps/dmv182.c:120: warning: format ‘%d’ expects type 
> 	‘int’, but argument 2 has type ‘uint64_t’
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/mtd/maps/dmv182.c b/drivers/mtd/maps/dmv182.c
> index d171674..680ba2d 100644
> --- a/drivers/mtd/maps/dmv182.c
> +++ b/drivers/mtd/maps/dmv182.c
> @@ -116,7 +116,7 @@ static int __init init_svme182(void)
>  		return -ENXIO;
>  	}
>  
> -	printk(KERN_NOTICE "SVME182 flash device: %dMiB at 0x%08x\n",
> +	printk(KERN_NOTICE "SVME182 flash device: %lldMiB at 0x%08x\n",
>  		   this_mtd->size >> 20, FLASH_BASE_ADDR);

%lld is also wrong for uint64_t, I think on PPC it'll result in a
warning. Instead, I'd use %llu and then a cast:

(unsigned long long)(this_mtd->size >> 20)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
