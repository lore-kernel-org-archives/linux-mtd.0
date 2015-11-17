Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyg63-00017f-DE
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 13:14:56 +0000
Subject: Re: spi: OF module autoloading is still broken
To: Brian Norris <computersforpeace@gmail.com>
References: <20151113194031.GI8456@google.com>
 <20151113221228.GT12392@sirena.org.uk> <20151113225113.GJ8456@google.com>
 <20151113231410.GV12392@sirena.org.uk> <20151113234857.GK8456@google.com>
 <564A101F.9090807@osg.samsung.com> <20151116192434.GO8456@google.com>
 <564A35EB.5080008@osg.samsung.com> <20151116204702.GP8456@google.com>
 <564A4B66.6090107@osg.samsung.com> <20151116215144.GQ8456@google.com>
Cc: Mark Brown <broonie@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <564B2833.8030100@osg.samsung.com>
Date: Tue, 17 Nov 2015 10:14:27 -0300
MIME-Version: 1.0
In-Reply-To: <20151116215144.GQ8456@google.com>
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

Hello Brian,

On 11/16/2015 06:51 PM, Brian Norris wrote:
> On Mon, Nov 16, 2015 at 06:32:22PM -0300, Javier Martinez Canillas wrote:

[snip]

>>
>> Let's suppose you have 3 different IP's blocks (i.e: pmics) from the same
>> vendor. The IP's are quite similar but only differ in that use a different
>> bus to communicate with the SoC.
> 
> Ah, I thought that's what you might have meant, but then I reread enough
> times that I confused myself. I think my first understanding was correct
> :)
>

:)
 
>> So you could have a core driver and transport drivers for SPI and I2C.
>>
>> So currently you could use the not too creative compatible strings compatible
>> string "acme,my-pmic" in all the drivers and is not a problem because the SPI
>> and I2C subsystem will always report the MODALIAS uevent as:
>>
>> MODALIAS=i2c:my-pmic and MODALIAS=spi:my-pmic
>>
>> so as far as there is a "my-pmic" entry in the SPI and I2C id tables, module
>> autoload will work and the match will also work since that happens per bus_type.
>>
>> But if SPI and I2C are migrated to OF modalias reporting, then both I2C and SPI
>> will report (assuming the device node is called pmic in both cases):
>>
>> MODALIAS=of:NpmicT<NULL>Cacme,my-pmic
>>
>> That's what I meant when said that the modalias namespace is flat in the case of
>> OF but is separated in the case of board files and the current implementation.
> 
> Thanks for the additional explanation.
> 

You are welcome.

>> What currently the drivers are doing is to name the model my-pmic-{i2c,spi,etc}
>> but I think that the subsystem information should be explicitly present in the
>> OF modalias information as it is for legacy device registration.
> 
> Lest someone else wonder whether this is theoretical or not, I'll save
> them the work in pointing at an example: "st,st33zp24". See:
> 
> Documentation/devicetree/bindings/security/tpm/st33zp24-*.txt
> 
> and the code is in drivers/char/tpm/st33zp24/, sharing the same core
> library, suggesting that the devices really are the same except simply
> the bus.
> 

Thanks for pointing out that example although for that specific case,
the drivers' compatible are "st,st33zp24-i2c" and "st,st33zp24-spi" to
avoid the issue explained before.

Another example is Documentation/devicetree/bindings/mfd/cros-ec.txt
and code in drivers/mfd/cros_ec* where the EC is the same and all the
logic is in the core but only the transport bus changes for each driver.

Compatible strings again are using IP + bus:

"google,cros-ec-i2c"
"google,cros-ec-spi"

I still didn't find an example where the same compatible string is
used for different drivers (i.e: "st,st33zp24" or "google,cros-ec")
but the fact that is possible for legacy and not for OF is worrisome.

> In my limited opinion, then, it seems like a good idea to still try to
> separate the bus namespaces when reporting module-loading information.
>

Yes, I'll add it to my TODO list since this is orthogonal to the SPI
discussion, for example this could also be a problem for platform
drivers (i.e: MODALIAS=platform:bar vs of:N*T*Cfoo,bar).
 
> Brian
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
