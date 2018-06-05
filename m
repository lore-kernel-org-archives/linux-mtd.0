Received: from mail-yb0-f196.google.com ([209.85.213.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQIKd-0002nT-CS
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 20:13:28 +0000
Received: by mail-yb0-f196.google.com with SMTP id x36-v6so1224703ybi.0
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2018 13:13:17 -0700 (PDT)
Date: Tue, 5 Jun 2018 14:13:13 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de,
 miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com,
 krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se,
 jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
 mirza.krak@gmail.com, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] mtd: rawnand: tegra: add devicetree binding
Message-ID: <20180605201313.GA32175@rob-hp-laptop>
References: <20180531221637.6017-1-stefan@agner.ch>
 <20180531221637.6017-4-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180531221637.6017-4-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 01, 2018 at 12:16:34AM +0200, Stefan Agner wrote:
> This adds the devicetree binding for the Tegra 2 NAND flash
> controller.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../bindings/mtd/nvidia-tegra20-nand.txt      | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>
