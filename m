Message-ID: <55AFC3F0.5050002@atmel.com>
Date: Wed, 22 Jul 2015 18:25:20 +0200
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: <nicolas.ferre@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <shijie.huang@intel.com>, <ben@decadent.org.uk>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
 <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
 <galak@codeaurora.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] mtd: spi-nor: notify (Q)SPI controller about
 protocol change
References: <cover.1437569902.git.cyrille.pitchen@atmel.com>
 <036f143509fed3f303508d1688d68012790f835a.1437569902.git.cyrille.pitchen@atmel.com>
 <201507221541.46135.marex@denx.de>
In-Reply-To: <201507221541.46135.marex@denx.de>
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

Hi Marek,

Le 22/07/2015 15:41, Marek Vasut a écrit :
> On Wednesday, July 22, 2015 at 03:17:06 PM, Cyrille Pitchen wrote:
>> Once the Quad SPI mode has been enabled on a Micron flash memory, this
>> device expects ALL the following commands to use the SPI 4-4-4 protocol.
>> The (Q)SPI controller needs to be notified about the protocol change so it
>> can adapt and keep on dialoging with the Micron memory.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++++++++++
>>  include/linux/mtd/spi-nor.h   | 13 +++++++++++++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d78831b4422b..93627d4e6be8 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -163,6 +163,18 @@ static inline int write_disable(struct spi_nor *nor)
>>  	return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0, 0);
>>  }
>>
>> +/*
>> + * Notify the (Q)SPI controller about the new protocol to be used.
> 
> Hi!
> 
> Can you please just reword this a little, so that it is absolutelly clear
> even to the less bright of us (like me) that this is a notification coming
> from the upper layers (ie. the spi-nor framework) toward the hardware ?
> 
Sure, no problem! what about the following?

/*
 * Let the spi-nor framework notify lower layers, especially the driver of the
 * (Q)SPI controller, about the new protocol to be used. Indeed, once the
 * spi-nor framework has sent manufacturer specific commands to a memory to
 * enable its Quad SPI mode, it should immediately after tell the QSPI
 * controller to use the very same Quad SPI protocol as expected by the memory.
 */

>> + */
>> +static inline int spi_nor_set_protocol(struct spi_nor *nor,
>> +				       enum spi_protocol proto)
>> +{
>> +	if (nor->set_protocol)
>> +		return nor->set_protocol(nor, proto);
>> +
>> +	return 0;
>> +}
>> +
>>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>>  {
>>  	return mtd->priv;
> 
> [...]
> 
> Best regards,
> Marek Vasut
> 
Best regards,

Cyrille
