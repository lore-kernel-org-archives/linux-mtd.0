Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSY5v-0002sx-9z
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 22:14:00 +0000
Subject: Re: [PATCH 03/18] mtd: dataflash: Export OF module alias information
To: Brian Norris <computersforpeace@gmail.com>
References: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
 <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
 <20150820215404.GA81844@google.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Message-ID: <55D6510E.7010002@osg.samsung.com>
Date: Fri, 21 Aug 2015 00:13:34 +0200
MIME-Version: 1.0
In-Reply-To: <20150820215404.GA81844@google.com>
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

On 08/20/2015 11:54 PM, Brian Norris wrote:
> On Thu, Aug 20, 2015 at 09:07:16AM +0200, Javier Martinez Canillas wrote:
>> The SPI core always reports the MODALIAS uevent as "spi:<modalias>"
>> regardless of the mechanism that was used to register the device
>> (i.e: OF or board code) and the table that is used later to match
>> the driver with the device (i.e: SPI id table or OF match table).
>>
>> So drivers needs to export the SPI id table and this be built into
>> the module or udev won't have the necessary information to autoload
>> the needed driver module when the device is added.
>>
>> But this means that OF-only drivers needs to have both OF and SPI id
>> tables that have to be kept in sync and also the dev node compatible
>> manufacturer prefix is stripped when reporting the MODALIAS. Which can
>> lead to issues if two vendors use the same SPI device name for example.
>>
>> To avoid the above, the SPI core behavior may be changed in the future
>> to not require an SPI device table for OF-only drivers and report the
>> OF module alias. So, it's better to also export the OF table even when
>> is unused now to prevent breaking module loading when the core changes.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> I appreciate the context for the whole problem here, but this commit
> subject mostly doesn't apply to this driver, and it deson't seem to
> match the problem this is solving. As I see it, the patch description
> for this patch should be more like:
> 
>   "The OF ID table is used for auto-probing the device, but it is not
>   exported to the module device table. That means this driver won't
>   autoload when built as a module.
> 
>   Export the OF ID table to fix that.
> 
>   (insert some reference to the larger issue here)"
> 
> Do you want to rewrite the message, shall I just prepend my
> modifications, or am I off-base?
>

Well, I believe my commit message is more accurate than yours :-)

I mean, right now the OF modalias information is not really used neither
by the SPI core since always MODALIAS=spi:foo is reported nor by user
space since the MODALIAS uevent will never match the OF exported modalias.

So this patch really is a no-op right now and is not fixing anything.
As long as the driver has a MODULE_DEVICE_TABLE(spi,...), things will
work without a MODULE_DEVICE_TABLE(of,...).

However, this patch is needed to avoid breaking module autoloading in
the future once RFC patch 18/18 is applied and the SPI core is changed
to report a MODALIAS=of:N*T*Cfoo,bar for SPI devices registered by OF.

Having said that, I will of course re-spin the patch and write a
commit message that you agree on. So I'll be happy to trim it down if
is providing too much content or is not correct.

I just don't think your suggestion better matches reality than mine.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
