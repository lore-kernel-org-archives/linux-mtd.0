Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URddq-0002in-QM
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 07:15:55 +0000
Message-ID: <516BAA36.9030500@intel.com>
Date: Mon, 15 Apr 2013 10:20:22 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Namjae Jeon <linkinjeon@gmail.com>
Subject: Re: [PATCH 2/8] mmc: fix max_discard_sectors
References: <1365860309-21261-1-git-send-email-linkinjeon@gmail.com>
In-Reply-To: <1365860309-21261-1-git-send-email-linkinjeon@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: axboe@kernel.dk, nbd-general@lists.sourceforge.net,
 Vivek Trivedi <t.vivek@samsung.com>, npiggin@kernel.dk, neilb@suse.de,
 dwmw2@infradead.org, Paul.Clements@steeleye.com, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org, cjb@laptop.org,
 shli@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/04/13 16:38, Namjae Jeon wrote:
> From: Namjae Jeon <namjae.jeon@samsung.com>
> 
> https://lkml.org/lkml/2013/4/1/292
> As per above discussion, there is possibility that request's __data_len
> field may overflow when max_discard_sectors greater than UINT_MAX >> 9
> 
> If multiple discard requests get merged, merged discard request's
> size exceeds 4GB, there is possibility that merged discard request's
> __data_len field may overflow.
> 
> This patch fixes this issue.
> 
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>
> Signed-off-by: Vivek Trivedi <t.vivek@samsung.com>
> Tested-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  drivers/mmc/card/queue.c |    2 +-
>  drivers/mmc/core/core.c  |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/card/queue.c b/drivers/mmc/card/queue.c
> index 9447a0e..54726b7 100644
> --- a/drivers/mmc/card/queue.c
> +++ b/drivers/mmc/card/queue.c
> @@ -166,7 +166,7 @@ static void mmc_queue_setup_discard(struct request_queue *q,
>  		return;
>  
>  	queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, q);
> -	q->limits.max_discard_sectors = max_discard;
> +	blk_queue_max_discard_sectors(q, max_discard);
>  	if (card->erased_byte == 0 && !mmc_can_discard(card))
>  		q->limits.discard_zeroes_data = 1;
>  	q->limits.discard_granularity = card->pref_erase << 9;
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 7b435a3..6ee530c 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2058,7 +2058,7 @@ static unsigned int mmc_do_calc_max_discard(struct mmc_card *card,
>  	if (card->erase_shift)
>  		max_qty = UINT_MAX >> card->erase_shift;
>  	else if (mmc_card_sd(card))
> -		max_qty = UINT_MAX;
> +		max_qty = UINT_MAX >> 9;

No.  This function calculates max discard for the card not the block layer.
 Apply the block layer limitation at the block layer interface e.g.
in mmc_queue_setup_discard()

>  	else
>  		max_qty = UINT_MAX / card->erase_size;
>  
> @@ -2100,7 +2100,7 @@ unsigned int mmc_calc_max_discard(struct mmc_card *card)
>  	unsigned int max_discard, max_trim;
>  
>  	if (!host->max_discard_to)
> -		return UINT_MAX;
> +		return UINT_MAX >> 9;

Ditto.

>  
>  	/*
>  	 * Without erase_group_def set, MMC erase timeout depends on clock
> 
