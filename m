Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VltWH-0001jL-A8
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 04:48:05 +0000
Message-ID: <5296CAEA.3030002@ti.com>
Date: Thu, 28 Nov 2013 10:17:38 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 02/17] spi/spi.h: Add configure from slave support.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-3-git-send-email-sourav.poddar@ti.com>
 <20131126102951.GX14725@sirena.org.uk> <52948451.3060706@ti.com>
 <20131126122159.GB14725@sirena.org.uk>
In-Reply-To: <20131126122159.GB14725@sirena.org.uk>
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

On Tuesday 26 November 2013 05:51 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 04:51:53PM +0530, Sourav Poddar wrote:
>> On Tuesday 26 November 2013 03:59 PM, Mark Brown wrote:
>>>> +	void	(*configure_from_slave)(struct spi_device *spi, u8 *val);
>>> Clearly this is far too unstructured to be useful, this is only ever
>>> going to work with one specific combination of slave and master since
>>> there's absolutely no semantics defined.
>> I thought "val" might be good enuf, and this can be filled with whatever
>> data that need to be used from slave into master(irrespective of
>> slave and master?).
> The name isn't the issue, it's the fact that you're passing a completely
> unspecified blob of data.
May be, what you are suggesting here is to we should define a flash 
information
structure and should pass that structure here ?
