Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D28CC43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 12:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BAD2077B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 12:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oElZHq2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BAD2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B8jXXJ8mqxcBcAXUXNVL+3IuxeU4HMdf3XY237sYDE=; b=oElZHq2E4xa+I4
	5WMAzAgfVHUMz+ncE1L1GuPSMa4YSon5DBGCILtuH0dzA8x7s9kgUwQfH53dYKUdwKhkKSJnohOAv
	OZniDte1s4kL7cKoQVbaIA/hC70KxGy7HPninu17l/vZnsZp7V8iPWvkg9ZUlfdTlBpXyr3F+Fkf3
	Cre1SQeacBg5kmHGta/TxoUBNoGRgRbq6/6wwHXK6dJ9oLvnx7FI+CES1u5gfbeenyoLXf8KpfKdM
	99vehNNAoKBXsv2oL7N/3YxY2x9d0JIDv0u0aeKNE5wn6N3yFa4UV3+Kze/qCnJU9rqSyerfDSVHf
	+8jPGZ5MOm1Y0gsZ6/og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieIbE-0002oK-Vv; Mon, 09 Dec 2019 12:57:16 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieIbB-0002nj-8u
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 12:57:15 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47Wjrf3r6Xz1rhrr;
 Mon,  9 Dec 2019 13:57:06 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47Wjrf2pQYz1rhB9;
 Mon,  9 Dec 2019 13:57:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id k9UABFSTHqqT; Mon,  9 Dec 2019 13:57:02 +0100 (CET)
X-Auth-Info: x1PsPRCcCav+ogqodslC9+QGUnGMpAvoTx7TA2r5yvQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  9 Dec 2019 13:57:02 +0100 (CET)
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20191207004855.11334-1-marex@denx.de>
 <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
Message-ID: <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
Date: Mon, 9 Dec 2019 13:53:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_045713_611093_55C31E94 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/9/19 6:38 AM, Masahiro Yamada wrote:
[...]

>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
>> index 3102ddbd8abdb..b6c463d021677 100644
>> --- a/drivers/mtd/nand/raw/denali.c
>> +++ b/drivers/mtd/nand/raw/denali.c
>> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
>>
>>         /*
>>          * Set how many bytes should be skipped before writing data in OOB.
>> +        * If a non-zero value has already been configured, update it in HW.
>>          * If a non-zero value has already been set (by firmware or something),
>>          * just use it. Otherwise, set the driver's default.
>>          */
>> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>> -       if (!denali->oob_skip_bytes) {
>> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
>> +       if (denali->oob_skip_bytes) {
>>                 iowrite32(denali->oob_skip_bytes,
>>                           denali->reg + SPARE_AREA_SKIP_BYTES);
>> +       } else {
>> +               denali->oob_skip_bytes =
>> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>> +               if (!denali->oob_skip_bytes) {
>> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
>> +                       iowrite32(denali->oob_skip_bytes,
>> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
> 
> This fallback is ugly, and should be removed, I think.
> It is only reachable by PCI platform (Intel MRST), where
> DENALI_DEFAULT_OOB_SKIP_BYTES is probably useless.

This fallback retains the original behavior on all platforms. It might
not be to your liking, but it does not break other platforms while
fixing SoCFPGA. We don't know what other platforms might be depending on
this behavior, do we ?

>> @@ -209,6 +213,8 @@ static int denali_dt_probe(struct platform_device *pdev)
>>         denali->clk_rate = clk_get_rate(dt->clk);
>>         denali->clk_x_rate = clk_get_rate(dt->clk_x);
>>
>> +       denali->oob_skip_bytes = data->oob_skip_bytes;
>> +
> 
> Please move this to the relevant hunk.
> Preferably, based on this:
> http://patchwork.ozlabs.org/patch/1205912/

I don't understand what you want me to change ? Shall I rebase this on
top of your patch from today and repost ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
