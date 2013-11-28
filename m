Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VltNg-0001Y8-Pc
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 04:39:13 +0000
Message-ID: <5296C8D4.80004@ti.com>
Date: Thu, 28 Nov 2013 10:08:44 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 09/17] spi/spi.h: Add "mem" variable in spi master.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-10-git-send-email-sourav.poddar@ti.com>
 <20131126130119.GH14725@sirena.org.uk> <52949C9F.10008@ti.com>
 <20131126132051.GO14725@sirena.org.uk>
In-Reply-To: <20131126132051.GO14725@sirena.org.uk>
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

On Tuesday 26 November 2013 06:50 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 06:35:35PM +0530, Sourav Poddar wrote:
>> On Tuesday 26 November 2013 06:31 PM, Mark Brown wrote:
>>> Is this really generic enough to put here rather than in the driver
>>> data?
>> The thought behind this was that if a master controller supports
>> memory mapped operation and slave wants to use memcpy in his
>> driver(bypassing spi ), then we should have a mean to communicate
>> between the
>> master and the slave. So, 'spi_master' seems to be the place for me
>> for this data,
>> which could be parsed in the slave side also.
> I would have expected that the address would be returned by the function
> that maps the buffer in rather than stored permanently in the master.
Yes, it could be be done the above way. I will change.
