Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b4u5v-0003NE-Dv
 for linux-mtd@lists.infradead.org; Mon, 23 May 2016 17:56:48 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: disable software protection for
 Macronix flash at startup
To: Matthias Schiffer <mschiffer@universe-factory.net>
References: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
 <57430D4C.3010000@atmel.com>
 <b3d19f59-84c8-1ed2-c3c9-14e6975767e5@universe-factory.net>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, "Felix
 Fietkau" <nbd@nbd.name>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <57434448.1050005@atmel.com>
Date: Mon, 23 May 2016 19:56:24 +0200
MIME-Version: 1.0
In-Reply-To: <b3d19f59-84c8-1ed2-c3c9-14e6975767e5@universe-factory.net>
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

Hi Matthias,

Le 23/05/2016 18:32, Matthias Schiffer a écrit :
> On 05/23/2016 04:01 PM, Cyrille Pitchen wrote:
>> Hi Matthias,
>>
>> Le 18/05/2016 15:32, Matthias Schiffer a écrit :
>>> This patch has been tested in OpenWrt for a few months and seems to work
>>> correctly.
>>>
>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 157841d..d681003 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1304,6 +1304,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  
>>>  	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
>>>  	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
>>> +	    JEDEC_MFR(info) == SNOR_MFR_MACRONIX ||
>>>  	    JEDEC_MFR(info) == SNOR_MFR_SST ||
>>>  	    info->flags & SPI_NOR_HAS_LOCK) {
>>>  		write_enable(nor);
>>>
>> The line following this patch chunk is "write_sr(nor, 0);" however, if I refer
>> to the Macronix mx25l25673g datasheet about the Status Register, bits[5:2]
>> (BP0, BP1, BP2 and BP3) are non-volatile and define the protected area.
>> Also bit6 (Quad Enable) is also non-volatile and is used to reassign #WP and
>> #Hold pins to IO2 and IO3 functions needed by Quad SPI protocols on many other
>> Macronix memories (indeed on the 73g part, the Quad Enable bit is always 1).
>>
>> So you should not write 0 directly into the Status Register if you only want to
>> clear bit7 (Status Register Write Disable): use a read, modify, write sequence
>> instead.
>>
>>
>> Best regards,
>>
>> Cyrille
>>
> 
> Hi,
> clearing the protected area (BP0..BP3) is exactly what this code is
> supposed to do; it was already doing this for Atmel, Intel and SST flash,
> and this patch series makes it behave the same for Macronix and Winbond.
> 
> I see that the mx25l25673g defaults to unprotected according to the
> datasheet, but removing the protection again should not hurt. If there is
> actually a problem with writing 0 to the Quad Enable bit, we can of course
> make this conditional and/or just clear the relevant bits.
> 
> I've observed the mx25l6405d coming up with protection bits set (the
> datasheet doesn't seem to specify the initial state of the bits). It's also
> possible that the software protection is enabled by the bootloader, which I
> can't replace; but I'd argue that the kernel should try to get the flash
> chip into a known state on boot, thus always removing the software protection.
> 
> Most of the setup of the flash chip is done after the "write_sr(nor, 0);"
> in spi_nor_scan(). Do you suspect that "write_sr(nor, 0);" might cause
> problems anyways?

Yes I do: it's likely to prevent us from adding support to the Macronix QPI mode
which use the SPI 4-4-4 protocol. As all other Quad SPI protocols on Macronix
memories, it requires the Quad Enable bit to be set so the #Write Protect, #Hold,
and #Reset functions are disabled and the associated pins are reassigned to
IO2 and IO3 data lines.

Adding proper support of the QPI mode would allow us to handle the case where
the Macronix memory has already entered its QPI mode before spi_nor_scan() is
called. So previous commands (Read JEDEC ID 0xAF, ...) already use the SPI 4-4-4
protocol. Then if you clear the Quad Enable bit in the Status Register:
1 - I don't whether it safely makes the Macronix exit its QPI mode
2 - the spi-nor framework is already configured to use the SPI 4-4-4 but once
    the QE bit is cleared you could no longer use any Quad SPI protocol until
    you set this bit again.

Also let forget the QPI mode for now, the Quad Enable bit is non-volatile:
if you clear it then a spurious reset occurs before the spi-nor framework sets the bit
back, some bootloaders might find the Macronix memory in a unexpected state where
Quad SPI protocols don't work.

Besides, if you just want to clear the BPx bits, there is no need to also clear
the SRWD non-volatile bit at the same time.

I don't think it's good practice to modify non-volatile bits when not needed.

> 
> Regards,
> Matthias
> 

Regards,

Cyrille
