Received: from mail-yw0-f195.google.com ([209.85.161.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXSkd-0005B6-Tr
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 14:46:02 +0000
Received: by mail-yw0-f195.google.com with SMTP id m201-v6so898214ywd.4
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 07:45:45 -0700 (PDT)
Date: Mon, 25 Jun 2018 08:45:41 -0600
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Piotr Bugalski <Piotr.Bugalski@cryptera.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Julien Su <juliensu@mxic.com.tw>,
 Mason Yang <masonccyang@mxic.com.tw>, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v9 2/6] dt-bindings: Add bindings for SPI NAND devices
Message-ID: <20180625144541.GA8597@rob-hp-laptop>
References: <20180622122828.12939-1-boris.brezillon@bootlin.com>
 <20180622122828.12939-3-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180622122828.12939-3-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 22, 2018 at 02:28:24PM +0200, Boris Brezillon wrote:
> Add bindings for SPI NAND chips.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v9:
> - Do not describe generic SPI device properties, and more importantly
>   do not change their meaning
> 
> Changes in v8:
> - Fixed a typo in the commit message
> ---
>  Documentation/devicetree/bindings/mtd/spi-nand.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>
