Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYGp-0002qE-A7
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 11:47:01 +0000
Received: by fxm14 with SMTP id 14so3459325fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 04:46:56 -0700 (PDT)
Subject: Re: [PATCH 06/32] mtd: rbtx4939-flash don't specify default
	parsing options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-6-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
	<1307351782-7456-6-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 14:42:39 +0300
Message-ID: <1307360559.3112.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 13:15 +0400, Dmitry Eremin-Solenikov wrote:
>  static int rbtx4939_flash_probe(struct platform_device *dev)
>  {
> @@ -107,8 +106,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
>  	info->mtd->owner = THIS_MODULE;
>  	if (err)
>  		goto err_out;
> -
> -	err = parse_mtd_partitions(info->mtd, part_probe_types,
> +	err = parse_mtd_partitions(info->mtd, NULL,
>  				&info->parts, 0);

This can become one-line. I can do this.

>  	if (err > 0) {
>  		mtd_device_register(info->mtd, info->parts, err);


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
