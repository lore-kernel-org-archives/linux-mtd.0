Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGV7V-0007VY-2L
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 18:46:54 +0000
Received: by mail-pf0-x243.google.com with SMTP id f27so8252251pfe.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 11:46:32 -0700 (PDT)
Date: Thu, 1 Jun 2017 11:46:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] mtd: mchp23k256: device tree and mchp23lcv1024
Message-ID: <20170601184630.GC102137@google.com>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 25, 2017 at 11:49:11AM +1200, Chris Packham wrote:
> This series adds device tree support to the mchp23k256 driver and
> support for the mchp23lcv1024 chip. I suspect there are more compatible
> variants that we could now enumerate if desired.
> 
> Chris Packham (5):
>   mtd: mchp23k256: Add OF device ID table
>   mtd: mchp23k256: switch to mtd_device_register()

Applied these two to l2-mtd.git.

>   mtd: handle partitioning on devices with 0 erasesize

I had a question on this one (posted on an earlier revision).

>   mtd: mchp23k256: add partitioning support
>   mtd: mchp23k256: Add support for mchp23lcv1024
> 
>  .../bindings/mtd/microchip,mchp23k256.txt          | 18 +++++
>  drivers/mtd/devices/mchp23k256.c                   | 78 ++++++++++++++++++----
>  drivers/mtd/mtdpart.c                              | 25 ++++---
>  3 files changed, 100 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

Holding off on patches 3-5 for now.
