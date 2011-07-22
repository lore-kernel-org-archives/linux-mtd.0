Message-ID: <4E292FCF.6010608@freescale.com>
Date: Fri, 22 Jul 2011 16:07:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20110721215020.GA25344@pengutronix.de>
	<4E28EEE1.2050008@freescale.com>
	<20110722055731.GI26837@S2100-06.ap.freescale.net>
In-Reply-To: <20110722055731.GI26837@S2100-06.ap.freescale.net>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram:
> On Fri, Jul 22, 2011 at 11:30:41AM +0800, Huang Shijie wrote:
>> Hi,
>>>> The general-purpose media interface(GPMI) controller is a flexible interface
>>>> to up to several NAND flashs.
>>> ...
>>>> To Walfram&  Artem:
>>>>      About how to disable the JFFS2 to use the OOB:
>>>>      I read the code, and I still have no idea about how to use the ecclayout
>>>>      to do the job. Could you give me some hint? thanks.
>>> Have you checked mxc_nand.c for example? There is
>>>
>>> static struct nand_ecclayout nandv1_hw_eccoob_smallpage = {
>>>          .eccbytes = 5,
>>>          .eccpos = {6, 7, 8, 9, 10},
>>>          .oobfree = {{0, 5}, {12, 4}, }
>>> }
>>>
>>> defined as one layout. Now, you could define one where oobfree is empty and
>>> eccbytes as big as the oob-area.
>>>
>> thanks. I will check the code.
>>>> The driver depends on another GPMI-NAND device patch set, you can find them at :
>>>> 	[1] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037033.html
>>>> 	[2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037031.html
>>>> 	[3] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037032.html
>>>> 	[4] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037034.html
>>>>
>>>> The driver also depends on another DMA patch by Shawn:
>>>> 	[0] http://lists.infradead.org/pipermail/linux-mtd/2011-June/036820.html
>>> This makes it difficult for testers/reviewers. Please try to get a git-branch
>>> from Freescale or Linaro.
>>>
>> Shawn will merge my patches to his Linaro branch.
>>
> git://git.linaro.org/people/shawnguo/linux-2.6.git mxs-gpmi
Please test the GPMI driver based this git tree.

I tested, and the DMA-timeout does not occur any more.

I notice that Shawn added two more patched to 
/arch/arm/config/mxs_defconfig:
[1] ARM: mxs_defconfig: Add mx23evk and mx28evk build
[2] ARM: mxs_defconfig: Change CONFIG_RTC_CLASS 'm' to 'y'

Please check it. Maybe your kernel code misses them.

Of course, you can use the my_config (i sent you last mail) for .config.

Best Regards
Huang Shijie


> Shijie, please check and test it.  I only did a build test.
>
