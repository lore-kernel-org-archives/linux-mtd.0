Subject: Re: [PATCH v5 3/5] mtd: devices: m25p80: add support for mmap read
 request
To: Mark Brown <broonie@kernel.org>
References: <1449807000-6457-1-git-send-email-vigneshr@ti.com>
 <1449807000-6457-4-git-send-email-vigneshr@ti.com>
 <20160209193616.GN13270@sirena.org.uk>
CC: Tony Lindgren <tony@atomide.com>, Brian Norris
 <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@arm.linux.org.uk>, <hramrach@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <56BC1D3E.5020203@ti.com>
Date: Thu, 11 Feb 2016 11:03:50 +0530
MIME-Version: 1.0
In-Reply-To: <20160209193616.GN13270@sirena.org.uk>
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



On 02/10/2016 01:06 AM, Mark Brown wrote:
> On Fri, Dec 11, 2015 at 09:39:58AM +0530, Vignesh R wrote:
> 
>> +	if (spi_flash_read_supported(spi)) {
>> +		struct spi_flash_read_message msg;
>> +		int ret;
>> +
>> +		msg.buf = buf;
>> +		msg.from = from;
>> +		msg.len = len;
>> +		msg.read_opcode = nor->read_opcode;
>> +		msg.addr_width = nor->addr_width;
>> +		msg.dummy_bytes = dummy;
>> +		/* TODO: Support other combinations */
>> +		msg.opcode_nbits = SPI_NBITS_SINGLE;
>> +		msg.addr_nbits = SPI_NBITS_SINGLE;
>> +		msg.data_nbits = m25p80_rx_nbits(nor);
>> +
>> +		ret = spi_flash_read(spi, &msg);
>> +		*retlen = msg.retlen;
>> +		return ret;
> 
> Looking at this I can't help but think that spi_flash_read() ought to
> have the stub in rather than the caller.  But given that we're pretty
> much only ever expecting one user I'm not 100% sure it actually matters.

Well, my initial patch set passed long list of arguments to
spi_flash_read(), but Brian suggested to use struct[1] in order to avoid
unnecessary churn when things need changed in the API.


[1] https://lkml.org/lkml/2015/11/11/454

-- 
Regards
Vignesh
