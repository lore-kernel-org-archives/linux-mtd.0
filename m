Date: Wed, 9 Aug 2017 19:10:21 -0500
From: Rob Herring <robh@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] mtd: spi-nor: cadence-quadspi: Add support to enable
 loopback clock circuit
Message-ID: <20170810001021.ayygkgy6xwnrxghl@rob-hp-laptop>
References: <20170801045434.8733-1-vigneshr@ti.com>
 <20170801045434.8733-3-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170801045434.8733-3-vigneshr@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 01, 2017 at 10:24:29AM +0530, Vignesh R wrote:
> Cadence QSPI IP has a adapted loopback circuit which can be enabled by
> setting BYPASS field to 0 in READCAPTURE register. It enables use of
> QSPI return clock to latch the data rather than the internal QSPI
> reference clock. For high speed operations, adapted loopback circuit
> using QSPI return clock helps to increase data valid window.
> 
> Add DT parameter cdns,rclk-en to help enable adapted loopback circuit
> for boards which do have QSPI return clock provided.
> This patch also modifies cqspi_readdata_capture() function's bypass
> parameter to bool to match how its used in the function.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 3 +++
>  drivers/mtd/spi-nor/cadence-quadspi.c                     | 8 ++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)

Please separate bindings to a separate patch or patches.

Rob
