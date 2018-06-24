Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXCNO-0001o7-8A
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 21:16:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Sun, 24 Jun 2018 23:16:30 +0200
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
 benjamin.lindqvist@endian.se, pgaikwad@nvidia.com, dev@lynxeye.de,
 mirza.krak@gmail.com, richard@nod.at, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 marcel@ziswiler.com, miquel.raynal@bootlin.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, gaireg@gaireg.de
Subject: Re: [PATCH v7 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
In-Reply-To: <20180624215014.3249b382@bbrezillon>
References: <20180624192230.4674-1-stefan@agner.ch>
 <20180624192230.4674-5-stefan@agner.ch> <20180624215014.3249b382@bbrezillon>
Message-ID: <fa42ef544b3ad7f5be4ebdd115d99a59@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24.06.2018 21:50, Boris Brezillon wrote:
> On Sun, 24 Jun 2018 21:22:28 +0200
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> +
>> +static int tegra_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_nand_controller *ctrl = platform_get_drvdata(pdev);
>> +
>> +	nand_release(nand_to_mtd(ctrl->chip));
> 
> I still see nand_release() being used here. As I said in my review of
> v6, it's not safe. Please use mtd_device_unregister() + nand_cleanup()
> instead, and check the return code of mtd_device_unregister().

Whoops missed that one. Will send v8.

--
Stefan

> 
> With this addressed
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> 
>> +
>> +	clk_disable_unprepare(ctrl->clk);
>> +
>> +	return 0;
>> +}
>> +
