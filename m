Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC44C34056
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 18:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF32124670
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 18:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJWOg67F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF32124670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3a7Sv2KA+ZglngyMIOHk5/h6WnkcfOFHDw3EzIadf74=; b=CJWOg67FtAio1C8+cJG4tSuwx
	uLUZpQemR/Y+SAyzQNbXKfnkGNBb9v6XdsIzQDS55Z2xFXpFT7/30C7NvK+mPU+vh3qkU+me2UazW
	ZwKcXuiRXGbAQ6JPwfRGPdEtPuFGxzuVqzvaICepXr6UpntDnIedxTm0nWbya6D5dZFf2XE+fJTa7
	MqlUSuUXA5PMoMYJpOFUeXJ4adEJ/KxiGPeKB15fTcMp7vsIG8Vz9LHAbGojFQwurTKEB6EH74HoB
	0xjUCcgYcWgji8LcPz+vNsaE9c1YYZzMZr5020DOfhVUf8cia+Wa90iJJsIBiflxeA4GOrx1yAMpi
	WtQPgOQIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ULS-0007n8-NG; Wed, 19 Feb 2020 18:45:14 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ULD-0006Pi-8O
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 18:45:01 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48N68n3B5nz1qqkq;
 Wed, 19 Feb 2020 19:44:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48N68n1Rycz1qyDK;
 Wed, 19 Feb 2020 19:44:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id iEi1FHsr8kp4; Wed, 19 Feb 2020 19:44:55 +0100 (CET)
X-Auth-Info: sENUZ557ky/d+KmFvTCJb0USmGDiCqDHWwGKkL4heLE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 19 Feb 2020 19:44:55 +0100 (CET)
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
 <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
Date: Wed, 19 Feb 2020 19:42:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------7836A46E0DEA5A9F212DF892"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_104459_602084_257FAE18 
X-CRM114-Status: GOOD (  20.69  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------7836A46E0DEA5A9F212DF892
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2/18/20 6:55 AM, Masahiro Yamada wrote:
> Hi

Hi,

[...]

>> There is no change around the ->setup_data_interface() hook
>> after v4.19
>> The only difference I could think of is the clock frequency.
>>
>> But, it is OK if you do not want to test it.
>>
>> And you are confident.
>>
>> So, let's suspect the ->setup_data_interface() hook.
>>
>>
>> If possible, can you provide the dump of
>> the attached debug code?
>>
> 
> 
> I attached two experimental patches.
> 
> I cannot test them because
> the mainline code works fine for my boards.
> 
> Does either of them improve something
> on your settings?

Considering that the NAND works if denali_setup_data_interface() is not
called, would it rather make sense to first read and print what's
programmed into the controller and then print what the code calculated
and intends to program into the controller ?

See attached patch, with which (without this revert) you get this:
denali->reg + TWHR2_AND_WE_2_RE = 0x00001414 -> 0x0000143f
denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
denali->reg + RE_2_WE = 0x00000014 -> 0x00000019
denali->reg + ACC_CLKS = 0x00000004 -> 0x00000005
denali->reg + RDWR_EN_LO_CNT = 0x00000002 -> 0x00000009
denali->reg + RDWR_EN_HI_CNT = 0x00000002 -> 0x00000004
denali->reg + CS_SETUP_CNT = 0x00000001 -> 0x00000008
denali->reg + RE_2_RE = 0x00000014 -> 0x00000019

--------------7836A46E0DEA5A9F212DF892
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-denali-dump-timing-parameters.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-denali-dump-timing-parameters.patch"

>From a2a1300041979f183a5a85ddada63faa80b68983 Mon Sep 17 00:00:00 2001
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Feb 2020 16:48:06 +0900
Subject: [PATCH] denali: dump timing parameters

:'<,'>s@iowrite32(\([^,]\+\), \([^)]\+\));@pr_err("\2 = 0x%08x -> 0x%08x\\n", ioread32(\2), \1);\r\t&

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 drivers/mtd/nand/raw/denali.c | 44 +++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index b6c463d02167..4241b47d92a6 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -218,14 +218,21 @@ static void denali_select_target(struct nand_chip *chip, int cs)
 		return;
 
 	/* update timing registers unless NAND_KEEP_TIMINGS is set */
+	pr_err("denali->reg + TWHR2_AND_WE_2_RE = 0x%08x -> 0x%08x\n", ioread32(denali->reg + TWHR2_AND_WE_2_RE), sel->hwhr2_and_we_2_re);
 	iowrite32(sel->hwhr2_and_we_2_re, denali->reg + TWHR2_AND_WE_2_RE);
-	iowrite32(sel->tcwaw_and_addr_2_data,
-		  denali->reg + TCWAW_AND_ADDR_2_DATA);
+	pr_err("denali->reg + TCWAW_AND_ADDR_2_DATA = 0x%08x -> 0x%08x\n", ioread32(denali->reg + TCWAW_AND_ADDR_2_DATA), sel->tcwaw_and_addr_2_data);
+	iowrite32(sel->tcwaw_and_addr_2_data, denali->reg + TCWAW_AND_ADDR_2_DATA);
+	pr_err("denali->reg + RE_2_WE = 0x%08x -> 0x%08x\n", ioread32(denali->reg + RE_2_WE), sel->re_2_we);
 	iowrite32(sel->re_2_we, denali->reg + RE_2_WE);
+	pr_err("denali->reg + ACC_CLKS = 0x%08x -> 0x%08x\n", ioread32(denali->reg + ACC_CLKS), sel->acc_clks);
 	iowrite32(sel->acc_clks, denali->reg + ACC_CLKS);
+	pr_err("denali->reg + RDWR_EN_LO_CNT = 0x%08x -> 0x%08x\n", ioread32(denali->reg + RDWR_EN_LO_CNT), sel->rdwr_en_lo_cnt);
 	iowrite32(sel->rdwr_en_lo_cnt, denali->reg + RDWR_EN_LO_CNT);
+	pr_err("denali->reg + RDWR_EN_HI_CNT = 0x%08x -> 0x%08x\n", ioread32(denali->reg + RDWR_EN_HI_CNT), sel->rdwr_en_hi_cnt);
 	iowrite32(sel->rdwr_en_hi_cnt, denali->reg + RDWR_EN_HI_CNT);
+	pr_err("denali->reg + CS_SETUP_CNT = 0x%08x -> 0x%08x\n", ioread32(denali->reg + CS_SETUP_CNT), sel->cs_setup_cnt);
 	iowrite32(sel->cs_setup_cnt, denali->reg + CS_SETUP_CNT);
+	pr_err("denali->reg + RE_2_RE = 0x%08x -> 0x%08x\n", ioread32(denali->reg + RE_2_RE), sel->re_2_re);
 	iowrite32(sel->re_2_re, denali->reg + RE_2_RE);
 }
 
@@ -795,6 +802,8 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
 		return 0;
 
+	printk("Denali: clk_rate=%ld, clk_x_rate=%ld\n", denali->clk_rate, denali->clk_x_rate);
+
 	sel = &to_denali_chip(chip)->sels[chipnr];
 
 	/* tREA -> ACC_CLKS */
@@ -806,10 +815,16 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	tmp |= FIELD_PREP(ACC_CLKS__VALUE, acc_clks);
 	sel->acc_clks = tmp;
 
+	printk("Denali: tREA=%d\n", timings->tREA_max);
+	printk("Denali: acc_clks=%d\n", acc_clks);
+
 	/* tRWH -> RE_2_WE */
 	re_2_we = DIV_ROUND_UP(timings->tRHW_min, t_x);
 	re_2_we = min_t(int, re_2_we, RE_2_WE__VALUE);
 
+	printk("Denali: tRHW=%d\n", timings->tRHW_min);
+	printk("Denali: re_2_we=%d\n", re_2_we);
+
 	tmp = ioread32(denali->reg + RE_2_WE);
 	tmp &= ~RE_2_WE__VALUE;
 	tmp |= FIELD_PREP(RE_2_WE__VALUE, re_2_we);
@@ -819,6 +834,9 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	re_2_re = DIV_ROUND_UP(timings->tRHZ_max, t_x);
 	re_2_re = min_t(int, re_2_re, RE_2_RE__VALUE);
 
+	printk("Denali: tRHZ=%d\n", timings->tRHZ_max);
+	printk("Denali: re_2_re=%d\n", re_2_re);
+
 	tmp = ioread32(denali->reg + RE_2_RE);
 	tmp &= ~RE_2_RE__VALUE;
 	tmp |= FIELD_PREP(RE_2_RE__VALUE, re_2_re);
@@ -833,6 +851,10 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	we_2_re = DIV_ROUND_UP(max(timings->tCCS_min, timings->tWHR_min), t_x);
 	we_2_re = min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
 
+	printk("Denali: tCCS=%d\n", timings->tCCS_min);
+	printk("Denali: tWHR=%d\n", timings->tWHR_min);
+	printk("Denali: we_2_re=%d\n", we_2_re);
+
 	tmp = ioread32(denali->reg + TWHR2_AND_WE_2_RE);
 	tmp &= ~TWHR2_AND_WE_2_RE__WE_2_RE;
 	tmp |= FIELD_PREP(TWHR2_AND_WE_2_RE__WE_2_RE, we_2_re);
@@ -848,6 +870,9 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	addr_2_data = DIV_ROUND_UP(timings->tADL_min, t_x);
 	addr_2_data = min_t(int, addr_2_data, addr_2_data_mask);
 
+	printk("Denali: tADL=%d\n", timings->tADL_min);
+	printk("Denali: addr_2_data=%d\n", addr_2_data);
+
 	tmp = ioread32(denali->reg + TCWAW_AND_ADDR_2_DATA);
 	tmp &= ~TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA;
 	tmp |= FIELD_PREP(TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA, addr_2_data);
@@ -858,6 +883,10 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 				  t_x);
 	rdwr_en_hi = min_t(int, rdwr_en_hi, RDWR_EN_HI_CNT__VALUE);
 
+	printk("Denali: tREH=%d\n", timings->tREH_min);
+	printk("Denali: tWH=%d\n", timings->tWH_min);
+	printk("Denali: rdwr_en_hi=%d\n", rdwr_en_hi);
+
 	tmp = ioread32(denali->reg + RDWR_EN_HI_CNT);
 	tmp &= ~RDWR_EN_HI_CNT__VALUE;
 	tmp |= FIELD_PREP(RDWR_EN_HI_CNT__VALUE, rdwr_en_hi);
@@ -871,6 +900,13 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	rdwr_en_lo = max(rdwr_en_lo, rdwr_en_lo_hi - rdwr_en_hi);
 	rdwr_en_lo = min_t(int, rdwr_en_lo, RDWR_EN_LO_CNT__VALUE);
 
+	printk("Denali: tRP=%d\n", timings->tRP_min);
+	printk("Denali: tWP=%d\n", timings->tWP_min);
+	printk("Denali: tRC=%d\n", timings->tRC_min);
+	printk("Denali: tWC=%d\n", timings->tWC_min);
+	printk("Denali: rdwr_en_lo_hi=%d\n", rdwr_en_lo_hi);
+	printk("Denali: rdwr_en_lo=%d\n", rdwr_en_lo);
+
 	tmp = ioread32(denali->reg + RDWR_EN_LO_CNT);
 	tmp &= ~RDWR_EN_LO_CNT__VALUE;
 	tmp |= FIELD_PREP(RDWR_EN_LO_CNT__VALUE, rdwr_en_lo);
@@ -882,6 +918,10 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 			0);
 	cs_setup = min_t(int, cs_setup, CS_SETUP_CNT__VALUE);
 
+	printk("Denali: tCS=%d\n", timings->tCS_min);
+	printk("Denali: tCEA=%d\n", timings->tCEA_max);
+	printk("Denali: cs_setup=%d\n", cs_setup);
+
 	tmp = ioread32(denali->reg + CS_SETUP_CNT);
 	tmp &= ~CS_SETUP_CNT__VALUE;
 	tmp |= FIELD_PREP(CS_SETUP_CNT__VALUE, cs_setup);
-- 
2.24.1


--------------7836A46E0DEA5A9F212DF892
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------7836A46E0DEA5A9F212DF892--

