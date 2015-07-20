Message-ID: <55ACBE1B.6050507@atmel.com>
Date: Mon, 20 Jul 2015 11:23:39 +0200
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: <nicolas.ferre@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <shijie.huang@intel.com>, <ben@decadent.org.uk>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
 <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
 <galak@codeaurora.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 4/7] Documentation: mtd: add a DT property to set the
 latency code of Spansion memory
References: <cover.1437059658.git.cyrille.pitchen@atmel.com>
 <398ca9f17bda638e05e97f258fb4e6d27ac828db.1437059658.git.cyrille.pitchen@atmel.com>
 <201507161944.20523.marex@denx.de>
In-Reply-To: <201507161944.20523.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Le 16/07/2015 19:44, Marek Vasut a écrit :
> On Thursday, July 16, 2015 at 05:27:51 PM, Cyrille Pitchen wrote:
> 
> Hi!
> 
>> Both the SPI controller and the NOR flash memory need to agree on the
>> number of dummy cycles to use for Fast Read commands. For Spansion
>> memories, this number of dummy cycles is not given directly but through a
>> so called "latency code".
>> The latency code can be found into the memory datasheet and depends on the
>> SPI clock frequency, the Fast Read op code and the Single/Dual Data Rate
>> mode.
> 
> Shouldn't you be able to derive the latency code from the above information,
> which you already know then ?
Yes I agree with you; this could have been done adding static tables inside the
driver instead of creating a new DT property dedicated to Spansion memories.

When I wrote this patch, I had a close look at the s25fl512s datasheet but only
overviewed few datasheets for other Spansion QSPI flash memories. So I don't
know whether a single latency code table could be shared among all Spansion
memories or many tables should be added to support different memory models.

That's why I've chosen to add a dedicated DT property to support Spansion
memories as it avoids to add tables to guess the proper latency code to be
used. I thought it would be more flexible.

Maybe I will remove the support of Spansion QSPI memories from this series for
now. Their support can still be implemented later.

Anyway, thanks for your review :)

> 
> Best regards,
> Marek Vasut
> 

Best Regards,

Cyrille
