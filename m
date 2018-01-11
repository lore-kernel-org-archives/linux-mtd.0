Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZgBn-0005QD-Hu
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 16:58:53 +0000
Received: by mail-oi0-x244.google.com with SMTP id t8so2061641oie.6
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2018 08:58:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180111174012.67e2681a@bbrezillon>
References: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
 <20180111164823.34b0b8fd@bbrezillon>
 <CAOMZO5AChZVrGMSdGFW5ZyKOOx23f_WJjchmdE=hUj0PmAMZgw@mail.gmail.com>
 <20180111174012.67e2681a@bbrezillon>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 11 Jan 2018 14:58:39 -0200
Message-ID: <CAOMZO5Aerkb2r0y2aC8sZJcEgpJzoNgR5_MU=2t_uq7jTzNo9g@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: fsl-quadspi: Distinguish the mtd device names
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, David Wolfe <david.wolfe@nxp.com>,
 Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org, Frank Li <frank.li@nxp.com>,
 cyrille.pitchen@wedev4u.fr
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 11, 2018 at 2:40 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> Nope, I wasn't sure whether reg was mandatory or not since it was not
> used by the driver before your patch. This being said, that'd be good to
> update the example you have in the bindings do to fully describe a
> flash device.

Ok, I can update fsl-quadspi.txt to include an example for describing
the flash devices.

> Anyway, if all existing DTs have a reg defined, even those where only

As far as I can see all DTs that use fsl-quadspi have a reg property
in the SPI flash sub-nodes:

arch/arm/boot/dts/imx6ul-14x14-evk.dts
arch/arm/boot/dts/imx6sx-sdb.dts
arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts

> one flash device is described, then your patch might break mtdparts
> users. And if this is not the case, and the reg property is really
> mandatory, then that means those dts are not compliant with the DT
> bindings and have to be patched :-). So, the solution of testing the
> presence of a reg property to choose the naming scheme is probably not
> appropriate.

Any ideas on how we can properly solve this?
