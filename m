Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aucuc-0007ky-ET
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 09:34:39 +0000
Subject: Re: [PATCH RFC 4/8] mtd: spi-nor: fix support of Dual (x-y-2) and
 Quad (x-y-4) SPI protocols
To: "R, Vignesh" <vigneshr@ti.com>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
 <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
 <571C5454.5040006@ti.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <marex@denx.de>, <boris.brezillon@free-electrons.com>,
 <nicolas.ferre@atmel.com>, <linux-kernel@vger.kernel.org>
Message-ID: <571DE496.3000108@atmel.com>
Date: Mon, 25 Apr 2016 11:34:14 +0200
MIME-Version: 1.0
In-Reply-To: <571C5454.5040006@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vignesh,

Le 24/04/2016 07:06, R, Vignesh a écrit :
> Hi Cyrille,
> 
> On 4/13/2016 10:53 PM, Cyrille Pitchen wrote:
> [...]
>> @@ -1451,51 +1599,42 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>  	if (np) {
>>  		/* If we were instantiated by DT, use it */
>>  		if (of_property_read_bool(np, "m25p,fast-read"))
>> -			nor->flash_read = SPI_NOR_FAST;
>> +			modes->rd_modes |= SNOR_MODE_1_1_1;
>>  		else
>> -			nor->flash_read = SPI_NOR_NORMAL;
>> +			modes->rd_modes &= ~SNOR_MODE_1_1_1;
>>  	} else {
>>  		/* If we weren't instantiated by DT, default to fast-read */
>> -		nor->flash_read = SPI_NOR_FAST;
>> +		modes->rd_modes |= SNOR_MODE_1_1_1;
>>  	}
>>  
>>  	/* Some devices cannot do fast-read, no matter what DT tells us */
>>  	if (info->flags & SPI_NOR_NO_FR)
>> -		nor->flash_read = SPI_NOR_NORMAL;
>> +		modes->rd_modes &= ~SNOR_MODE_1_1_1;
>>  
>> -	/* Quad/Dual-read mode takes precedence over fast/normal */
>> -	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
>> -		ret = set_quad_mode(nor, info);
>> -		if (ret) {
>> -			dev_err(dev, "quad mode not supported\n");
> 
> Now that the set_quad_mode() is removed, could you explain how spansion
> flash enters SNOR_MODE_1_1_4 mode? Is it bootloader's responsibility to
> flash's set quad enable bit?
> 

The proposed mechanics relies on the struct spi_nor_basic_flash_parameter.
This structure provides the same kind of parameters that those we could find
in JEDEC SFDP (Serial Flash Discoverable Parameters):
- (Fast) Read op codes and protocols supported by the memory and the associated
  number of dummy cycles. More precisely the number of mode clock and wait
  state cycle.
- Page Program op code and protocols.
- Sector/Block Erase op codes and the associated erase size.
- The "Quad Enable Requirements (QER)" which tells us "whether the device 
  contains a Quad Enable (QE) bit used to enable 1-1-4 and 1-4-4 quad read or
  quad program operations" as found in the JESD216B specification and
  implemented here through the optional .enable_quad_io() hook.
- The "4-4-4 mode enable and disable sequences", implemented by the optional
  .enable_4_4_4() hook.
- The optional .enable_2_2_2() hook: the JESD216B specification misses to
  describe this procedure, only used by Micron AFAIK.

For this RFC series, I've only provided a patch (patch 6) for Micron as an
example of the new way to support QSPI memories.
I've already written another patch for the support of Macronix memories but I
didn't publish it yet.

I was waiting for comments on the series to know whether I'm on the good way
before spending much time on writing support to other manufacturers.

For Spansion, the .enable_4_4_4() and .enable_2_2_2() would not be implemented
as Spansion QSPI memories only supports 1-1-2, 1-2-2, 1-1-4 and 1-4-4
protocols. Hence only the .enable_quad_io() hook is needed. This hook should
be implemented using something very closed to the spansion_quad_enable()
function.

So at one side the struct spi_nor_basic_flash_parameter describes the SPI
memory hardware capabilities and SPI protocols it supports.
On the other side, the struct spi_nor_modes allows the caller of spi_nor_scan()
to describe the hardware capabilities of the SPI controller; which SPI
protocols the controller supports and which SPI protocols the user wants to
allow or disable.

As an example, if a QSPI memory has already entered its 4-4-4 mode, you can
still probe the memory from Linux by reading the JEDEC ID as long as you set
the SNOR_MODE_4_4_4 bit in modes.id_modes.
Then, if you don't set the SNOR_MODE_4_4_4 bit in modes.rd_modes but only the
SNOR_MODE_1_1_4 bit, spi_nor_scan() first makes the SPI exit its 4-4-4 mode
then select the SPI 1-1-4 (if supported by the memory) for Fast Read
operations. You can do so if for some reason you'd rather use the SPI 1-1-4
protocol instead of the 4-4-4.

So it's now up to the caller of spi_nor_scan() to tell the framework what
protocols it supports and what protocols it wants to use. The spi-nor framework
will select the best match between the memory and controller hardware
capabilities.

Anyway, thanks for the review! :)

> Regards
> Vignesh
> 

Best regards,

Cyrille
