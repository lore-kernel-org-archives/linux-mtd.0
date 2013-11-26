Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlIL5-0003Fm-3g
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 13:06:03 +0000
Message-ID: <52949C9F.10008@ti.com>
Date: Tue, 26 Nov 2013 18:35:35 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 09/17] spi/spi.h: Add "mem" variable in spi master.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-10-git-send-email-sourav.poddar@ti.com>
 <20131126130119.GH14725@sirena.org.uk>
In-Reply-To: <20131126130119.GH14725@sirena.org.uk>
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

On Tuesday 26 November 2013 06:31 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 01:05:05PM +0530, Sourav Poddar wrote:
>> Add "mem" variable in spi_master, which can be used to hold on the
>> memory mapped address.
> Is this really generic enough to put here rather than in the driver
> data?
The thought behind this was that if a master controller supports
memory mapped operation and slave wants to use memcpy in his
driver(bypassing spi ), then we should have a mean to communicate 
between the
master and the slave. So, 'spi_master' seems to be the place for me for 
this data,
which could be parsed in the slave side also.
