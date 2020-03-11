Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFF4C18E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 12:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E752146E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 12:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e2QrXbKC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E752146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LiG9AcUL/iY02/1sVqgCtWS7mpven5gFBjjClW8FJxE=; b=e2QrXbKCRpKDReux5TJ94jBNn
	6gA/Nf4QaDngihpMtc1pcLcW92BZ+LRFz4eMgCE5JmajotKapVXkYFVped0vP9kz2b48hGJK1EDzD
	tuoCSBxpxsErNtezsf4apSbEexdv6gxQ1BI4cPLIxKjcg4b7fbmEwBHCq5qNaEXgY+jiR2mbhM0lk
	ivXMyOKTz3hdcB+UemPXfJlV7C0Uynbv3Abu/YaTNfkh7IeZtk3UP3nzMiZGD7+sqnSswDRDNg6te
	FIVlPwbGaaARdds0SnjlFjUVOAey1pp2NmR7lPU53r/uWQp4Hj866BcYebh8p8WlOZxHuYg1jpAH8
	sqjSgigJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC0r6-0005mX-Br; Wed, 11 Mar 2020 12:53:00 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC0r2-0005m1-AL
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 12:52:58 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48csLs42fMz1qrg3;
 Wed, 11 Mar 2020 13:52:53 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48csLs2mdkz1qyF8;
 Wed, 11 Mar 2020 13:52:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sICeFbbcUdVf; Wed, 11 Mar 2020 13:52:50 +0100 (CET)
X-Auth-Info: BWgMdqLXZQYrl7gSjYr2uaq2x3xabFFmd4ARMtP9AsI=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 11 Mar 2020 13:52:50 +0100 (CET)
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
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
 <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de>
Date: Wed, 11 Mar 2020 13:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------6DE7A0C90EF8E200F3240991"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_055256_665767_90EA02CE 
X-CRM114-Status: GOOD (  24.07  )
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
--------------6DE7A0C90EF8E200F3240991
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 3/9/20 11:27 AM, Masahiro Yamada wrote:
> Hi.

Hi,

[...]

>>>> See attached patch, with which (without this revert) you get this:
>>>> denali->reg + TWHR2_AND_WE_2_RE = 0x00001414 -> 0x0000143f
>>>> denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
>>>> denali->reg + RE_2_WE = 0x00000014 -> 0x00000019
>>>> denali->reg + ACC_CLKS = 0x00000004 -> 0x00000005
>>>> denali->reg + RDWR_EN_LO_CNT = 0x00000002 -> 0x00000009
>>>> denali->reg + RDWR_EN_HI_CNT = 0x00000002 -> 0x00000004
>>>> denali->reg + CS_SETUP_CNT = 0x00000001 -> 0x00000008
>>>> denali->reg + RE_2_RE = 0x00000014 -> 0x00000019
>>>
>>> OK, the left-hand side is probably the timing
>>> set up by U-Boot.
>>
>> Yep, the timings that work. So now, how do you get to those working
>> timings using the Linux driver ?
> 
> 
> How about
> 0001-denali-more-complicated-calculation-for-timings.patch
> 
> + following ?
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index b0482108a127..ea38aa42873e 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -860,9 +860,9 @@ static int denali_setup_data_interface(struct
> nand_chip *chip, int chipnr,
> 
>         /*
>          * Determine the minimum of acc_clks to meet the data setup timing.
> -        * (one additional clock cycle just in case)
> +        * (two additional clock cycles just in case)
>          */
> -       acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 1;
> +       acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 2;
> 
>         /* Determine the minimum of rdwr_en_lo_cnt from RE#/WE# pulse width */
>         rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min), t_x);

Like the attached one ?

That seems to work, but -- the calculated timings differ from the ones
which are calculated by U-Boot and which were tested to work well.
That's not good, I would expect both timings to be identical:
 Denali: clk_rate=31250000, clk_x_rate=125000000
 Denali: tREA=40000
 Denali: tRHW=200000
 Denali: tRHZ=200000
 Denali: tCCS=500000000
 Denali: tWHR=120000
 Denali: tADL=400000
 Denali: tREH=30000
 Denali: tWH=30000
 Denali: tRP=50000
 Denali: tWP=50000
 Denali: tRC=100000
 Denali: tWC=100000
 Denali: tCS=70000
 Denali: tCEA=100000
 Denali: acc_clks=8
 Denali: re_2_we=25
 Denali: re_2_re=25
 Denali: we_2_re=63
 Denali: addr_2_data=50
 Denali: rdwr_en_hi=4
 Denali: rdwr_en_lo_hi=13
 Denali: rdwr_en_lo=9
 Denali: cs_setup=5

 denali->reg + TWHR2_AND_WE_2_RE = 0x00001414 -> 0x0000143f
 denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
 denali->reg + RE_2_WE = 0x00000014 -> 0x00000019
 denali->reg + ACC_CLKS = 0x00000004 -> 0x00000008
 denali->reg + RDWR_EN_LO_CNT = 0x00000002 -> 0x00000009
 denali->reg + RDWR_EN_HI_CNT = 0x00000002 -> 0x00000004
 denali->reg + CS_SETUP_CNT = 0x00000001 -> 0x00000005
 denali->reg + RE_2_RE = 0x00000014 -> 0x00000019

 denali->reg + TWHR2_AND_WE_2_RE = 0x0000143f -> 0x0000143f
 denali->reg + TCWAW_AND_ADDR_2_DATA = 0x00001432 -> 0x00001432
 denali->reg + RE_2_WE = 0x00000019 -> 0x00000019
 denali->reg + ACC_CLKS = 0x00000008 -> 0x00000008
 denali->reg + RDWR_EN_LO_CNT = 0x00000009 -> 0x00000009
 denali->reg + RDWR_EN_HI_CNT = 0x00000004 -> 0x00000004
 denali->reg + CS_SETUP_CNT = 0x00000005 -> 0x00000005
 denali->reg + RE_2_RE = 0x00000019 -> 0x00000019

 denali->reg + TWHR2_AND_WE_2_RE = 0x0000143f -> 0x0000143f
 denali->reg + TCWAW_AND_ADDR_2_DATA = 0x00001432 -> 0x00001432
 denali->reg + RE_2_WE = 0x00000019 -> 0x00000019
 denali->reg + ACC_CLKS = 0x00000008 -> 0x00000008
 denali->reg + RDWR_EN_LO_CNT = 0x00000009 -> 0x00000009
 denali->reg + RDWR_EN_HI_CNT = 0x00000004 -> 0x00000004
 denali->reg + CS_SETUP_CNT = 0x00000005 -> 0x00000005
 denali->reg + RE_2_RE = 0x00000019 -> 0x00000019
...

-- 
Best regards,
Marek Vasut

--------------6DE7A0C90EF8E200F3240991
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-denali-more-complicated-calculation-for-timings.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-denali-more-complicated-calculation-for-timings.patch"

>From 5fd2ee8e18de2490da347d0388481adb18a04408 Mon Sep 17 00:00:00 2001
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 17 Feb 2020 21:16:33 +0900
Subject: [PATCH] denali: more complicated calculation for timings

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 drivers/mtd/nand/raw/denali.c | 75 +++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 5fe3c62a756e..ef5ebb8394f3 100644
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
 
@@ -797,15 +804,6 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 
 	sel = &to_denali_chip(chip)->sels[chipnr];
 
-	/* tREA -> ACC_CLKS */
-	acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x);
-	acc_clks = min_t(int, acc_clks, ACC_CLKS__VALUE);
-
-	tmp = ioread32(denali->reg + ACC_CLKS);
-	tmp &= ~ACC_CLKS__VALUE;
-	tmp |= FIELD_PREP(ACC_CLKS__VALUE, acc_clks);
-	sel->acc_clks = tmp;
-
 	/* tRWH -> RE_2_WE */
 	re_2_we = DIV_ROUND_UP(timings->tRHW_min, t_x);
 	re_2_we = min_t(int, re_2_we, RE_2_WE__VALUE);
@@ -863,14 +861,39 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	tmp |= FIELD_PREP(RDWR_EN_HI_CNT__VALUE, rdwr_en_hi);
 	sel->rdwr_en_hi_cnt = tmp;
 
-	/* tRP, tWP -> RDWR_EN_LO_CNT */
+	/*
+	 * tREA -> ACC_CLOCKS
+	 * tRP, tWP, tRHOH, tRC, tWC -> RDWR_EN_LO_CNT
+	 */
+
+	/*
+	 * Determine the minimum of acc_clks to meet the data setup timing.
+	 * (one additional clock cycle just in case)
+	 */
+	acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 2;
+
+	/* Determine the minimum of rdwr_en_lo_cnt from RE#/WE# pulse width */
 	rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min), t_x);
+
+	/* Extend rdwr_en_lo to meet the data hold timing */
+	rdwr_en_lo = max_t(int, rdwr_en_lo, acc_clks - timings->tRHOH_min / t_x);
+
+	/* Extend rdwr_en_lo to meet the requirement for RE#/WE# cycle time */
 	rdwr_en_lo_hi = DIV_ROUND_UP(max(timings->tRC_min, timings->tWC_min),
 				     t_x);
-	rdwr_en_lo_hi = max_t(int, rdwr_en_lo_hi, mult_x);
 	rdwr_en_lo = max(rdwr_en_lo, rdwr_en_lo_hi - rdwr_en_hi);
 	rdwr_en_lo = min_t(int, rdwr_en_lo, RDWR_EN_LO_CNT__VALUE);
 
+	/* Center the data latch timing for extra safety */
+	acc_clks = (acc_clks + rdwr_en_lo +
+		    DIV_ROUND_UP(timings->tRHOH_min, t_x)) / 2;
+	acc_clks = min_t(int, acc_clks, ACC_CLKS__VALUE);
+
+	tmp = ioread32(denali->reg + ACC_CLKS);
+	tmp &= ~ACC_CLKS__VALUE;
+	tmp |= FIELD_PREP(ACC_CLKS__VALUE, acc_clks);
+	sel->acc_clks = tmp;
+
 	tmp = ioread32(denali->reg + RDWR_EN_LO_CNT);
 	tmp &= ~RDWR_EN_LO_CNT__VALUE;
 	tmp |= FIELD_PREP(RDWR_EN_LO_CNT__VALUE, rdwr_en_lo);
@@ -887,6 +910,32 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	tmp |= FIELD_PREP(CS_SETUP_CNT__VALUE, cs_setup);
 	sel->cs_setup_cnt = tmp;
 
+	/* debug */
+	printk("Denali: clk_rate=%ld, clk_x_rate=%ld\n", denali->clk_rate, denali->clk_x_rate);
+	printk("Denali: tREA=%d\n", timings->tREA_max);
+	printk("Denali: tRHW=%d\n", timings->tRHW_min);
+	printk("Denali: tRHZ=%d\n", timings->tRHZ_max);
+	printk("Denali: tCCS=%d\n", timings->tCCS_min);
+	printk("Denali: tWHR=%d\n", timings->tWHR_min);
+	printk("Denali: tADL=%d\n", timings->tADL_min);
+	printk("Denali: tREH=%d\n", timings->tREH_min);
+	printk("Denali: tWH=%d\n", timings->tWH_min);
+	printk("Denali: tRP=%d\n", timings->tRP_min);
+	printk("Denali: tWP=%d\n", timings->tWP_min);
+	printk("Denali: tRC=%d\n", timings->tRC_min);
+	printk("Denali: tWC=%d\n", timings->tWC_min);
+	printk("Denali: tCS=%d\n", timings->tCS_min);
+	printk("Denali: tCEA=%d\n", timings->tCEA_max);
+	printk("Denali: acc_clks=%d\n", acc_clks);
+	printk("Denali: re_2_we=%d\n", re_2_we);
+	printk("Denali: re_2_re=%d\n", re_2_re);
+	printk("Denali: we_2_re=%d\n", we_2_re);
+	printk("Denali: addr_2_data=%d\n", addr_2_data);
+	printk("Denali: rdwr_en_hi=%d\n", rdwr_en_hi);
+	printk("Denali: rdwr_en_lo_hi=%d\n", rdwr_en_lo_hi);
+	printk("Denali: rdwr_en_lo=%d\n", rdwr_en_lo);
+	printk("Denali: cs_setup=%d\n", cs_setup);
+
 	return 0;
 }
 
-- 
2.25.0


--------------6DE7A0C90EF8E200F3240991
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------6DE7A0C90EF8E200F3240991--

