Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yymci-0001dh-8g
 for linux-mtd@lists.infradead.org; Sat, 30 May 2015 19:40:49 +0000
Received: by wicmx19 with SMTP id mx19so44078146wic.0
 for <linux-mtd@lists.infradead.org>; Sat, 30 May 2015 12:40:25 -0700 (PDT)
Message-ID: <556A1162.7060400@vanguardiasur.com.ar>
Date: Sat, 30 May 2015 16:37:06 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Joachim Eastwood <manabian@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] mtd: spi-nor: add driver for NXP SPI Flash Interface
 (SPIFI)
References: <1432921816-10765-1-git-send-email-manabian@gmail.com>	<1432921816-10765-2-git-send-email-manabian@gmail.com>	<5569DAB9.9070105@vanguardiasur.com.ar>	<CAGhQ9VwsiPaFw=cMXhQrKfg8zWGa7RMOd+H6_VXfRepOwWbtYQ@mail.gmail.com>	<5569FC99.1060706@vanguardiasur.com.ar>	<556A10A3.6000406@nod.at>
 <CAGhQ9VzDDK6dh6pGUzp_-h42NPROQJG=2D96WMWjZJEAoVqAFQ@mail.gmail.com>
In-Reply-To: <CAGhQ9VzDDK6dh6pGUzp_-h42NPROQJG=2D96WMWjZJEAoVqAFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org,
 Ariel D'Alessandro <ariel.dalessandro@gmail.com>,
 linux-mtd@lists.infradead.org, shijie.huang@intel.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/30/2015 04:37 PM, Joachim Eastwood wrote:
> On 30 May 2015 at 21:33, Richard Weinberger <richard@nod.at> wrote:
>> Am 30.05.2015 um 20:08 schrieb Ezequiel Garcia:
>>> +Richard
>>>
>>> On 05/30/2015 01:51 PM, Joachim Eastwood wrote:
>>>> Hi Ezequiel,
>>>>
>>>> On 30 May 2015 at 17:43, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>>>>> Hi Joachim,
>>>>>
>>>>> Looks pretty neat. I've just a couple comments.
>>>>>
>>>>> On 05/29/2015 02:50 PM, Joachim Eastwood wrote:
>>>>>> Add SPI-NOR driver for the SPI Flash Interface (SPIFI)
>>>>>> controller that is found newer NXP MCU devices.
>>>>>>
>>>>>> The controller supports serial SPI Flash devices with 1-, 2-
>>>>>> and 4-bit width in either SPI mode 0 or 3. The controller
>>>>>> can operate in either command or memory mode. In memory mode
>>>>>> the Flash is exposed as normal memory and can be directly
>>>>>> accessed by the CPU.
>>>>>>
>>>>>> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
>>>>>> ---
>>>>>>  drivers/mtd/spi-nor/Kconfig     |  10 +
>>>>>>  drivers/mtd/spi-nor/Makefile    |   1 +
>>>>>>  drivers/mtd/spi-nor/nxp-spifi.c | 508 ++++++++++++++++++++++++++++++++++++++++
>>>>>>  3 files changed, 519 insertions(+)
>>>>>>  create mode 100644 drivers/mtd/spi-nor/nxp-spifi.c
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>>>>> index 64a4f0edabc7..f10a37f1a4ef 100644
>>>>>> --- a/drivers/mtd/spi-nor/Kconfig
>>>>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>>>>> @@ -28,4 +28,14 @@ config SPI_FSL_QUADSPI
>>>>>>         This enables support for the Quad SPI controller in master mode.
>>>>>>         We only connect the NOR to this controller now.
>>>>>>
>>>>>> +config SPI_NXP_SPIFI
>>>>>> +     tristate "NXP SPI Flash Interface (SPIFI)"
>>>>>> +     depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
>>>>>
>>>>> Since you are adding COMPILE_TEST, maybe you want
>>>>> 'depends on HAS_IOMEM' as well?
>>>>
>>>> Since MTD depends on GENERIC_IO is that needed?
>>>> Or am I confusing the config options here(?)
>>>>
>>>
>>> I think you need HAS_IOMEM for ioremap stuff.
>>> Maybe Brian or Richard will know better.
>>
>> Yes, if you need ioremap() your driver has to depend on HAS_IOMEM.
>>
>> We have GENERIC_IO to allow non-physical MTD stuff
>> on architectures without io memory, namely s390 and UML.
>> Some time ago I've implemented GENERIC_IO to make nandsim
>> and UBI work on UML.
> 
> Got it.
> Thanks Richard.
> 
> I'll send a new version of the patch within a couple of days.
> 

You can add my reviewed on that.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
