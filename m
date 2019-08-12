Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D378C0650F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 02:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1511C20651
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 02:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EIb+gLA8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1511C20651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w7H1tQdkyo72JZPk5OlMg4CMS0/nojn4RMlydE0VfJE=; b=EIb+gLA8d17pmmwMEaZBDFd5L
	AAnCZ9peJHAQCThtZ7QdOVLY8STwTg2jq0RHaRk1NxJOe7xI2KiSP6s4o3drHsXJ8Y+gnzNOTb7+3
	J273c6s86tS2voFXVuocioGvClb4i6+jVaVpH1PxRN7Id1B07sfvVH+0uwvNZZVo217URguq/4JDO
	93u88SHBHyQ+o+VQLUMkI8MgFX1FmlfYFJbnBPoiSdE/HuA+Xd5gmAWESN8abkz8XrHd1KFv1waLh
	2k7L9SMOUeR7Ntq7KjYptN0f6EggwAQsDYEc/Aeb+yN+cbh2OmxTeaUnbDo6KdbTttHFbDTEnPgPI
	AaukMNLwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx0Qe-0008E1-1s; Mon, 12 Aug 2019 02:51:24 +0000
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hx0QX-0008DE-4Y
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 02:51:20 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AhAAC401Bd/zXSMGcNWRkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEHAQEBAQEBgWeEM4Qej3UBAQEBBoEJLX6CaoYCkSEJAQEBAQEBAQE?=
 =?us-ascii?q?BNwEBhD8CgwQ4EwEEAQEBBAEBAwEJAYVShhkBAQEDIwQRQRALDQsCAiYCAlc?=
 =?us-ascii?q?GDQYCAQGDHoF3qVJzfzMahS+DPoFJgQwogWOKGHiBB4ERJ4I2NT6HT4JYBIw?=
 =?us-ascii?q?tIIhMgS+UfwmCH49nhEUGG4IwL4sDAxCKSKdngXkzGggoCIMngk4XjjRgjyQ?=
 =?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A2AhAAC401Bd/zXSMGcNWRkBAQEBAQEBAQEBAQEHAQEBA?=
 =?us-ascii?q?QEBgWeEM4Qej3UBAQEBBoEJLX6CaoYCkSEJAQEBAQEBAQEBNwEBhD8CgwQ4E?=
 =?us-ascii?q?wEEAQEBBAEBAwEJAYVShhkBAQEDIwQRQRALDQsCAiYCAlcGDQYCAQGDHoF3q?=
 =?us-ascii?q?VJzfzMahS+DPoFJgQwogWOKGHiBB4ERJ4I2NT6HT4JYBIwtIIhMgS+UfwmCH?=
 =?us-ascii?q?49nhEUGG4IwL4sDAxCKSKdngXkzGggoCIMngk4XjjRgjyQBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,375,1559491200"; d="scan'208";a="187021482"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out9.iinet.net.au with ESMTP; 12 Aug 2019 10:50:37 +0800
Subject: Re: GPMI iMX6ull timeout on DMA
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190729103655.095297a2@xps13>
 <18734a1d-17d9-d390-58ef-ad8ca1be925f@kernel.org>
 <20190729144730.4a58de32@xps13>
 <17b49e7d-ff63-315f-cf12-3474f7228c6d@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
Date: Mon, 12 Aug 2019 12:50:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809155934.40c43f29@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190811_195117_899051_AEC0A7CE 
X-CRM114-Status: GOOD (  18.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, s.hauer@pengutronix.de,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 9/8/19 11:59 pm, Boris Brezillon wrote:
> On Fri, 9 Aug 2019 23:57:08 +1000
> Greg Ungerer <gerg@kernel.org> wrote:
>> On 9/8/19 5:32 pm, Boris Brezillon wrote:
>>> On Fri, 9 Aug 2019 16:55:22 +1000
>>> Greg Ungerer <gerg@kernel.org> wrote:
>>>> On 9/8/19 4:23 pm, Boris Brezillon wrote:
>>>>> On Fri, 9 Aug 2019 15:20:52 +1000
>>>>> Greg Ungerer <gerg@kernel.org> wrote:
>>>>>> On 9/8/19 2:36 am, Boris Brezillon wrote:
>>>>>>> On Mon, 5 Aug 2019 15:51:05 +1000
>>>>>>> Greg Ungerer <gerg@kernel.org> wrote:
>>>>>>>> On 2/8/19 10:51 pm, Boris Brezillon wrote:
>>>>>>>>> On Fri, 2 Aug 2019 22:34:57 +1000
>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote:
>>>>>>>>>> On 31/7/19 4:28 pm, Boris Brezillon wrote:
>>>>>>>>>>> On Wed, 31 Jul 2019 12:05:44 +1000
>>>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote:
>>>>>>>>>>>> On 30/7/19 6:38 pm, Miquel Raynal wrote:
>>>>>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote on Tue, 30 Jul 2019 16:06:55 +1000:
>>>>>>>>>>>>>> On 30/7/19 10:41 am, Greg Ungerer wrote:
>>>>>>>>>>>>>>> On 30/7/19 10:28 am, Greg Ungerer wrote:
>>>>>>>>>>>>>>>> On 29/7/19 10:47 pm, Miquel Raynal wrote:
>>>>>>>>>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 22:33:56 +1000:
>>>>>>>>>>>>>>>>>> On 29/7/19 6:36 pm, Miquel Raynal wrote:
>>>>>>>>>>>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 16:41:51 +1000:
>>>>>>>>>>>>>>> [snip]
>>>>>>>>>>>> Note that this was generated on a normal boot up (not failure).
>>>>>>>>>>>
>>>>>>>>>>> The values looks good. Can you try with the below diff applied?
>>>>>>>>>>> --->8---
>>>>>>>>>>> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>>>>>>>>>>> index 334fe3130285..9771f6a82abe 100644
>>>>>>>>>>> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>>>>>>>>>>> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>>>>>>>>>>> @@ -721,12 +721,10 @@ static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
>>>>>>>>>>>               writel(hw->ctrl1n, gpmi_regs + HW_GPMI_CTRL1_SET);
>>>>>>>>>>>        
>>>>>>>>>>>               /* Wait 64 clock cycles before using the GPMI after enabling the DLL */
>>>>>>>>>>> -       dll_wait_time_us = USEC_PER_SEC / hw->clk_rate * 64;
>>>>>>>>>>> -       if (!dll_wait_time_us)
>>>>>>>>>>> -               dll_wait_time_us = 1;
>>>>>>>>>>> +       dll_wait_time_us = DIV_ROUND_UP(USEC_PER_SEC * 64, hw->clk_rate);
>>>>>>>>>>>        
>>>>>>>>>>>               /* Wait for the DLL to settle. */
>>>>>>>>>>> -       udelay(dll_wait_time_us);
>>>>>>>>>>> +       usleep_range(dll_wait_time_us, dll_wait_time_us * 10);
>>>>>>>>>>>        }
>>>>>>>>>>>        
>>>>>>>>>>>        static int gpmi_setup_data_interface(struct nand_chip *chip, int chipnr,
>>>>>>>>>>
>>>>>>>>>> Eventually it failed, in the same way with with same errors.
>>>>>>>>>> Took quite a while, over 600 boot cycles.
>>>>>>>>>>
>>>>>>>>>> Note also that I had to hand merge the changes, since in 5.1.14 that
>>>>>>>>>> gpmi_nfc_apply_timings() is in gpmi-lib.c. But it was trivial to do.
>>>>>>>>>
>>>>>>>>> Oh well. I guess the next thing to do would be to dump the timing regs
>>>>>>>>> and clk rate that are set by the bootloader (before the driver override
>>>>>>>>> them) or those applied by an older kernel (one that didn't have that
>>>>>>>>> issue).
>>>>>>>>
>>>>>>>> Is this useful?
>>>>>>>
>>>>>>> Hm, looks like it's configured in mode 0, so no, it's not super useful.
>>>>>>> Can you try booting an older kernel (one that didn't have the
>>>>>>> ->setup_data_interface() hook implemented).
>>>>>>
>>>>>> Ok. I went back from 5.1 and the first kernel I could find that
>>>>>> returned no grep hits for "setup_data_interface" was 4.16.
>>>>>>
>>>>>> So I built for my target with that and added similar trace to dump
>>>>>> the hardware register settings for that. Debug output looks like
>>>>>> this now for it:
>>>>>>
>>>>>> ...
>>>>>> drivers/mtd/nand/gpmi-nand/gpmi-nand.c(807): gpmi_get_clks()
>>>>>>       clk_get_rate(r->clock[0])=22000000
>>>>>> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1054): gpmi_begin()
>>>>>>       HW_GPMI_TIMING0=0x00010203
>>>>>>       HW_GPMI_TIMING1=0x05000000
>>>>>> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
>>>>>> nand: Micron MT29F2G08ABAEAWP
>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
>>>>>> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(966): enable_edo_mode()
>>>>>>       clk_get_rate(r->clock[0])=99000000
>>>>>> gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
>>>>>> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1054): gpmi_begin()
>>>>>>       HW_GPMI_TIMING0=0x00010101
>>>>>
>>>>> TIMING0 match the one you have with 5.1 kernels.
>>>>>     
>>>>>>       HW_GPMI_TIMING1=0x90000000
>>>>>
>>>>> And we even have a bigger timeout value in 5.1 (0xe0000000), so we
>>>>> should be all safe WRT to timings in TIMING{0,1}.
>>>>>
>>>>> Can you dump CTRL1?
>>>>
>>>> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1054): gpmi_begin()
>>>>      HW_GPMI_TIMING0=0x00010101
>>>>      HW_GPMI_TIMING1=0x90000000
>>>>      HW_GPMI_CTRL1_SET=0x01c4800c
>>>
>>> The read/write delay fields seem to match, but there are a few more
>>> fields set in this version:
>>> - DECOUPLE_CS
>>> - BCH_MODE
>>> - DEV_RESET
>>> - CTRL1_ATA_IRQRDY_POLARITY__ACTIVEHIGH
>>>
>>> Looks like those fields are not explicitly set in the gpmi_begin()
>>> patch, but maybe you dumped CTRL1. Would you mind sharing your patch?
>>
>> Attached.
> 
> Hm, you should read CTRL1 instead of CTRL1_SET which I guess is WO.


Here is 2 sets of trace dumping the same set of registers.
This first is on the linux-4.16 kernel:

Linux version 4.16.0 (gerg@goober) (gcc version 4.8.3 (GCC)) #9 Mon Aug 12 10:46:25 AEST 2019
...
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi-nand 1806000.gpmi-nand: use legacy bch geometry
gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1110): gpmi_begin()
   HW_GPMI_TIMING0=0x00010101
   HW_GPMI_TIMING1=0x90000000
   HW_GPMI_CTRL1=0x01c6800c
   r->clock[0]=99000000
Scanning device for bad blocks
5 ofpart partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.
...


And then this is from the 5.1.14 kernel:

Linux version 5.1.14 (gerg@goober) (gcc version 4.8.3 (GCC)) #25 Mon Aug 12 10:49:21 AEST 2019
...
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(510): gpmi_nfc_apply_timings()
   HW_GPMI_TIMING0=0x00020101
   HW_GPMI_TIMING1=0xb0000000
   HW_GPMI_CTRL1=0x0104000c
   r->clock[0]=22000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(510): gpmi_nfc_apply_timings()
   HW_GPMI_TIMING0=0x00010101
   HW_GPMI_TIMING1=0xe0000000
   HW_GPMI_CTRL1=0x01c6800c
   r->clock[0]=99000000
Scanning device for bad blocks
5 fixed-partitions partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.


Register settings read back from the registers themselves at the end
of the respective setting routines (so gpmi_begin() for 4.16 and
gpmi_nfc_apply_timings() for 5.1.14)

So something I notice here is that gpmi_nfc_apply_timings() is
being run multiple times. When I look back to the original
failure dumps the first error ("DMA timeout, last DMA") occurred
after the device type messages ("nand: 256 MiB, SLC,..."). Is it
happening with that higher clock rate still set?

Regards
Greg






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
