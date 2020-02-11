Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566A8C352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 10:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F842086A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 10:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="thPPG1yY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F842086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmFr+Dy02vfcs8gYRLvu4hBthK6DF4rZ0ovg69E2520=; b=thPPG1yYxdGX2t
	54a/XNKkhIJQvxCE7sTV9oo6R5G3YJiSv/Qt+r719hXgReZXf6+Lhw4WZKCKBdbk/Ky4ZR4yBH+ke
	5znD9YQnH1f4S9mwDLzYvv7N6puYKcq3vy0Kj06xhG7mBNdwV4nfNN3E0ysw+LSSVZdWnsIWkYRfE
	vjdTgcK1xaRYaXTQVW54f8bw7Km+12vn7hBqdcVU5FT7+jxJrokBmlTvhA94foIw7hJ+DDiVSMDR0
	fGOVNyZq77YMt/KRjbQ7ad6PgwR1PJiGyamTOL11oLAnuK1GYKQt4fu9LeBrKR6E264GvQ7eV5wvq
	C6UmeNapxdw3aPMczEGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1SOy-00067p-0I; Tue, 11 Feb 2020 10:04:20 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1SOu-00067H-8J
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 10:04:18 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Gyzd2RCzz1rHDD;
 Tue, 11 Feb 2020 11:04:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Gyzd17J3z1qrYk;
 Tue, 11 Feb 2020 11:04:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FjGa24uUwwnY; Tue, 11 Feb 2020 11:04:11 +0100 (CET)
X-Auth-Info: ER4FsN9sA1y1ZrKSKhnuyEoBbziRu7X4FJ90Dnnwg5Q=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 11 Feb 2020 11:04:11 +0100 (CET)
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
From: Marek Vasut <marex@denx.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
 <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
Message-ID: <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
Date: Tue, 11 Feb 2020 11:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_020416_603150_338FEE17 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/5/20 11:08 AM, Marek Vasut wrote:
> On 2/5/20 10:50 AM, Miquel Raynal wrote:
>> Hi Marek,
>>
>> Marek Vasut <marex@denx.de> wrote on Wed, 5 Feb 2020 10:41:05 +0100:
>>
>>> On 2/5/20 10:12 AM, Miquel Raynal wrote:
>>>> Hi Marek,
>>>>
>>>> Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
>>>>   
>>>>> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
>>>>> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
>>>>> SoC).
>>>>>
>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
>>>>> hence the driver sets NAND_KEEP_TIMINGS flag. This did not happen before
>>>>> and is actually incorrect, as on SoCFPGA we do not want to retain timings
>>>>> from previous stage (the timings might be incorrect or outright invalid).
>>>>>
>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Cc: Dinh Nguyen <dinguyen@kernel.org>
>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>> Cc: Tim Sander <tim@krieglstein.org>
>>>>> To: linux-mtd <linux-mtd@lists.infradead.org>
>>>>> ---
>>>>>  drivers/mtd/nand/raw/denali.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
>>>>> index b6c463d02167..5fe3c62a756e 100644
>>>>> --- a/drivers/mtd/nand/raw/denali.c
>>>>> +++ b/drivers/mtd/nand/raw/denali.c
>>>>> @@ -1209,7 +1209,7 @@ int denali_chip_init(struct denali_controller *denali,
>>>>>  	}
>>>>>  
>>>>>  	/* clk rate info is needed for setup_data_interface */
>>>>> -	if (!denali->clk_rate || !denali->clk_x_rate)  
>>>>
>>>> I don't get it, if both clk_rate and clk_x_rate are set, the if
>>>> condition will not be entered, right?  
>>>
>>> Err, then it's the other way around and I need to keep the timings on
>>> socfpga ?
>>
>> Ok.
>>
>> Do you have a different compatible? Or a register to check? How do you
>> discriminate the different platforms by software? The quick and dirty
>> solution is to add a special case for your platform and specifically
>> use the NAND_KEEP_TIMINGS horror.
> 
> Sure, there's a socfpga compatible and at least two for uniphier.
> 
>> But I think using ->software_data_interface is the right solution. So
>> I would highly recommend fixing the implementation of this hook
>> for your platform and in this case the commit reverted is not the
>> culprit, the one introducing setup_data_interface is (for the Fixes:
>> tag).
> 
> I'll leave the details to Yamada-san.

Just got a confirmation that this fixes NAND behavior on SoCFPGA, so
this patch should go in in some form.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
