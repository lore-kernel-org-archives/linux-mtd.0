Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agzq9-00068c-FO
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 19:13:41 +0000
Date: Fri, 18 Mar 2016 14:13:15 -0500
From: Rob Herring <robh@kernel.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: nsekhar@ti.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] ARM: OMAP2+: Update GPMC and NAND DT binding
 documentation
Message-ID: <20160318191315.GA20951@rob-hp-laptop>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-8-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457654203-20856-8-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 10, 2016 at 05:56:43PM -0600, Franklin S Cooper Jr wrote:
> Add additional details to the GPMC NAND documentation to clarify
> what is needed to enable NAND DMA prefetch.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  Documentation/devicetree/bindings/bus/ti-gpmc.txt   | 7 ++++++-
>  Documentation/devicetree/bindings/mtd/gpmc-nand.txt | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
