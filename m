Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F2AC28CBC
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 01:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C782073E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 01:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aopkLqVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C782073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufW16T9rf5GiJPBdud2vlj6I9xb0ReRYkK5/BY2bTuY=; b=aopkLqVkbp97FD
	0WmFMCsdkEF9Wl13H+imqYYAbXr1L06O5sqN3raDnsGRlM930G9DT0cIZYUc0FFLkSaKnJ/lIpFvj
	9DEp2PA8vHS47EvnDyc/zcExPQD0Va7BpqWKLQeSGJ/r7ZjAUHD9/ChMCKcvPSMfXK6A9tB6r0JOZ
	0AQ0GNy5xQy7SQu+fWbLRbOe7tsY7haY19mGr0Jb35jvV7jsl4WzbDrI7FCgq2XBkyPpxiyKcdF2s
	6wA0dBlnECxRKBKhK2TM1zfW0i7ldejbR6bVqeMwtIPJifI6Wn9gN4/G9sEwQu5vS4Wb0P7AAndY1
	fsvxxb/Luk/7HAGiASdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVQNA-0004po-8e; Mon, 04 May 2020 01:58:20 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVQN7-0004pT-4x
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 01:58:18 +0000
IronPort-SDR: C/uTGzXaWm+r7PeL08rUxXqsti22iDf7CUEBQ31xSdTiEVXHO/ZY0fnRfJUqabLMRDhLlk4MKJ
 cPxbMgze5+IA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:58:15 -0700
IronPort-SDR: Ff3Y4xZ2QEk7wxYUQl6+j0WiEaUTuZZrEcn2LGSUgpJZeG8g0PG+BE1CCGK1w7xYYrWgwaxpSR
 qjMzawbxhmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="262680308"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 03 May 2020 18:58:15 -0700
Received: from [10.214.154.10] (vramuthx-mobl1.gar.corp.intel.com
 [10.214.154.10])
 by linux.intel.com (Postfix) with ESMTP id 773DE580609;
 Sun,  3 May 2020 18:58:09 -0700 (PDT)
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
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <5bf637de-0ac1-1a24-0e91-aeb18bb563b4@linux.intel.com>
Date: Mon, 4 May 2020 09:58:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430150124.7856d112@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_185817_262427_F1E80091 
X-CRM114-Status: GOOD (  18.85  )
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

   Thank you very much for the review comments and your time...

On 30/4/2020 9:01 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 14:36:00 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Thu, 30 Apr 2020 17:07:03 +0800
>> "Ramuthevar, Vadivel MuruganX"
>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>
>>>>>> The question is, is it the same value we have in nand_pa or it is
>>>>>> different?
>>>>>>         
>>>>> Different address which is 0xE1400000 NAND_BASE_PHY address.
>>>>
>>>> Then why didn't you tell me they didn't match when I suggested to pass
>>>
>>> sorry, because you keep asking nand_pa after that only I realized that.
>>>    
>>>> nand_pa? So now the question is, what does this address represent?
>>>
>>>                  EBU-MODULE
>>>    _________     _______________________
>>> |         |   |            |NAND CTRL  |
>>> | FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
>>> |_________|   |_CS1(0x17C)_|__________ |
>>>
>>> EBU_CONRTROLLER_BASE : 0xE0F0_0000
>>> HSNAND_BASE: 0xE100_0000
>>> NAND_CS0: 0xE140_0000
>>> NAND_CS1: 0xE1C0_0000
>>>
>>> MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
>>> MEM_REGION_BASE_CS1: 0x17C00
>>>    
>>
>> Hm, I wonder if we shouldn't use a 'ranges' property to describe this
>> address translation. Something like
>>
>> 	ebu@xxx {
>> 		ranges = <0x17400000 0xe1400000 0x1000>,
>> 			 <0x17c00000 0xe1c00000 0x1000>;
>> 		reg = <0x17400000>, <0x17c00000>;
>> 		reg-names = "cs-0", "cs-1";
>> 	}
>>
>> The translated address (0xE1X00000) will be available in res->start,
>> and the non-translated one (0x17X00000) can be retrieved with
>> of_get_address(). All you'd have to do then would be calculate the
>> mask:
>>
>> 	mask = (translated_address & original_address) >> 22;
>> 	num_comp_bits = fls(mask);
>> 	WARN_ON(mask != GENMASK(num_comp_bits - 1, 0));
>>
>> Which allows you to properly set the ADDR_SEL() register without
>> relying on some hardcoded values:
>>
>> 	writel(original_address | EBU_ADDR_SEL_REGEN |
>> 	       EBU_ADDR_COMP_BITS(num_comp_bits),
>> 	       ebu_host->ebu + EBU_ADDR_SEL(csid));
>>
>> That's quite important if we want to merge the xway NAND driver with
>> this one.
> 
> Looks like the translation is done at the FPI bus declaration level (see
> [1]). We really need to see the big picture to take a wise decision
> about the bindings. Would you mind pasting your dsti/dts files
> somewhere? It feels like the NAND controller is a sub-part of a more
> generic 'memory' controller, in which case the NAND controller should be
> declared as a child of this generic memory bus (called localbus in [1],
> but maybe EBU is more accurate).
> 
> [1]https://github.com/xieyaxiongfly/Atheros_CSI_tool_OpenWRT_src/blob/master/target/linux/lantiq/files-4.14/arch/mips/boot/dts/vr9.dtsi#L162

for the ebu-nand node in the dts file.

       ebu_nand: ebu_nand@e0f00000 {
                  compatible = "intel,lgm-ebu-nand";
                  reg = <0xe0f00000 0x100 //EBU_NAND controller
                   0xe1000000 0x300       //NAND ECC Extension access
                  0xe1400000 0x80000
                  0xe1c00000 0x10000>;
                  reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1";
                  dmas = <&dma0 8>, <&dma0 9>;
                  dma-names = "ebu_rx", "ebu_tx";
                  clocks =  <&cgu0 LGM_GCLK_EBU>;
          };


	 &ebu_nand {
	         status = "disabled";
	        nand,cs = <1>;
	        nand-ecc-mode = "hw";
	        pinctrl-names = "default";
	        pinctrl-0 = <&ebu_nand_base &ebu_cs1>;
	};

This is not comes under fpi in our devicetree.

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
