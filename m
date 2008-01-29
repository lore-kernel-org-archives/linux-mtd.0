Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JK0eW-0001u5-Vj
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 00:18:15 +0000
Date: Wed, 30 Jan 2008 00:17:43 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] at91_nand: Make part_probes[] static
Message-ID: <20080129231743.GD32157@lazybastard.org>
References: <20080129.222837.126141133.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080129.222837.126141133.anemo@mba.ocn.ne.jp>
Cc: Andrew Victor <andrew@sanpeople.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, Frank Mandarino <fmandarino@endrelia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 January 2008 22:28:37 +0900, Atsushi Nemoto wrote:
> 
> This patch fixes this sparse warning:
> 
> linux/drivers/mtd/nand/at91_nand.c:86:12: warning: symbol 'part_probes' was not declared. Should it be static?

You cannot fix a warning.  You can only fix code.  Warnings can be and
often are wrong.  This particular is right, so in spite of the
description
Acked-by: Joern Engel <joern@logfs.org>

> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> ---
> diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
> index b2a5672..9adbf2a 100644
> --- a/drivers/mtd/nand/at91_nand.c
> +++ b/drivers/mtd/nand/at91_nand.c
> @@ -83,7 +83,7 @@ static void at91_nand_disable(struct at91_nand_host *host)
>  }
>  
>  #ifdef CONFIG_MTD_PARTITIONS
> -const char *part_probes[] = { "cmdlinepart", NULL };
> +static const char *part_probes[] = { "cmdlinepart", NULL };
>  #endif
>  
>  /*
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
Joern's library part 11:
http://www.unicom.com/pw/reply-to-harmful.html
