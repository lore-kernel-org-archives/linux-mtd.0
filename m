Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqbGZ-0007HI-LU
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 04:19:20 +0000
Message-ID: <52A7E7A5.5000909@ti.com>
Date: Wed, 11 Dec 2013 09:48:45 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCHv2 00/10] Add memory mapped support for ti qspi, m25p80
 serial flash.
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <201312101349.13564.marex@denx.de>
In-Reply-To: <201312101349.13564.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,
On Tuesday 10 December 2013 06:19 PM, Marek Vasut wrote:
> On Friday, December 06, 2013 at 03:24:41 PM, Sourav Poddar wrote:
>> The patch series aims to add memory mapped support for TI qspi
>> contoller and also add support for the same in serial flash driver(m25p80).
> My question is, shall we not wait for the new SPI NOR framework to be well
> fleshed out and only then implement this controller driver on top of it ?
I think it will still take lot of time for spi framework to come to 
alignment
and get merged in the mainline. Till then, m25p80 development should
go on independently. Once, the spi framework is ready, I can myself port
this into the new framework.
> I have a feeling this patchset adds quite a lot of ad-hoc hacks into the m25p80
> driver, which would become dead code once converted to the SPI NOR framework.
>
I dont think that spi framework till now provides capabilities which can 
be used
to handle memory mapped cases.
I did a quad mode support for m25p80 which easily got cloned into the 
new spi framework.
Same can be done for the memory mapped support too


> Best regards,
> Marek Vasut
