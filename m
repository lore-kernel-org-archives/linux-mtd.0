Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZfuD-0005MD-1Z
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 16:40:42 +0000
Date: Thu, 11 Jan 2018 17:40:12 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, David Wolfe
 <david.wolfe@nxp.com>, Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org, Frank Li <frank.li@nxp.com>,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH v4] mtd: fsl-quadspi: Distinguish the mtd device names
Message-ID: <20180111174012.67e2681a@bbrezillon>
In-Reply-To: <CAOMZO5AChZVrGMSdGFW5ZyKOOx23f_WJjchmdE=hUj0PmAMZgw@mail.gmail.com>
References: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
 <20180111164823.34b0b8fd@bbrezillon>
 <CAOMZO5AChZVrGMSdGFW5ZyKOOx23f_WJjchmdE=hUj0PmAMZgw@mail.gmail.com>
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

On Thu, 11 Jan 2018 13:59:44 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> Hi Boris,
> 
> On Thu, Jan 11, 2018 at 1:48 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> 
> > Still missing the DT doc update. You can do it in a separate patch, but
> > please make it part of the same series.  
> 
> The dt-binding update part is not very clear to me.
> 
> Currently on the imx6sx-sdb.dts we have:
> 
> &qspi2 {
>     pinctrl-names = "default";
>     pinctrl-0 = <&pinctrl_qspi2>;
>     status = "okay";
> 
>     flash0: n25q256a@0 {
>         #address-cells = <1>;
>         #size-cells = <1>;
>         compatible = "micron,n25q256a", "jedec,spi-nor";
>         spi-max-frequency = <29000000>;
>         reg = <0>;
>     };
> 
>     flash1: n25q256a@1 {
>         #address-cells = <1>;
>         #size-cells = <1>;
>         compatible = "micron,n25q256a", "jedec,spi-nor";
>         spi-max-frequency = <29000000>;
>         reg = <1>;
>     };
> };
> 
> 
> The reg requirement is already present as part of
> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt.
> 
> Are you proposing that I add a comment to
> Documentation/devicetree/bindings/mtd/fsl-quadspi.txt saying that the
> Flash sub-nodes must contain a reg property?

Nope, I wasn't sure whether reg was mandatory or not since it was not
used by the driver before your patch. This being said, that'd be good to
update the example you have in the bindings do to fully describe a
flash device.

Anyway, if all existing DTs have a reg defined, even those where only
one flash device is described, then your patch might break mtdparts
users. And if this is not the case, and the reg property is really
mandatory, then that means those dts are not compliant with the DT
bindings and have to be patched :-). So, the solution of testing the
presence of a reg property to choose the naming scheme is probably not
appropriate.
