Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbT9l-0002Ri-MS
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 07:56:28 +0000
Received: by pzk28 with SMTP id 28so3772692pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 00:56:21 -0700 (PDT)
Subject: Re: [PATCH 2/6] nand_wait : warn if the nand is busy on exit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Tue, 28 Jun 2011 10:57:12 +0300
In-Reply-To: <1309105616-3609-2-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-2-git-send-email-matthieu.castet@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309247836.23597.42.camel@sauron>
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

On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
> This patch allow to detect buggy driver/hardware with
> bad RnB (dev_ready) management.
> This check cost nothing and could help to detect bugs.
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
>  drivers/mtd/nand/nand_base.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a3c7fd3..095dfea 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -885,6 +885,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  	led_trigger_event(nand_led_trigger, LED_OFF);
>  
>  	status = (int)chip->read_byte(mtd);
> +	/* This can happen if in case of timeout or buggy dev_ready */
> +	WARN_ON(!(status & NAND_STATUS_READY));
>  	return status;

This seem to completely miss the chip->dev_ready != NULL case, e.g.,
piece of code above is like this

                while (time_before(jiffies, timeo)) {
                        if (chip->dev_ready) {
                                if (chip->dev_ready(mtd))
                                        break;
                        } else {
                                if (chip->read_byte(mtd) & NAND_STATUS_READY)
                                        break;
                        }
                        cond_resched();
                }

-- 
Best Regards,
Artem Bityutskiy
