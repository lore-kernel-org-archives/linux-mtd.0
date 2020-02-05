Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA11C33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:42:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE1F21741
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYrFDx7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE1F21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qM4RoGHHYP1RPm9DoP0+cgzXdnUbizFA+U9/256JSDE=; b=jYrFDx7UOglr8K
	CqdBYty/kreyU+hssPAcGXRpx1uYnbcFTA74mA37gKJnR6Yj9q/F9nrY0C+9jla1SfliAPcAbOlle
	nnZp7MySF1QaUliuDzJzYusQDeQwytvSS7p4iES/bA6Hwt6EgWAVHPP/tfXkSq7oaYe1xtTkFXeq+
	wUflAFvUoPs9sXIQ3o14VoLPiOa1lI2G3e2S6pONf9FcGy/L0cMSQM8MHsI+yzOKa6UhZ6mTCGt+l
	wGWdeUMZDgrwsxRnttj/v/+tVTcybI7vhA3qWw+bXFmo0hKQIaX/9HyALippI8OtlKOAeWE/9q4LR
	IszZA9h1adsvhv/i/dZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izHBq-0007nk-U7; Wed, 05 Feb 2020 09:41:46 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izHBn-0007nD-JV
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 09:41:45 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48CGmN66tBz1qqkY;
 Wed,  5 Feb 2020 10:41:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48CGmN4lGfz1qyWX;
 Wed,  5 Feb 2020 10:41:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id TZPwZsIG3GnN; Wed,  5 Feb 2020 10:41:39 +0100 (CET)
X-Auth-Info: h/OgRrxpAUhFfQI/vTxfniaA2zPiaJ7xkHH2YdCGUuY=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  5 Feb 2020 10:41:39 +0100 (CET)
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
Date: Wed, 5 Feb 2020 10:41:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205101223.21d99d93@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_014143_790884_DE42BC42 
X-CRM114-Status: GOOD (  17.06  )
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

On 2/5/20 10:12 AM, Miquel Raynal wrote:
> Hi Marek,
> 
> Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
> 
>> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
>> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
>> SoC).
>>
>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
>> hence the driver sets NAND_KEEP_TIMINGS flag. This did not happen before
>> and is actually incorrect, as on SoCFPGA we do not want to retain timings
>> from previous stage (the timings might be incorrect or outright invalid).
>>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Dinh Nguyen <dinguyen@kernel.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Cc: Tim Sander <tim@krieglstein.org>
>> To: linux-mtd <linux-mtd@lists.infradead.org>
>> ---
>>  drivers/mtd/nand/raw/denali.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
>> index b6c463d02167..5fe3c62a756e 100644
>> --- a/drivers/mtd/nand/raw/denali.c
>> +++ b/drivers/mtd/nand/raw/denali.c
>> @@ -1209,7 +1209,7 @@ int denali_chip_init(struct denali_controller *denali,
>>  	}
>>  
>>  	/* clk rate info is needed for setup_data_interface */
>> -	if (!denali->clk_rate || !denali->clk_x_rate)
> 
> I don't get it, if both clk_rate and clk_x_rate are set, the if
> condition will not be entered, right?

Err, then it's the other way around and I need to keep the timings on
socfpga ?

>> +	if (denali->clk_rate && denali->clk_x_rate)
>>  		chip->options |= NAND_KEEP_TIMINGS;

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
