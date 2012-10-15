Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNnC6-0005UN-1a
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 16:07:06 +0000
Received: by mail-vc0-f177.google.com with SMTP id p16so6248524vcq.36
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2012 09:07:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <507B04AA.1050502@vanka.net>
References: <507B04AA.1050502@vanka.net>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 15 Oct 2012 12:06:42 -0400
Message-ID: <CAMjpGUd8mjZniGcbKw3jZ0V1kGbnYxoHUJg4jGVrSFtdVTadyQ@mail.gmail.com>
Subject: Re: [PATCH] Devicetree support for enc28j60 SPI Ethernet chip
To: Michal Vanka <mv@vanka.net>
Content-Type: text/plain; charset=UTF-8
Cc: nios2-dev@sopc.et.ntust.edu.tw, lanconelli.claudio@eptar.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 14, 2012 at 2:30 PM, Michal Vanka wrote:
> the following patch adds generic openfirmware/devicetree support to enc28j60
> driver.

this should go to the net list, not the mtd list, since this is a net driver

however, your patch needs a little work.  please send it with `git
send-email` rather than formatting things yourself.

> +       if(priv->interrupt_deassert_reg)
> +               writeb(1,priv->interrupt_deassert_reg);

needs a space after the "if" and after the ",".  please run your patch
through checkpatch.pl before re-submitting.

> +static int __devinit enc28j60_of_probe(struct spi_device *spi,struct

more space issues

> +{
> +
> +       u8 *reg;

kill off that blank line

> +       if(prop && len>=sizeof(__be32))

more space issues

> +       if(!devm_request_mem_region(&spi->dev, reg, 4, DRV_NAME))

here too
-mike
