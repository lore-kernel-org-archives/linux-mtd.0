Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D96C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7mcGokxu/68v2zEsBryIClD/baYAIn9vptrvfWY+eE=; b=DiYz8mtBTvyUot
	e9a7Ure+zP3YN+Mli/cxWi6KOK6lQqkLq0Rgc9bZW11+OmhY+/T7zpz+nyswmQ19BcHEhufVkiMoH
	Ss/aFY0QGlP7d12zWo2GkVlRQ1chbHdNkYbAQv07B4AQsgwlYqiWcWR1OTnIOg6Ena6GO5KQezgDz
	6nwO5SXeWZeTYoCUsUTXHh8c3gk5/JUwODVbUv56EV92Fku3DKngbeCojKbFuCaambVQFiSK3fYkH
	WQwoLoTv1wM9iCDKpX0BnUhiVpoB9joX/MZfIJQRcH7LP+zbdvUMh+q4jdvizHsgq1o0f1skQsHCX
	mQptU9QuNId0R6KcricA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFY1C-0000000DnPP-3EXk;
	Fri, 07 Jun 2024 11:44:26 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFY19-0000000DnOb-1bu6
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 11:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pgFYfKFP2+BrbhwQbVDF4L8VfHYcNvZ2JTarujvrQbs=; b=djleXuaaLQPy8jXIKeMbAWm33z
	PSgWi16npUwwG1mtTK5LeFhO3XYtvwH5UUKjnCb5qZAVXqSYYbY9cHW9kZAQYvAJB9CVDrYSU0X8S
	apq3ZUB4s7CyRtZnHJcCNHwFxEI6W+uIRokts2cJ2nEQ3QIiJ1spi2GSXcYDY3B6R5cao6voWfq1F
	rGsQmBnv1FlYgzzeIIEgH5EnSjGBlImOXY0xbMh6xbHMhJx30ixPSC9p9zGFS3/dmaziTKd+pZPGt
	6rmoIUg/8grB7+FylbSErgMJ0IL31qss52/0BeGlnXlmZUOT9teSgVfGU2Q/z1Xx6eFXchYrHqWl9
	/xLXPIew==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sFY18-0009VI-VN; Fri, 07 Jun 2024 13:44:19 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sFY15-00081C-1N;
	Fri, 07 Jun 2024 13:44:18 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Michael Walle" <michael@walle.cc>
Cc: "e9hack" <e9hack@gmail.com>,  <linux-mtd@lists.infradead.org>,  "Tudor
 Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: Definition for flash w25q128 is wrong
In-Reply-To: <D1TNAMAIIHAF.1QD3BI5DZTZBF@walle.cc> (Michael Walle's message of
	"Fri, 07 Jun 2024 10:34:24 +0200")
References: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com>
	<D1TNAMAIIHAF.1QD3BI5DZTZBF@walle.cc>
Date: Fri, 07 Jun 2024 13:44:18 +0200
Message-ID: <87y17h0ygd.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27299/Fri Jun  7 10:27:20 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_044423_446720_68677754 
X-CRM114-Status: GOOD (  23.49  )
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

"Michael Walle" <michael@walle.cc> writes:

> On Thu Jun 6, 2024 at 9:50 PM CEST, e9hack wrote:
>> I'm using a TP-LINK WDR3600 with a bigger flash. Since some time the
>> router hangs in an endless boot loop. I see the following message:
>>
>> ...
>> [    0.402716] spi-nor spi0.0: BFPT parsing failed. Please consider
>> using SPI_NOR_SKIP_SFDP when declaring the flash
>
> Looks like your flash doesn't support SFDP. Relevant threads are:
> https://lore.kernel.org/r/d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org/
> https://lore.kernel.org/r/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
>
>> [    0.413217] spi-nor: probe of spi0.0 failed with error -22
>> ...
>> [    0.926180] /dev/root: Can't open blockdev
>> [    0.930427] VFS: Cannot open root device "(null)" or
>> unknown-block(0,0): error -6
>> [    0.938037] Please append a correct "root=" boot option; here are
>> the available partitions:
>> [    0.946520] Kernel panic - not syncing: VFS: Unable to mount root
>> fs on unknown-block(0,0)
>> [    0.954914] Rebooting in 1 seconds..
>>
>> It looks like the definition for the flash is wrong:
>>
>> --- a/drivers/mtd/spi-nor/winbond.
>> c     2024-03-15 19:27:50.000000000 +0100
>> +++ b/drivers/mtd/spi-nor/winbond.c     2024-04-01 05:59:17.166780732 +0200
>> @@ -120,8 +120,8 @@ static const struct flash_info winbond_n
>>                 NO_SFDP_FLAGS(SECT_4K) },
>>         { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>>                 NO_SFDP_FLAGS(SECT_4K) },
>> -       { "w25q128", INFO(0xef4018, 0, 0, 0)
>> -               PARSE_SFDP
>> +       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
>> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>         { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>
>> With these changes, the flash will be detected properly. The chip is
>> marked with:
>> The chip (SOIC8) is marked with:
>> winbond
>> 25Q128FVSG
>> 1327
>>
>> I use another TP-LINK router. This is an Archer C7 v2. It has the same
>> flash chip with date code 1528. This router doesn't have this issue.
>
> Looks like some of these flashes support SFDP and some don't :/

Which means that for those (old) flashes without SFDP was broken by
83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128").

During patch review, the following was said:

>>> while here try, using INFO with INFO(0xef4018, 0, 0, 0), those
>>> parameters shall be discovered at run-time, so we prepare to get rid of
>>> explicitly setting them sooner or later.
>>
>> This is an entry matching various flash families from Winbond, see my
>> reply in v1. I'm not sure we should remove these as we could break the
>> older ones, which might or might not have SFDP tables. We don't know.
>
> I'd take the risk and break the older ones if there are some that don't
> define SFDP indeed, just to handle the conflict properly. We can't
> encourage code based on assumptions otherwise we'll get back to the
> knotted spi-nor code that we tried to untie in the last years.

I guess it is not an assumption anymore. There are flashes out there
with this jedec id which does not have SFDP tables.

So while parsing SFDP is good, keeping a fallback to some known "good"
values are needed. Something similar to what we are discussing in
https://lore.kernel.org/all/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
