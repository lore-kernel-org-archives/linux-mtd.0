Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4DPQ-0007Id-FA
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 12:18:11 +0000
Message-ID: <4A0ABA24.7080801@nokia.com>
Date: Wed, 13 May 2009 15:16:36 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH] mtd_dataflash: unbreak erase support
References: <1242216722-7262-1-git-send-email-jacmet@sunsite.dk>
In-Reply-To: <1242216722-7262-1-git-send-email-jacmet@sunsite.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>,
	"stable@kernel.org" <stable@kernel.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Peter Korsgaard wrote:
> Commit 5b7f3a50 (fix dataflash 64-bit divisions) unfortunately
> introduced a typo. Erase addr and len were swapped in the pageaddr
> calculation, causing the wrong sectors to get erased.
> 
> Please consider for 2.6.29-stable as well.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  drivers/mtd/devices/mtd_dataflash.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index 62dee54..43976aa 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -178,7 +178,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		/* Calculate flash page address; use block erase (for speed) if
>  		 * we're at a block boundary and need to erase the whole block.
>  		 */
> -		pageaddr = div_u64(instr->len, priv->page_size);
> +		pageaddr = div_u64(instr->addr, priv->page_size);
>  		do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
>  		pageaddr = pageaddr << priv->page_offset;

Oh, sorry for that.

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
