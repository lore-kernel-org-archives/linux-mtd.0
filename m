Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxIes-0008Bz-7z
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 19:38:00 +0000
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4BBA1675FE
 for <linux-mtd@lists.infradead.org>; Sun,  9 Apr 2017 21:37:22 +0200 (CEST)
Subject: Re: [PATCH v5 2/6] mtd: m25p80: add support of SPI 1-2-2 and 1-4-4
 protocols
To: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 jartur@cadence.com, kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <3426fd033830e2df15eae27c1b5284983961fa8e.1490220411.git.cyrille.pitchen@atmel.com>
 <49375a87-5eca-a1c3-26f9-81075dd9c7f9@gmail.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <af1c3082-534c-befb-4e05-b8d94a6da5d6@wedev4u.fr>
Date: Sun, 9 Apr 2017 21:37:08 +0200
MIME-Version: 1.0
In-Reply-To: <49375a87-5eca-a1c3-26f9-81075dd9c7f9@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Le 07/04/2017 à 01:37, Marek Vasut a écrit :
> On 03/23/2017 12:33 AM, Cyrille Pitchen wrote:
>> Before this patch, m25p80_read() supported few SPI protocols:
>> - regular SPI 1-1-1
>> - SPI Dual Output 1-1-2
>> - SPI Quad Output 1-1-4
>> On the other hand, m25p80_write() only supported SPI 1-1-1.
>>
>> This patch updates both m25p80_read() and m25p80_write() functions to let
>> them support SPI 1-2-2 and SPI 1-4-4 protocols for Fast Read and Page
>> Program SPI commands.
>>
>> It adopts a conservative approach to avoid regressions. Hence the new
>                                              ^ FYI, regression != bug
> 
>> implementations try to be as close as possible to the old implementations,
>> so the main differences are:
>> - the tx_nbits values now being set properly for the spi_transfer
>>   structures carrying the (op code + address/dummy) bytes
>> - and the spi_transfer structure being split into 2 spi_transfer
>>   structures when the numbers of I/O lines are different for op code and
>>   for address/dummy byte transfers on the SPI bus.
>>
>> Besides, the current spi-nor framework supports neither the SPI 2-2-2 nor
>> the SPI 4-4-4 protocols. So, for now, we don't need to update the
>> m25p80_{read|write}_reg() functions as SPI 1-1-1 is the only one possible
>> protocol.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>>  drivers/mtd/devices/m25p80.c | 120 ++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 90 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 68986a26c8fe..64d562efc25d 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -34,6 +34,19 @@ struct m25p {
>>  	u8			command[MAX_CMD_SIZE];
>>  };
>>  
>> +static inline void m25p80_proto2nbits(enum spi_nor_protocol proto,
>> +				      unsigned int *inst_nbits,
>> +				      unsigned int *addr_nbits,
>> +				      unsigned int *data_nbits)
>> +{
> 
> Why don't we just have some generic macros to extract the number of bits
> from $proto ?
>

from Documentation/process/coding-style.rst:
"Generally, inline functions are preferable to macros resembling functions."

inline functions provide better type checking of their arguments and/or
returned value than macros.

Type checking is also the reason I have chosen to create the 'enum
spi_nor_protocol' rather than using constant macros.

>> +	if (inst_nbits)
>> +		*inst_nbits = spi_nor_get_protocol_inst_width(proto);
>> +	if (addr_nbits)
>> +		*addr_nbits = spi_nor_get_protocol_addr_width(proto);
>> +	if (data_nbits)
>> +		*data_nbits = spi_nor_get_protocol_data_width(proto);
>> +}
>> +
>>  static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
>>  {
>>  	struct m25p *flash = nor->priv;
>> @@ -78,11 +91,16 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>  {
>>  	struct m25p *flash = nor->priv;
>>  	struct spi_device *spi = flash->spi;
>> -	struct spi_transfer t[2] = {};
>> +	unsigned int inst_nbits, addr_nbits, data_nbits, data_idx;
>> +	struct spi_transfer t[3] = {};
>>  	struct spi_message m;
>>  	int cmd_sz = m25p_cmdsz(nor);
>>  	ssize_t ret;
>>  
>> +	/* get transfer protocols. */
>> +	m25p80_proto2nbits(nor->write_proto, &inst_nbits,
>> +			   &addr_nbits, &data_nbits);
>> +
>>  	spi_message_init(&m);
>>  
>>  	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>> @@ -92,12 +110,27 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>  	m25p_addr2cmd(nor, to, flash->command);
>>  
>>  	t[0].tx_buf = flash->command;
>> +	t[0].tx_nbits = inst_nbits;
>>  	t[0].len = cmd_sz;
>>  	spi_message_add_tail(&t[0], &m);
>>  
>> -	t[1].tx_buf = buf;
>> -	t[1].len = len;
>> -	spi_message_add_tail(&t[1], &m);
>> +	/* split the op code and address bytes into two transfers if needed. */
>> +	data_idx = 1;
>> +	if (addr_nbits != inst_nbits) {
>> +		t[0].len = 1;
>> +
>> +		t[1].tx_buf = &flash->command[1];
>> +		t[1].tx_nbits = addr_nbits;
>> +		t[1].len = cmd_sz - 1;
>> +		spi_message_add_tail(&t[1], &m);
>> +
>> +		data_idx = 2;
>> +	}
>> +
>> +	t[data_idx].tx_buf = buf;
>> +	t[data_idx].tx_nbits = data_nbits;
>> +	t[data_idx].len = len;
>> +	spi_message_add_tail(&t[data_idx], &m);
>>  
>>  	ret = spi_sync(spi, &m);
>>  	if (ret)
>> @@ -109,18 +142,6 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>  	return ret;
>>  }
>>  
>> -static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>> -{
>> -	switch (nor->read_proto) {
>> -	case SNOR_PROTO_1_1_2:
>> -		return 2;
>> -	case SNOR_PROTO_1_1_4:
>> -		return 4;
>> -	default:
>> -		return 0;
>> -	}
>> -}
>> -
>>  /*
>>   * Read an address range from the nor chip.  The address range
>>   * may be any size provided it is within the physical boundaries.
>> @@ -130,13 +151,19 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  {
>>  	struct m25p *flash = nor->priv;
>>  	struct spi_device *spi = flash->spi;
>> -	struct spi_transfer t[2];
>> +	unsigned int inst_nbits, addr_nbits, data_nbits, data_idx;
>> +	struct spi_transfer t[3];
>>  	struct spi_message m;
>>  	unsigned int dummy = nor->read_dummy;
>>  	ssize_t ret;
>> +	int cmd_sz;
>> +
>> +	/* get transfer protocols. */
>> +	m25p80_proto2nbits(nor->read_proto, &inst_nbits,
>> +			   &addr_nbits, &data_nbits);
>>  
>>  	/* convert the dummy cycles to the number of bytes */
>> -	dummy /= 8;
>> +	dummy = (dummy * addr_nbits) / 8;
>>  
>>  	if (spi_flash_read_supported(spi)) {
>>  		struct spi_flash_read_message msg;
>> @@ -149,10 +176,9 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  		msg.read_opcode = nor->read_opcode;
>>  		msg.addr_width = nor->addr_width;
>>  		msg.dummy_bytes = dummy;
>> -		/* TODO: Support other combinations */
>> -		msg.opcode_nbits = SPI_NBITS_SINGLE;
>> -		msg.addr_nbits = SPI_NBITS_SINGLE;
>> -		msg.data_nbits = m25p80_rx_nbits(nor);
>> +		msg.opcode_nbits = inst_nbits;
>> +		msg.addr_nbits = addr_nbits;
>> +		msg.data_nbits = data_nbits;
>>  
>>  		ret = spi_flash_read(spi, &msg);
>>  		if (ret < 0)
>> @@ -167,20 +193,45 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  	m25p_addr2cmd(nor, from, flash->command);
>>  
>>  	t[0].tx_buf = flash->command;
>> +	t[0].tx_nbits = inst_nbits;
>>  	t[0].len = m25p_cmdsz(nor) + dummy;
>>  	spi_message_add_tail(&t[0], &m);
>>  
>> -	t[1].rx_buf = buf;
>> -	t[1].rx_nbits = m25p80_rx_nbits(nor);
>> -	t[1].len = min3(len, spi_max_transfer_size(spi),
>> -			spi_max_message_size(spi) - t[0].len);
>> -	spi_message_add_tail(&t[1], &m);
>> +	/*
>> +	 * Set all dummy/mode cycle bits to avoid sending some manufacturer
>> +	 * specific pattern, which might make the memory enter its Continuous
>> +	 * Read mode by mistake.
>> +	 * Based on the different mode cycle bit patterns listed and described
>> +	 * in the JESD216B speficication, the 0xff value works for all memories
>                            ^
>                            specification, typo
> 

good catch :)

Best regards,

Cyrille

>> +	 * and all manufacturers.
>> +	 */
>> +	cmd_sz = t[0].len;
>> +	memset(flash->command + cmd_sz - dummy, 0xff, dummy);
>> +
>> +	/* split the op code and address bytes into two transfers if needed. */
>> +	data_idx = 1;
>> +	if (addr_nbits != inst_nbits) {
>> +		t[0].len = 1;
>> +
>> +		t[1].tx_buf = &flash->command[1];
>> +		t[1].tx_nbits = addr_nbits;
>> +		t[1].len = cmd_sz - 1;
>> +		spi_message_add_tail(&t[1], &m);
>> +
>> +		data_idx = 2;
>> +	}
>> +
>> +	t[data_idx].rx_buf = buf;
>> +	t[data_idx].rx_nbits = data_nbits;
>> +	t[data_idx].len = min3(len, spi_max_transfer_size(spi),
>> +			       spi_max_message_size(spi) - cmd_sz);
>> +	spi_message_add_tail(&t[data_idx], &m);
>>  
>>  	ret = spi_sync(spi, &m);
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = m.actual_length - m25p_cmdsz(nor) - dummy;
>> +	ret = m.actual_length - cmd_sz;
>>  	if (ret < 0)
>>  		return -EIO;
>>  	return ret;
>> @@ -223,11 +274,20 @@ static int m25p_probe(struct spi_device *spi)
>>  	spi_set_drvdata(spi, flash);
>>  	flash->spi = spi;
>>  
>> -	if (spi->mode & SPI_RX_QUAD)
>> +	if (spi->mode & SPI_RX_QUAD) {
>>  		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>> -	else if (spi->mode & SPI_RX_DUAL)
>> +
>> +		if (spi->mode & SPI_TX_QUAD)
>> +			hwcaps.mask |= (SNOR_HWCAPS_READ_1_4_4 |
>> +					SNOR_HWCAPS_PP_1_1_4 |
>> +					SNOR_HWCAPS_PP_1_4_4);
>> +	} else if (spi->mode & SPI_RX_DUAL) {
>>  		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>  
>> +		if (spi->mode & SPI_TX_DUAL)
>> +			hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
>> +	}
>> +
>>  	if (data && data->name)
>>  		nor->mtd.name = data->name;
>>  
>>
> 
> 
