Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKb4q-0007fX-6R
 for linux-mtd@lists.infradead.org; Sun, 17 Jan 2016 00:20:16 +0000
Date: Sat, 16 Jan 2016 18:19:52 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: atmel_nand: Reword the documenation
Message-ID: <20160117001952.GA12311@rob-hp-laptop>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
 <1452854102-6125-6-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452854102-6125-6-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2016 at 11:34:59AM +0100, Romain Izard wrote:
> Do not mention which chips supporting the PMECC controller, as it a
> duplicate of the information in the chips' device trees.
> 
> Use common terms when describing the sub-node for the NAND Flash
> controller.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> v2: new
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 23 +++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
