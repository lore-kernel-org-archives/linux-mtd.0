Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6TYI-0004sU-9b
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 02:32:52 +0000
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id uAF2WEPR004193
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2016 11:32:14 +0900
Received: by mail-yw0-f172.google.com with SMTP id i145so84040522ywg.2
 for <linux-mtd@lists.infradead.org>; Mon, 14 Nov 2016 18:32:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5a1b5ef5-5c1a-ce20-f0be-ed6abed6996e@gmail.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-6-git-send-email-yamada.masahiro@socionext.com>
 <5a1b5ef5-5c1a-ce20-f0be-ed6abed6996e@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 15 Nov 2016 11:32:13 +0900
Message-ID: <CAK7LNARnmNei8h6U-PmH37QuCVa5g-rWv2uQq2pEbjMbSuh+ZQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] mtd: nand: denali: remove "Spectra:" prefix from
 printk strings
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2016-11-13 6:35 GMT+09:00 Marek Vasut <marek.vasut@gmail.com>:
> On 11/09/2016 05:35 AM, Masahiro Yamada wrote:
>> As far as I understood from the Kconfig menu deleted by commit
>> be7f39c5ecf5 ("Staging: delete spectra driver"), the "Spectra" is
>> specific to Intel Moorestown Platform.
>>
>> The Denali NAND controller IP is used for various SoCs such as
>> Altera SOCFPGA, Socionext UniPhier, etc.  The platform specific
>> strings are not preferred in this driver.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>
>> ---
>>
>> As an ARM-SoC developer, I only need denali.c and denali_dt.c.
>>
>> I see some "Spectra:" in drivers/mtd/nand/denali_pci.c as well.
>> I was not quite sure if they are needed or not.
>> If desired, I can update this patch to remove them too.
>
> Is anyone even using Denali on Intel now ?


I assume this question is address to Intel guys, not me.

May I drop the "Spectra:" from printk strings entirely?




-- 
Best Regards
Masahiro Yamada
