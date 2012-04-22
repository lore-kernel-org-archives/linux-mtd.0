Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLpBU-0001tr-LB
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 05:18:05 +0000
Received: by lagy4 with SMTP id y4so9456165lag.36
 for <linux-mtd@lists.infradead.org>; Sat, 21 Apr 2012 22:17:59 -0700 (PDT)
Message-ID: <1335071724.28267.5.camel@brekeke>
Subject: Re: [PATCH] mtd : print out the page size and oob size after
 parsing out the nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Sun, 22 Apr 2012 08:15:24 +0300
In-Reply-To: <1333942897-7392-1-git-send-email-b32955@freescale.com>
References: <1333942897-7392-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2012-04-09 at 11:41 +0800, Huang Shijie wrote:
>  	pr_info("NAND device: Manufacturer ID:"
> -		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
> -		nand_manuf_ids[maf_idx].name,
> -		chip->onfi_version ? chip->onfi_params.model : type->name);
> +		" 0x%02x, Chip ID: 0x%02x (%s %s), pagesize: %d, oobsize: %d\n",
> +		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
> +		chip->onfi_version ? chip->onfi_params.model : type->name,
> +		mtd->writesize, mtd->oobsize);

I've amended this to print "page size" and "OOB size" instead, because
this is a bit more user-friendly, and pushed to l2-mtd.git, thanks.

-- 
Best Regards,
Artem Bityutskiy
