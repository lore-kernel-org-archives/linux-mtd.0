Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpAC-0003mY-9J
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:28:13 +0000
Received: from mail-la0-f41.google.com ([209.85.215.41]:32963)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZXp9q-002TjW-WD
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 07:27:51 -0400
Received: by lamp12 with SMTP id p12so11058202lam.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:27:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1439978205-6092-1-git-send-email-jteki@openedev.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
Date: Fri, 4 Sep 2015 16:57:49 +0530
Message-ID: <CAD6G_RSoUcHP-VbR4AwAKhYXh56sFyc7MO0rS0q5QXS660pnZg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Use write_sr for write status
From: Jagan Teki <jteki@openedev.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jagan Teki <jteki@openedev.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 August 2015 at 15:26, Jagan Teki <jteki@openedev.com> wrote:
> Use existing write_sr() call instead of decoding and
> calling nor->write_reg separately.
>
> Signed-off-by: Jagan Teki <jteki@openedev.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 47516d3..3e198b4 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -869,8 +869,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
>         val = read_sr(nor);
>         write_enable(nor);
>
> -       nor->cmd_buf[0] = val | SR_QUAD_EN_MX;
> -       nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1, 0);
> +       write_sr(nor, val | SR_QUAD_EN_MX);
>
>         if (spi_nor_wait_till_ready(nor))
>                 return 1;
> --
> 1.9.1
>

Ping


-- 
Jagan | openedev.
