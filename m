Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XD6Xs-0006mT-93
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 06:42:28 +0000
Received: by mail-pa0-f47.google.com with SMTP id kx10so5176586pab.6
 for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2014 23:42:07 -0700 (PDT)
Date: Thu, 31 Jul 2014 23:42:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Wu <Aaron.wu@analog.com>
Subject: Re: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded flash
Message-ID: <20140801064202.GE3095@norris-Latitude-E6410>
References: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
Cc: dwmw2@infradead.org, sonic.zhang@analog.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 03, 2014 at 04:13:34PM +0800, Aaron Wu wrote:
> @@ -108,13 +108,24 @@ static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssi
>  {
[...]
> +		memcpy_fromio(to, map->virt + (from % state->win_size)
> +			, this_len);

And one nitpick: please put that stray comma on the previous line.

[...]

Thanks,
Brian
