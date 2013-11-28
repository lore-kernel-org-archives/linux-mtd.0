Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VltOa-0001ZK-D0
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 04:40:08 +0000
Message-ID: <5296C90C.2060306@ti.com>
Date: Thu, 28 Nov 2013 10:09:40 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/17] spi/qspi: Add support to switc to memory mapped
 operation.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-7-git-send-email-sourav.poddar@ti.com>
 <20131126125740.GG14725@sirena.org.uk>
In-Reply-To: <20131126125740.GG14725@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 26 November 2013 06:27 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 01:05:02PM +0530, Sourav Poddar wrote:
>
>> +void enable_qspi_memory_mapped(struct ti_qspi *qspi)
>> +void disable_qspi_memory_mapped(struct ti_qspi *qspi)
> These are driver internal functions so they should be static.  It'd also
> be more normal to put the qspi_ at the start of the name though it's not
> too big a deal.
Ok. will change.
