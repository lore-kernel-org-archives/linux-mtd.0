Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C731C27C5E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jun 2024 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqrZ7c4+7vZP+VcE6G5tncmclp+i3qTikIvfjiRAh28=; b=p5PX8pHShLhwUF
	aKS06M1zn4rkD4x+l6wTt3pqke2+kufcKA98x9x/nRJB8s/6zHO/uErE7IbKPGhQPbr3cXQObxyHQ
	lLUin/qArRpgKom9/xh40YnubBHXQrHmTWCKh+S04ZR47trlMtVTcs8ptjf3ltf1F3fsOZW5fmFbD
	l/+QjkseOZVwKIk78q8yzX98xFw0JYbMn1NIZY2BLNO/hKt47NNOVTqXrKlanU/N/E11Ca/KD5X7h
	GXSSLid3pxF84Os/v1QtKOkL8HOCXrFUoaUJFexQECk6pHnkS1vHevtXwt6jVV+CjHkQcSahujIOD
	sJ5VzdQawTipsKikjr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZi9-000000047SF-0Raa;
	Mon, 10 Jun 2024 07:45:01 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZi3-000000047RP-1Dah
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jun 2024 07:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=U4BNJy7uCs1VcCOGG0mmYOuq1eLgeAmnW0G5Eltd27E=; b=uJIIQK0NcODWvq2YGjSus0zKuA
	welQCqU6v0h1+Jo7Hj6cGSSjS2G2KRDtYO1YWGA7yaAAJCtq4rFHJ15FmdVZyHlje21KLfp03+9ND
	VotwgVTVjUg73dmRI17KWzP5PpRM47IB1fBESwJqQXi4D9Wu75o6foQcNZ5TsGvGgO9cXbVKO3LyM
	07y8j3BOjMfDuG9r9CS/gmlfX//a7vZ82QZtK8vZHddh8brDPLdnMmULbH6Q3pppu3V3IEwC6VgRX
	sNxfe6qumSA0cEJLFKHFM1OF88CH1q5n/+fRUsCQFlQRE2u/BQ7eTkh2S245vXZvlQpM3m418bb4L
	ibohMKlQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sGZhv-0005UI-QS; Mon, 10 Jun 2024 09:44:44 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sGZhs-000LHy-0v;
	Mon, 10 Jun 2024 09:44:43 +0200
From: Esben Haabendal <esben@geanix.com>
To: e9hack <e9hack@gmail.com>
Cc: Michael Walle <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Tudor
 Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Definition for flash w25q128 is wrong
In-Reply-To: <194d6f02-bd70-489d-b883-d7677b6f87b3@gmail.com>
	(e9hack@gmail.com's message of "Sun, 9 Jun 2024 20:26:06 +0200")
References: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com>
	<D1TNAMAIIHAF.1QD3BI5DZTZBF@walle.cc> <87y17h0ygd.fsf@geanix.com>
	<194d6f02-bd70-489d-b883-d7677b6f87b3@gmail.com>
Date: Mon, 10 Jun 2024 09:44:43 +0200
Message-ID: <87wmmxb5sk.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27301/Sun Jun  9 10:24:05 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_004455_682412_3FF68AE5 
X-CRM114-Status: GOOD (  20.76  )
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

e9hack <e9hack@gmail.com> writes:

> Am 07.06.2024 um 13:44 schrieb Esben Haabendal:
>> "Michael Walle" <michael@walle.cc> writes:
>> 
>>> On Thu Jun 6, 2024 at 9:50 PM CEST, e9hack wrote:
>>>> I'm using a TP-LINK WDR3600 with a bigger flash. Since some time the
>>>> router hangs in an endless boot loop. I see the following message:
>>>>
>>>> ...
>>>> [    0.402716] spi-nor spi0.0: BFPT parsing failed. Please consider
>>>> using SPI_NOR_SKIP_SFDP when declaring the flash
>>>
>>> Looks like your flash doesn't support SFDP. Relevant threads are:
>>> https://lore.kernel.org/r/d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org/
>>> https://lore.kernel.org/r/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
>>>
>>>> [    0.413217] spi-nor: probe of spi0.0 failed with error -22
>>>> ...
>>>> [    0.926180] /dev/root: Can't open blockdev
>>>> [    0.930427] VFS: Cannot open root device "(null)" or
>>>> unknown-block(0,0): error -6
>>>> [    0.938037] Please append a correct "root=" boot option; here are
>>>> the available partitions:
>>>> [    0.946520] Kernel panic - not syncing: VFS: Unable to mount root
>>>> fs on unknown-block(0,0)
>>>> [    0.954914] Rebooting in 1 seconds..
>>>>
>>>> It looks like the definition for the flash is wrong:
>>>>
>>>> --- a/drivers/mtd/spi-nor/winbond.
>>>> c     2024-03-15 19:27:50.000000000 +0100
>>>> +++ b/drivers/mtd/spi-nor/winbond.c     2024-04-01 05:59:17.166780732 +0200
>>>> @@ -120,8 +120,8 @@ static const struct flash_info winbond_n
>>>>                  NO_SFDP_FLAGS(SECT_4K) },
>>>>          { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>>>>                  NO_SFDP_FLAGS(SECT_4K) },
>>>> -       { "w25q128", INFO(0xef4018, 0, 0, 0)
>>>> -               PARSE_SFDP
>>>> +       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
>>>> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>>                  FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>>>          { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
>>>>                  NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>>
>>>> With these changes, the flash will be detected properly. The chip is
>>>> marked with:
>>>> The chip (SOIC8) is marked with:
>>>> winbond
>>>> 25Q128FVSG
>>>> 1327
>>>>
>>>> I use another TP-LINK router. This is an Archer C7 v2. It has the same
>>>> flash chip with date code 1528. This router doesn't have this issue.
>>>
>>> Looks like some of these flashes support SFDP and some don't :/
>
> Related to the spec
> 	https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q128FV
> chapter 8.2.30, older flashes don't support SFDP. Newer flashes may support SFDP. From my two versions, one doesn't support SFDP, the other does support it.

Ok. That is clear. Sort of. No concrete information on which flashes
exactly supports SFDP. Thank you Winbond. Looks like we really need the
SFDP with fallback to handle these flashes according to their
"specification".

/Esben

>> Which means that for those (old) flashes without SFDP was broken by
>> 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128").
>> During patch review, the following was said:
>> 
>>>>> while here try, using INFO with INFO(0xef4018, 0, 0, 0), those
>>>>> parameters shall be discovered at run-time, so we prepare to get rid of
>>>>> explicitly setting them sooner or later.
>>>>
>>>> This is an entry matching various flash families from Winbond, see my
>>>> reply in v1. I'm not sure we should remove these as we could break the
>>>> older ones, which might or might not have SFDP tables. We don't know.
>>>
>>> I'd take the risk and break the older ones if there are some that don't
>>> define SFDP indeed, just to handle the conflict properly. We can't
>>> encourage code based on assumptions otherwise we'll get back to the
>>> knotted spi-nor code that we tried to untie in the last years.
>> I guess it is not an assumption anymore. There are flashes out there
>> with this jedec id which does not have SFDP tables.
>> So while parsing SFDP is good, keeping a fallback to some known "good"
>> values are needed. Something similar to what we are discussing in
>> https://lore.kernel.org/all/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
