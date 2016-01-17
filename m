Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKb3i-0007OY-Qm
 for linux-mtd@lists.infradead.org; Sun, 17 Jan 2016 00:19:07 +0000
Date: Sat, 16 Jan 2016 18:18:43 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>
Subject: Re: [PATCH v2 6/8] mtd: atmel_nand: Support PMECC on SAMA5D2
Message-ID: <20160117001843.GA11736@rob-hp-laptop>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
 <1452854102-6125-7-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452854102-6125-7-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2016 at 11:35:00AM +0100, Romain Izard wrote:
> Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
> controller that can correct 32 bits in each sector. This controller is
> not 100% compatible with the previous revision that corrected a maximum
> of 24 bits by sector, as some register addresses overlap.
> 
> Using information from the device tree, we can configure the driver to
> work with both versions.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> v2: Split rewording of the binding into its own patch
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  5 ++++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++++++++++-
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
>  3 files changed, 32 insertions(+), 4 deletions(-)
