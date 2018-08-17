Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqfsp-0004NU-97
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 14:37:48 +0000
Date: Fri, 17 Aug 2018 16:37:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <kyungmin.park@samsung.com>, <absahu@codeaurora.org>,
 <peterpandong@micron.com>, <frieder.schrempf@exceet.de>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20180817163733.34d3199c@xps13>
In-Reply-To: <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

A user of Xilinx BSP reported a problem with lockdep that I can see is
not yet fixed in this code:

Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote on
Fri, 17 Aug 2018 18:49:24 +0530:

> +static int anfc_probe(struct platform_device *pdev)
> +{
> +	struct anfc_nand_controller *nfc;
> +	struct anfc_nand_chip *anand_chip;
> +	struct device_node *np =3D pdev->dev.of_node, *child;
> +	struct resource *res;
> +	int err;
> +
> +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	init_waitqueue_head(&nfc->controller.wq);

The controller structure has a lock which is not initialized here. You
should not initialize the waitqueue manually neither and instead use
nand_controller_init(&nfc->controller).

> +	INIT_LIST_HEAD(&nfc->chips);
> +	init_completion(&nfc->event);
> +	nfc->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, nfc);
> +	nfc->csnum =3D -1;
> +	nfc->controller.ops =3D &anfc_nand_controller_ops;

More to come.

Thanks,
Miqu=C3=A8l
