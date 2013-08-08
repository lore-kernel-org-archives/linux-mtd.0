Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7Lf1-0002UZ-V6
 for linux-mtd@lists.infradead.org; Thu, 08 Aug 2013 08:33:32 +0000
Message-ID: <520357DF.3030403@freescale.com>
Date: Thu, 8 Aug 2013 16:33:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
In-Reply-To: <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: vikram186@gmail.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem & Brian:
> Hi Huang and others,
>
> On Thu, May 16, 2013 at 8:17 PM, Huang Shijie<b32955@freescale.com>  wrote:
>> 1.) Why add the ECC information to the nand_chip{} ?
>>     Each nand chip has its requirement for the ECC correctability, such as
>>     "4bit ECC for each 512Byte" or "40bit ECC for each 1024Byte".
>>     This ECC info is very important to the nand controller, such as gpmi.
>>
>>     Take the Micron MT29F64G08CBABA for example, its geometry is
>>     8k page size, 744 bytes oob size and it requires 40bit ECC per 1K bytes.
>>     If we do not provide the ECC info to the gpmi nand driver, it has to
>>     calculate the ECC correctability itself. The gpmi driver will gets the 56bit
>>     ECC for per 1K bytes which is beyond its BCH's 40bit ecc capibility.
>>     The gpmi will quits in this case. But in actually, the gpmi can supports
>>     this nand chip if it can get the right ECC info.
>>
>> 2.) About the patch set:
>>     2.1) patch 1:
>>                The keynote patch.
>>
>>     2.2) patch 2 ~ patch 6:
>>                 These patches are for ONFI nand.
>>                 Parse out the ecc info from the parameter page if we can, else
>>                 parse out the ecc info from the extended parameter page.
>>
>>     2.2) patch 7 ~ patch 9:
>>                 Add the ECC info for full-id nand, and parse it out.
>>
>>     2.3) patch 10
>>                 The gpmi uses the ecc info to set the BCH module. and with this
>>                 patch set, the gpmi can supports the MT29F64G08CBABA now.
> What's the status on this patch set? Surely by v6 we have some
> reasonable stable state on things like naming. Does anyone have any
> other objections? Unfortunately, I've been awfully distracted, and on
> top of that, I'm running into some bugs with my NAND controller
> sending the ONFI parameter read/change column commands. But any time
> my controller actually outputs a correct parameter page + extended
> parameter page, this series has worked for me.
>
> I've put my 2 cents in on most of the issues I had, and I tested the
> whole series on my driver at around v5. The only issues I have with it
> are somewhat cosmetic and not worth bikeshedding. So for all the
> non-GPMI specific stuff I'll give my:
>
> Reviewed-by: Brian Norris<computersforpeace@gmail.com>
> Tested-by: Brian Norris<computersforpeace@gmail.com>
>
> Thanks for the work Huang.
>
> Brian
>
Could you please merge this patch set?


thanks

Huang Shijie
