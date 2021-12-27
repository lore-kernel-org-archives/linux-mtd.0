Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3CAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 17:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLmCwUN5QoNrPZnwidjijdkaoiWiQR8UREzsW8dljQo=; b=eg7BU2mcv0I8hU
	W8k3O0XsdmY7Sj1euypB1vRnfA5fKYxi4oSROkd/QXy8XYQIFTlmnWtqKpa8FcllTFAE62JPz/a/F
	eStBI4fxp344BD68fh9Qw0thFxOJPfOOsjokZ4kefukQyW36lfASEBh7Nc0zuPq2bf+99A9bGDkBs
	ProAhxRDEsun6Z7Qg9jOmFVkiI22B5SOrdnBVVF4CXXvGPwPpRlJ2+0GT7WZhVM2PxXeWqyKx+DMh
	Y+kLs/U3ElHGMSW8VhaicCDLkoFBeShHmZEgz45p0JIeTWEIpsmvfr6g4ojmFWQ/WknFMdNcdNp2o
	LcOsKBIFN7gX3VhT5ysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tRk-00H6JG-PK; Mon, 27 Dec 2021 17:06:04 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tRi-00H6IT-8z
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 17:06:03 +0000
Received: by mail-ua1-x92b.google.com with SMTP id c36so2303296uae.13
 for <linux-mtd@lists.infradead.org>; Mon, 27 Dec 2021 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/Jl9rD98P7u8+W/KPfuS6926/YvVcB+fWGfP5gXmcTo=;
 b=DDIfjCIH8zwOvNzVxa6/z0ntzbksgSSL55dovlZgWOtGSrp3q1ZaH60trhPrBO7InU
 VQzMnJflyMmq1QzPT7DEvhz62ejT/hFT0wjAjxwDXWyaPtjdk5Zi8t5nAy/6/jv76drI
 M9izPrQFhzXJCFjuvZ6thVvLO6WMqpQa1emRr/faWqTsHilWmOgaKDoE6iEMFYq8rx6x
 Ys1H9LtoD+fHreydGZ+bsh6TW1LLAI90CgvBxyVxyJKZhXp7ph/ujC1j74L22ZWv9PHX
 R6TGHEHxozjoooC98744KFk42Cdo+KUCfaMoA3Z3SErBc3wxVKqUdtqrhndUDDgmdg26
 29Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Jl9rD98P7u8+W/KPfuS6926/YvVcB+fWGfP5gXmcTo=;
 b=lviEhYTdA1lLdzVBLQsBcleEObxdMdTO3U9kzLfMnJKjqinqN1mwsk+YweJMhK+D/t
 KspnTKTmklok/Fx57Gjsd3O/L6Ffg2M2MK5boIVJRYE4ZBI3KxeNgl2XojscWX4MOt2E
 BaU6agDej8ocQaY8YWRqjc6h71gcC/2C5NgdNHStMiJLHWWa2uFiw5lxXxKGnjR8Uk99
 rH+FFyi57Ju+4tv5v21JX/dNeynwR4jHD7eJOHuJnItCMhimFS8dQtoP6oLCU0mrN6xD
 zYc/P/S7KeKOvFFLEu7Af/z8FSxZf3WeH5IMxP9zSZbLV5Vjm7AhX9nPB4F1AgdwgLlc
 bBzA==
X-Gm-Message-State: AOAM530EGoEm1V6sZq4NJv4sVVLZukADbmRiYUdESlAOTlHGCwT+SUmM
 DQo/1r7/FdsQlRL2rG5SGVg=
X-Google-Smtp-Source: ABdhPJy0eYa4Kbf89/rW9lywsPSxvgEPpudw09MmZke+H+vogBjO7hdxao99ZqQw5ZKvwLE0rweVqg==
X-Received: by 2002:a9f:2322:: with SMTP id 31mr5172057uae.133.1640624760159; 
 Mon, 27 Dec 2021 09:06:00 -0800 (PST)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 92sm3030310uar.19.2021.12.27.09.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 09:05:59 -0800 (PST)
Message-ID: <ee2d9730-6f7c-a210-8949-0eb2edd9b22e@gmail.com>
Date: Mon, 27 Dec 2021 09:05:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 5/9] mtd: rawnand: brcmnand: Allow working without
 interrupts
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-6-f.fainelli@gmail.com>
 <CAHp75VeLAuGbeh+DJ=Oox5o8vdt=iLxr80sS3RrZbdJ9smh4OA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAHp75VeLAuGbeh+DJ=Oox5o8vdt=iLxr80sS3RrZbdJ9smh4OA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_090602_356793_E6794526 
X-CRM114-Status: GOOD (  14.29  )
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



On 12/25/2021 9:45 AM, Andy Shevchenko wrote:
> On Sat, Dec 25, 2021 at 1:41 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> The BCMA devices include the brcmnand controller but they do not wire up
>> any interrupt line, allow the main interrupt to be optional and update
>> the completion path to also check for the lack of an interrupt line.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
>> -       unsigned int            irq;
>> +       int                     irq;
> 
> instead.,,
> 
>> +       ctrl->irq = platform_get_irq_optional(pdev, 0);
>> +       if (ctrl->irq >= 0) {
> 
> ret = ...
> if (ret > 0) {
> 
> And drop 0 from the equation, OF never uses 0 as valid vIRQ.

OK but the point of this patch series is to allow the use of the 
brcmnand driver in a configuration without OF. I don't really see the 
point in continuing to use unsigned int instead of just letting 
request_irq() play through and tell us if the interrupt descriptor was 
valid later on.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
