Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewY5v-0001Fy-Cf
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 18:59:21 +0000
Subject: Re: [PATCH RESEND v6 1/2] mtd: fsl-quadspi: Distinguish the mtd
 device names
To: Fabio Estevam <festevam@gmail.com>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 han.xu@nxp.com, david.wolfe@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
References: <1517001805-7646-1-git-send-email-festevam@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0354a333-d178-918c-8395-ef7408070478@wedev4u.fr>
Date: Thu, 15 Mar 2018 19:58:57 +0100
MIME-Version: 1.0
In-Reply-To: <1517001805-7646-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 26/01/2018 à 22:23, Fabio Estevam a écrit :
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
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
> Acked-by: Han Xu <han.xu@nxp.com>

Series applied to the spi-nor/next branch of linux-mtd

Thanks!
