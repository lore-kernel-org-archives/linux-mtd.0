Date: Thu, 8 Oct 2015 16:33:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: shawn.guo@linaro.org, kernel@pengutronix.de, mark.rutland@arm.com,
 boris.brezillon@free-electrons.com, aaron@tastycactus.com,
 marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 bpringlemeir@gmail.com, linux-kernel@vger.kernel.org,
 albert.aribaud@3adev.fr, klimov.linux@gmail.com,
 sebastian@breakpoint.cc, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 galak@codeaurora.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, devicetree@vger.kernel.org,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH v13 1/2] ARM: dts: vf610twr: add NAND flash controller
 peripherial
Message-ID: <20151008083340.GA22946@tiger>
References: <1444262316-30588-1-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444262316-30588-1-git-send-email-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 07, 2015 at 04:58:35PM -0700, Stefan Agner wrote:
> This adds the NAND flash controller (NFC) peripherial. The driver
> supports the SLC NAND chips found on Freescale's Vybrid Tower System
> Module. The Micron NAND chip on the module needs 4-bit ECC per 512
> byte page. Use 24-bit ECC per 2k page, which is supported by the
> driver.
> 
> Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
> Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied both, thanks.

Stefan,

In the future, please use my new email address which has been updated to
MAINTAINERS for a couple of release cycles.

Shawn
