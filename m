Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzlFi-0003p3-GE
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 12:57:23 +0000
Received: by wmww144 with SMTP id w144so18409220wmw.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 04:57:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <564CEB61.2000601@gmail.com>
References: <564CEB61.2000601@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 20 Nov 2015 13:56:21 +0100
Message-ID: <CAOMqctQo58yCfzU3u=u3N0zNfhQph2Pw2vnrxsVvAEXi5n2HRw@mail.gmail.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 18 November 2015 at 22:19, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> There have been few discussions in the past about how to handle SPI controller
> limitations like max message length. However they don't seem to have resulted
> in accepted patches yet.
> I also stumbled across this topic because I own a device using Freescale's
> ESPI which has a 64K message size limitation.
>
> At least one agreed fact is that silently assembling chunks in protocol
> drivers is not the preferred approach.
>
> Maybe a better approach would be to introduce a new member of spi_master
> dealing with controller limitations.
> My issue is just the message size limitation but most likely there are more
> and different limitations in other controllers.
>

There are multiple sides to this problem.

The first is the nature of the limitation of the driver. I was dealing
with a driver that can transfer up to 63 bytes because it has 64byte
fifo and the hardware locks up when it's full. The limitation is only
due to the driver cutting way too many corners. There is dmaengine
support available for the platform which has been merged recently so
the driver can use DMA for arbitrarily long transfers. Even without
DMA there is possibility to to drive CS manually and compose multiple
transfers into single logical message or whatever.

Either way, the limit of 63 bytes is very low and would actually cause
problems with many device drivers so it was agreed that fixing the
master one way or another is desirable.

64k limit on the other hand is something more usable from driver
writer standpoint and some banked mmap access to flash memories would
have similar granularity.

I would also like to point out that the limit depends on the transfer
settings. For example, a SPI controller can have no limit on transfer
size but when accessing a flash memory through mmap interface the mmap
window limits the amount of data you can transfer at once. This
particular case may be fixable by moving the mmap window transparently
inside the driver.

Thanks

Michal
