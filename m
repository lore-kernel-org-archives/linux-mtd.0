Received: from mail-pg0-f68.google.com ([74.125.83.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxKG9-0004m4-5u
 for linux-mtd@lists.infradead.org; Wed, 27 Sep 2017 21:52:51 +0000
Received: by mail-pg0-f68.google.com with SMTP id v5so10464062pgn.4
 for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2017 14:52:28 -0700 (PDT)
Date: Wed, 27 Sep 2017 16:52:26 -0500
From: Rob Herring <robh@kernel.org>
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org,
 tien.hock.loh@intel.com, hean.loong.ong@intel.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Message-ID: <20170927215226.ogcewa22dqc2jf3f@rob-hp-laptop>
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1505932139-2905-2-git-send-email-matthew.gerlach@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505932139-2905-2-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 20, 2017 at 11:28:57AM -0700, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Device Tree bindings for Altera ASMI Parallel II IP Core
> connected to a flash chip.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
> v2:
>     Made substitutions suggested by Rob Herring.
>     Emphasize driver expects controller is connected to spi-nor flash.
> ---
>  Documentation/devicetree/bindings/mtd/altera-asmip2.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt

Acked-by: Rob Herring <robh@kernel.org>
