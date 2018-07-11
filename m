Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdHRZ-0001ss-3K
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 15:54:20 +0000
Received: by mail-oi0-f67.google.com with SMTP id b15-v6so50094213oib.10
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2018 08:54:06 -0700 (PDT)
Date: Wed, 11 Jul 2018 09:54:04 -0600
From: Rob Herring <robh@kernel.org>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com,
 linux-spi@vger.kernel.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 miquel.raynal@bootlin.com, broonie@kernel.org, david.wolfe@nxp.com,
 fabio.estevam@nxp.com, prabhakar.kushwaha@nxp.com,
 yogeshnarayan.gaur@nxp.com, han.xu@nxp.com, shawnguo@kernel.org,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/12] dt-bindings: spi: Move the bindings for the FSL
 QSPI driver
Message-ID: <20180711155404.GA15363@rob-hp-laptop>
References: <1530789310-16254-1-git-send-email-frieder.schrempf@exceet.de>
 <1530789310-16254-5-git-send-email-frieder.schrempf@exceet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530789310-16254-5-git-send-email-frieder.schrempf@exceet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 05, 2018 at 01:15:00PM +0200, Frieder Schrempf wrote:
> Move the documentation of the old SPI NOR driver to the place of the new
> SPI memory interface based driver.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
> ---
> Changes in v2:
> ==============
> * Split the moving and editing of the dt-bindings in two patches
> 
>  .../devicetree/bindings/mtd/fsl-quadspi.txt     | 65 --------------------
>  .../devicetree/bindings/spi/spi-fsl-qspi.txt    | 65 ++++++++++++++++++++
>  2 files changed, 65 insertions(+), 65 deletions(-)

Next time, use the -M option so the move shows any real diffs.

Acked-by: Rob Herring <robh@kernel.org>
