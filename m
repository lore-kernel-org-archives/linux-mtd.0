Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFJOS-00013p-LZ
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 06:40:53 +0000
Received: by wibhn17 with SMTP id hn17so2070707wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 23:40:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1348294351-27182-1-git-send-email-sachin.kamat@linaro.org>
References: <1348294351-27182-1-git-send-email-sachin.kamat@linaro.org>
Date: Sat, 22 Sep 2012 15:40:45 +0900
Message-ID: <CAH9JG2W4jVxrTQVwoLrnMmypcHhM5mfciyK=tvGmi+8i_L78vQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: Make flexonenand_set_boundary static
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/22/12, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Fixes the following sparse warning:
> drivers/mtd/onenand/onenand_base.c:3697:5: warning:
> symbol 'flexonenand_set_boundary' was not declared. Should it be static?
>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/onenand/onenand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> index 7153e0d..b3f41f2 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -3694,7 +3694,7 @@ static int flexonenand_check_blocks_erased(struct
> mtd_info *mtd, int start, int
>   * flexonenand_set_boundary	- Writes the SLC boundary
>   * @param mtd			- mtd info structure
>   */
> -int flexonenand_set_boundary(struct mtd_info *mtd, int die,
> +static int flexonenand_set_boundary(struct mtd_info *mtd, int die,
>  				    int boundary, int lock)
>  {
>  	struct onenand_chip *this = mtd->priv;
> --
> 1.7.4.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
