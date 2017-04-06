Received: from mail-dm3nam03on0085.outbound.protection.outlook.com
 ([104.47.41.85] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cw864-0003fs-K8
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 14:09:16 +0000
Message-ID: <1491487722.4829.11.camel@nxp.com>
Subject: Re: [PATCH v3 33/37] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>, Enrico Jorns
 <ejo@pengutronix.de>, Chuanxiao Dong <chuanxiao.dong@intel.com>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Octavian Purdila
 <octavian.purdila@nxp.com>
Date: Thu, 6 Apr 2017 17:08:42 +0300
In-Reply-To: <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 30, 2017 at 11:15 AM, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> Some NAND controllers are using DMA engine requiring a specific
> buffer alignment.  The core provides no guarantee on the nand_buffers
> pointers, which forces some drivers to allocate their own buffers
> and pass the NAND_OWN_BUFFERS flag.
> 
> Rework the nand_buffers allocation logic to allocate each buffer
> independently.  This should make most NAND controllers/DMA engine
> happy, and allow us to get rid of these custom buf allocation in
> NAND controller drivers.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

> @@ -4914,8 +4930,12 @@ void nand_cleanup(struct nand_chip *chip)
> >         /* Free bad block table memory */
>         kfree(chip->bbt);
> -       if (!(chip->options & NAND_OWN_BUFFERS))
> +       if (!(chip->options & NAND_OWN_BUFFERS)) {
> +               kfree(chip->buffers->databuf);
> +               kfree(chip->buffers->ecccode);
> +               kfree(chip->buffers->ecccalc);
>                 kfree(chip->buffers);
> +       }

It seems that chip->buffers might not be allocated at this point, for
example if nand_cleanup is called during a failed probe. You should
check if (chip->buffers != NULL) before freeing stuff inside it.

When attempting to run linux-next on various imx6qdl-sabreauto boards
they now panic on boot. This happens because they have nand chips in
devicetree which are not physically populated on the board. This
normally fails in nand_scan_ident but now crashes later in
nand_cleanup.

--
Regards,
Leonard
