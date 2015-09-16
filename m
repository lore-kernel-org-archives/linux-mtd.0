Subject: Re: [PATCH 3/5] mtd: devices: m25p80: add support for mmap read
 request
To: Mark Brown <broonie@kernel.org>
References: <1441355402-6837-1-git-send-email-vigneshr@ti.com>
 <1441355402-6837-4-git-send-email-vigneshr@ti.com>
 <20150914182704.GD12027@sirena.org.uk>
CC: Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <hramrach@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <55F93F4F.1010704@ti.com>
Date: Wed, 16 Sep 2015 15:37:11 +0530
MIME-Version: 1.0
In-Reply-To: <20150914182704.GD12027@sirena.org.uk>
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



On 09/14/2015 11:57 PM, Mark Brown wrote:
> On Fri, Sep 04, 2015 at 02:00:00PM +0530, Vignesh R wrote:
> 
>> +	if (spi->master->spi_mtd_mmap_read) {
>> +		return  spi->master->spi_mtd_mmap_read(spi, from, len,
>> +						       retlen, buf,
>> +						       nor->read_opcode,
>> +						       nor->addr_width,
>> +						       dummy);
>> +	}
> 
> We should be calling some API provided by the SPI core here, not peering
> directly into the ops struture.
> 

Ok..
-- 
Regards
Vignesh
