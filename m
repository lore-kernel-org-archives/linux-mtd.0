Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F93C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 05:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD41A20B1F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 05:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BhyL+Kqb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD41A20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iEdLi+20XvUY+KE91hpg5c1dPJb+YPsuxqTZ4TmP7bw=; b=BhyL+KqbbedFJsC6QnKTNc5j8
	2KsuG4/ULHqF3lZXta7SfjHFs1TyRN2/1+WAatOs2s0AUeAmv3Viox1IvukXiCj87T4hZ1bfkY0Sr
	plRLbE6YRuuSdc8BBzx4ImI/ihy4EaW6K8a7gO9dF3iaVuFLUNrdC4riRybvi0GzSaWjb1S49kW80
	7YeBf9oJOaBj4jGZls0VSz3sXypZ0anW3+xzBV5iR6iiGg1I8BiNwV7IL6svAUVKPI7O/nS59w29s
	28Xch0qB5lic8cEbSXUatLxmis1fh4R5Aun+bK3hTNGyaaFkfQe5kJ91t0rm2HOEfsUh76BTVIIVq
	GLOpZz6Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huVuN-0003DK-8b; Mon, 05 Aug 2019 05:51:47 +0000
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1huVuI-0003CX-4v
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 05:51:45 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AKAABuw0dd/zXSMGcNWRkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEHAQEBAQEBgVYBAQEBAQELAYQyhB6QEQEBAQEGgQktg2aFf5EdCQE?=
 =?us-ascii?q?BAQEBAQEBATcBAYQ/AoMHNwYOAQMBAQEEAQEBAQUBhVKGEAEBAQMjBFIQCw0?=
 =?us-ascii?q?LKgICVwYNBgIBAYMeAYF2qh5xfzMahS+DLYE4EIE0AYFiihd4gQeBESeCaz6?=
 =?us-ascii?q?HT4JYBIwlIIhEDYEhlGkJgh2DLYIgjksGG41aA4pMp0WBejMaCCgIgyeCThe?=
 =?us-ascii?q?OM2COPAEB?=
X-IPAS-Result: =?us-ascii?q?A2AKAABuw0dd/zXSMGcNWRkBAQEBAQEBAQEBAQEHAQEBA?=
 =?us-ascii?q?QEBgVYBAQEBAQELAYQyhB6QEQEBAQEGgQktg2aFf5EdCQEBAQEBAQEBATcBA?=
 =?us-ascii?q?YQ/AoMHNwYOAQMBAQEEAQEBAQUBhVKGEAEBAQMjBFIQCw0LKgICVwYNBgIBA?=
 =?us-ascii?q?YMeAYF2qh5xfzMahS+DLYE4EIE0AYFiihd4gQeBESeCaz6HT4JYBIwlIIhED?=
 =?us-ascii?q?YEhlGkJgh2DLYIgjksGG41aA4pMp0WBejMaCCgIgyeCTheOM2COPAEB?=
X-IronPort-AV: E=Sophos;i="5.64,348,1559491200"; d="scan'208";a="194799024"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out7.iinet.net.au with ESMTP; 05 Aug 2019 13:51:06 +0800
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
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
Date: Mon, 5 Aug 2019 15:51:05 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802145109.00c4a4eb@collabora.com>
Content-Type: multipart/mixed; boundary="------------151C05A4CC9BA773E9FBD0C0"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_225142_910554_9CB9CEC9 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: s.hauer@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------151C05A4CC9BA773E9FBD0C0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Boris,

On 2/8/19 10:51 pm, Boris Brezillon wrote:
> On Fri, 2 Aug 2019 22:34:57 +1000
> Greg Ungerer <gerg@kernel.org> wrote:
>> On 31/7/19 4:28 pm, Boris Brezillon wrote:
>>> On Wed, 31 Jul 2019 12:05:44 +1000
>>> Greg Ungerer <gerg@kernel.org> wrote:
>>>> On 30/7/19 6:38 pm, Miquel Raynal wrote:
>>>>> Greg Ungerer <gerg@kernel.org> wrote on Tue, 30 Jul 2019 16:06:55 +1000:
>>>>>> On 30/7/19 10:41 am, Greg Ungerer wrote:
>>>>>>> On 30/7/19 10:28 am, Greg Ungerer wrote:
>>>>>>>> On 29/7/19 10:47 pm, Miquel Raynal wrote:
>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 22:33:56 +1000:
>>>>>>>>>> On 29/7/19 6:36 pm, Miquel Raynal wrote:
>>>>>>>>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 16:41:51 +1000:
>>>>>>> [snip]
>>>> Note that this was generated on a normal boot up (not failure).
>>>
>>> The values looks good. Can you try with the below diff applied?
>>> --->8---
>>> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>>> index 334fe3130285..9771f6a82abe 100644
>>> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>>> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>>> @@ -721,12 +721,10 @@ static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
>>>           writel(hw->ctrl1n, gpmi_regs + HW_GPMI_CTRL1_SET);
>>>    
>>>           /* Wait 64 clock cycles before using the GPMI after enabling the DLL */
>>> -       dll_wait_time_us = USEC_PER_SEC / hw->clk_rate * 64;
>>> -       if (!dll_wait_time_us)
>>> -               dll_wait_time_us = 1;
>>> +       dll_wait_time_us = DIV_ROUND_UP(USEC_PER_SEC * 64, hw->clk_rate);
>>>    
>>>           /* Wait for the DLL to settle. */
>>> -       udelay(dll_wait_time_us);
>>> +       usleep_range(dll_wait_time_us, dll_wait_time_us * 10);
>>>    }
>>>    
>>>    static int gpmi_setup_data_interface(struct nand_chip *chip, int chipnr,
>>
>> Eventually it failed, in the same way with with same errors.
>> Took quite a while, over 600 boot cycles.
>>
>> Note also that I had to hand merge the changes, since in 5.1.14 that
>> gpmi_nfc_apply_timings() is in gpmi-lib.c. But it was trivial to do.
> 
> Oh well. I guess the next thing to do would be to dump the timing regs
> and clk rate that are set by the bootloader (before the driver override
> them) or those applied by an older kernel (one that didn't have that
> issue).

Is this useful?

With attached patch, I get the following dump of the timing
settings in use:

...
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(490): gpmi_nfc_apply_timings()
   HW_GPMI_TIMING0=0x00010203  (calculated=0x00020101)
   HW_GPMI_TIMING1=0x00000000  (calculated=0x60000000)
   HW_GPMI_CTRL1_SET=0x01c4000c  (calculated=0x00000000)
   r->clock[0]=22000000  (calculated=22000000)
random: fast init done
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(490): gpmi_nfc_apply_timings()
   HW_GPMI_TIMING0=0x00010203  (calculated=0x00020101)
   HW_GPMI_TIMING1=0x00000000  (calculated=0xb0000000)
   HW_GPMI_CTRL1_SET=0x01c4000c  (calculated=0x00000000)
   r->clock[0]=22000000  (calculated=22000000)
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(490): gpmi_nfc_apply_timings()
   HW_GPMI_TIMING0=0x00010203  (calculated=0x00010101)
   HW_GPMI_TIMING1=0x00000000  (calculated=0xe0000000)
   HW_GPMI_CTRL1_SET=0x01c4000c  (calculated=0x00c28000)
   r->clock[0]=22000000  (calculated=100000000)
Scanning device for bad blocks
5 fixed-partitions partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.
...

Regards
Greg



--------------151C05A4CC9BA773E9FBD0C0
Content-Type: text/x-patch;
 name="gpmi-nand-default-timing.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="gpmi-nand-default-timing.patch"

--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c	2019-03-06 15:47:24.310993476 +1000
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c	2019-08-05 15:04:49.241345883 +1000
@@ -486,6 +486,14 @@
 	void __iomem *gpmi_regs = r->gpmi_regs;
 	unsigned int dll_wait_time_us;
 
+#if 1
+	printk("%s(%d): gpmi_nfc_apply_timings()\n", __FILE__, __LINE__);
+	printk("  HW_GPMI_TIMING0=0x%08x  (calculated=0x%08x)\n", readl(gpmi_regs + HW_GPMI_TIMING0), hw->timing0);
+	printk("  HW_GPMI_TIMING1=0x%08x  (calculated=0x%08x)\n", readl(gpmi_regs + HW_GPMI_TIMING1), hw->timing1);
+	printk("  HW_GPMI_CTRL1_SET=0x%08x  (calculated=0x%08x)\n", readl(gpmi_regs + HW_GPMI_CTRL1_SET), hw->ctrl1n);
+	printk("  r->clock[0]=%d  (calculated=%d)\n", clk_get_rate(r->clock[0]), hw->clk_rate);
+#endif
+#if 0
 	clk_set_rate(r->clock[0], hw->clk_rate);
 
 	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
@@ -505,6 +513,7 @@
 
 	/* Wait for the DLL to settle. */
 	udelay(dll_wait_time_us);
+#endif
 }
 
 int gpmi_setup_data_interface(struct nand_chip *chip, int chipnr,

--------------151C05A4CC9BA773E9FBD0C0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------151C05A4CC9BA773E9FBD0C0--

