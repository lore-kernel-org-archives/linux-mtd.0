Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWGKx-0007MQ-AN
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2016 04:37:09 +0000
Date: Thu, 18 Feb 2016 12:36:13 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <han.xu@nxp.com>
CC: <matthias.bgg@gmail.com>, <rubini@gnudd.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] MAINTAINERS: add maintainer entry for FREESCALE GPMI
 NAND driver
Message-ID: <20160218043612.GA735@sha-win-210.asiapac.arm.com>
References: <1455767715-621-1-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1455767715-621-1-git-send-email-han.xu@nxp.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 18, 2016 at 03:55:15AM +0000, Han Xu wrote:
> Add a maintainer entry for FREESCALE GPMI NAND driver and add myself as a
> maintainer.
>
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7bd927e..49baa5b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4543,6 +4543,12 @@ L:     linuxppc-dev@lists.ozlabs.org
>  S:   Maintained
>  F:   drivers/dma/fsldma.*
>
> +FREESCALE GPMI NAND DRIVER
> +M:   Han Xu <han.xu@nxp.com>
> +L:   linux-mtd@lists.infradead.org
> +S:   Maintained
> +F:   drivers/mtd/nand/gpmi-nand/*
> +
>  FREESCALE I2C CPM DRIVER
>  M:   Jochen Friedrich <jochen@scram.de>
>  L:   linuxppc-dev@lists.ozlabs.org
> --
> 2.7.1
>
Acked-by: Huang Shijie <shijie.huang@arm.com>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
