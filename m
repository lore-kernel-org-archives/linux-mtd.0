Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4tV8-0001vv-Kn
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 16:46:31 +0000
Received: by wmww144 with SMTP id w144so69277554wmw.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 08:46:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5FC39638-EEE0-4CFA-B464-0B4743CB6AB6@sperl.org>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201231233.GA1929@sirena.org.uk>
 <5FC39638-EEE0-4CFA-B464-0B4743CB6AB6@sperl.org>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 4 Dec 2015 17:45:28 +0100
Message-ID: <CAOMqctRVT9vLOgePJ_NzTdt-gTWA8cfUJ9CRtH9BmLSZ5qk=0A@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
To: Martin Sperl <martin@sperl.org>
Cc: Mark Brown <broonie@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
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

On 4 December 2015 at 15:30, Martin Sperl <martin@sperl.org> wrote:
>
>> On 02.12.2015, at 00:12, Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Dec 01, 2015 at 04:51:06PM -0000, Michal Suchanek wrote:
>>
>>> +static inline size_t
>>> +spi_max_transfer_size(struct spi_device *spi)
>>> +{
>>> +    struct spi_master *master = spi->master;
>>> +    if (!master->max_transfer_size)
>>> +            return 0;
>>> +    return master->max_transfer_size(spi);
>>> +}
>>
>> Can we change this to return SIZE_MAX instead (ie, the maximum value for
>> a size_t)?  That way callers don't need to worry if there is a limit, if
>> they want to handle it they can just unconditionally assume that a limit
>> will be provided.
>
> As I just came across: spi_master.max_dma_len, so I wonder how this
> value would differ from the proposed spi_master.max_transfer_size
> on specific HW?
>
> For all practical purposes I would assume both are identical.

They aren't.

Some SPI masters don't use DMA. Some SPI master drivers can drive CS
manually so they can glue multiple DMA (or whatever) transfers into
single logical SPI transfer transparently. And some cannot. Hence this
limit.

That said I don't know what is the purpose of spi_master.max_dma_len.
It is seldom used. It seems to be used as a hint for the DMA buffer
size in spi.c only.

It is set in 3 drivers.

Thanks

Michal
