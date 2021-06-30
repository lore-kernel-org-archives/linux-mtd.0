Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD92C11F66
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:22:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09B161474
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09B161474
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kRlmEPTDHbshxBftjz13zQzSoVmwffbcbGMYbqJnAg=; b=wxvkDZk7mrvCQ7
	rLzLZz0iskt4srBQ6S09gmeuYs15xf+evFmIdXWDtMlawmKTPJM9OaT3Uxx09gaEb35m7Wk6VscGJ
	WB+5V/pauQ8DncRLqjMZUeOtwLQjYdcaANK0+YXMc93VJpVxFl9HEXol9nmaRnHL1lL7v5nENKM2m
	VnFIVe1hm8A54JO7lwxx4Nuz8/DHrMiZBEv3E1ZrmcTJ8nItyadAeyepOlMBeWlGfdsK0ZYsABGJj
	rAjqxKU7BlH5h42bCPFo20CN8hZSOD0HINZ4dmcqRS1LcYML5NDk0qLZDB0AYdNIQToz8eZk10X+Q
	F0Z2DTgttG61PUYPqCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyeq6-00Euei-Jg; Wed, 30 Jun 2021 18:21:34 +0000
Received: from atlmailgw2.ami.com ([63.147.10.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyeq2-00Eue7-Uz
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 18:21:32 +0000
X-AuditID: ac10606f-903ff70000006d35-4f-60dcb627a325
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 B9.0C.27957.726BCD06; Wed, 30 Jun 2021 14:21:27 -0400 (EDT)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Wed, 30 Jun 2021 14:21:27 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Michael Walle <michael@walle.cc>
CC: Hongwei Zhang <hongweiz@ami.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
Date: Wed, 30 Jun 2021 14:20:59 -0400
Message-ID: <20210630182059.29699-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629150846.21547-2-hongweiz@ami.com>
References: <20210629150846.21547-1-hongweiz@ami.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCLMWRmVeSWpSXmKPExsWyRiBhgq76tjsJBlf3Kltc3jWHzWJ30zJ2
 i7enN7Bb3H3+g93i4xIHB1aPzUvqPe78WMrocfzGdiaPz5vkPA7sbWELYI3isklJzcksSy3S
 t0vgyri5ZDFzwWb+ioaDJ1kbGF9zdzFyckgImEhc6lnB2MXIxSEksItJYubrOyxQDqPEvUlP
 GUGq2ATUJPZunsMEYosIqEg8/nwBrINZYDujRGfDNzaQhLCApcTEjS9ZQWwWAVWJhYcamUFs
 XgFTiSkv17NArJOXWL3hAFicU8BMYm77A7BeIaCaZ2t62CDqBSVOznwCVs8sICFx8MULZoga
 WYlbhx4zQcxRlHjw6zvrBEaBWUhaZiFpWcDItIpRKLEkJzcxMye93EgvMTdTLzk/dxMjJGTz
 dzB+/Gh+iJGJg/EQowQHs5IIb9TO2wlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeVe5H40XEkhP
 LEnNTk0tSC2CyTJxcEo1MBbm+QtzrBf4759X0uwR0TEv56Zv199JR3Zms05dp1l7ddMXhryN
 HrpqPh2CsZEtWqufKs3IV+jTqzXm1Kud+PnhZDcjNuP731Omvp3su+9v/PaYjAd9Wi9vLf1l
 VZ7oz3FUZT3bLP9tfYVxMUsme3i+5eDeUtzKqzxl9mwH3o5KhSXyCptslFiKMxINtZiLihMB
 6S9YMkcCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_112131_122696_9D5B6DB1 
X-CRM114-Status: GOOD (  17.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael,

>Subject:	[EXTERNAL] Re: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
>
>Hi Hongwei,
>
>Am 2021-06-29 17:08, schrieb Hongwei Zhang:
>> Add some Micron M45PEx flash memeories into the IDs table.
>
>Did you test all these flashes?
>
No, the patch was added in porting drivers related to AST2600 EVB.

>> Fixes: dd1e9367157f900616f (ARM: dts: everest: Add phase corrections
>> for
>> eMMC)
>
>Bogus Fixes tag. First, I cannot find this commit id, which tree is
>that? Secondly, adding new flash ids don't fix anything, esp not
>something related to eMMC.
>
Sorry for the confusion, I thought Fixes tag could be also used for referencing
the revision base for the patch to aplly on.
I used dev-5.10 branch from https://github.com/openbmc/linux.git , should I
use a different repository?

Thanks,
--Hongwei
>>
>> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>> b/drivers/mtd/spi-nor/micron-st.c
>> index ef3695080710..379b14e339ff 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -95,8 +95,12 @@ static const struct flash_info st_parts[] = {
>>       { "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
>>
>>       { "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
>> +     { "m45pe20", INFO(0x204012,  0, 64 * 1024,    4, 0) },
>> +     { "m45pe40", INFO(0x204013,  0, 64 * 1024,    8, 0) },
>>       { "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
>>       { "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
>> +     { "m45pe32", INFO(0x204016,  0, 64 * 1024,   64, 0) },
>> +     { "m45pe64", INFO(0x204017,  0, 64 * 1024,  128, 0) },
>>
>>       { "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
>>       { "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
>
>--
>-michael
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
