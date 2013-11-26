Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlIR5-0003PJ-PG
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 13:12:16 +0000
Message-ID: <52949E0C.20203@ti.com>
Date: Tue, 26 Nov 2013 18:41:40 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 11/17] spi/qspi: set "mmap" flag to true.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-12-git-send-email-sourav.poddar@ti.com>
 <20131126131029.GI14725@sirena.org.uk>
In-Reply-To: <20131126131029.GI14725@sirena.org.uk>
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

On Tuesday 26 November 2013 06:40 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 01:05:07PM +0530, Sourav Poddar wrote:
>> Set mmap flag to true to indicate that the qspi controller
>> supports memory mapped operations.
> Please combine some of these patches - adding the mmap support and then
> separately adding this flag isn't really helping bisection, just have
> one patch enabling support for mmap in the driver.  Similarly adding
> internal functions to the driver with no users and then separately
> adding the users isn't really adding much.
Sure, I will do that in my next version.
