Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EDDC30658
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rzmmm3th2w34gvKzDsj3K6PAVf0SMyVBl4s4pfM0gE=; b=neC0EWy+AzUxFM
	JFWj/pEm7sncxTv62mItt3Jv5cx2qwluriRdfcnV0nyctDlPiyK44UxDj3EXmddwiBXf8G2sHAUII
	lFbeQcKSu3Dvm0bjNGPlFX7G/jqF2zT1W2HAy90MvVN5+vL2Fv289atJw92890fwzVFo9+tJutl0Z
	LG6zP3s4Y3hq8QkqFctQVYjX90nF8bajEQGJlzeK1HNUAfiMLfWaZV8905bs/PHXirIFKHCa/hIKU
	48YwTnVd+97r7PkxUvIP1Z5VQnA+VsD9lAzlfbyB5caf2jLsfVt3k6OCVQaJYnOPxlhfNKZV/6UI+
	VmCDw16lxbFEgZYP84Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOgd7-00000007QRb-2y7f;
	Tue, 02 Jul 2024 16:45:21 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOgcj-00000007QCJ-0ZsB
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jul 2024 16:44:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77CBF240003;
	Tue,  2 Jul 2024 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719938693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unb3QJ1ZSaRryP9Bs3P1fLuG39JlH4isF5oYd+2RhRQ=;
	b=bcQC1gNgP3gDQfpW0v23OOjOxdP0I2luTbTTLxfUXVTUL7/jRRjMhpCL5kQzqcUNwyvVs6
	ly8+SPm0Uxlb5CXCg9Tj26hBJYHZhQWry2GCUecSInf3AhHWtNdUwZ+28quErq/hMvxqm4
	1aLtj3rOF2it97inFG6FKmcpFCAE0i+4Ywh+SkeIZjXPKpNVYbXa1FUtU1Q0XyqA77qbjp
	QwYSKTtOq/6epwUFyBd2lSGHUxxP679j3RRiKNx5E5EV5zr152wukzLyqVhyTM4HzJ7KCB
	WwEKEaq/EW9ToVvQxMcUTMdYGLs2LvHc755NQHutKnM01u8AJgp7gPZOWN0F4A==
Message-ID: <b974df45-daf5-4156-8532-cf9e2be8bdfa@yoseli.org>
Date: Tue, 2 Jul 2024 18:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arch: m68k: Add definitions for flash NFC support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Agner <stefan@agner.ch>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
 <20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
 <20240628094511.75cc9c78@xps-13>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20240628094511.75cc9c78@xps-13>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_094457_518984_A9384A8A 
X-CRM114-Status: GOOD (  19.06  )
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

Hi Miquel,

On 28/06/2024 09:45, Miquel Raynal wrote:
> Hi Jean-Michel & Geert,
> 
> jeanmichel.hautbois@yoseli.org wrote on Thu, 27 Jun 2024 18:05:28 +0200:
> 
>> Add a few definitions, as the base address for the NFC for the M5441x.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> ---
>>   arch/m68k/include/asm/m5441xsim.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
>> index f48cf63bd782..d4ee1eab7c4a 100644
>> --- a/arch/m68k/include/asm/m5441xsim.h
>> +++ b/arch/m68k/include/asm/m5441xsim.h
>> @@ -99,6 +99,7 @@
>>   #define MCFINT2_PIT1		14
>>   #define MCFINT2_PIT2		15
>>   #define MCFINT2_PIT3		16
>> +#define MCFINT2_NFC		25
>>   #define MCFINT2_RTC		26
>>   
>>   /*
>> @@ -333,4 +334,10 @@
>>   #define MCF_IRQ_BOFF1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
>>   #define MCF_IRQ_ERR1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
>>   
>> +/*
>> + * Flash module
>> + */
>> +#define MCF_NFC_BASE		0xfc0fc000
>> +#define MCF_NFC_SIZE		(0xfc0fff3b - 0xfc0fc000)
>> +#define MCF_NFC_ISR		(MCFINT2_VECBASE + MCFINT2_NFC)
> 
> I'm sorry but this feels really backwards. Platform data as C
> structures are already legacy, but defining these information in
> some arch headers and using them directly from drivers really seems
> even "wronger" to me. What's the mid/long term plan for this? If the
> platforms are still in use today and need to be maintained, why not
> finally enabling device tree support? I know it's harder to do than to
> say, but I'd like some really good explanation on why we should accept
> to do this in 2024 because it feels rather inadequate.

Thanks for your review !

I agree with you it is legacy. I use a lot of ARM platforms and 
device-tree is indeed great. Though, switching the m68k architecture to 
use this sounds really tough.

I will obviously let Geert and maybe others answer, but my feeling is it 
is not really worth it to implement the dts on those platforms are they 
are not that used (compared, again, to ARM for instance).

AFAIK the platform data is not officialy considered deprecated ? As it 
concerns a few platforms out there...

Thanks,
JM

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
