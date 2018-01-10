Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZP1e-0005c1-F8
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 22:39:15 +0000
Received: by mail-oi0-x233.google.com with SMTP id a70so427462oib.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jan 2018 14:39:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180110231719.72767797@bbrezillon>
References: <1515181560-1410-1-git-send-email-festevam@gmail.com>
 <VI1PR0401MB22213B0560C91999E6E22E7197130@VI1PR0401MB2221.eurprd04.prod.outlook.com>
 <20180110231719.72767797@bbrezillon>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Jan 2018 20:39:02 -0200
Message-ID: <CAOMZO5AzfWeg=98F5QJeMcN3UaFvmf2d+69wvCmomK9bHTMn6g@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Distinguish the mtd device names
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 David Wolfe <david.wolfe@nxp.com>, Frank Li <frank.li@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>
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

On Wed, Jan 10, 2018 at 8:17 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> With the alternative naming scheme suggested above, it gives:
>
>                 mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s:%d"
>                                            dev_name(&pdev->dev),
>                                            mtd_index);

Yes, this looks better.

I have made the suggested change. Will test it tomorrow on my board
and will send a v2.

Thanks!
