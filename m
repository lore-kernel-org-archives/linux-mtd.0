Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZfGm-0003XE-OL
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 15:59:58 +0000
Received: by mail-oi0-x243.google.com with SMTP id u83so1923302oie.7
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2018 07:59:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180111164823.34b0b8fd@bbrezillon>
References: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
 <20180111164823.34b0b8fd@bbrezillon>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 11 Jan 2018 13:59:44 -0200
Message-ID: <CAOMZO5AChZVrGMSdGFW5ZyKOOx23f_WJjchmdE=hUj0PmAMZgw@mail.gmail.com>
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

Hi Boris,

On Thu, Jan 11, 2018 at 1:48 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> Still missing the DT doc update. You can do it in a separate patch, but
> please make it part of the same series.

The dt-binding update part is not very clear to me.

Currently on the imx6sx-sdb.dts we have:

&qspi2 {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_qspi2>;
    status = "okay";

    flash0: n25q256a@0 {
        #address-cells = <1>;
        #size-cells = <1>;
        compatible = "micron,n25q256a", "jedec,spi-nor";
        spi-max-frequency = <29000000>;
        reg = <0>;
    };

    flash1: n25q256a@1 {
        #address-cells = <1>;
        #size-cells = <1>;
        compatible = "micron,n25q256a", "jedec,spi-nor";
        spi-max-frequency = <29000000>;
        reg = <1>;
    };
};


The reg requirement is already present as part of
Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt.

Are you proposing that I add a comment to
Documentation/devicetree/bindings/mtd/fsl-quadspi.txt saying that the
Flash sub-nodes must contain a reg property?

Please clarify.

Thanks
