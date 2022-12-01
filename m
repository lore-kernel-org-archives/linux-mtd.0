Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613ECC47088
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKYk0WgS3OEBqWC0oCQPV3WioGsv3Oe/9fXAdmHJblU=; b=lvL96rqulu2oYq
	av0psRZNLMvKSmCcE79XqA2Ci4S+WYbbZJ3iDGKsRKWnOW9jX7uUbY4AxaEqTL9+FlaPQ7euBclFB
	RNj5N737DJPyx4EOY0yjvxh5HX0G58rycYhCvSHnK2jzgZTNlPwmH31ON2FtYJOj5CNUliCz8Hbs1
	/E6qoGK+m6Hk1x4baq8J7WFVbmm0VHz1lyxm/fTNPmi8surorGTpcUeUIeayTiC/GS3EW8H/ws0D9
	WTgliRU8ycvhbcpEHtGCCD3oCN/lkY1oF7Ypp7I1L+aVWxatso3Gvihp/4dNsDy6Rsr3Lm/jONlJo
	54tLjbbcaDwhwFI95VGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hhQ-0073Jm-5x; Thu, 01 Dec 2022 11:25:52 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hhE-0073GT-BK; Thu, 01 Dec 2022 11:25:42 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 30FD8853ED;
	Thu,  1 Dec 2022 12:25:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669893936;
	bh=yRZSp89XEvXg+1Ku43frQh5KXHoYXxfK4JG3galWAQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XQAO1J0hYwP0I0aG+Bqf3PFiYVEki8GplQ/U54Oxju5W28Zk569vq2DqaknOmTGMS
	 T8cC9UdzjMub/xvsCIuaWyQRNgCUyQHxQazKG70IIiGFgb3BzrWOG7hlDlooCxGpIH
	 4OpljxXSu3vBY3gDhrbT666+GMSwZnKiSSd0ND8Rma7tzWSaDThLc+oJ6/HPpTvRxJ
	 xVR7hw18wSXI9wv33hFWlSshjvSCm+hUCGH4Hj6oXGWyfSr1HL9m94yG2+agh8zFKi
	 BrK+IiSiKgcu2Zpx4RpxztyWD7l36qCGsa0PAyz2NkifskTLRc37uGpMAmzw/YECuh
	 qONnRQiIET6xg==
Message-ID: <b5080dd6-40b3-a8f2-0c4e-4c1e52e67fe8@denx.de>
Date: Thu, 1 Dec 2022 12:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Boot failure regression on 6.0.10 stable kernel on iMX7
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com>
 <12f7fbb7-8252-4520-89c2-c5138931a696@denx.de>
 <Y4fCZmjDMtMMyu+E@francesco-nb.int.toradex.com>
 <fef2598e-e5fc-c4fc-0530-2d3c380ed39a@denx.de>
 <Y4iKAUav9ktuxncE@francesco-nb.int.toradex.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y4iKAUav9ktuxncE@francesco-nb.int.toradex.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_032540_759627_75F2BC45 
X-CRM114-Status: GOOD (  38.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/1/22 12:03, Francesco Dolcini wrote:
> + MTD maintainers/list
> 
> On Wed, Nov 30, 2022 at 11:59:04PM +0100, Marek Vasut wrote:
>> On 11/30/22 21:51, Francesco Dolcini wrote:
>>> On Wed, Nov 30, 2022 at 03:41:13PM +0100, Marek Vasut wrote:
>>>> On 11/30/22 14:52, Francesco Dolcini wrote:
>>>>> [    0.000000] Booting Linux on physical CPU 0x0
>>>>> [    0.000000] Linux version 6.0.10 (francesco@francesco-nb) (arm-linux-gnueabihf-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.
>>>>> 4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #36 SMP Wed Nov 30 14:07:15 CET 2022
>>>>> ...
>>>>> [    4.407499] gpmi-nand: error parsing ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller
>>>>> @33002000)
>>>>> [    4.438401] gpmi-nand 33002000.nand-controller: driver registered.
>>>>> ...
>>>>> [    5.933906] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -19
>>>>> [    5.946504] Please append a correct "root=" boot option; here are the available partitions:
>>>>> ...
>>>>>
>>>>> Any idea? I'm not familiar with the gpmi-nand driver and I would just revert it, but
>>>>> maybe you have a better idea.
>>>>
>>>> Can you share the relevant snippet of your nand controller DT node ?
>>>
>>> We just have
>>>
>>> from imx7-colibri.dtsi,
>>>
>>>     &gpmi {
>>>     	fsl,use-minimum-ecc;
>>>     	nand-ecc-mode = "hw";
>>>     	nand-on-flash-bbt;
>>>     	pinctrl-names = "default";
>>>     	pinctrl-0 = <&pinctrl_gpmi_nand>;
>>>     };
>>>
>>> OF partition are created by U-Boot from
>>>     mtdparts=mtdparts=gpmi-nand:512k(mx7-bcb),1536k(u-boot1)ro,1536k(u-boot2)ro,512k(u-boot-env),-(ubi)
>>> env variables calling fdt_fixup_mtdparts from colibri_imx7.c
>>>
>>> Everything is available in the upstream Linux/U-Boot git, no downstream
>>> repo of any sort.
>>>
>>>> Probably up to first partition is enough. I suspect you need to fill in the
>>>> correct address-cells/size-cells there, which might be currently missing in
>>>> your DT and worked by chance.
>>>
>>> This is generated by U-Boot, I would need to dump what he did generate
>>> from the standard fdt_fixup_mtdparts(). I will try to do it tomorrow
>>> unless what I wrote here is already enough to understand what's going
>>> on.
>>
>> Oh drat ... I see. It's the u-boot fdt_node_set_part_info() which checks the
>> current NAND controller #size-cells and uses that when generating MTD
>> partitions 'reg' properties. Since #size-cells is now zero, the reg
>> properties would be malformed.
> 
> I think the issue is slightly different, the u-boot code checks it and
> if not set it defaults to #size-cells = <1>. Said that u-boot
> never set #size-cells anywhere.

Which it really should, can you send a patch there too ?

> What is failing is ofpart_core.c:parse_fixed_partitions() in Linux with
> #size-cells = <0>.
> 
> 
>> Now, what I am unsure is whether the right fix is to update mx7 colibri DT
>> and include &gpmi { #size-cells=<1>; }; , or , revert this patch. The former
>> fixes the problem for colibri and retains the correct #size-cells=<0>
>> behavior for any other board which does not specify MTD partitions in the
>> GPMI NAND node. The later also covers boards which we don't know about which
>> might also use generated MTD partitions in DT using fdt_fixup_mtdparts() in
>> U-Boot, but I am not convinced that is correct.
>>
>> So, would you be OK with fixing up the colibri mx7 DT with #size-cells=<1> ?
> 
> I am also not sure what is the right fix, however I am convinced that
> the fix needs to be in Linux, we cannot really break the boot flow.

I agree

> In a very pragmatic way I could just add the property to colibri-imx7
> dtsi, but we are really breaking potential other users of it, anybody
> using U-Boot to generate the partitions in the end ... (and the list is
> not empty and not just the colibri*).

I agree here too

> Would it make any sense to do something like that (untested!) ?
> 
> diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> index 192190c42fc8..fffd60acd926 100644
> --- a/drivers/mtd/parsers/ofpart_core.c
> +++ b/drivers/mtd/parsers/ofpart_core.c
> @@ -122,6 +122,8 @@ static int parse_fixed_partitions(struct mtd_info *master,
> 
>                  a_cells = of_n_addr_cells(pp);
>                  s_cells = of_n_size_cells(pp);
> +               if (s_cells == 0)
> +                       s_cells = 1; // for backward compatibility
>                  if (len / 4 != a_cells + s_cells) {
>                          pr_debug("%s: ofpart partition %pOF (%pOF) error parsing reg property.\n",
>                                   master->name, pp,

You might want to print a warning too, so users would fix their DTs, 
since once there is MTD partition > 4 GiB, this would break. Otherwise I 
like this option.

Thanks for looking into this !

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
