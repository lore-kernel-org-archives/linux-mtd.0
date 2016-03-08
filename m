Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adMEp-00075y-V3
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 18:20:08 +0000
Received: by mail-pf0-x22d.google.com with SMTP id 63so18324512pfe.3
 for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2016 10:19:46 -0800 (PST)
Date: Tue, 8 Mar 2016 10:19:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 dwmw2@infradead.org, matthias.bgg@gmail.com, robh@kernel.org,
 daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: mediatek: device tree docs for MTK Smart Device
 Gen1 NAND
Message-ID: <20160308181944.GK55664@google.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308160038.29374f04@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160308160038.29374f04@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Tue, Mar 08, 2016 at 04:00:38PM +0100, Boris Brezillon wrote:
> We're trying to enforce the NAND controller and NAND chip separation
> for all new NAND controller drivers, and representing those 2 elements
> in the DT is now the preferred approach.
> 
> You can have a look at the sunxi-nand bindings [1].
> 
> Thanks,
> 
> Boris
> 
> [1]http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt

This suggestion is coming up a lot. Can you please document some general
best practices for this in Documentation/devicetree/bindings/mtd/nand.txt?

Thanks,
Brian
