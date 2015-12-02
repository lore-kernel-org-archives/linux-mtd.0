Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a43tF-0006Rg-QU
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 09:39:59 +0000
Received: by wmec201 with SMTP id c201so49624883wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 01:39:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151201231233.GA1929@sirena.org.uk>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201231233.GA1929@sirena.org.uk>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 2 Dec 2015 10:38:56 +0100
Message-ID: <CAOMqctS6KaXuX0nS_pO7O80466j-3G8g_MAySdwRcCK10jozFw@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
To: Mark Brown <broonie@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>,
 "Andrew F. Davis" <afd@ti.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paM?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2 December 2015 at 00:12, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Dec 01, 2015 at 04:51:06PM -0000, Michal Suchanek wrote:
>
>> +static inline size_t
>> +spi_max_transfer_size(struct spi_device *spi)
>> +{
>> +     struct spi_master *master = spi->master;
>> +     if (!master->max_transfer_size)
>> +             return 0;
>> +     return master->max_transfer_size(spi);
>> +}
>
> Can we change this to return SIZE_MAX instead (ie, the maximum value for
> a size_t)?  That way callers don't need to worry if there is a limit, if
> they want to handle it they can just unconditionally assume that a limit
> will be provided.

Yes, that sounds reasonable.

Thanks

Michal
