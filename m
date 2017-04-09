Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxJsz-0000Nq-Rg
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 20:56:39 +0000
Received: by mail-wm0-x244.google.com with SMTP id x75so6592040wma.1
 for <linux-mtd@lists.infradead.org>; Sun, 09 Apr 2017 13:56:16 -0700 (PDT)
Subject: Re: [PATCH v5 2/6] mtd: m25p80: add support of SPI 1-2-2 and 1-4-4
 protocols
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 jartur@cadence.com, kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <3426fd033830e2df15eae27c1b5284983961fa8e.1490220411.git.cyrille.pitchen@atmel.com>
 <49375a87-5eca-a1c3-26f9-81075dd9c7f9@gmail.com>
 <af1c3082-534c-befb-4e05-b8d94a6da5d6@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <10463831-9caf-f9df-ea15-2b77e01bd4b5@gmail.com>
Date: Sun, 9 Apr 2017 22:46:30 +0200
MIME-Version: 1.0
In-Reply-To: <af1c3082-534c-befb-4e05-b8d94a6da5d6@wedev4u.fr>
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

On 04/09/2017 09:37 PM, Cyrille Pitchen wrote:
> Hi Marek,
> 
> Le 07/04/2017 à 01:37, Marek Vasut a écrit :
>> On 03/23/2017 12:33 AM, Cyrille Pitchen wrote:
>>> Before this patch, m25p80_read() supported few SPI protocols:
>>> - regular SPI 1-1-1
>>> - SPI Dual Output 1-1-2
>>> - SPI Quad Output 1-1-4
>>> On the other hand, m25p80_write() only supported SPI 1-1-1.
>>>
>>> This patch updates both m25p80_read() and m25p80_write() functions to let
>>> them support SPI 1-2-2 and SPI 1-4-4 protocols for Fast Read and Page
>>> Program SPI commands.
>>>
>>> It adopts a conservative approach to avoid regressions. Hence the new
>>                                              ^ FYI, regression != bug
>>
>>> implementations try to be as close as possible to the old implementations,
>>> so the main differences are:
>>> - the tx_nbits values now being set properly for the spi_transfer
>>>   structures carrying the (op code + address/dummy) bytes
>>> - and the spi_transfer structure being split into 2 spi_transfer
>>>   structures when the numbers of I/O lines are different for op code and
>>>   for address/dummy byte transfers on the SPI bus.
>>>
>>> Besides, the current spi-nor framework supports neither the SPI 2-2-2 nor
>>> the SPI 4-4-4 protocols. So, for now, we don't need to update the
>>> m25p80_{read|write}_reg() functions as SPI 1-1-1 is the only one possible
>>> protocol.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> ---
>>>  drivers/mtd/devices/m25p80.c | 120 ++++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 90 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>>> index 68986a26c8fe..64d562efc25d 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -34,6 +34,19 @@ struct m25p {
>>>  	u8			command[MAX_CMD_SIZE];
>>>  };
>>>  
>>> +static inline void m25p80_proto2nbits(enum spi_nor_protocol proto,
>>> +				      unsigned int *inst_nbits,
>>> +				      unsigned int *addr_nbits,
>>> +				      unsigned int *data_nbits)
>>> +{
>>
>> Why don't we just have some generic macros to extract the number of bits
>> from $proto ?
>>
> 
> from Documentation/process/coding-style.rst:
> "Generally, inline functions are preferable to macros resembling functions."
> 
> inline functions provide better type checking of their arguments and/or
> returned value than macros.
> 
> Type checking is also the reason I have chosen to create the 'enum
> spi_nor_protocol' rather than using constant macros.

That part I get (no, not really [1], inline is compiler _hint_ and for
static function, the compiler is smart enough to figure out it should
inline it, so drop it. Also cf. __always_inline).

What I don't quite get is why don't we just encode the proto as ie.

#define PROTO_1_1_4 0x00010204 /* (== BIT(16) | BIT(8) | BIT(2)) */

in which case this whole function would turn into constant-time

return (proto >> (n * 8)) & 0xff;

where n is 0 for data, 1 for address , 2 for command .

[1] https://lwn.net/Articles/166172/

>>> +	if (inst_nbits)
>>> +		*inst_nbits = spi_nor_get_protocol_inst_width(proto);
>>> +	if (addr_nbits)
>>> +		*addr_nbits = spi_nor_get_protocol_addr_width(proto);
>>> +	if (data_nbits)
>>> +		*data_nbits = spi_nor_get_protocol_data_width(proto);
>>> +}
>>> +
[...]

-- 
Best regards,
Marek Vasut
