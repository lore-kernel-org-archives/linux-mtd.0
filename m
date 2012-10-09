MIME-Version: 1.0
Sender: viresh.linux@gmail.com
In-Reply-To: <c30a9228d4bff7dbedd5d011f84c79c324736452.1349778820.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <c30a9228d4bff7dbedd5d011f84c79c324736452.1349778820.git.vipin.kumar@st.com>
Date: Tue, 9 Oct 2012 22:44:40 +0530
Message-ID: <CAOh2x=neFZcdK16_3wHRPHURWDVgfyv2UvX44bSb0hLmvMjHqA@mail.gmail.com>
Subject: Re: [PATCH 01/11] fsmc/nand:FIX: Change the type for regs to void
 __iomem *
From: viresh kumar <viresh.kumar@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 4:14 PM, Vipin Kumar <vipin.kumar@st.com> wrote:
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
> ---
>  drivers/mtd/nand/fsmc_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 38d2624..e96d7d1 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -361,7 +361,7 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>         struct nand_chip *this = mtd->priv;
>         struct fsmc_nand_data *host = container_of(mtd,
>                                         struct fsmc_nand_data, mtd);
> -       void *__iomem *regs = host->regs_va;
> +       void __iomem *regs = host->regs_va;

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
