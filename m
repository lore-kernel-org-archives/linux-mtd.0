Subject: Re: [PATCH v2 2/5] spi: spi-ti-qspi: add mmap mode read support
To: Mark Brown <broonie@kernel.org>
References: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
 <1446545174-14193-3-git-send-email-vigneshr@ti.com>
 <20151104144112.GJ1717@sirena.org.uk>
CC: Tony Lindgren <tony@atomide.com>, Michal Suchanek <hramrach@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <563AF429.1000406@ti.com>
Date: Thu, 5 Nov 2015 11:46:09 +0530
MIME-Version: 1.0
In-Reply-To: <20151104144112.GJ1717@sirena.org.uk>
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



On 11/04/2015 08:11 PM, Mark Brown wrote:
> On Tue, Nov 03, 2015 at 03:36:11PM +0530, Vignesh R wrote:
> 
>> +	ti_qspi_enable_memory_map(spi);
>> +	ti_qspi_setup_mmap_read(spi, read_opcode, addr_width,
>> +				dummy_bytes);
>> +	memcpy_fromio(buf, qspi->mmap_base + from, len);
>> +	*retlen = len;
>> +	ti_qspi_disable_memory_map(spi);
> 
> We'll be constantly enabling and disabling memory mapping with this.
> I'm not sure that's a meaningful cost given that it doesn't actually
> remap anything but rather just switches hardware modes, we can always
> optimise it later if it is.
> 

Hmm, I will move the ti_qspi_disable_memory_map() call to
ti_qspi_start_transfer_one(), so that mmap mode is disabled only when
normal SPI bus transfer is requested. Further, "mmap_enabled" status
flag can be used to determine whether mode switch is required or not.
This should help to overcome enabling and disabling memory mapping
between successive mmap read requests.

-- 
Regards
Vignesh
