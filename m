Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8yNK-0006F3-Kn
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 16:52:23 +0000
Message-ID: <4CC06FC2.2060406@parrot.com>
Date: Thu, 21 Oct 2010 18:52:18 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 3/3 v3] NAND: add support for reading ONFI parameters
	from NAND device
References: <201008301832.24672.florian@openwrt.org>
In-Reply-To: <201008301832.24672.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Florian Fainelli a écrit :
> This patch adds support for reading NAND device ONFI parameters and use
> the ONFI informations to define its geometry. In case the device supports
> ONFI, the onfi_version field in struct nand_chip contains the version (BCD)
> and the onfi_params structure can be used by drivers to set up timings and
> such. We currently only support ONFI 1.0 parameters.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>
> Signed-off-by: Matthieu Castet <matthieu.castet@parrot.com>
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> ---
                 chip->cmdfunc = nand_command_lp;
> 
> +       /* TODO onfi flash name */
>         printk(KERN_INFO "NAND device: Manufacturer ID:"
> -              " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
> -              nand_manuf_ids[maf_idx].name, type->name);
> +               " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
> +               nand_manuf_ids[maf_idx].name,
> +               chip->onfi_version ? type->name:chip->onfi_params.model);
> 
I don't know if it has been noticed but it should be
chip->onfi_version ? chip->onfi_params.model : type->name

Matthieu
