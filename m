Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4493-0000z2-Cm
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 09:56:18 +0000
Received: by wmec201 with SMTP id c201so244736994wme.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 01:55:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151201195816.GS1929@sirena.org.uk>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201195816.GS1929@sirena.org.uk>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 2 Dec 2015 10:55:16 +0100
Message-ID: <CAOMqctTbJVpxbGaRHhfNGfN6gVCZBQkiVRLe1Cm8LeGzwtamcQ@mail.gmail.com>
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

On 1 December 2015 at 20:58, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Dec 01, 2015 at 04:51:06PM -0000, Michal Suchanek wrote:
>> On some SPI controllers it is not feasible to transfer arbitrary amount
>> of data at once.
>>
>> When the limit on transfer size is a few kilobytes at least it makes
>> sense to use the SPI hardware rather than reverting to gpio driver.
>
>> +     /*
>> +      * on some hardware transfer size may be constrained
>> +      * the limit may depend on device transfer settings
>> +      */
>> +     size_t (*max_transfer_size)(struct spi_device *spi);
>
> Heiner submitted a *very* similar patch just now with a straight
> variable plus accessor instead of a function and using a name with _msg.
> I'm ambivalent on the implementation but prefer the naming here since
> that's more the limitation we're trying to express I think (some
> hardware does have limiations about multple transfers too).  Can the two
> of you come up with something that works for both of you?

Sorry, missed there is a patch because it shows in the middle of the
discussion for me.

I don't really care which one it is so long as I can get the last
patch in this series based on it.

Thanks

Michal
