Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A79C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 13:05:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F3922D75
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 13:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F3922D75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K8ISAOkSqhavmq0md924CcU6A9ruV9r/kZoB8YiJMAw=; b=Qd/hRNkSf39bBXO7zh8T01/Px
	+xApKv5SmDw6P3guvUAsAdc10w6gzNdwGPRybmcwBCoZBj0Prn0COcPUeSdy76ZvUSLCUOQ7RMDY5
	xZ/LGok7fxIHehKL8ETfkbMOi/p3mttl+T0CJC1KbOsvq4cFkuFqGuIJEXTKUZilzfwWvYwBmHTNW
	mXYEKm+73YOUa8HEoDFoOOmBQrAlWc5133D+ZayTWJzztMwnc9csJFct9WEbmeQHgZJQWFl/ZKwK0
	v0scc2zZ2Szfd8/3Tgg8rq3bZXXd+/MVIOJ/mL6kOJTB3xgi1N/54cB1F/ZEjb8ftXwToIyL74SD2
	g0WI4O3zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3Iag-0001nw-3z; Sat, 23 Jan 2021 13:04:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3Iad-0001nF-Bc
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 13:04:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B36A222FB3;
 Sat, 23 Jan 2021 14:04:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611407064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfLRrUpC1xu9tbasyiSVT9jQyfPb/fwDXgh3c3C0p0U=;
 b=F+NNlD9MKOQra11Grf6UZUbNgdDoD/lfwt6jBGEt8QQQ7I5wzlaqgbbazL4Fq96nZk+YTU
 RTMtuule+dRmBs4RX8kp6Nimezzftgqdi2g8fnjd5ZHhMmRWhkFRsKvso4/cgY1YPTD4lf
 QdEIcVGeiA4QUXZ01GVLzKRb6Af6zMQ=
MIME-Version: 1.0
Date: Sat, 23 Jan 2021 14:04:19 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
In-Reply-To: <93b7f8e8-cdf4-5b09-da17-636d8fcaf0ee@microchip.com>
References: <20201208011938.GB12175@DESKTOP-8REGVGF.localdomain>
 <20201208015730.12351-1-liew.s.piaw@gmail.com>
 <93b7f8e8-cdf4-5b09-da17-636d8fcaf0ee@microchip.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <0fb41db8c9495e2dcca9f2da48670555@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_080431_496635_B86CF4EE 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 liew.s.piaw@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-01-23 13:18, schrieb Tudor.Ambarus@microchip.com:
> Hi, Sieng,
> 
> On 12/8/20 3:57 AM, Sieng Piaw Liew wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Enable 4-bit Block Protect support for MX256405D and its variants 
>> using
>> the same ID.
>> 
>> Tested on Innacom W3400V6 router with MX25L6406E chip.

MX25L6406E?

>> https://github.com/openwrt/openwrt/pull/3501
>> 
>> Signed-off-by: Sieng Piaw Liew <liew.s.piaw@gmail.com>
>> ---
>> Changes in v2:
>> - Add SPI_NOR_HAS_LOCK which SPI_NOR_4BIT_BP required.
>> 
>>  drivers/mtd/spi-nor/macronix.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/macronix.c 
>> b/drivers/mtd/spi-nor/macronix.c
>> index 9203abaac229..033ede381673 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -42,7 +42,9 @@ static const struct flash_info macronix_parts[] = {
>>         { "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>>         { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>>         { "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>> -       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>> +       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
>> +                             SECT_4K | SPI_NOR_HAS_LOCK |
>> +                             SPI_NOR_4BIT_BP) },
> 
> I've read again the datasheet[1], and to me it looks like we
> don't support the locking scheme for this flash.
> What mx25l6405d calls BP3, we refer to as Top/Bottom support (TB bit).
> The problem that I see is that mx25l6405d uses some kind of twisted
> TB bit.
> 
> For example, for BP3=1, BP2=0, BP1=0, BP0=1, the flash's datasheet
> states that the lower half blocks are protected (0th-63th), while in
> our code we would expect that just the lower first two blocks to be
> protected (0th and 1st). We need new support for this flash.

I double checked that and we don't support this. BP3 is indeed some
kind of TB bit. But not the TB bit which is currently supported. I
guess with the current code, protection scheme can be supported iff
BP3 == 0.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
