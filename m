Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOhaP-0006WP-7u
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 10:14:55 +0000
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
To: Greg Cook <greg@morpheus.ws>, <ezequiel.garcia@free-electrons.com>,
 <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@free-electrons.com>
References: <20171212083826.5000-1-greg@morpheus.ws>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <ad6f5d27-fdcd-1356-9f5d-5b5185979b04@prevas.dk>
Date: Tue, 12 Dec 2017 11:14:28 +0100
MIME-Version: 1.0
In-Reply-To: <20171212083826.5000-1-greg@morpheus.ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg
> Signed-off-by: Greg Cook <greg@morpheus.ws>
Tested-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
>   drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 021374f..cfa8c71 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>   
>   static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>   {
> -	if (info->ecc_bch) {
> +	if (info->use_ecc && info->ecc_bch) {
>   		u32 val;
>   		int ret;
>   
> @@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
>   
>   		if (info->cur_chunk < info->nfullchunks) {
>   			info->step_chunk_size = info->chunk_size;
> -			info->step_spare_size = info->spare_size;
> +			if (info->use_ecc) {
> +				info->step_spare_size = info->spare_size;
> +			} else {
> +				info->step_spare_size = info->spare_size
> +							+ info->ecc_size;
> +			}
>   		} else {
>   			info->step_chunk_size = info->last_chunk_size;
>   			info->step_spare_size = info->last_spare_size;
Please change the subject to something shorter like:
mtd: nand: pxa3xx: fix READOOB when hardware FIFO is not drained completely
Fix potential bug for non-ECC operations.

/Sean
