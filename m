Message-ID: <55BEF5D1.1050608@ti.com>
Date: Mon, 3 Aug 2015 10:32:09 +0530
From: Vignesh R <vigneshr@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@arm.linux.org.uk>,
 Huang Shijie <b32955@freescale.com>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [RFC PATCH 4/5] ARM: dts: DRA7: Add memory map region entries
 for qspi
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
 <1438072876-16338-5-git-send-email-vigneshr@ti.com>
 <20150731181903.GN20873@sirena.org.uk>
In-Reply-To: <20150731181903.GN20873@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/31/2015 11:49 PM, Mark Brown wrote:
> On Tue, Jul 28, 2015 at 02:11:15PM +0530, Vignesh R wrote:
>> Add qspi memory mapped region entries for DRA7xx based SoCs.
>>
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
> 
>>  		qspi: qspi@47900000 {
>>  			compatible = "ti,am4372-qspi";
>> -			reg = <0x47900000 0x100>;
>> +			reg = <0x47900000 0x100>,
>> +			      <0x30000000 0x3ffffff>;
>> +			reg-names = "qspi_base", "qspi_mmap";
> 
> The DT binding document for the controller needs to be extended to
> document this change in the binding.
> 

DT bindings are already documented at
Documentation/devicetree/bindings/spi/ti_qspi.txt. Did you mean to add
this node as an example in that file?

-- 
Regards
Vignesh
