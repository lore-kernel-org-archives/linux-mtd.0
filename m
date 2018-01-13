Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eaRfr-0003XC-Gy
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 19:41:05 +0000
Received: by mail-ot0-x233.google.com with SMTP id s3so7724528otc.9
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jan 2018 11:40:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180111211543.561ea46d@bbrezillon>
References: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
 <20180111164823.34b0b8fd@bbrezillon>
 <CAOMZO5AChZVrGMSdGFW5ZyKOOx23f_WJjchmdE=hUj0PmAMZgw@mail.gmail.com>
 <20180111174012.67e2681a@bbrezillon>
 <CAOMZO5Aerkb2r0y2aC8sZJcEgpJzoNgR5_MU=2t_uq7jTzNo9g@mail.gmail.com>
 <20180111211543.561ea46d@bbrezillon>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 13 Jan 2018 17:40:51 -0200
Message-ID: <CAOMZO5DCOz4zp57g-VWBOOOdL1J3-nrNYr6-mdbY+nefp0boFw@mail.gmail.com>
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

On Thu, Jan 11, 2018 at 6:15 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> Nothing that I really like, sorry. One solution would be to use
> dev_name(&pdev->dev) when only one flash device is declared and use
> dev_name(&pdev->dev)-reg_val otherwise. Or you could leave the logic

Ok, so I can do as you suggested above:

--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
                spi_nor_set_flash_node(nor, np);
                nor->priv = q;

+               if (q->nor_num > 1) {
+                       int spiflash_idx;
+
+                       ret = of_property_read_u32(np, "reg", &spiflash_idx);
+                       if (!ret) {
+                               mtd->name = devm_kasprintf(dev, GFP_KERNEL,
+                                                          "%s-%d",
+                                                          dev_name(dev),
+                                                          spiflash_idx);
+                               if (!mtd->name) {
+                                       ret = -ENOMEM;
+                                       goto mutex_failed;
+                               }
+                       } else {
+                               dev_warn(dev, "reg property is missing\n");
+                       }
+               }
+
                /* fill the hooks */
                nor->read_reg = fsl_qspi_read_reg;
                nor->write_reg = fsl_qspi_write_reg;

And then I can do a separate patch adding the qspi flash examples into
Documentation/devicetree/bindings/mtd/fsl-quadspi.txt

Does this look good?
