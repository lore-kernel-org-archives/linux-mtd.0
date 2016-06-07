Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAC73-0001Ee-3j
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 08:11:51 +0000
Received: by mail-wm0-x22b.google.com with SMTP id m124so102566743wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2016 01:11:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <fe0042f9-66c9-51fd-ca91-641c5cc25c40@gmail.com>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
 <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
 <20160606174003.GE7510@sirena.org.uk>
 <a57adb90-0d80-186f-17d3-6fdf106bfb4a@gmail.com>
 <20160606230752.GM7510@sirena.org.uk>
 <fe0042f9-66c9-51fd-ca91-641c5cc25c40@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 7 Jun 2016 10:10:47 +0200
Message-ID: <CAOMqctRmtCXurb8A05m2kw+9EjU+AWB8Uj0z1FPO792kGG=36Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@nxp.com>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7 June 2016 at 08:03, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Am 07.06.2016 um 01:07 schrieb Mark Brown:
>> On Mon, Jun 06, 2016 at 08:53:10PM +0200, Heiner Kallweit wrote:
>>> Am 06.06.2016 um 19:40 schrieb Mark Brown:

>>> Well, we could reduce the max_transfer_size exposed by the driver by
>>> the max length of a m25p80 read command in general.
>>
>> No!  Apart from anything else this would be a complete and total
>> abstraction failure.  This is a driver for a SPI controller, not a
>> driver for a flash controller, which means that it should not have flash
>> specific hacks in it.
>>
>>> Then we might be too strict for other SPI devices, but this may
>>> be acceptable as the current fsl-espi driver is usable with SPI NOR
>>> devices only anyway.
>>
>> What makes you say this?  I'm guessing that the driver is just broken
>> but it would be good to understand the specifics.
>>
> See fsl_espi_rw_trans():
> In case of transfers > SPCOM_TRANLEN_MAX it loops and reads in
> SPCOM_TRANLEN_MAX chunks whilst replacing bytes 2-4 of the
> message buffer with the new start address to read from.

That's obviously bogus. Just reject anything too large and let the
upper layer deal with it.

Given m25p80 and fbtft would handle this can you use DMA to gather
buffers from multiple transfers (ie command and data) or does the
buffer have to be copied together for the transfer?

Thanks

Michal
