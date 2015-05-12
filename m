Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsIqp-0006CN-J4
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 22:40:36 +0000
Received: by lbbuc2 with SMTP id uc2so16793534lbb.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 15:40:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431469664-20084-1-git-send-email-b45815@freescale.com>
References: <1431469664-20084-1-git-send-email-b45815@freescale.com>
Date: Tue, 12 May 2015 19:40:12 -0300
Message-ID: <CAOMZO5AN-Lrnv_44UtD6WzyhqJ=vu2s2_DY1MyAOk+V5xc2=+w@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: fsl-quadspi: Access multiple chips simultaneously
From: Fabio Estevam <festevam@gmail.com>
To: Han Xu <b45815@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 12, 2015 at 7:27 PM, Han Xu <b45815@freescale.com> wrote:
> Add supports for simultaneous access to multiple chips. Need to lock
> the mutex before any quad spi operations and unlock the mutex after
> operations complete.
>
> Rebase to latest l2-mtd code and resend.

It seems this would be better below the --- line.

>  static inline int is_vybrid_qspi(struct fsl_qspi *q)
> @@ -761,6 +763,7 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>         struct fsl_qspi *q = nor->priv;
>         int ret;
>
> +       mutex_lock(&q->lock);
>         ret = clk_enable(q->clk_en);
>         if (ret)
>                 return ret;

You forgot to unlock the mutex on error.
