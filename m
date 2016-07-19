Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPXCs-0005Zx-CQ
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 15:45:15 +0000
Subject: Re: [PATCH 1/2] mtd: nand: BUG_ON in case of no select_chip and
 cmd_ctrl
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <578E4AF0.7090507@nod.at>
Date: Tue, 19 Jul 2016 17:44:48 +0200
MIME-Version: 1.0
In-Reply-To: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.07.2016 um 17:41 schrieb Andrey Smirnov:
> If no user specified chip->select_chip() function is provided, code in
> nand_base.c will automatically set this hook to nand_select_chip(),
> which in turn depends on chip->cmd_ctrl() hook being valid. Not
> providing both of those functions in NAND controller driver (for example
> by mistake) will result in a bit cryptic segfault. Replace it with
> explicit BUG_ON statement so it would be obvious what went wrong.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ce7b2ca..57043a6 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3128,8 +3128,10 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>  	if (chip->waitfunc == NULL)
>  		chip->waitfunc = nand_wait;
>  
> -	if (!chip->select_chip)
> +	if (!chip->select_chip) {
> +		BUG_ON(!chip->cmd_ctrl);

Please don't add new BUG_ON() calls. WARN_ON() is good enough to raise the driver developer's
attention and won't kill the machine.

Thanks,
//richard
