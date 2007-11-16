Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1It1yg-0000TH-5q
	for linux-mtd@lists.infradead.org; Fri, 16 Nov 2007 09:15:32 -0500
Date: Fri, 16 Nov 2007 15:10:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Andre Haupt <andre@bitwigglers.org>
Subject: Re: [PATCH] cfi: make cfi_staa_erase_varsize static to shut up sparse
Message-ID: <20071116141015.GB17372@lazybastard.org>
References: <11952197951426-git-send-email-andre@bitwigglers.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11952197951426-git-send-email-andre@bitwigglers.org>
Cc: joern@wh.fh-wedel.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 November 2007 14:29:55 +0100, Andre Haupt wrote:
> 
> should this be static?

Looks like it.

> From: Andre Haupt <andre@bitwigglers.org>
> Signed-off-by: Andre Haupt <andre@bitwigglers.org>
Acked-by: Joern Engel <joern@logfs.org>
> ---
>  drivers/mtd/chips/cfi_cmdset_0020.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
> index b344ff8..07a3dd4 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0020.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0020.c
> @@ -893,7 +893,7 @@ retry:
>  	return ret;
>  }
>  
> -int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
> +static int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
>  {	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	unsigned long adr, len;
> -- 
> 1.4.4.4
> 

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
