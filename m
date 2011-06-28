Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbT1X-0002NI-Mb
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 07:47:56 +0000
Received: by pwi3 with SMTP id 3so3958334pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 00:47:49 -0700 (PDT)
Subject: Re: [PATCH 1/6] nand_wait_ready timeout fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Tue, 28 Jun 2011 10:48:40 +0300
In-Reply-To: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309247324.23597.37.camel@sauron>
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
> nand_wait_ready timeout should not assume HZ=1000.
> Make it independent of HZ value.
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a46e9bb..a3c7fd3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -512,7 +512,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
>  void nand_wait_ready(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip = mtd->priv;
> -	unsigned long timeo = jiffies + 2;
> +	unsigned long timeo = jiffies + (2 * HZ) / 1000;

I agree that the code is buggy, but your fix is strange: if HZ = 100, (2
* HZ) / 1000 will be zero?

I think you should instead know for how many msecs you want to wait, and
use msecs_to_jiffies().

-- 
Best Regards,
Artem Bityutskiy
