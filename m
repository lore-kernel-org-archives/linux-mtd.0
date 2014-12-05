Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xwzck-0003bn-MV
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 20:37:11 +0000
Received: by mail-la0-f54.google.com with SMTP id pv20so1310611lab.27
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 12:36:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DQb+xThzQDMh4qqYy=mNCoUG5zWr-iOrtgzbFQdR_VsQ@mail.gmail.com>
References: <CAOMZO5DQb+xThzQDMh4qqYy=mNCoUG5zWr-iOrtgzbFQdR_VsQ@mail.gmail.com>
Date: Fri, 5 Dec 2014 18:36:48 -0200
Message-ID: <CAOMZO5Cm=-kNAccOgHAV=+yZW3cbE8oKeVbA1xN=vap+Bvi0Rw@mail.gmail.com>
Subject: Re: mtd: unable to unregister device
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Frank Li <Frank.Li@freescale.com>, Huang Shijie <shijie8@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 5, 2014 at 1:55 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi,
>
> Running top of head linus tree or linux-next I observe the following issue:
>
> fsl-quadspi is autloaded as a kernel module:
>
> [    9.670508] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
> [    9.763432] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
> [    9.847063] fsl-quadspi 21e4000.qspi: QuadSPI SPI NOR flash driver
>
> root@freescale /$ cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00010000 "21e4000.qspi"
> mtd1: 01000000 00010000 "21e4000.qspi"
>
> root@freescale /$ rmmod  fsl-quadspi
> root@freescale /$ cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"

If I change it like this:

--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -960,7 +960,7 @@ static int fsl_qspi_remove(struct platform_device *pdev)
        struct fsl_qspi *q = platform_get_drvdata(pdev);
        int i;

-       for (i = 0; i < q->nor_num; i++)
+       for (i = 0; i < FSL_QSPI_MAX_CHIP; i++)
                mtd_device_unregister(&q->mtd[i]);

        /* disable the hardware */

Then rmmod works as expected:

root@freescale /$ rmmod fsl-quadspi
root@freescale /$ cat /proc/mtd
dev:    size   erasesize  name
