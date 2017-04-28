Date: Fri, 28 Apr 2017 12:13:37 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@atmel.com, mark.rutland@arm.com,
 shawnguo@kernel.org, kernel@pengutronix.de, han.xu@nxp.com,
 fabio.estevam@freescale.com, LW@KARO-electronics.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] mtd: gpmi: document current clock requirements
Message-ID: <20170428171337.23jti5634myafw65@rob-hp-laptop>
References: <20170422012338.4635-1-stefan@agner.ch>
 <20170422012338.4635-4-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170422012338.4635-4-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 21, 2017 at 06:23:36PM -0700, Stefan Agner wrote:
> The clock requirements are completely missing, add the clocks
> currently required by the driver.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
