Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B512C47247
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 07:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29E7E206B8
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 07:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qr2YO8CR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29E7E206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otgeNuiWgFCTPC8k1l99840LuFPSSExRC4tPzmVqZrY=; b=qr2YO8CRn+FDpk
	/QzoEd+2FMB8RmmL96LWqoUecwj2TWP+Cmm5Qbs/hgQpBaimvXFpDqIGDgCBU382HpBO1euKvnMDl
	iGe9g7zY/3+7+TMPXw01n31XSTyZJ5fiv+Yd3KShPp7hQBF8LxKVkyksaSaz92qlPKelzwb64D4RY
	n1Q2pobW4Daqe41b9/Ny5szjLQ6bqHb6/8LiwCtfsbKsECK2rlNfsW+L1YT5voAH7CHnwgKkRzDGF
	JJMgcGQuu4tjmsry8/K7UyouBjK5iCFSAKfhZXL9EO2V8MU734KataM7gVMTKHtjFMKb1wBC7oB8+
	R7/3xM/FnacV7+SZDUcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVrpS-0000VF-3G; Tue, 05 May 2020 07:17:22 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVrpO-0000Tk-VD
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 07:17:20 +0000
IronPort-SDR: BeQ8++ppmbE7zGYuzbakLusQdFfvkcSG8psgbknsFKmiuH6PQ9CLfRRafZLoUN1hadJ97AhhIB
 cONxaUfKhFzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 00:17:18 -0700
IronPort-SDR: CC3/PNanzsn5BqWUZt+7YJ+y/t91tFE6zd+4MjFJHGOSqjZ7ac6q3Yc4vOTkEwUP+v5gVrYBss
 z9qHprK9oJDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; d="scan'208";a="434380983"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 05 May 2020 00:17:18 -0700
Received: from [10.255.159.65] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.159.65])
 by linux.intel.com (Postfix) with ESMTP id 501815803E3;
 Tue,  5 May 2020 00:17:13 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
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
 <6a41963b-e018-1a2d-88d4-5bb59d56a7e5@linux.intel.com>
 <20200505090001.145c5e8e@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <e0de2e2f-0960-217e-7555-7a37b8781ee4@linux.intel.com>
Date: Tue, 5 May 2020 15:17:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505090001.145c5e8e@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_001719_020130_D327CEF5 
X-CRM114-Status: GOOD (  19.65  )
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

On 5/5/2020 3:00 pm, Boris Brezillon wrote:
> Hello Vadivel,
> 
> On Tue, 5 May 2020 13:28:58 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>   
>>>>>>>>
>>>>>>>>       ebu_nand: ebu_nand@e0f00000 {
>>>>>>>>                       compatible = "intel,lgm-ebu-nand";
>>>>>>>>                       reg = <0xe0f00000 0x100
>>>>>>>>                       0xe1000000 0x300
>>>>>>>>                       0xe1400000 0x80000
>>>>>>>>                       0xe1c00000 0x10000>;
>>>>>>>>                       reg-names = "ebunand", "hsnand", "nand_cs0", nand_cs1";
>>>>>>>>                       dmas = <&dma0 8>, <&dma0 9>;
>>>>>>>>                       dma-names = "ebu_rx", "ebu_tx";
>>>>>>>>                       clocks =  <&cgu0 LGM_GCLK_EBU>;
>>>>>>>>               };
>>>>>>>>
>>>>>>>>
>>>>>>>> 	 &ebu_nand {
>>>>>>>> 	         status = "disabled";
>>>>>>>> 	        nand,cs = <1>;
>>>>>>>> 	        nand-ecc-mode = "hw";
>>>>>>>> 	        pinctrl-names = "default";
>>>>>>>> 	        pinctrl-0 = <&ebu_nand_base &ebu_cs1>;
>>>>>>>> 	};
>>>>>>>>         
>>>>>>>>>             
>>>>>>> Ok. If I understand the SoC topology correctly it should actually be
>>>>>>> something like that:
>>>>>>>
>>>>>>> {
>>>>>>> 	...
>>>>>>> 	fpi@xxxxx {
>>>>>>> 		compatible = "intel,lgm-fpi", "simple-bus";
>>>>>>>
>>>>>>> 		/* You might have other ranges to define here */
>>>>>>> 		ranges = <0x16000000 0xe0000000 0x1000000>;
>>>>>>>
>>>>>>> 		...
>>>>>>
>>>>>> Sorry, we do not have fpi tree node in our dts/dtsi file instead we have
>>>>>> the below one.. , that also not included the major peripherals
>>>>>> controllers node.
>>>>>>             /* Special part from CPU core */
>>>>>>             core: core {
>>>>>>                     compatible = "intel,core", "simple-bus";
>>>>>>                     #address-cells = <1>;
>>>>>>                     #size-cells = <1>;
>>>>>>                     ranges;
>>>>>>
>>>>>>                     ioapic1: interrupt-controller@fec00000 {
>>>>>>                             #interrupt-cells = <2>;
>>>>>>                             #address-cells = <0>;
>>>>>>                             compatible = "intel,ce4100-ioapic";
>>>>>>                             interrupt-controller;
>>>>>>                             reg = <0xfec00000 0x1000>;
>>>>>>                             nr_entries = <256>;
>>>>>>                     };
>>>>>>
>>>>>>                     hpet: timer@fed00000 {
>>>>>>                             compatible = "intel,ce4100-hpet";
>>>>>>                             reg = <0xfed00000 0x400>;
>>>>>>                     };
>>>>>>
>>>>>>                     lapic0: interrupt-controller@fee00000 {
>>>>>>                             compatible = "intel,ce4100-lapic";
>>>>>>                             reg = <0xfee00000 0x1000>;
>>>>>>                             no_pic_mode;
>>>>>>                     };
>>>>>>             };
>>>>>>
>>>>>> other than this, rest all in independent node .
>>>>>
>>>>> But you do have an FPI bus, right? If this is the case it should be
>>>>> represented.
>>>>
>>>> Yes, FPI bus is slave to core which connects all the peripherals.
>>>>
>>>>     Or is the "intel,core" bus actually the FPI bus that you
>>>>> named differently?
>>>>
>>>> FPI slave bus connects to core bus by OCP bridge, so here it is named
>>>> FPI bus, but SW perspective didn't have root tree which has all
>>>> sub-nodes, as of now each peripheral has its own node.
>>>
>>> Duh, not sure that's a good idea to hide that, especially since you
>>> have to describe the address translation that happens when crossing the
>>> FPI bus (the ranges thing I mentioned previously).
>>
>> Thanks! for the keep reviewing.
>>
>> SW Address translation is not required, after discussion with HW team ,
>> came to know that 0x17400 and 0x17C00 internal to the SoC.
>>
>> NOC will translate 0xE1XX... to FPI address 0x17X... internally.
>> There is an address translation in the NOC.
>> 0x17X... is not visible to user.
>>
>> so far added hard-coded values to CS0 and CS1 is not at required.
>> I will change the code accordingly and sent to you.
> 
> Hm, you told me last week that writing wrong values to this register
> caused the NAND controller to not work properly (you even had code that
> was overwriting the dynamically calculated values by hardcoded ones, so
> I suspect it indeed didn't work) and now you say this write to
> EBU_ADDR_SEL() is optional?! Sorry but it's hard to believe, and I've
> received so many contradictory information from you on that matter that
> I can't really tell which one is correct. Not sure I want to keep
> reviewing new versions of this driver in this context.

oh my bad really sorry , since last week based on the input given from 
person who has worked on legacy IP, but now I have discussed with 
low-level HW team and confirmed. also we don't have proper document 
reference manual since it's new SoC.

Please forgive me , this shouldn't be happen once again, Thanks a lot!!

Regards
Vadivel
> 
> Regards,
> 
> Boris
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
