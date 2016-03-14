Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afdHl-0005dL-DT
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 00:56:34 +0000
Message-ID: <56E73F7B.2010408@denx.de>
Date: Mon, 14 Mar 2016 23:47:23 +0100
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Graham Moore <grmoore@opensource.altera.com>, Vignesh R <vigneshr@ti.com>
CC: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com>
 <201602081627.57666.marex@denx.de> <56BB60F1.9070306@opensource.altera.com>
 <56BB629D.2040209@denx.de> <56E1DF45.901@opensource.altera.com>
 <56E1E2C8.8030405@denx.de> <56E70024.3080205@opensource.altera.com>
In-Reply-To: <56E70024.3080205@opensource.altera.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/14/2016 07:17 PM, Graham Moore wrote:
> On 03/10/2016 03:10 PM, Marek Vasut wrote:
>> On 03/10/2016 09:55 PM, Graham Moore wrote:
>>> On 02/10/2016 10:17 AM, Marek Vasut wrote:
>>>
>>> [...]
>>>
>>>> All right, so we will just add a special property or compat string for
>>>> the TI SoC. But we need to get this driver mainlined first :)
>>>>
>>>
>>> Hi Marek,
>>
>> Hi Graham,
>>
>>> How's that mainlining going?  You probably noticed this patch needed
>>> some refactoring for 4.4.  In the course of testing, we realized this
>>> driver needs to enable its clock.
>>>
>>> Do you have a 4.4 or later version in your tree?  I'd like to add the
>>> clock enabling.
>>
>> Still waiting for the patches from Cyrille to go in, so this patch is
>> stuck. I just checked next and some of them made it, but there are more
>> which didn't. I have a V10 of this patch , it is in the ML already [1],
>> so try playing around with that.
>>
>> I have linux 4.4 branch with all the necessary patches backported and/or
>> applied if you'd be interested in that, but I do my development on
>> linux-next .
>>
>> What sort of clock patch are you missing ?
>>
> 
> The clock needs to be enabled, after the devm_clk_get().  I've added a
> clk_prepare_enable() there, and also clk_disable_unprepare() in the
> remove function.

Yeah, please send me a patch and I will add it into the driver, add your
SoB line and repost.

> That ML patch won't apply to any tree I have, 4.4, 4.5, linux-next, etc.
>  Maybe I'll just wait until it's in linux-next.

I'll send you the backport to 4.4 off-list, so I don't bother people here.

> -Graham
> 


-- 
Best regards,
Marek Vasut
