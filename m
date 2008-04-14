Received: from e31.co.us.ibm.com ([32.97.110.149])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlR2F-0000Ay-GF
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 15:55:59 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m3EFqPLK002133
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2008 11:52:25 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m3EFqOwk178902
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2008 09:52:24 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m3EFqNp4021035
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2008 09:52:23 -0600
Date: Mon, 14 Apr 2008 10:49:25 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] mtd/chips/cfi_cmdset_0020.c: make a function static
Message-ID: <20080414104925.5416d07c@zod.rchland.ibm.com>
In-Reply-To: <20080414142030.GT6695@cs181133002.pp.htv.fi>
References: <20080414142030.GT6695@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 14 Apr 2008 17:20:30 +0300
Adrian Bunk <bunk@kernel.org> wrote:

> This patch makes the needlessly global cfi_staa_erase_varsize() static.
> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>

Acked-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>

> 
> ---
> 071e1e3116928c1625f475a0fba2f96ee897a95c diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
> index 492e2ab..356939b 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0020.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0020.c
> @@ -893,7 +893,8 @@ retry:
>  	return ret;
>  }
> 
> -int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
> +static int cfi_staa_erase_varsize(struct mtd_info *mtd,
> +				  struct erase_info *instr)
>  {	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	unsigned long adr, len;
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
