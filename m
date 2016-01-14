Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJWPt-0003C2-PA
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 01:09:34 +0000
Date: Wed, 13 Jan 2016 19:09:09 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Yang Wenyou <Wenyou.Yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v1 4/5] mtd: atmel_nand: Support 32-bit ECC strength
Message-ID: <20160114010909.GA28864@rob-hp-laptop>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-5-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452702857-2240-5-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 05:34:16PM +0100, Romain Izard wrote:
> As the SAMA5D2 controller supports the 32-bit ECC strength, accept it
> as a valid setting when required by the device tree or the NAND
> parameter page.
> 
> Then configure the controller to do use this new setting.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  3 ++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/atmel_nand.c                      | 23 ++++++++++++++++++----
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  1 +
>  3 files changed, 22 insertions(+), 5 deletions(-)
