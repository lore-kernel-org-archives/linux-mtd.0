Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUV1j-0002Fx-HG
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:17:12 +0000
Received: by mail-pa0-f52.google.com with SMTP id kq14so774109pab.39
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:16:50 -0700 (PDT)
Date: Wed, 17 Sep 2014 23:16:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47xxpart: find NVRAM partitions in middle
 blocks
Message-ID: <20140918061646.GG7362@norris-Latitude-E6410>
References: <1408004566-22271-1-git-send-email-zajec5@gmail.com>
 <1408386027-12120-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408386027-12120-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 18, 2014 at 08:20:27PM +0200, Rafał Miłecki wrote:
> Old devices used to have NVRAM at the very end of flash and they could
> be unaligned (starting at some offset in a block).
> In new devices NVRAM can be located quite randomly, however it seems to
> always start at the beginning of a block. For example Netgear R6250 has
> NVRAM located right after the bootloader, before the kernel partition.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> V2: Ignore last block to avoid having two "nvram" partitions.

Tweaked the multi-line comment style and pushed to l2-mtd.git. Thanks!

> ---
>  drivers/mtd/bcm47xxpart.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 035690e..da641ac 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -224,6 +224,16 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  			continue;
>  		}
>  
> +		/* New (ARM?) devices may have NVRAM in some middle block. Last
> +		 * block will be checked later, so skip it.
> +		 */
> +		if (offset != master->size - blocksize &&
> +		    buf[0x000 / 4] == NVRAM_HEADER) {
> +			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
> +					     offset, 0);
> +			continue;
> +		}
> +
>  		/* Read middle of the block */
>  		if (mtd_read(master, offset + 0x8000, 0x4,
>  			     &bytes_read, (uint8_t *)buf) < 0) {

Brian
