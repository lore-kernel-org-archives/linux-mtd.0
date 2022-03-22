Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B78AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31jR5hEHJlfiwQbFywlBBBmyiNucbGdWjzhQqu3fKZA=; b=uXd5bnSQDD1Tv+
	mdHKDMEZAgS4JtEzc2qcQOIPvaT1QxrhmeDsq022c4lSeDrUuNSmq5OmxZLM0/ethVRR1EEE2wCn/
	3bJNTHcrBf38rtfctM/xIwX4RXqr5V83ye2pRCiFZD3OFWs7oo2q6hhjkMPS6T7RSG5nhw9Pch0+K
	sbCF3ndNeUoIR73vOEarTq8/jlgj9vQ2a6pk+cwhfYvNcpl4X+C09L9S4nAz7KSwbHidkXGAeuu6p
	JNn+Z1zIwQez30RG3S9wA+nMPCS34o4+67m0YyApqsq9CQDWZQ5Qgfd+9EagGpmLjBW38JCc/0M47
	n0ud7G7a4/v5z8rQLatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWbia-00AiEO-49; Tue, 22 Mar 2022 10:26:24 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWbiV-00AiDm-1Y
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 10:26:21 +0000
Received: from [IPV6:2001:a61:618e:a001:298d:1e1d:3bf:6bb8] (unknown
 [IPv6:2001:a61:618e:a001:298d:1e1d:3bf:6bb8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: sbabic@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C0FB280FD8;
 Tue, 22 Mar 2022 11:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647944774;
 bh=vngRyFAqpviZE3IXZbuj5Np26m+cB3H+L+LTxbdBc7w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XBp5pqkxgjw2RpNjwCv7O6Ctj3kBc2vxd9CouMCqTGj8hDKt4BDFpDCOO9uR/8KHa
 5raaqJ/7HD3GHyfXDVruMblLtE8DMMIupQRFxRKCVrtCmtymFR9yc1xhnD/J7pvvus
 IcMfik58gzhf1uhgPUxiiG5xpD5jbACyYZj7xRekPAugmKy5twg5G+286Dd5cqbd+2
 JEKBYTtMNtvTfVZOJUY5Zn7i4C7avyb3SKiYchhFerljMp1FTkeUBVqiWAtAAEsLqI
 dVYOsnVlTvd08WscS+BzV5F7kZdMw5Tjhiyl0XHYzs4OKbtRZoSBdpsxaBZOJM1kzm
 MJC/WL7sqzLnQ==
Message-ID: <f0b9f993-7c6f-70e5-0f5c-9f537101dbc1@denx.de>
Date: Tue, 22 Mar 2022 11:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
Content-Language: de-DE
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stefano Babic <sbabic@denx.de>, Sean Nyekjaer <sean@geanix.com>
Cc: peng.fan@nxp.com, ye.li@nxp.com, alice.guo@nxp.com, sjg@chromium.org,
 seanga2@gmail.com, u-boot@lists.denx.de, miquel.raynal@bootlin.com,
 linux-mtd <linux-mtd@lists.infradead.org>, "han.xu" <han.xu@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
 dl-uboot-imx <uboot-imx@nxp.com>
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
 <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
 <20210513200242.fxvfvwgua35hbqvr@umbrella>
 <edd64777-ff6a-82fd-63bb-7b2f31f63f44@geanix.com>
 <05831c2f-668f-1386-2ba6-4ce623b50d49@kontron.de>
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: <05831c2f-668f-1386-2ba6-4ce623b50d49@kontron.de>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_032619_491472_2C65B2A2 
X-CRM114-Status: GOOD (  35.09  )
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

Hi Frieder,

sorry for late answer.
On 17.03.22 14:24, Frieder Schrempf wrote:
> Hi Stefano,
> 
> this old patch was delegated to you in patchwork. If you're not the
> correct maintainer to address, please let me know. As the NAND layer
> seems to be unmaintained at the moment, I'm not sure whom to ask.
> 

I am not the maintainer, but I picked up also in the past patches for 
NAND else they could not be merged. I will do this time, too.

Han has sent a patch yesterday to align u-boot and kernel, and it is 
okay if it is assigned to me, I will then merge it. I see from Sean he 
can test on thursday.

Regards,
Stefano

> This patch fixes a regression that was introduced by 616f03dabacb ("
> mtd: gpmi: change the BCH layout setting for large oob NAND") which
> alters the BCH layout in a way that doesn't match with the
> implementation in the Linux kernel.
> 
> This causes failures when loading an UBI image in U-Boot that was
> flashed by Linux or vice versa (see [1]).
> 
> There has been an approach to fix this through an optional devicetree
> property in 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
> geometry"), but this is not acceptable. The "legacy" BCH layout
> compatible with Linux should be used by default.
> 
> The approach to upstream the "new" layout to the kernel [2] seems to be
> stalled and even if it would succeed, it would break systems that use an
> old U-Boot and a new kernel, which is again not really acceptable in my
> opinion.
> 
> For the reasons above I would like to ask U-Boot maintainers to pick up
> this patch.
> 
> Thanks
> Frieder
> 
> [1] https://lists.denx.de/pipermail/u-boot/2022-March/477828.html
> [2]
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20210522205136.19465-2-han.xu@nxp.com/
> 
> Am 20.05.21 um 11:09 schrieb Sean Nyekjaer:
>> On 13/05/2021 22.02, han.xu wrote:
>>> On 21/05/11 07:08AM, Sean Nyekjaer wrote:
>>>> Caution: EXT Email
>>>>
>>>> On 11/05/2021 04.49, han.xu wrote:
>>>>> On 21/05/10 12:00PM, Sean Nyekjaer wrote:
>>>>>> Caution: EXT Email
>>>>>>
>>>>>> Linux kernel defaults to use legacy bch setting, this was creating a
>>>>>> mismatch between U-boot and Linux default settings.
>>>>> Kernel uses the NAND chip specified minimum ecc strength and steps by default
>>>>> not the legacy bch setting, unless users enable it in DT file.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> Adding, mtd-list and Miquel
>>>>
>>>> With u-boot dtb:
>>>> &gpmi {
>>>>          pinctrl-names = "default";
>>>>          pinctrl-0 = <&pinctrl_gpmi_nand1>;
>>>>          compatible = "fsl,imx7d-gpmi-nand";
>>>>          nand-on-flash-bbt;
>>>>          status = "okay";
>>>> };
>>>>
>>>> With linux dtb (mainline 5.10):
>>>> &gpmi {
>>>>          pinctrl-names = "default";
>>>>          pinctrl-0 = <&pinctrl_gpmi_nand1>;
>>>>          nand-on-flash-bbt;
>>>>          status = "okay";
>>>> };
>>>>
>>>> U-boot prior to commit 51cdf83eea selected 18 bit ECC, after that commit it selects 8 bits.
>>>> With legacy option it selects 18.
>>>> Linux is selecting 18 bits ;) So now we have a mismatch.
>>>>
>>>> I have been searching for the legacy option in the mainline kernel can't find it ;)
>>>> Please show me where it is (is it in the NXP fork?)
>>>
>>> You are right, it's only fixed in NXP fork, with kernel driver modification. We
>>> prefer the current u-boot bch geometry, so I will send out a kernel patch to
>>> make them align.
>>>
>> Any progress on this?
>>
>> I see your patch in:
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsource.codeaurora.org%2Fexternal%2Fimx%2Flinux-imx%2Fcommit%2Fdrivers%2Fmtd%2Fnand%2Fraw%2Fgpmi-nand%3Fh%3Dimx_5.4.70_2.3.0%26id%3Dae980dccc6189956fab047958ad0a70ec4951439&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C275b7f11361e4fd3eb7e08d91b6f0e45%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637570986066857865%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=L4xAN9HDl68dmA%2FX6nnP%2Buqh6CUKTQZJeFWja5EvmPI%3D&amp;reserved=0
>>
>> But I can't find the option for selecting legacy mode in the devicetree...
>>
>> /Sean


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
