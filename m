Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdlXB-0001HW-79
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 17:02:38 +0000
Message-ID: <4FD4D326.1010205@linutronix.de>
Date: Sun, 10 Jun 2012 19:02:30 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
In-Reply-To: <20120610135812.01dce4e7@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/10/2012 12:58 PM, Shmulik Ladkani wrote:
> The code responsible for reading the version of the mirror bbt was
> incorrectly using the descriptor of the main bbt.
>
> Pass the mirror bbt descriptor to 'scan_read_raw' when reading the
> version of the mirror bbt.
>
> Signed-off-by: Shmulik Ladkani<shmulik.ladkani@gmail.com>
> ---
> - Spotted while reviewing BBT code.
> - Introduced by 7cba7b1 [mtd: nand: add support for BBT without OOB].
> - Looks like a typo.
> - Not runtime tested.
> - Sebastian, care to take a look and Ack?

Looks good.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 30d1319..c126469 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -390,7 +390,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
>   	/* Read the mirror version, if available */
>   	if (md&&  (md->options&  NAND_BBT_VERSION)) {
>   		scan_read_raw(mtd, buf, (loff_t)md->pages[0]<<  this->page_shift,
> -			      mtd->writesize, td);
> +			      mtd->writesize, md);
>   		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
>   		pr_info("Bad block table at page %d, version 0x%02X\n",
>   			 md->pages[0], md->version[0]);

Sebastian
