Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZnS-0001ae-6R
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 07:36:55 +0000
Received: by fxm14 with SMTP id 14so1131282fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 00:36:51 -0700 (PDT)
Subject: Re: [PATCH 14/43] mtd: physmap.c: use mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-15-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
	<1307549152-7085-15-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 10:32:32 +0300
Message-ID: <1307604752.7374.34.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
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

On Wed, 2011-06-08 at 20:05 +0400, Dmitry Eremin-Solenikov wrote:
> -	if (physmap_data->nr_parts) {
> -		printk(KERN_NOTICE "Using physmap partition information\n");
> -		mtd_device_register(info->cmtd, physmap_data->parts,
> -				    physmap_data->nr_parts);
> -		return 0;
> -	}
> -
> -	mtd_device_register(info->cmtd, NULL, 0);
> -
> +	mtd_device_parse_register(info->cmtd, part_probe_types, 0,
> +			physmap_data->parts, physmap_data->nr_parts);

Same here.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
