Received: from a.mx.sdesigns.eu ([78.31.43.6])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmkf3-00041p-18
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 16:46:17 +0000
Subject: Re: [PATCH v5] mtd: nand: tango: import driver for tango chips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com> <57D2DF96.7060705@sigmadesigns.com>
 <57D5530B.2060209@free.fr> <20160912210810.79ac23c9@bbrezillon>
 <57DFE444.3000003@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <57E2B941.5010301@sigmadesigns.com>
Date: Wed, 21 Sep 2016 18:45:53 +0200
MIME-Version: 1.0
In-Reply-To: <57DFE444.3000003@sigmadesigns.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/09/2016 15:12, Marc Gonzalez wrote:

> +static int chip_init(struct device *dev, struct device_node *np, int kHz)
> +{
> +	int err;
> +	u32 cs, ecc_bits;
> +	struct nand_ecc_ctrl *ecc;
> +	struct tango_nfc *nfc = dev_get_drvdata(dev);
> +	struct tango_chip *p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);

As pointed out by Boris on IRC, every chip needs a pointer back
to the parent device.

	p->chip.mtd.dev.parent = dev;

http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L1729
