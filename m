Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvM1Z-000387-Co
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 08:40:18 +0000
Received: by wicmx19 with SMTP id mx19so6394988wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 01:39:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520233835.GX11598@ld-irv-0074>
References: <cover.1430403750.git.hramrach@gmail.com>
 <50c40ef17ab6566f35ef5a4426bf23567f896db7.1430403750.git.hramrach@gmail.com>
 <20150520233835.GX11598@ld-irv-0074>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 21 May 2015 10:39:13 +0200
Message-ID: <CAOMqctTYqDWL51twOuGi+oXONXQ4B2-2BkdJNSpzZAXshZUN6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] MTD: spi-nor: check for short writes in spi_nor_write.
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 May 2015 at 01:38, Brian Norris <computersforpeace@gmail.com> wrote:
> + linux-spi, Mark
>
> On Thu, Apr 30, 2015 at 03:38:50PM +0200, Michal Suchanek wrote:
>> My SPI controller driver does not support DMA so writes are truncated to
>> FIFO size.
>
> Which SPI master driver?

I am using sunxi SPI driver. The dmaengine support for sunxi is not
yet in mainline kernel so the SPI master functionality is limited.

>
>> Check the amount of data actually written by the driver.
>
> I'm not sure if we should just reactively use the retlen, or if we
> should be communicating such a limitation via the SPI API. Thoughts?
>

Is there any driver that would break if the SPI master truncated
writes when the message is too long rather than returning an error an
refusing the transfer?

m25p80 as is would because it assumes all data is always written.

Some display driver I tried earlier has an option to limit transfer
size actively in the driver.

Thanks

Michal
