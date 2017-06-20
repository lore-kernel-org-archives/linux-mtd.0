Date: Mon, 19 Jun 2017 18:01:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stefan Agner <stefan@agner.ch>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, aisheng.dong@nxp.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com,
 han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] clk: imx7d: create clocks behind rawnand clock gate
Message-ID: <20170620010125.GI20170@codeaurora.org>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
 <8b9edf13938e3166081e72ba8fa4ac822035079c.1496961128.git-series.stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b9edf13938e3166081e72ba8fa4ac822035079c.1496961128.git-series.stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/08, Stefan Agner wrote:
> The rawnand clock gate gates two clocks, NAND_USDHC_BUS_CLK_ROOT
> and NAND_CLK_ROOT. However, the gate has been in the chain of the
> latter only. This does not allow to use the NAND_USDHC_BUS_CLK_ROOT
> only, e.g. as required by APBH-Bridge-DMA.
> 
> Add new clocks which represent the clock after the gate, and use a
> shared clock gate to correctly model the hardware.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
