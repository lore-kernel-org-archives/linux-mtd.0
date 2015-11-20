Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzumk-0003Ue-RL
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 23:08:07 +0000
Received: by pacdm15 with SMTP id dm15so129665294pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 15:07:45 -0800 (PST)
Date: Fri, 20 Nov 2015 15:07:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
Message-ID: <20151120230743.GZ64635@google.com>
References: <564CEB61.2000601@gmail.com>
 <CAOMqctQo58yCfzU3u=u3N0zNfhQph2Pw2vnrxsVvAEXi5n2HRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMqctQo58yCfzU3u=u3N0zNfhQph2Pw2vnrxsVvAEXi5n2HRw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michal,

On Fri, Nov 20, 2015 at 01:56:21PM +0100, Michal Suchanek wrote:
> I was dealing
> with a driver that can transfer up to 63 bytes because it has 64byte
> fifo and the hardware locks up when it's full. The limitation is only
> due to the driver cutting way too many corners. There is dmaengine
> support available for the platform which has been merged recently so
> the driver can use DMA for arbitrarily long transfers. Even without
> DMA there is possibility to to drive CS manually and compose multiple
> transfers into single logical message or whatever.
> 
> Either way, the limit of 63 bytes is very low and would actually cause
> problems with many device drivers so it was agreed that fixing the
> master one way or another is desirable.

Thanks for clarifying what your underlying SPI driver/controller
limitations are. I've probably heard this before, but it's hard to keep
track. This helps me review your MTD/SPI-NOR patches better.

All in all, I believe this is not acceptable for SPI NOR. Even if things
"mostly work" by limiting messages to 64 (or 63) bytes, I don't think
they are good in the long run, since the flash may respond differently
to sub-256-byte writes than to 256+ byte writes. I mentioned some of
this in reply to your other patches, but I think a SPI NOR driver would
just have to reject you if you can't even transfer one flash page of
data.

> 64k limit on the other hand is something more usable from driver
> writer standpoint and some banked mmap access to flash memories would
> have similar granularity.

Right.

> I would also like to point out that the limit depends on the transfer
> settings. For example, a SPI controller can have no limit on transfer
> size but when accessing a flash memory through mmap interface the mmap
> window limits the amount of data you can transfer at once. This
> particular case may be fixable by moving the mmap window transparently
> inside the driver.

Hmm, I'm not sure I have much opinion on that one without having a
non-theoretical case. It seems like it'd be best if the SPI master
driver can work as best as it can to respect a single reasonable "max
mesage size", even if that means choosing the lowest common denominator
of all limitations.

Brian
