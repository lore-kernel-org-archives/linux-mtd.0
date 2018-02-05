Date: Mon, 5 Feb 2018 00:08:28 -0600
From: Rob Herring <robh@kernel.org>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
Subject: Re: [PATCH v3] arm64: dts: ls1088a: Add qspi device node for
 ls1088a-rdb
Message-ID: <20180205060828.ubp67qmtn7m3b247@rob-hp-laptop>
References: <1517373888-4716-1-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517373888-4716-1-git-send-email-yogeshnarayan.gaur@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 31, 2018 at 10:14:48AM +0530, Yogesh Gaur wrote:
> Add nodes and properties for QSPI controller.
> Add support for spansion flash, s25fs512s, as slave device for
> QSPI controller.
> 
> Added entry of "fsl,ls1088a-qspi" in fsl-quadspi.txt binding file.
> 
> Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Depends on
>  https://patchwork.ozlabs.org/project/linux-mtd/list/?series=26084
> 
> Changes for v3:
> - Add compatible string for slave nodes.
> Changes for v2:
> - Move property spi-rx-bus-width and spi-tx-bus-width from controller
>   to connected slave device node.
> 
>  .../devicetree/bindings/mtd/fsl-quadspi.txt        |  1 +
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  | 25 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     | 12 +++++++++++
>  3 files changed, 38 insertions(+)

Really the binding should be a separate patch, but no need to respin 
just for that.

Reviewed-by: Rob Herring <robh@kernel.org>
