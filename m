Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eeeed-0002CX-Dp
 for linux-mtd@lists.infradead.org; Thu, 25 Jan 2018 10:21:13 +0000
Received: by mail-ot0-x243.google.com with SMTP id 53so6269055otj.2
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2018 02:21:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>
References: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Jan 2018 08:20:59 -0200
Message-ID: <CAOMZO5Bo4Tbo+uQADrfo2O=LmHn4oFTqN7pWwqMrrtrhkemmEg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] mtd: fsl-quadspi: Distinguish the mtd device names
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org, David Wolfe <david.wolfe@nxp.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, Jan 18, 2018 at 12:28 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> Currently on a imx6sx-sdb board, which has two SPI NOR chips connected
> to QSPI2 the following output from /proc/mtd is seen:
>
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00010000 "21e4000.qspi"
> mtd1: 01000000 00010000 "21e4000.qspi"
>
> Attempts to partition them on the kernel command line result in both
> chips with identical (and identically named) partitions, which is
> an inconvenient behavior.
>
> Assign a different mtd->name for each mtd device to avoid this problem.
>
> After this change the output from /proc/mtd becomes:
>
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00010000 "21e4000.qspi-0"
> mtd1: 01000000 00010000 "21e4000.qspi-1"
>
> In order to keep mtdparts compatibility keep the mtd->name
> unchanged when a single SPI NOR is present.
>
> Reported-by: David Wolfe <david.wolfe@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v5:
> - Preserve the label value, if any. (Boris)

Do you plan to apply this one for 4.17?

Thanks
