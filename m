Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3s9z-0001Iw-CS
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 21:08:27 +0000
Received: by wmww144 with SMTP id w144so30716251wmw.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 13:08:05 -0800 (PST)
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
To: Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201195816.GS1929@sirena.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paM?=
 <beanhuo@micron.com>, Furquan Shaikh <furquan@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <565E0C2B.4070504@gmail.com>
Date: Tue, 1 Dec 2015 22:07:55 +0100
MIME-Version: 1.0
In-Reply-To: <20151201195816.GS1929@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.12.2015 um 20:58 schrieb Mark Brown:
> On Tue, Dec 01, 2015 at 04:51:06PM -0000, Michal Suchanek wrote:
>> On some SPI controllers it is not feasible to transfer arbitrary amount
>> of data at once.
>>
>> When the limit on transfer size is a few kilobytes at least it makes
>> sense to use the SPI hardware rather than reverting to gpio driver.
> 
>> +	/*
>> +	 * on some hardware transfer size may be constrained
>> +	 * the limit may depend on device transfer settings
>> +	 */
>> +	size_t (*max_transfer_size)(struct spi_device *spi);
> 
> Heiner submitted a *very* similar patch just now with a straight
> variable plus accessor instead of a function and using a name with _msg.
> I'm ambivalent on the implementation but prefer the naming here since
> that's more the limitation we're trying to express I think (some
> hardware does have limiations about multple transfers too).  Can the two
> of you come up with something that works for both of you?
> 
Sure .. Just one inquiry:
When you say "the naming here" you refer to Michal's or my version?

Actually I like in Michal's hook that it directly takes a struct spi_device.
This saves the caller one level of indirection as the caller usually will
deal with a spi_device and not a spi_master.

If you're fine with Michal's version then this is also fine with me,
especially as the functionality is the same.
