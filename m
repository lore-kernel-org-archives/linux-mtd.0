Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T01xF-0002aS-EH
 for linux-mtd@lists.infradead.org; Sat, 11 Aug 2012 03:01:35 +0000
Received: by vbbfo1 with SMTP id fo1so2315215vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2012 20:01:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1344638914-5268-1-git-send-email-festevam@gmail.com>
References: <1344638914-5268-1-git-send-email-festevam@gmail.com>
Date: Fri, 10 Aug 2012 23:01:30 -0400
Message-ID: <CAMiH66FsGSxa5BiTFWbmfL7M4r+4tV09Wa9S_+PJ5NdTkZxvBQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi-nand: Fix kernel crash due to missing verify_buf
From: Huang Shijie <shijie8@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: marex@denx.de, Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 10, 2012 at 6:48 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> When selecting CONFIG_MTD_NAND_VERIFY_WRITE=y and doing simple write tests the following kernel crash happens:
>
> root@freescale /$ dd if=/dev/zero of=/dev/mtd0 bs=128k count=1
> [   41.070000] Unable to handle kernel NULL pointer dereference at virtual addr0
> [   41.080000] pgd = c77ac000
> [   41.080000] [00000000] *pgd=4773c831, *pte=00000000, *ppte=00000000
> [   41.090000] Internal error: Oops: 17 [#1] ARM
> [   41.090000] Modules linked in:
> [   41.090000] CPU: 0    Not tainted  (3.6.0-rc1-next-20120809-00002-ga25d017-d)
> [   41.090000] PC is at nand_verify_buf+0x18/0x5c
> [   41.090000] LR is at nand_write_page+0xc0/0x140
> [   41.090000] pc : [<c023e7d4>]    lr : [<c023fcfc>]    psr: 20000013
> [   41.090000] sp : c7779de4  ip : 00000000  fp : c6e60000
> [   41.090000] r10: 00000000  r9 : 00020000  r8 : 00000000
> [   41.090000] r7 : 00000000  r6 : c6e60000  r5 : c762cb10  r4 : 00000000
> [   41.090000] r3 : c762c8a8  r2 : 00000800  r1 : c6e60000  r0 : 00000000
> [   41.090000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> [   41.090000] Control: 0005317f  Table: 477ac000  DAC: 00000015
> [   41.090000] Process dd (pid: 427, stack limit = 0xc7778270)
> [   41.090000] Stack: (0xc7779de4 to 0xc777a000)
> ...
>
> The NULL pointer dereference that happens in nand_verify_buf() is due to the missing
> gpmi_verify_buf implementation in the gpmi-nand driver.
>
> Implement gpmi_verify_buf() to prevent this crash.
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   18 ++++++++++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 +
>  2 files changed, 19 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 8c0d2f0..72b25ce 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1533,6 +1533,23 @@ void gpmi_nfc_exit(struct gpmi_nand_data *this)
>         gpmi_free_dma_buffer(this);
>  }
>
> +static int gpmi_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
> +{
> +       struct nand_chip *nand = mtd->priv;
> +       struct gpmi_nand_data *data = container_of(mtd, struct gpmi_nand_data,
> +                                                                  mtd);
> +       int ret;
> +
> +       ret = nand->ecc.read_page(mtd, nand, data->verify_buf, 0, 0);
> +       if (ret)
> +               return -EFAULT;
> +
> +       if (memcmp(buf, data->verify_buf, len))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
>  static int __devinit gpmi_nfc_init(struct gpmi_nand_data *this)
>  {
>         struct mtd_info  *mtd = &this->mtd;
> @@ -1555,6 +1572,7 @@ static int __devinit gpmi_nfc_init(struct gpmi_nand_data *this)
>         chip->dev_ready         = gpmi_dev_ready;
>         chip->read_byte         = gpmi_read_byte;
>         chip->read_buf          = gpmi_read_buf;
> +       chip->verify_buf        = gpmi_verify_buf;
>         chip->write_buf         = gpmi_write_buf;
>         chip->ecc.read_page     = gpmi_ecc_read_page;
>         chip->ecc.write_page    = gpmi_ecc_write_page;
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> index 1547a60..cd9bdf7 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -148,6 +148,7 @@ struct gpmi_nand_data {
>         /* General-use Variables */
>         int                     current_chip;
>         unsigned int            command_length;
> +       uint8_t                 verify_buf[NAND_MAX_PAGESIZE];
It seems this will waste a page memory when the nand page is 4K.
So it's better to allocate the verify_buf dynamically whose size is
the mtd->writesize.

Best Regards
Huang Shijie

>
>         /* passed from upper layer */
>         uint8_t                 *upper_buf;
> --
> 1.7.1
>
