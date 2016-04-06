Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1annku-00055c-UI
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 13:44:26 +0000
Subject: Re: [RESEND][PATCH] mtd: devices: m25p80: add support for mmap read
 request
To: Vignesh R <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>
References: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
 <20160405181427.GA5561@localhost> <57049C31.7090505@ti.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Jagan Teki
 <jteki@openedev.com>, Marek Vasut <marex@denx.de>
Message-ID: <570512A1.7040107@atmel.com>
Date: Wed, 6 Apr 2016 15:44:01 +0200
MIME-Version: 1.0
In-Reply-To: <57049C31.7090505@ti.com>
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

Hi all,

+ Jagan, Marek

Le 06/04/2016 07:18, Vignesh R a écrit :
> Hi,
> 
> On 04/05/2016 11:44 PM, Brian Norris wrote:
>> + Mark, Cyrille
>>
>> On Tue, Mar 29, 2016 at 11:16:17AM +0530, Vignesh R wrote:
>>> Certain SPI controllers may provide accelerated hardware interface to
>>> read from m25p80 type flash devices in order to provide better read
>>> performance. SPI core supports such devices with spi_flash_read() API.
>>> Call spi_flash_read(), if supported, to make use of such interface.
>>>
>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>>> ---
>>
>> Applied, with a small diff.
>>
>>> Resend v5:
>>> Rebased on top of v4.6-rc1
>>> v5: http://www.spinics.net/lists/devicetree/msg106696.html
>>>
>>>  drivers/mtd/devices/m25p80.c | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>>> index c9c3b7fa3051..7730e633d7d3 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -131,6 +131,26 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>>  	/* convert the dummy cycles to the number of bytes */
>>>  	dummy /= 8;
>>>  
>>> +	if (spi_flash_read_supported(spi)) {
>>> +		struct spi_flash_read_message msg;
>>> +		int ret;
>>> +
>>
>> I added a memset(&msg, 0, sizeof(msg)), since spi_flash_read() doesn't
>> guarantee msg.retlen is zeroed for failures. 
> 
> Thanks!
> 
>> Do we want a
>> spi_flash_read_message_init() function, to mirror spi_message_init()?
>>
> 
> Not sure, there is nothing much to initialize (apart from memset msg to
> zero), all fields are expected to explicitly populated by MTD flash driver.
> 
>>> +		msg.buf = buf;
>>> +		msg.from = from;
>>> +		msg.len = len;
>>> +		msg.read_opcode = nor->read_opcode;
>>> +		msg.addr_width = nor->addr_width;
>>> +		msg.dummy_bytes = dummy;
>>> +		/* TODO: Support other combinations */
>>
>> Speaking of "other combinations": does the TI QSPI controller support
>> MMAP'ed read modes other than 1/1/{1,2,4}? It doesn't seem to implement
>> support, and the SPI core doesn't handle this. So if we merge any of
>> Cyrille's work on other modes, then this is going to break quickly.
>>
> 
> No, TI QSPI only supports 1/1/{1,2,4} mode in MMAP'ed mode or in normal
> SPI mode. This is specified in DT as:
> 			spi-tx-bus-width = <1>;
> inside m25p80 slave node. This indicates that cmd,addr are always on D0
> line only.
> AFAIK, Cyrille's series starts using 4-4-4/2-2-2/ etc only if the flash
>  was  initially configured to be in that mode by bootloader/ROM code. If
> flash's bit to enter 4-4-4 is not set, then there will be no change and
> m25p80 continues to use 1-1-4 format for QUAD read. Therefore I don't
> think those patches will break TI QSPI. I will try and test that series
> on top of this patch sometime soon.
> 

Correct, the series I've submitted tries to be conservative an doesn't enable
the 4-4-4 or 2-2-2 modes itself. However if one of those modes is already
enabled by some early bootloader, the spi-nor can now adapt.

Indeed, if the memory has already entered its 4-4-4 or 2-2-2 mode when
spi_nor_scan() is called:
- either the QSPI controller doesn't support this mode so the issue is likely
  to be located in some early bootloader or in some non-volatile bit of a
  Configuration Register inside the QSPI memory.
- or the SPI controller supports this mode, which is verified when the JEDEC ID
  is successfully read.

I've also send a patch dedicated to the m25p80 driver introducing a helper
function to convert the enum spi_nor_protocol into a (code_nbits, addr_nbits,
data_nbits):

+static inline int m25p80_proto2nbits(enum spi_nor_protocol proto,
+				      unsigned *code_nbits,
+				      unsigned *addr_nbits,
+				      unsigned *data_nbits)
+{
+	if (code_nbits)
+		*code_nbits = SNOR_PROTO_CODE_FROM_PROTO(proto);
+	if (addr_nbits)
+		*addr_nbits = SNOR_PROTO_ADDR_FROM_PROTO(proto);
+	if (data_nbits)
+	*data_nbits = SNOR_PROTO_DATA_FROM_PROTO(proto);
+
+	return 0;
+}
+

Then I guess updating Vignesh's patch this way should be enough:

 	if (spi_flash_read_supported(spi)) {
 		struct spi_flash_read_message msg;
+		unsigned code_nbits, addr_nbits, data_nbits;
 		int ret;
 
+		ret = m25p80_proto2nbits(nor->read_proto,
+					 &code_nbits,
+					 &addr_nbits,
+					 &data_nbits);
[...]
 		msg.dummy_bytes = dummy;
-		/* TODO: Support other combinations */
-		msg.opcode_nbits = SPI_NBITS_SINGLE;
-		msg.addr_nbits = SPI_NBITS_SINGLE;
-		msg.data_nbits = m25p80_rx_nbits(nor);
+		msg.op_code_nbits = code_nbits;
+		msg.addr_nbits = addr_nbits;
+		msg.data_nbits = data_nbits;


I plan to do things more incrementally to ease the code review. To my next
series of patches to add support to the 4-4-4 and 2-2-2 modes should be limited
to only two patches. The first to fix the read of the JEDEC ID, guessing at the
same time the current mode (1-y-z, 2-2-2 or 4-4-4). Then the second dedicated
to the m25p80.c driver, the patch I've already sent to add support of SPI
protocols other than 1-1-1 and 1-1-4 for read_reg, write_reg, read, write and
erase operations.

I will remove manufacturer specific patches for the moment though some of them
should be needed later. For instance, the Spansion w25q16fw datasheet claims
this memory only supports 0Bh and EBh op codes for Fast Read operations in
4-4-4 (QPI) mode but not the 6Bh op code as currently used by the spi-nor
framework for QSPI support.

Since I rebase my series of 2 patches on my other series of patches for 4byte-
address dedicated op codes, I first wait for the later series to be accepted
before sending the new QSPI series. Then, If Vignesh's patch is also accepted,
I should be able to update my m25p80.c patch to take the spi_flash_read()
modifications into account as explained earlier.

One future modification I'm currently thinking about would be to replace the
enum read_mode argument of spi_nor_scan() by two bitmask arguments, one
for the list of SPI protocols supported by the (Q)SPI controller for (Fast)
Read operations, the other for the list of SPI protocols supported by the
controller for Page Program operations.
These two bitmasks could then be AND'ed with equivalent bitmasks provided
by the spi_nor_ids[] entries through a pointer to a structure like:

struct spi_nor_flash_proto {
	u32	supported_read_protocols;
	u32	supported_write_protocols;
	u8	read_1_1_1_opcode; /* 3-byte address versions */
	u8	read_1_1_2_opcode;
	u8	read_1_1_4_opcode;
	u8	read_1_2_2_opcode;
	u8	read_1_4_4_opcode;
	u8	read_2_2_2_opcode;
	u8	read_4_4_4_opcode;
	u8	write_1_1_1_opcode;
	u8	write_1_1_2_opcode;
	u8	write_1_1_4_opcode;
	u8	write_1_2_2_opcode;
	u8	write_1_4_4_opcode;
	...
};

It might look redundant with some SFDP tables but since these tables are
optional we can not always rely on them. Also they happen to be buggy as well.
Also it's likely that for a given manufacturer, most (but likely not all)
entries in the spi_nor_ids[] array would points to the same structure instance.
Hence it should not need to much memory.

In u-boot, Jagan already used the logical AND operation on two bitmasks to
select the best protocol supported by both the memory and the controller.
IMHO, it was a clever idea :)

However to build the two bitmasks describing the SPI protocols supported by
the SPI controller, the two "spi-tx-bus-width" and "spi-rx-bus-width" DT
properties alone don't allow us to make the difference between the 1-4-4 and
4-4-4 protocols. Some SPI controllers might support only the 1-4-4 protocol
whereas others would want to use the 4-4-4 protocol when supported by the
memory.

But maybe this proposal is out of topic for now and should be discussed in
an other thread.

Best regards,

Cyrille
