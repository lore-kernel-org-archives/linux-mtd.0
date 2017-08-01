Subject: Re: [PATCH 0/7] K2G: Add QSPI support
To: Vignesh R <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20170801045434.8733-1-vigneshr@ti.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <29c0e8ec-1f9f-cfc9-2d0e-e4d31890b699@oracle.com>
Date: Tue, 1 Aug 2017 11:01:43 -0700
MIME-Version: 1.0
In-Reply-To: <20170801045434.8733-1-vigneshr@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/31/2017 9:54 PM, Vignesh R wrote:
> This series adds support for Cadence QSPI for 66AK2G SoC. The first
> three patches enhance the cadence-quadspi driver to support loopback
> clock and pm_runtime and tweaks for 66AK2G SoC. Remaining patches add
> DT nodes and enable the driver in defconfig.
> 
> Tested on 66AK2G GP and ICE boards.
> 
> Vignesh R (7):
>    mtd: spi-nor: cadence-quadspi: add a delay in write sequence
>    mtd: spi-nor: cadence-quadspi: Add support to enable loopback clock
>      circuit
>    mtd: spi-nor: cadence-quadspi: Add runtime PM support
>    ARM: dts: keystone-k2g: Add QSPI DT entry
>    ARM: dts: keystone-k2g-evm: Add QSPI node
>    ARM: dts: keystone-k2g-ice: Add QSPI node
>    ARM: configs: keystone: Enable Cadence QSPI driver
> 
Please separate dts and driver patches in its own series
while posting next time since they go throgh different
subsystem trees. Get your driver patch queed
first before adding DTS and enabling config option.

Regards,
Santosh
