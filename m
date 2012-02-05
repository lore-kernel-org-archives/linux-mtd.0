Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtxXX-0002br-8t
 for linux-mtd@lists.infradead.org; Sun, 05 Feb 2012 08:33:39 +0000
Received: by wico1 with SMTP id o1so4326712wic.36
 for <linux-mtd@lists.infradead.org>; Sun, 05 Feb 2012 00:33:33 -0800 (PST)
Date: Sun, 5 Feb 2012 10:33:21 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 4/4] mtd: remove R/O checking duplication
Message-ID: <20120205103321.0a7e2e1c@pixies.home.jungo.com>
In-Reply-To: <1328288491-8744-4-git-send-email-dedekind1@gmail.com>
References: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
 <1328288491-8744-4-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri,  3 Feb 2012 19:01:31 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 13bd4fa..78e1df6 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -754,7 +756,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>  	      const u_char *buf)
>  {
>  	*retlen = 0;
> -	if (!mtd->_write)
> +	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
>  		return -EROFS;
>  	if (to < 0 || to > mtd->size || len > mtd->size - to)
>  		return -EINVAL;

(sorry for nit-picking)

Here you perform "writable" (EROFS) validation prior offset/length
validation (EINVAL) - however in other API funtions you had it
vice-versa.
Really not that important, but better if handling is consistent.

Regards,
Shmulik
