Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3iNp-0000ST-8T
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 10:42:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 17C0328C0EA
 for <linux-mtd@lists.infradead.org>; Tue,  1 Dec 2015 11:41:33 +0100 (CET)
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by arrakis.dune.hu (Postfix) with ESMTPSA id A15C528C037
 for <linux-mtd@lists.infradead.org>; Tue,  1 Dec 2015 11:41:18 +0100 (CET)
Received: by lffu14 with SMTP id u14so2502821lff.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 02:41:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5659FF4A.7080203@simon.arlott.org.uk>
References: <5659FF4A.7080203@simon.arlott.org.uk>
From: Jonas Gorski <jogo@openwrt.org>
Date: Tue, 1 Dec 2015 11:41:00 +0100
Message-ID: <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Nov 28, 2015 at 8:23 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
> Workaround false ECC uncorrectable errors by checking if the data
> has been erased and the OOB data indicates that the data has been
> erased. The v4.0 controller on the BCM63168 incorrectly handles
> these as uncorrectable errors.
>
> I don't know which version of the controller handles this scenario
> correctly. I'm only able to test this in Hamming mode, so the BCH
> version needs to be checked.
>
> This code is quite complicated because the fact that either the data
> buffer or the OOB data may not have been read from the controller, and
> both of them are required to determine if the error is incorrect.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 107 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 5f26b8a..0857af7 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1387,6 +1387,102 @@ static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
>  }
>
>  /*
> + * Workaround false ECC uncorrectable errors by checking if the data
> + * has been erased and the OOB data indicates that the data has been
> + * erased. The controller incorrectly handles these as uncorrectable
> + * errors.
> + */
> +static void brcmnand_read_ecc_unc_err(struct mtd_info *mtd,
> +                               struct nand_chip *chip,
> +                               int idx, unsigned int trans,
> +                               u32 *buf, u8 *oob_begin, u8 *oob_end,
> +                               u64 *err_addr)
> +{
> +       struct brcmnand_host *host = chip->priv;
> +       struct brcmnand_controller *ctrl = host->ctrl;
> +       u32 *buf_tmp = NULL;
> +       u8 *oob_tmp = NULL;
> +       bool buf_erased = false;
> +       bool oob_erased = false;
> +       int j;
> +
> +       /* Assume this is fixed in v5.0+ */
> +       if (ctrl->nand_version >= 0x0500)
> +               return;
> +
> +       /* Read OOB data if not already read */
> +       if (!oob_begin) {
> +               oob_tmp = kmalloc(ctrl->max_oob, GFP_KERNEL);
> +               if (!oob_tmp)
> +                       goto out_free;
> +
> +               oob_begin = oob_tmp;
> +               oob_end = oob_tmp;
> +
> +               oob_end += read_oob_from_regs(ctrl, idx, oob_tmp,
> +                               mtd->oobsize / trans,
> +                               host->hwcfg.sector_size_1k);
> +       }
> +
> +       if (is_hamming_ecc(&host->hwcfg)) {
> +               u8 *oob_offset = oob_begin + 6;
> +
> +               if (oob_offset + 3 < oob_end)
> +                       /* Erased if ECC bytes are all 0xFF, or the data bytes
> +                        * are all 0xFF which should have Hamming codes of 0x00
> +                        */
> +                       oob_erased = memchr_inv(oob_offset, 0xFF, 3) == NULL ||
> +                               memchr_inv(oob_offset, 0x00, 3) == NULL;
> +       } else { /* BCH */
> +               u8 *oob_offset = oob_end - ctrl->max_oob;
> +
> +               if (oob_offset >= oob_begin)
> +                       /* Erased if ECC bytes are all 0xFF */
> +                       oob_erased = memchr_inv(oob_offset, 0xFF,
> +                                               oob_end - oob_offset) == NULL;
> +       }
> +
> +       if (!oob_erased)
> +               goto out_free;
> +
> +       /* Read data buffer if not already read */
> +       if (!buf) {
> +               buf_tmp = kmalloc_array(FC_WORDS, sizeof(*buf_tmp), GFP_KERNEL);
> +               if (!buf_tmp)
> +                       goto out_free;
> +
> +               buf = buf_tmp;
> +
> +               brcmnand_soc_data_bus_prepare(ctrl->soc);
> +
> +               for (j = 0; j < FC_WORDS; j++, buf++)
> +                       *buf = brcmnand_read_fc(ctrl, j);
> +
> +               brcmnand_soc_data_bus_unprepare(ctrl->soc);
> +       }
> +
> +       /* Go to start of buffer */
> +       buf -= FC_WORDS;
> +
> +       /* Erased if all data bytes are 0xFF */
> +       buf_erased = memchr_inv(buf, 0xFF, FC_WORDS) == NULL;
> +
> +       if (!buf_erased)
> +               goto out_free;

We now have a function exactly for that use case in 4.4,
nand_check_erased_buf [1], consider using that. This also has the
benefit of treating bit flips as correctable as long as the ECC scheme
is strong enough.


Jonas

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/nand_base.c#n1110
