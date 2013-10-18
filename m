Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX8YM-0000Ja-Az
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 11:49:15 +0000
Message-ID: <52611FFF.9080601@ti.com>
Date: Fri, 18 Oct 2013 17:18:15 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
References: <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
 <525FD715.50703@ti.com> <20131017123850.GN2443@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
 <20131017234230.GZ2443@sirena.org.uk> <5260B3AE.9070308@ti.com>
 <CA+7tXihUBXK61cRDmn3tnY9FM7FUSZrhPpLry2VAfvwWJpJ6gQ@mail.gmail.com>
 <5260D0C7.4000805@ti.com> <5260E2F7.4020404@ti.com>
 <20131018103114.GJ2443@sirena.org.uk>
In-Reply-To: <20131018103114.GJ2443@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Peter Korsgaard <peter@korsgaard.com>, Trent Piepho <tpiepho@gmail.com>,
 "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 October 2013 04:01 PM, Mark Brown wrote:
> On Fri, Oct 18, 2013 at 12:57:51PM +0530, Sourav Poddar wrote:
>
>> 3. For filling memory mapped register in qspi controller, we can
>> pass that information
>>      from dt rather than hardcoding as macros.
> Or from the flash driver at runtime...
>
No, as for now, its better to keep mtd framework independent of this
spi controller configuration and pass the information via dt.

Since we dont have a common protocol, If we start putting this information
in mtd, it will clutter the mtd space and it may happen that we may end up
with differnet if defs for all the kind of flash devices.
>>      4b.
>>          Roadblock:
>>          Runtime clock management is handle by SPI framework, so while
>>          doing memory read, where we bypass SPI framework, clocks will be
>>          disable and we will get an abort while doing memcpy.
>>         Possible solution:
>>             As suggested by Trent, we can keep the SPI controller
>> clocks always ON ?
> At the SPI layer I would keep the clocks on while the driver has a
> region mapped for the flash layer.  The flash layer can then decide when
> to keep the region mapped, for example it could do so whenever the
> device is opened.
