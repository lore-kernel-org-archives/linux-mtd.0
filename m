Received: from [2a01:238:20a:202:5305::1] (helo=mo6-p05-ob.rzone.de)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn2IV-0000Va-Vt
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 06:46:30 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] [RFC] mtd: m25p80: Make fast read configurable via DT
Date: Fri, 6 Jul 2012 08:43:44 +0200
References: <1341555027-17462-1-git-send-email-marex@denx.de>
 <1341555027-17462-3-git-send-email-marex@denx.de>
In-Reply-To: <1341555027-17462-3-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201207060843.45073.sr@denx.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Friday 06 July 2012 08:10:27 Marek Vasut wrote:
> @@ -914,6 +912,14 @@ static int __devinit m25p_probe(struct spi_device
> *spi) flash->page_size = info->page_size;
>  	flash->mtd.writebufsize = flash->page_size;
> 
> +	flash->fast_read = false;
> +	if (np && of_find_property(np, "m25p,fast-read", NULL))
> +		flash->fast_read = true;
> +
> +#ifdef CONFIG_M25PXX_USE_FAST_READ
> +	flash->fast_read = true;
> +#endif
> +

Better use of_property_read_bool() instead of of_find_property() here.

Thanks,
Stefan
