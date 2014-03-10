Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WN0sf-0007Gg-Nb
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 14:08:38 +0000
Date: Mon, 10 Mar 2014 11:08:01 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 3/4] mtd: devices: elm: configure parallel channels
 based on ecc_steps
Message-ID: <20140310140801.GE5994@arch.cereza>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
 <1394197344-9468-4-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394197344-9468-4-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, avinashphilipk@gmail.com,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 07, Pekon Gupta wrote:
> Though ELM hardware can process upto maximum of 8 channels in parallel for
> ECC error detection. But actual number of channels need to be processed in
> parallel depends on ecc_steps (for page mode configuration).
>
 
This commit log needs some love ;) How about something along these lines:

"ELM hardware can process up to ERR_VECTOR_MAX channels in parallel for
ECC error detection. However, the actual number of channels that need to
be processed is the ECC step number." ?

Perhaps you could add some more information (I'm not too familiar with ELM),
what's the impact of this change? Does it fix any bug or the over-looping
was harmless?

> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/devices/elm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index f59c100..43fd81d 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
> @@ -174,7 +174,7 @@ static void elm_load_syndrome(struct elm_info *info,
>  	int i, offset;
>  	u32 val;
>  
> -	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
> +	for (i = 0; i < info->ecc_steps; i++) {

I think it would be less confusing if you can add the ecc_steps field on this
patch, where you start to use it.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
