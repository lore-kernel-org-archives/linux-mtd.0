Received: from 212-186-180-163.dynamic.surfer.at ([212.186.180.163]
 helo=cgate.sperl.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4rOP-0004Tz-Pm
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 14:31:27 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <20151201231233.GA1929@sirena.org.uk>
Date: Fri, 4 Dec 2015 15:30:50 +0100
Cc: Michal Suchanek <hramrach@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 =?utf-8?Q?Bean_Huo_=E9=9C=8D=E6=96=8C=E6=96=8C?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5FC39638-EEE0-4CFA-B464-0B4743CB6AB6@sperl.org>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201231233.GA1929@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 02.12.2015, at 00:12, Mark Brown <broonie@kernel.org> wrote:
> 
> On Tue, Dec 01, 2015 at 04:51:06PM -0000, Michal Suchanek wrote:
> 
>> +static inline size_t
>> +spi_max_transfer_size(struct spi_device *spi)
>> +{
>> +	struct spi_master *master = spi->master;
>> +	if (!master->max_transfer_size)
>> +		return 0;
>> +	return master->max_transfer_size(spi);
>> +}
> 
> Can we change this to return SIZE_MAX instead (ie, the maximum value for
> a size_t)?  That way callers don't need to worry if there is a limit, if
> they want to handle it they can just unconditionally assume that a limit
> will be provided.

As I just came across: spi_master.max_dma_len, so I wonder how this 
value would differ from the proposed spi_master.max_transfer_size
on specific HW?

For all practical purposes I would assume both are identical.

Martin
