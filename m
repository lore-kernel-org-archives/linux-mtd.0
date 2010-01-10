Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTuv4-0005A2-39
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 10:21:18 +0000
Received: by fg-out-1718.google.com with SMTP id e12so1599182fga.0
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 02:21:12 -0800 (PST)
Subject: Re: [PATCH 2/6] mtd: Use get_mtd_device_nm() to find named device
	in get_sb_mtd()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1262704813.2837.7.camel@achroite.uk.solarflarecom.com>
References: <1262704813.2837.7.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 12:21:09 +0200
Message-Id: <1263118869.7315.149.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-05 at 15:20 +0000, Ben Hutchings wrote:
> This removes the need to know the number of MTD devices.
> 
> Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
> ---
>  drivers/mtd/mtdsuper.c |   18 ++++++------------
>  1 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
> index af8b42e..d257052 100644
> --- a/drivers/mtd/mtdsuper.c
> +++ b/drivers/mtd/mtdsuper.c
> @@ -150,18 +150,12 @@ int get_sb_mtd(struct file_system_type *fs_type, int flags,
>  			DEBUG(1, "MTDSB: mtd:%%s, name \"%s\"\n",
>  			      dev_name + 4);
>  
> -			for (mtdnr = 0; mtdnr < MAX_MTD_DEVICES; mtdnr++) {
> -				mtd = get_mtd_device(NULL, mtdnr);
> -				if (!IS_ERR(mtd)) {
> -					if (!strcmp(mtd->name, dev_name + 4))
> -						return get_sb_mtd_aux(
> -							fs_type, flags,
> -							dev_name, data, mtd,
> -							fill_super, mnt);
> -
> -					put_mtd_device(mtd);
> -				}
> -			}
> +			mtd = get_mtd_device_nm(dev_name + 4);
> +			if (!IS_ERR(mtd))
> +				return get_sb_mtd_aux(
> +					fs_type, flags,
> +					dev_name, data, mtd,
> +					fill_super, mnt);

Since now your indentation level is less, you could de-uglify the
'get_sb_mtd_aux()' as well, while you are on it. But this is minor.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
