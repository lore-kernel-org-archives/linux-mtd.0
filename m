Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSYmr-0002EV-DV
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 22:58:22 +0000
Subject: Re: [PATCH 03/18] mtd: dataflash: Export OF module alias information
To: Brian Norris <computersforpeace@gmail.com>
References: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
 <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
 <20150820215404.GA81844@google.com> <55D6510E.7010002@osg.samsung.com>
 <20150820223440.GC81844@google.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <55D65B72.2050006@osg.samsung.com>
Date: Fri, 21 Aug 2015 00:57:54 +0200
MIME-Version: 1.0
In-Reply-To: <20150820223440.GC81844@google.com>
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

On 08/21/2015 12:34 AM, Brian Norris wrote:
> On Fri, Aug 21, 2015 at 12:13:34AM +0200, Javier Martinez Canillas wrote:
>> So this patch really is a no-op right now and is not fixing anything.
>> As long as the driver has a MODULE_DEVICE_TABLE(spi,...), things will
> 
> This driver does not have a MODULE_DEVICE_TABLE() at all, nor does it
> use spi_device_id. So, it is currently broken for the module use case.
>

That is correct but also that does not mean that this patch will fix
module autoloading right now. It will though once the SPI core is
changed to report a OF type module alias.

So what about something along this lines?

mtd: dataflash: Export OF module alias information

The SPI core currently reports the MODALIAS uevent as "spi:<modalias>"
even for SPI devices that were registered by OF.

That means the OF module alias exported by MODULE_OF_TABLE(of,...) is
currently not used and user-space has no way to autoload this module.

But is still a good practice to add the OF module alias information
into the kernel module even when currently is unused so once the SPI
core is changed to report a correct OF modalias uevent, module
autoloading will be working for this driver.
 
>> work without a MODULE_DEVICE_TABLE(of,...).
> 
> Brian
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
