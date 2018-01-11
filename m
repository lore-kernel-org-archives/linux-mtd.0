Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZjGW-0005kY-Te
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 20:15:59 +0000
Date: Thu, 11 Jan 2018 21:15:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, David Wolfe
 <david.wolfe@nxp.com>, Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org, Frank Li <frank.li@nxp.com>,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH v4] mtd: fsl-quadspi: Distinguish the mtd device names
Message-ID: <20180111211543.561ea46d@bbrezillon>
In-Reply-To: <CAOMZO5Aerkb2r0y2aC8sZJcEgpJzoNgR5_MU=2t_uq7jTzNo9g@mail.gmail.com>
References: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
 <20180111164823.34b0b8fd@bbrezillon>
 <CAOMZO5AChZVrGMSdGFW5ZyKOOx23f_WJjchmdE=hUj0PmAMZgw@mail.gmail.com>
 <20180111174012.67e2681a@bbrezillon>
 <CAOMZO5Aerkb2r0y2aC8sZJcEgpJzoNgR5_MU=2t_uq7jTzNo9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 Jan 2018 14:58:39 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> On Thu, Jan 11, 2018 at 2:40 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> 
> > Nope, I wasn't sure whether reg was mandatory or not since it was not
> > used by the driver before your patch. This being said, that'd be good to
> > update the example you have in the bindings do to fully describe a
> > flash device.  
> 
> Ok, I can update fsl-quadspi.txt to include an example for describing
> the flash devices.
> 
> > Anyway, if all existing DTs have a reg defined, even those where only  
> 
> As far as I can see all DTs that use fsl-quadspi have a reg property
> in the SPI flash sub-nodes:
> 
> arch/arm/boot/dts/imx6ul-14x14-evk.dts
> arch/arm/boot/dts/imx6sx-sdb.dts
> arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> 
> > one flash device is described, then your patch might break mtdparts
> > users. And if this is not the case, and the reg property is really
> > mandatory, then that means those dts are not compliant with the DT
> > bindings and have to be patched :-). So, the solution of testing the
> > presence of a reg property to choose the naming scheme is probably not
> > appropriate.  
> 
> Any ideas on how we can properly solve this?

Nothing that I really like, sorry. One solution would be to use
dev_name(&pdev->dev) when only one flash device is declared and use
dev_name(&pdev->dev)-reg_val otherwise. Or you could leave the logic
unchanged and force users to specify a label property when they have
more than one device. The last solution would be to actually break
mtdparts users so that you can start using a sane naming scheme.
