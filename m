Date: Mon, 15 Oct 2018 14:11:12 -0500
From: Rob Herring <robh@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH 2/3] dt-bindings: cadence-quadspi: Add new compatible for
 AM654 SoC
Message-ID: <20181015191112.GA6923@bogus>
References: <20181003165603.2579-1-vigneshr@ti.com>
 <20181003165603.2579-3-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181003165603.2579-3-vigneshr@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 3 Oct 2018 22:26:02 +0530, Vignesh R wrote:
> AM654 SoC has Cadence Octal SPI controller, which is similar to Cadence
> QSPI controller but supports Octal IO(x8 data lines) and Double Data
> Rate(DDR) mode. Add new compatible to support OSPI controller on TI's
> AM654 SoCs.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
