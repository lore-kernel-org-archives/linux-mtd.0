Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD7CC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:13:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731F720872
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+lQT2Ek";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="QCCMutQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731F720872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bxETdP6eKXUuBtT5JW7Mtk75cP2OckJttjO85SmgVtY=; b=M+lQT2EkwKhOZrcP0ZNGO22T3
	uKjXO+g27I8hf7+NcbverzzHeKfGpYyBHkdBABMncVkI9YT4y7R91ar4JYa7lhBZWU7VmmToYkFGl
	PnidVGcb2BoZu2svr6SevSZKVjmMVfIRB24PK1Wye1ePP3QfIl2iijG2Izx81RCW7VCTcngtqwG3L
	aKOMPB4wftMxL7BGrP9XQkj8l05V6J0/W2a66EQniTDgOuSxGxBDliNNPd4CUk3pqPUoTv1cEWa9m
	KnmjkJ5TGSDnSU5E4YbrAlrRVSSNIt2wYi4B5/zW9Bt+kmHn0kSidmbEwKpMv0thv7VzTTpujMD8S
	WdpQQowUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzKD-00017k-RJ; Thu, 01 Oct 2020 14:12:49 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzKA-00016G-2O; Thu, 01 Oct 2020 14:12:47 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ADE9122F99;
 Thu,  1 Oct 2020 16:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601561563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qodIbGrXANDGKnUR1bw4HfdmzWfDoTXlWQOLVl/G1lM=;
 b=QCCMutQGnM/MkO/M2OBM5f6bbV86/EX5KZ5MaZqcbaOXLrkdQ2xPqKrqlY39tEKWA+edUz
 Kn5Y8Ap/5Iz0xg0+OddlEJyArziOBzbD5Gqb2utnXvDdpYOo1QItT8TMuq5Is2XztB3aCL
 ZamsV+YtiKoOUKZY5VTOH6slwNmKKAg=
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 16:12:43 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global SNOR_F_HAS_LOCK
In-Reply-To: <5eb8f95c-e9d5-6043-fb7d-bffcda044262@microchip.com>
References: <20201001122828.23186-1-michael@walle.cc>
 <5eb8f95c-e9d5-6043-fb7d-bffcda044262@microchip.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <871da0d058ba89320615098ee26150b3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_101246_237607_F1504D1E 
X-CRM114-Status: GOOD (  20.81  )
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
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-10-01 16:06, schrieb Tudor.Ambarus@microchip.com:
> On 10/1/20 3:28 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> This is considered bad for the following reasons:
>>  (1) We only support the block protection with BPn bits for write
>>      protection. Not all Atmel parts support this.
>>  (2) Newly added flash chip will automatically inherit the "has
>>      locking" support and thus needs to explicitly tested. Better
>>      be opt-in instead of opt-out.
>>  (3) There are already supported flashes which don't support the 
>> locking
>>          scheme. So I assume this wasn't properly tested before adding 
>> that
>>          chip; which enforces my previous argument that locking 
>> support should
>>          be an opt-in.
>> 
>> Remove the global flag and add individual flags to all flashes
>> which supports BP locking. In particular the following flashes
>> don't support the BP scheme:
>>  - AT26F004
>>  - AT25SL321
>>  - AT45DB081D
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/atmel.c | 28 +++++++++-------------------
>>  1 file changed, 9 insertions(+), 19 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
>> index 3f5f21a473a6..49d392c6c8bc 100644
>> --- a/drivers/mtd/spi-nor/atmel.c
>> +++ b/drivers/mtd/spi-nor/atmel.c
>> @@ -10,37 +10,27 @@
>> 
>>  static const struct flash_info atmel_parts[] = {
>>         /* Atmel -- some are (confusingly) marketed as "DataFlash" */
>> -       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
>> -       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
>> +       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | 
>> SPI_NOR_HAS_LOCK) },
>> +       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | 
>> SPI_NOR_HAS_LOCK) },
> 
> after a quick look in the datasheets of these flashes, I suspect that
> what we have now in the SPI NOR core for SR locking does not work for
> them. They probably supported just "unlock all", clearing all the
> BP bits. Anyway, different problem.
>> 
>> -       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
>> -       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
>> -       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
>> -       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
>> +       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | 
>> SPI_NOR_HAS_LOCK) },
> 
> this one does not support BP locking:
> https://www.adestotech.com/wp-content/uploads/doc3668.pdf
> 
>> +       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | 
>> SPI_NOR_HAS_LOCK) },
> 
> neither this one:
> https://datasheet.octopart.com/AT25DF321-S3U-Atmel-datasheet-8700896.pdf
> 
>> +       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | 
>> SPI_NOR_HAS_LOCK) },
> 
> nor this one: https://www.adestotech.com/wp-content/uploads/doc3686.pdf
> 
>> +       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | 
>> SPI_NOR_HAS_LOCK) },
> 
> nor this one: https://www.adestotech.com/wp-content/uploads/doc3680.pdf
> 
> I stop here.

These are all the ones which use the global unlock. I cannot just skip
the HAS_LOCK bit here, because otherwise this patch wouldn't be 
backwards
compatibe. Yes I missed that in the commit log, my bad.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
