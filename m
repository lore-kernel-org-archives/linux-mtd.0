Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayZiG-0008Ri-83
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 06:58:12 +0000
Date: Fri, 6 May 2016 08:57:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] mtd: nand: qcom: fixup whitespace
Message-ID: <20160506085749.52fac980@bbrezillon>
In-Reply-To: <1462477128-105528-1-git-send-email-computersforpeace@gmail.com>
References: <1462477128-105528-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Thu,  5 May 2016 12:38:48 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Should be using tabs instead of spaces.

Since I had to rebase to fix the circular dependency problem, I squashed
the changes into "mtd: nand: qcom: switch to mtd_ooblayout_ops".

Thanks,

Boris

> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Sorry for the resend, I missed linux-mtd the first time...
> 
>  drivers/mtd/nand/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index acd47c1b9c6b..de7d28e62d4e 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1711,7 +1711,7 @@ static void qcom_nandc_select_chip(struct mtd_info *mtd, int chipnr)
>   * the sum of the three).
>   */
>  static int qcom_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
> -                                   struct mtd_oob_region *oobregion)
> +				   struct mtd_oob_region *oobregion)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
