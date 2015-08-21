Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSv64-0000F1-6q
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 22:47:40 +0000
Received: by pacdd16 with SMTP id dd16so52984555pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 15:47:18 -0700 (PDT)
Date: Fri, 21 Aug 2015 15:47:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 03/18] mtd: dataflash: Export OF module alias information
Message-ID: <20150821224714.GD81844@google.com>
References: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
 <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
 <20150820215404.GA81844@google.com>
 <55D6510E.7010002@osg.samsung.com>
 <20150820223440.GC81844@google.com>
 <55D65B72.2050006@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55D65B72.2050006@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Javier,

On Fri, Aug 21, 2015 at 12:57:54AM +0200, Javier Martinez Canillas wrote:
> On 08/21/2015 12:34 AM, Brian Norris wrote:
> > On Fri, Aug 21, 2015 at 12:13:34AM +0200, Javier Martinez Canillas wrote:
> >> So this patch really is a no-op right now and is not fixing anything.
> >> As long as the driver has a MODULE_DEVICE_TABLE(spi,...), things will
> > 
> > This driver does not have a MODULE_DEVICE_TABLE() at all, nor does it
> > use spi_device_id. So, it is currently broken for the module use case.
> >
> 
> That is correct but also that does not mean that this patch will fix
> module autoloading right now. It will though once the SPI core is
> changed to report a OF type module alias.

Ah, thanks for the patience. I missed the point that it will still be
broken.

> So what about something along this lines?
> 
> mtd: dataflash: Export OF module alias information
> 
> The SPI core currently reports the MODALIAS uevent as "spi:<modalias>"
> even for SPI devices that were registered by OF.
> 
> That means the OF module alias exported by MODULE_OF_TABLE(of,...) is
> currently not used and user-space has no way to autoload this module.
> 
> But is still a good practice to add the OF module alias information

nit: s/is/it is/

> into the kernel module even when currently is unused so once the SPI

ditto

> core is changed to report a correct OF modalias uevent, module
> autoloading will be working for this driver.

Otherwise, looks good. I'll either patch in this commit message, or
await v2. Your call.

Regards,
Brian
