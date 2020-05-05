Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6331C47247
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 05:29:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4BC206B9
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 05:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKT+WIPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4BC206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNIM3audlhv64zqAkTH+9nHdNnBlEHs7QGwzu4+si2Y=; b=eKT+WIPtRnBg2f
	dzETnKg9Z7wugIrI55xuEeEJmHktCg+qHXq8CzzvapMC0Sk7In5O5Ub8AhPIhkVF6wxOFTbBWsIOP
	pieRkbI8eq4kniXBChn0y9F5cKgfbLHL4L8ps5B62e0BXvGhMHFmEDucCUIqe+s5bG6lVfa/0jbK9
	hCTLCOS3LE+VfrD2umCzgA9OQReX4zaP6CU64SprFP6e0rXuCRDWmunrenaHqUmXNaw0S3MItjAo0
	KaMOv971o3rCYtSqFpsw0C5t8s8FenpOB+4q7wm3gSAaDDLOVMfikcqdIEC5cc8UT6XxfabNLyugH
	nbmsZHp/rZxXaYqQcJlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVq8l-00076H-3p; Tue, 05 May 2020 05:29:11 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVq8i-000758-72
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 05:29:09 +0000
IronPort-SDR: 5XTOWXqhTXHySVW8CKuW/809e7YD4wZl45SaF7iIB6Pv9+nYYV0ZPeL4keifa7icHMuXMpt7k2
 Zsij/v7Ew0pw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 22:29:07 -0700
IronPort-SDR: Ka2n6nzc72bmrDfCQ8MCGg92c53MFCDeHzralBloqv1HAkxaQX7zKxf9PgWcCfyBz/NDT9/MPv
 VKZRx16Nlrxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; d="scan'208";a="284127785"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2020 22:29:06 -0700
Received: from [10.255.159.65] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.159.65])
 by linux.intel.com (Postfix) with ESMTP id 24058580609;
 Mon,  4 May 2020 22:29:00 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
 <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
 <20200429173107.5c6d2f55@collabora.com>
 <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
 <20200430102114.29b6552f@collabora.com>
 <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
 <20200430103658.4b0b979e@collabora.com>
 <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
 <20200430143600.27031639@collabora.com>
 <20200430150124.7856d112@collabora.com>
 <df7c1952-bc9b-bad7-bf31-d09707a0829e@linux.intel.com>
 <20200504090824.1eb16b78@collabora.com>
 <854521ed-b0f9-0f0f-2cd7-5ad11b2d059a@linux.intel.com>
 <20200504091755.0d0e73aa@collabora.com>
 <db023399-8b4d-c75c-30c8-b35e38e2e5f8@linux.intel.com>
 <20200504105828.72aaf7b8@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <6a41963b-e018-1a2d-88d4-5bb59d56a7e5@linux.intel.com>
Date: Tue, 5 May 2020 13:28:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504105828.72aaf7b8@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_222908_271174_857C11A3 
X-CRM114-Status: GOOD (  20.03  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 4/5/2020 4:58 pm, Boris Brezillon wrote:
> On Mon, 4 May 2020 16:50:08 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>> On 4/5/2020 3:17 pm, Boris Brezillon wrote:
>>> On Mon, 4 May 2020 15:15:08 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> Hi Boris,
>>>>
>>>>      Thank you very much for the prompt review and suggestions...
>>>>
>>>> On 4/5/2020 3:08 pm, Boris Brezillon wrote:
>>>>> On Mon, 4 May 2020 10:02:35 +0800
>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com>  wrote:
>>>>>       
>>>>>> Hi Boris,
>>>>>>
>>>>>> On 30/4/2020 9:01 pm, Boris Brezillon wrote:
>>>>>>> On Thu, 30 Apr 2020 14:36:00 +0200
>>>>>>> Boris Brezillon<boris.brezillon@collabora.com>  wrote:
>>>>>>>          
>>>>>>>> On Thu, 30 Apr 2020 17:07:03 +0800
>>>>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com>  wrote:
>>>>>>>>         
>>>>>>>>>>>> The question is, is it the same value we have in nand_pa or it is
>>>>>>>>>>>> different?
>>>>>>>>>>>>                  
>>>>>>>>>>> Different address which is 0xE1400000 NAND_BASE_PHY address.
>>>>>>>>>> Then why didn't you tell me they didn't match when I suggested to pass
>>>>>>>>> sorry, because you keep asking nand_pa after that only I realized that.
>>>>>>>>>             
>>>>>>>>>> nand_pa? So now the question is, what does this address represent?
>>>>>>>>>                     EBU-MODULE
>>>>>>>>>       _________     _______________________
>>>>>>>>> |         |   |            |NAND CTRL  |
>>>>>>>>> | FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
>>>>>>>>> |_________|   |_CS1(0x17C)_|__________ |
>>>>>>>>>
>>>>>>>>> EBU_CONRTROLLER_BASE : 0xE0F0_0000
>>>>>>>>> HSNAND_BASE: 0xE100_0000
>>>>>>>>> NAND_CS0: 0xE140_0000
>>>>>>>>> NAND_CS1: 0xE1C0_0000
>>>>>>>>>
>>>>>>>>> MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
>>>>>>>>> MEM_REGION_BASE_CS1: 0x17C00
>>>>>>>>>             
>>>>>>>> Hm, I wonder if we shouldn't use a 'ranges' property to describe this
>>>>>>>> address translation. Something like
>>>>>>>>
>>>>>>>> 	ebu@xxx {
>>>>>>>> 		ranges = <0x17400000 0xe1400000 0x1000>,
>>>>>>>> 			 <0x17c00000 0xe1c00000 0x1000>;
>>>>>>>> 		reg = <0x17400000>, <0x17c00000>;
>>>>>>>> 		reg-names = "cs-0", "cs-1";
>>>>>>>> 	}
>>>>>>>>
>>>>>>>> The translated address (0xE1X00000) will be available in res->start,
>>>>>>>> and the non-translated one (0x17X00000) can be retrieved with
>>>>>>>> of_get_address(). All you'd have to do then would be calculate the
>>>>>>>> mask:
>>>>>>>>
>>>>>>>> 	mask = (translated_address & original_address) >> 22;
>>>>>>>> 	num_comp_bits = fls(mask);
>>>>>>>> 	WARN_ON(mask != GENMASK(num_comp_bits - 1, 0));
>>>>>>>>
>>>>>>>> Which allows you to properly set the ADDR_SEL() register without
>>>>>>>> relying on some hardcoded values:
>>>>>>>>
>>>>>>>> 	writel(original_address | EBU_ADDR_SEL_REGEN |
>>>>>>>> 	       EBU_ADDR_COMP_BITS(num_comp_bits),
>>>>>>>> 	       ebu_host->ebu + EBU_ADDR_SEL(csid));
>>>>>>>>
>>>>>>>> That's quite important if we want to merge the xway NAND driver with
>>>>>>>> this one.
>>>>>>> Looks like the translation is done at the FPI bus declaration level (see
>>>>>>> [1]). We really need to see the big picture to take a wise decision
>>>>>>> about the bindings. Would you mind pasting your dsti/dts files
>>>>>>> somewhere? It feels like the NAND controller is a sub-part of a more
>>>>>>> generic 'memory' controller, in which case the NAND controller should be
>>>>>>> declared as a child of this generic memory bus (called localbus in [1],
>>>>>>> but maybe EBU is more accurate).
>>>>>>>
>>>>>>> [1]https://github.com/xieyaxiongfly/Atheros_CSI_tool_OpenWRT_src/blob/master/target/linux/lantiq/files-4.14/arch/mips/boot/dts/vr9.dtsi#L162
>>>>>>
>>>>>>      ebu_nand: ebu_nand@e0f00000 {
>>>>>>                      compatible = "intel,lgm-ebu-nand";
>>>>>>                      reg = <0xe0f00000 0x100
>>>>>>                      0xe1000000 0x300
>>>>>>                      0xe1400000 0x80000
>>>>>>                      0xe1c00000 0x10000>;
>>>>>>                      reg-names = "ebunand", "hsnand", "nand_cs0", nand_cs1";
>>>>>>                      dmas = <&dma0 8>, <&dma0 9>;
>>>>>>                      dma-names = "ebu_rx", "ebu_tx";
>>>>>>                      clocks =  <&cgu0 LGM_GCLK_EBU>;
>>>>>>              };
>>>>>>
>>>>>>
>>>>>> 	 &ebu_nand {
>>>>>> 	         status = "disabled";
>>>>>> 	        nand,cs = <1>;
>>>>>> 	        nand-ecc-mode = "hw";
>>>>>> 	        pinctrl-names = "default";
>>>>>> 	        pinctrl-0 = <&ebu_nand_base &ebu_cs1>;
>>>>>> 	};
>>>>>>      
>>>>>>>          
>>>>> Ok. If I understand the SoC topology correctly it should actually be
>>>>> something like that:
>>>>>
>>>>> {
>>>>> 	...
>>>>> 	fpi@xxxxx {
>>>>> 		compatible = "intel,lgm-fpi", "simple-bus";
>>>>>
>>>>> 		/* You might have other ranges to define here */
>>>>> 		ranges = <0x16000000 0xe0000000 0x1000000>;
>>>>>
>>>>> 		...
>>>>
>>>> Sorry, we do not have fpi tree node in our dts/dtsi file instead we have
>>>> the below one.. , that also not included the major peripherals
>>>> controllers node.
>>>>            /* Special part from CPU core */
>>>>            core: core {
>>>>                    compatible = "intel,core", "simple-bus";
>>>>                    #address-cells = <1>;
>>>>                    #size-cells = <1>;
>>>>                    ranges;
>>>>
>>>>                    ioapic1: interrupt-controller@fec00000 {
>>>>                            #interrupt-cells = <2>;
>>>>                            #address-cells = <0>;
>>>>                            compatible = "intel,ce4100-ioapic";
>>>>                            interrupt-controller;
>>>>                            reg = <0xfec00000 0x1000>;
>>>>                            nr_entries = <256>;
>>>>                    };
>>>>
>>>>                    hpet: timer@fed00000 {
>>>>                            compatible = "intel,ce4100-hpet";
>>>>                            reg = <0xfed00000 0x400>;
>>>>                    };
>>>>
>>>>                    lapic0: interrupt-controller@fee00000 {
>>>>                            compatible = "intel,ce4100-lapic";
>>>>                            reg = <0xfee00000 0x1000>;
>>>>                            no_pic_mode;
>>>>                    };
>>>>            };
>>>>
>>>> other than this, rest all in independent node .
>>>
>>> But you do have an FPI bus, right? If this is the case it should be
>>> represented.
>>
>> Yes, FPI bus is slave to core which connects all the peripherals.
>>
>>    Or is the "intel,core" bus actually the FPI bus that you
>>> named differently?
>>
>> FPI slave bus connects to core bus by OCP bridge, so here it is named
>> FPI bus, but SW perspective didn't have root tree which has all
>> sub-nodes, as of now each peripheral has its own node.
> 
> Duh, not sure that's a good idea to hide that, especially since you
> have to describe the address translation that happens when crossing the
> FPI bus (the ranges thing I mentioned previously).

Thanks! for the keep reviewing.

SW Address translation is not required, after discussion with HW team , 
came to know that 0x17400 and 0x17C00 internal to the SoC.

NOC will translate 0xE1XX... to FPI address 0x17X... internally.
There is an address translation in the NOC.
0x17X... is not visible to user.

so far added hard-coded values to CS0 and CS1 is not at required.
I will change the code accordingly and sent to you.


Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
