Received: from hauke-m.de ([5.39.93.123] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDcG4-0006Xr-79
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 19:15:33 +0000
Subject: Re: [PATCH] mtd: nand: xway: fix build undefined MODULE_DEVICE_TABLE()
To: John Crispin <john@phrozen.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20161130225110.10759-1-hauke@hauke-m.de>
 <20161201133627.38953fb0@bbrezillon>
 <d9847313-cb0b-5cdc-b70f-5fa3f5638473@phrozen.org>
 <20161201144706.6757b632@bbrezillon>
 <098516d2-89e7-3c7a-9c52-4ab46671e355@phrozen.org>
Cc: richard@nod.at, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@atmel.com, computersforpeace@gmail.com, dwmw2@infradead.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <6d1536a4-a712-e7bf-5b0f-998ac6a8d829@hauke-m.de>
Date: Sun, 4 Dec 2016 20:15:08 +0100
MIME-Version: 1.0
In-Reply-To: <098516d2-89e7-3c7a-9c52-4ab46671e355@phrozen.org>
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

On 12/01/2016 02:57 PM, John Crispin wrote:
> 
> 
> On 01/12/2016 14:47, Boris Brezillon wrote:
>> On Thu, 1 Dec 2016 14:02:55 +0100
>> John Crispin <john@phrozen.org> wrote:
>>
>>> On 01/12/2016 13:36, Boris Brezillon wrote:
>>>> Hi Hauke,
>>>>
>>>> On Wed, 30 Nov 2016 23:51:10 +0100
>>>> Hauke Mehrtens <hauke@hauke-m.de> wrote:
>>>>   
>>>>> The header file with the definition of MODULE_DEVICE_TABLE() was
>>>>> missing, add include for linux/module.h to fix the problem in 4.9.  
>>>>
>>>> I tried to enable this driver as a module, and the build failed because
>>>> of a missing symbol (see the following patch).
>>>> Now, if it's not supposed to be compiled as a module, then you should
>>>> modify the Kconfig accordingly.
>>>>
>>>> Regards,
>>>>
>>>> Boris
>>>>   
>>>> --->8---  
>>>> diff --git a/arch/mips/lantiq/xway/sysctrl.c
>>>> b/arch/mips/lantiq/xway/sysctrl.c index 236193b5210b..29e753556597
>>>> 100644 --- a/arch/mips/lantiq/xway/sysctrl.c
>>>> +++ b/arch/mips/lantiq/xway/sysctrl.c
>>>> @@ -156,6 +156,7 @@ static void __iomem *pmu_membase;
>>>>  static void __iomem *ltq_xbar_membase;
>>>>  void __iomem *ltq_cgu_membase;
>>>>  void __iomem *ltq_ebu_membase;
>>>> +EXPORT_SYMBOL(ltq_ebu_membase);  
>>>
>>> Hi,
>>>
>>> i would be against exporting the membase pointers as global symbols. i
>>> already find it annoying that cgu and ebu are not static
>>
>> Yep, that's also my opinion.

I also do not like this ebu integration. the ebu lock is also a problem.

>> Let's patch the Kconfig entry instead. BTW, if you don't compile the
>> driver as a module, then you don't need the MODULE_XX() calls, and you
>> can get rid of the module.h header.
>>
> 
> agreed. not sure how hauke tested his patch in the first place.

Sorry, I never tested this as a module, I only used it compiled into the
kernel.

I will send a patch which changes Kconfig.

Hauke
