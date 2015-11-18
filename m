Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz915-0005Fg-Cw
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 20:07:44 +0000
Subject: Re: spi: OF module autoloading is still broken
To: Brian Norris <computersforpeace@gmail.com>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com> <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com> <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com> <564A101F.9090807@osg.samsung.com>
 <20151116192434.GO8456@google.com> <564A35EB.5080008@osg.samsung.com>
 <20151116204702.GP8456@google.com> <564A4B66.6090107@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <564CDA72.8030800@osg.samsung.com>
Date: Wed, 18 Nov 2015 17:07:14 -0300
MIME-Version: 1.0
In-Reply-To: <564A4B66.6090107@osg.samsung.com>
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

Hello Brian and Mark,

On 11/16/2015 06:32 PM, Javier Martinez Canillas wrote:
> On 11/16/2015 05:47 PM, Brian Norris wrote:
>> On Mon, Nov 16, 2015 at 05:00:43PM -0300, Javier Martinez Canillas wrote:
>>> On 11/16/2015 04:24 PM, Brian Norris wrote:

[snip]

>>>> I don't think you have problems only with bad FDTs. I think you have a
>>>> problem with perfectly valid DTs.
>>>>
>>>
>>> Agreed, I wonder if spi_uevent() shouldn't be changed to report both the
>>> OF and old SPI modaliases to avoid breaking a lot of drivers but at the
>>> same time allowing DT-only drivers to not need an SPI ID table.
>>
>> That's the solution I imagined, though I haven't tested it yet. I don't
>> see much precedent for reporting multiple modaliases, so there could be
>> some kind of ABI issues around that too.
>>
> 
> Ok, I'm glad that we agree. This definitely needs to be discussed with more
> people. I'll re-spin my patch and post a v2 reporting multiple modaliases
> tomorrow after testing.
> 

So I had some time today to test this approach but unfortunately it seems
this workaround will not be possible because AFAICT kmod only takes into
account the last MODALIAS reported as a uevent. I still have to check the
kmod source code but that's my conclusion from trying to report both aliases.

When looking at the uevent sysfs entry for the device, I see that both aliases
are reported but if only a OF alias is built into the module, then kmod does
not auto load the module unless the OF MODALIAS is the last one reported, i.e:

# grep MODALIAS /sys/devices/platform/12d40000.spi/spi_master/spi2/spi2.0/uevent
MODALIAS=spi:cros-ec-spi
MODALIAS=of:Ncros-ecT<NULL>Cgoogle,cros-ec-spi

# modinfo cros_ec_spi | grep alias
alias:          of:N*T*Cgoogle,cros-ec-spi*

If I invert the order on which the uevent are reported, then the module is
not autoloaded, i.e:

# grep MODALIAS /sys/devices/platform/12d40000.spi/spi_master/spi2/spi2.0/uevent
MODALIAS=of:Ncros-ecT<NULL>Cgoogle,cros-ec-spi
MODALIAS=spi:cros-ec-spi

# modinfo cros_ec_spi | grep alias
alias:          of:N*T*Cgoogle,cros-ec-spi*

In this case only is loaded if the module has a spi:<alias>, i.e:

# modinfo cros_ec_spi | grep alias
alias:          of:N*T*Cgoogle,cros-ec-spi*
alias:          spi:cros-ec-spi

IOW, even when is possible to report more than one MODALIAS, user-space seems
to only use the last one reported so using both don't work.

Of course kmod can be changed to check for more than one MODALIAS but since
the kernel should not break old user-space, the fact that a single MODALIAS
was reported seems to be an ABI now due how is used.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
