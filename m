MIME-Version: 1.0
In-Reply-To: <1287742484-4276-4-git-send-email-leiwen@marvell.com>
References: <1287742484-4276-1-git-send-email-leiwen@marvell.com>
	<1287742484-4276-4-git-send-email-leiwen@marvell.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sun, 13 Feb 2011 17:47:41 +0800
Message-ID: <AANLkTimAaNcr1mq52RtCH6263M=L8AHFKwOBnBefBCQb@mail.gmail.com>
Subject: Re: [PATCH V3 3/6] pxa3xx_nand: discard wait_for_event, write_cmd,
	__readid function
To: Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, adrian.wenl@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 22, 2010 at 6:14 PM, Lei Wen <leiwen@marvell.com> wrote:
> Since we have rework the irq process, we don't need additional
> delay in wait_for_event. Also write_cmd and __readid is also
> discarded for the same reason.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Ack.

> ---
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 77 +-----------------------=
----------------
> =C2=A01 files changed, 1 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index dc24000..a7f623f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -258,25 +258,6 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nan=
d_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR1CS0, ndtr1);
> =C2=A0}
>
> -#define WAIT_EVENT_TIMEOUT =C2=A0 =C2=A0 10
> -
> -static int wait_for_event(struct pxa3xx_nand_info *info, uint32_t event)
> -{
> - =C2=A0 =C2=A0 =C2=A0 int timeout =3D WAIT_EVENT_TIMEOUT;
> - =C2=A0 =C2=A0 =C2=A0 uint32_t ndsr;
> -
> - =C2=A0 =C2=A0 =C2=A0 while (timeout--) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndsr =3D nand_readl(in=
fo, NDSR) & NDSR_MASK;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ndsr & event) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 nand_writel(info, NDSR, ndsr);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udelay(10);
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 return -ETIMEDOUT;
> -}
> -
> =C2=A0static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int oob_enable =3D info->reg_ndcr & NDCR_SPARE=
_EN;
> @@ -414,35 +395,6 @@ static void disable_int(struct pxa3xx_nand_info *inf=
o, uint32_t int_mask)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDCR, ndcr | int_mask);
> =C2=A0}
>
> -/* NOTE: it is a must to set ND_RUN firstly, then write command buffer
> - * otherwise, it does not work
> - */
> -static int write_cmd(struct pxa3xx_nand_info *info)
> -{
> - =C2=A0 =C2=A0 =C2=A0 uint32_t ndcr;
> -
> - =C2=A0 =C2=A0 =C2=A0 /* clear status bits and run */
> - =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDSR, NDSR_MASK);
> -
> - =C2=A0 =C2=A0 =C2=A0 ndcr =3D info->reg_ndcr;
> -
> - =C2=A0 =C2=A0 =C2=A0 ndcr |=3D info->use_ecc ? NDCR_ECC_EN : 0;
> - =C2=A0 =C2=A0 =C2=A0 ndcr |=3D info->use_dma ? NDCR_DMA_EN : 0;
> - =C2=A0 =C2=A0 =C2=A0 ndcr |=3D NDCR_ND_RUN;
> -
> - =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDCR, ndcr);
> -
> - =C2=A0 =C2=A0 =C2=A0 if (wait_for_event(info, NDSR_WRCMDREQ)) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "timed=
 out writing command\n");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ETIMEDOUT;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDCB0, info->ndcb0);
> - =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDCB0, info->ndcb1);
> - =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDCB0, info->ndcb2);
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
> -
> =C2=A0static void handle_data_pio(struct pxa3xx_nand_info *info)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (info->state) {
> @@ -789,33 +741,6 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info *=
mtd,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> -static int __readid(struct pxa3xx_nand_info *info, uint32_t *id)
> -{
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D info->=
cmdset;
> - =C2=A0 =C2=A0 =C2=A0 uint32_t ndcr;
> - =C2=A0 =C2=A0 =C2=A0 uint8_t =C2=A0id_buff[8];
> -
> - =C2=A0 =C2=A0 =C2=A0 prepare_other_cmd(info, cmdset->read_id);
> -
> - =C2=A0 =C2=A0 =C2=A0 /* Send command */
> - =C2=A0 =C2=A0 =C2=A0 if (write_cmd(info))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_timeout;
> -
> - =C2=A0 =C2=A0 =C2=A0 /* Wait for CMDDM(command done successfully) */
> - =C2=A0 =C2=A0 =C2=A0 if (wait_for_event(info, NDSR_RDDREQ))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_timeout;
> -
> - =C2=A0 =C2=A0 =C2=A0 __raw_readsl(info->mmio_base + NDDB, id_buff, 2);
> - =C2=A0 =C2=A0 =C2=A0 *id =3D id_buff[0] | (id_buff[1] << 8);
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -
> -fail_timeout:
> - =C2=A0 =C2=A0 =C2=A0 ndcr =3D nand_readl(info, NDCR);
> - =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDCR, ndcr & ~NDCR_ND_RUN);
> - =C2=A0 =C2=A0 =C2=A0 udelay(10);
> - =C2=A0 =C2=A0 =C2=A0 return -ETIMEDOUT;
> -}
> -
> =C2=A0static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pxa3xx_nan=
d_flash *f)
> =C2=A0{
> @@ -868,7 +793,7 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_na=
nd_info *info)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0page_per_block =3D ndcr & NDCR_PG_PER_BLK ? 64=
 : 32;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->page_size =3D ndcr & NDCR_PAGE_SZ ? 2048=
 : 512;
> - =C2=A0 =C2=A0 =C2=A0 /* set info fields needed to __readid */
> + =C2=A0 =C2=A0 =C2=A0 /* set info fields needed to read id */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (info->page_size =3D=
=3D 2048) ? 4 : 2;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->reg_ndcr =3D ndcr;
>
> --
> 1.7.0.4
>
>
