Subject: Re: [PATCH v2 5/5] ARM: dts: AM4372: add entry for qspi mmap region
To: Felipe Balbi <balbi@ti.com>, Rob Herring <robh@kernel.org>
References: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
 <1446545174-14193-6-git-send-email-vigneshr@ti.com>
 <20151105235124.GA2805@rob-hp-laptop> <878u6b1zgg.fsf@saruman.tx.rr.com>
CC: Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>, Michal
 Suchanek <hramrach@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <563C9B36.3010107@ti.com>
Date: Fri, 6 Nov 2015 17:51:10 +0530
MIME-Version: 1.0
In-Reply-To: <878u6b1zgg.fsf@saruman.tx.rr.com>
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



On 11/06/2015 10:44 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Rob Herring <robh@kernel.org> writes:
>> On Tue, Nov 03, 2015 at 03:36:14PM +0530, Vignesh R wrote:
>>> Add qspi memory mapped region entries for AM43xx based SoCs. Also,
>>> update the binding documents for the controller to document this change.
>>>
>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>>
>>> ---
>>>  Documentation/devicetree/bindings/spi/ti_qspi.txt | 5 +++--
>>>  arch/arm/boot/dts/am4372.dtsi                     | 4 +++-
>>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/ti_qspi.txt b/Documentation/devicetree/bindings/spi/ti_qspi.txt
>>> index f05dd631bef1..05488970060b 100644
>>> --- a/Documentation/devicetree/bindings/spi/ti_qspi.txt
>>> +++ b/Documentation/devicetree/bindings/spi/ti_qspi.txt
>>> @@ -17,9 +17,10 @@ Recommended properties:
>>>  
>>>  Example:
>>>  
>>> +For am4372:
>>>  qspi: qspi@4b300000 {
>>> -	compatible = "ti,dra7xxx-qspi";
>>> -	reg = <0x47900000 0x100>, <0x30000000 0x3ffffff>;
>>> +	compatible = "ti,am4372-qspi";
>>> +	reg = <0x47900000 0x100>, <0x30000000 0x4000000>;
>>>  	reg-names = "qspi_base", "qspi_mmap";
>>>  	#address-cells = <1>;
>>>  	#size-cells = <0>;
> 
> and how does the user for this look like ? Don't you need to give this a
> proper 'ranges' binding ?
> 


There are no other users of qspi_mmap region except ti-qspi driver itself:
In probe:
	res_mmap = platform_get_resource_byname(pdev,
			IORESOURCE_MEM, "qspi_mmap");
	qspi->mmap_base = devm_ioremap_resource(&pdev->dev, res_mmap);

and for reading from mmap region:
	memcpy_fromio(buf, qspi->mmap_base + from, len);

-- 
Regards
Vignesh
