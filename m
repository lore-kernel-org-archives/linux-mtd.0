Date: Thu, 17 Aug 2017 16:59:34 -0500
From: Rob Herring <robh@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC
 specific compatible
Message-ID: <20170817215934.tfmlp5thmv4gcylp@rob-hp-laptop>
References: <20170816045053.15492-1-vigneshr@ti.com>
 <20170816045053.15492-2-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170816045053.15492-2-vigneshr@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 16, 2017 at 10:20:49AM +0530, Vignesh R wrote:
> Update binding documentation to add a new compatible for TI 66AK2G SoC,
> to handle TI SoC specific quirks in the driver.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
