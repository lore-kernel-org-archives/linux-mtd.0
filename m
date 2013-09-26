Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP9e5-0003lg-MU
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 11:22:10 +0000
Message-ID: <524418AF.3030306@ti.com>
Date: Thu, 26 Sep 2013 16:51:19 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCHv2] drivers: mtd: devices: Add quad read support.
References: <1380191565-28640-1-git-send-email-sourav.poddar@ti.com>
 <1380193243.28494.51.camel@i7.infradead.org>
In-Reply-To: <1380193243.28494.51.camel@i7.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, b32955@freescale.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,
On Thursday 26 September 2013 04:30 PM, David Woodhouse wrote:
> On Thu, 2013-09-26 at 16:02 +0530, Sourav Poddar wrote:
>> Some flash also support quad read mode.
>> Adding support for adding quad mode in m25p80.
>>
>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
> This seems sane enough to me if Mark agrees that it's correct from the
> SPI point of view.
>
> Do we have a solution for the vf610-twr host controller, and is this
> going to work for that too? Or are we still stuck on questions like "how
> are we going to program the LUT to do what the request asks?" and "how
> *does* the request actually hand the required information to the
> controller?"
>
If the pupose of LUT is to just set the dummy cycles, and vf610-twr
hardware state machine does not have have any other dependency
on LUT, this patch should work.

Yes, this patch also solves the issue of communicating the appropriate 
request
to the handler through some spi transfer parameters already available in 
spi.c.

As explained in one comment in my previous version,
If you see spi.c, "spi-rx-bus-width" property is already added. We will 
set this
property in dts to 4 in case of quad read. Once this is set, spi->mode will
be set to SPI_RX_QUAD in spi.c. which can be used by mtd layer to decide 
whether
its a quad read or not.

Then, we can use tx_nbits/rx_nbits property of spi_transfer to 
communicate to the
controller whether the ongoing transfer is a quad/single read/write.
> I've seen a bunch of "*this* is how you indicate dummy cycles", and
> "*this* is how you request a quad-read transfer" type responses; have we
> got all the way there yet?
>
