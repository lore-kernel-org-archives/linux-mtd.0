Message-ID: <554D1624.5030608@wwwdotorg.org>
Date: Fri, 08 May 2015 14:01:40 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] ARM: tegra: add "nor-jedec" flash compatible binding
References: <1431066098-19821-1-git-send-email-zajec5@gmail.com>
 <554CDD8C.7050000@wwwdotorg.org> <20150508184317.GZ32500@ld-irv-0074>
In-Reply-To: <20150508184317.GZ32500@ld-irv-0074>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, Alexandre Courbot <gnurou@gmail.com>,
 devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-spi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/08/2015 12:43 PM, Brian Norris wrote:
> On Fri, May 08, 2015 at 10:00:12AM -0600, Stephen Warren wrote:
>> On 05/08/2015 12:21 AM, Rafał Miłecki wrote:
>>> Starting with commits
>>> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
>>> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
>>> we have "nor-jedec" binding indicating support for JEDEC identification.
>>
>> The documentation looks quite incomplete. "nor-jedec" sounds like
>> it's intended to be something generic. As such, it should be
>> documented in e.g.
>> Documentation/devicetree/bindings/mtd/nor-jedec.txt, not buried in
>> one particular flash device's binding. If it's not intended to be
>> generic, why isn't the existing "winbond,w25q32dw" enough?
>
> It is generic, though there are plenty of additional manufacturer/device
> pairs that could go on top of it. m25p80 was (one of?) the first
> supported, so the naming has been based on legacy, and we're in the
> process of unwinding a bit of that. If it helps, we could move the doc
> to .../mtd/spi-nor,nor-jedec.txt or something like that.

Yes, moving the documentation to a generic location would be appropriate 
in my opinion.

>> Equally, "nor-jedec" doesn't sound like the right name. It doesn't
>> differentiate between SPI and parallel NOR flash, which presumably
>> need different compatible values, since the programming model is
>> quite different, and the compatible value is supposed to
>> define/imply the SW-visible programming model.
>
> It's definitely for SPI only. There was much discussion about this a
> few months back. Somewhere along the way, it was mentioned that the
> context (SPI slave is a child of SPI master) would make this clear. I'm
> still not sure why we didn't end up with something more descriptive,
> though, like "spi-nor,nor-jedec".
>
> I'm open to change, as this binding is new in 4.1-rc1.

I don't believe compatible values should be interpreted according to 
context; compatible value matching isn't implemented that way AFAIK, and 
I'm not aware of any precedent for it to work that way.

Did the discussion involve the core DT maintainers? If so, whatever they 
decided can stick. Otherwise, the discussion should be rubn by them.
