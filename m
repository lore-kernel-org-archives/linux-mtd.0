Received: from mail-bn1on0074.outbound.protection.outlook.com ([157.56.110.74]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIfzk-0003mp-Ls
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 17:11:05 +0000
Message-ID: <5693E079.3050301@opensource.altera.com>
Date: Mon, 11 Jan 2016 11:03:53 -0600
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: <linux-mtd@lists.infradead.org>, Graham Moore
 <grmoore@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, "R, Vignesh" <vigneshr@ti.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <5693D306.9070001@opensource.altera.com> <201601111732.23954.marex@denx.de>
In-Reply-To: <201601111732.23954.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2016 10:32 AM, Marek Vasut wrote:
> On Monday, January 11, 2016 at 05:06:30 PM, Dinh Nguyen wrote:
>> Hi Marek,
> 
> Hi!
> 
>> On 01/10/2016 10:34 PM, Marek Vasut wrote:
>>> From: Graham Moore <grmoore@opensource.altera.com>
>>>
>>> Add binding document for the Cadence QSPI controller.
>>>
>>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Alan Tull <atull@opensource.altera.com>
>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
>>> Cc: Graham Moore <grmoore@opensource.altera.com>
>>> Cc: "R, Vignesh" <vigneshr@ti.com>
>>> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
>>> Cc: devicetree@vger.kernel.org
>>> ---
>>
>> I think you also need to CC the following people for proper review of
>> these bindings:
>>
>> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
>> DEVICE TREE BINDINGS)
>> Pawel Moll <pawel.moll@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED
>> DEVICE TREE BINDINGS)
>> Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND
>> FLATTENED DEVICE TREE BINDINGS)
>> Ian Campbell <ijc+devicetree@hellion.org.uk> (maintainer:OPEN FIRMWARE
>> AND FLATTENED DEVICE TREE BINDINGS)
>> Kumar Gala <galak@codeaurora.org> (maintainer:OPEN FIRMWARE AND
>> FLATTENED DEVICE TREE BINDINGS)
> 
> Isn't it enough to submit them to devicetree@vger ?
> 

Not sure, but I always CC those names explicitly for DTS bindings since
they are listed in the MAINTAINERS file.

Dinh
