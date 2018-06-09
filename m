Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRWqj-0002zM-VY
 for linux-mtd@lists.infradead.org; Sat, 09 Jun 2018 05:55:43 +0000
Date: Sat, 9 Jun 2018 07:55:29 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
 dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at,
 marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com,
 benjamin.lindqvist@endian.se, jonathanh@nvidia.com,
 pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Message-ID: <20180609075529.23be0658@bbrezillon>
In-Reply-To: <20180531221637.6017-5-stefan@agner.ch>
References: <20180531221637.6017-1-stefan@agner.ch>
 <20180531221637.6017-5-stefan@agner.ch>
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

On Fri,  1 Jun 2018 00:16:35 +0200
Stefan Agner <stefan@agner.ch> wrote:

> +
> +static const struct of_device_id tegra_nand_of_match[] = {
> +	{ .compatible = "nvidia,tegra20-nand" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver tegra_nand_driver = {
> +	.driver = {
> +		.name = "tegra-nand",
> +		.of_match_table = tegra_nand_of_match,
> +	},
> +	.probe = tegra_nand_probe,
> +	.remove = tegra_nand_remove,
> +};
> +module_platform_driver(tegra_nand_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra NAND driver");
> +MODULE_AUTHOR("Thierry Reding <thierry.reding@nvidia.com>");
> +MODULE_AUTHOR("Lucas Stach <dev@lynxeye.de>");
> +MODULE_AUTHOR("Stefan Agner <stefan@agner.ch>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DEVICE_TABLE(of, tegra_nand_of_match);

Just a nitpick: can you move this MODULE_DEVICE_TABLE() just after the
tegra_nand_of_match declaration?
