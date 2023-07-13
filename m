Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932EFEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4/HpyMs/yIVPDEwYSjua9Dumcslml0dxr76GYl346g=; b=rlZETUrLT0Ri3XTy9HuqB0FKru
	9I6DfAixvmlPK8cVeTMu7J8pTZN0CCTnvrxe2Wk21rmXDJiK64LDJBcUuC8y8mw9FtvPD5Cl+VJVx
	Xf6vIX+//xw/0W+8xx+VFeYLCp45b8Qq8y2IWYCeiowpNT4EZG8DQbSHfm9rTT9JUURI38vHfsgJd
	gx2a4OnOeHOY74H+qbSgFh7ZhoqZ+QPtK5Lys8ESBOK5R1niKXZGCj8vhXFjrLDOR0WQvDTMMevDx
	nB+QRz+MlznGLtTUI4ENYZcDfhyDKVoqKF4ikthTTBKO+yFNaZA6kKU8lN1s1SYNx4VVLLFv+pBIA
	oQ5oNTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqKf-002AeB-1g;
	Thu, 13 Jul 2023 07:01:45 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqKb-002Ad7-3C
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:01:43 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6F6D2274;
	Thu, 13 Jul 2023 09:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689231693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4KyJcPj86wpm+joAeHLW9qgmm3L3ws49NQpsZj9t5vI=;
	b=wG4HOiPI5/V1Jo2HNE4ElQjSmLJMfuVJyMb1Gt/nwycMmhv6wN+Ze/Xc6OslEkLcqMP6oi
	x5ovQuQONhXPht7KgSdBZb+unayfafqg5YV7zgSy12N2RdANEAgEAVeMHsBClNqIvbXhs3
	zwT+4wOWG4J2vCBJMdPZX/SKq6ehkxJRbZfNdOEdAyketbr5VyP5H8yASFSOHW+1C+0jUp
	GnNH6c2IrtS0EcSB+ON4JtDdy54pAtUzl+6VSzitP7zV3pVBGcEtQMhziF5u+U/aeIhFIr
	2a6I3xO/4/aTxlYxYjwnxe5zv9+o19/o/kuLqWJFKEz17TwOcceD1m9gJN5mOg==
MIME-Version: 1.0
Date: Thu, 13 Jul 2023 09:01:33 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
In-Reply-To: <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
Message-ID: <0525440a652854a2a575256cd07d3559@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_000142_207282_B118917B 
X-CRM114-Status: GOOD (  26.99  )
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

Hi,

Am 2023-07-13 05:32, schrieb Tudor Ambarus:
> Hi, Linus,
> 
> On 13.07.2023 00:59, Linus Walleij wrote:
>> The Winbond "w25q128" (actual vendor name W25Q128JV)
>> has exactly the same flags as the sibling device
>> "w25q128jv". The devices both require unlocking to
>> enable write access.
>> 
>> The actual product naming between devices vs the
>> Linux strings in winbond.c:
>> 
>> 0xef4018: "w25q128"   W25Q128JV-IM/JM
>> 0xef7018: "w25q128jv" W25Q128JV-IN/IQ/JQ
>> 
>> The latter device, "w25q128jv" supports features
>> named DTQ and QPI, otherwise it is the same.
>> 
>> Not having the right flags has the annoying side
>> effect that write access does not work.
> 
> I guess you refer to the locking flags. Probably your flash has the non
> volatile block protection (BP) bits from the Status Register set, which
> means the entire flash is write protected. The factory default for 
> these
> bits is 0/disabled on this flash so someone must have played with them.
> The reason why one may want write protection set is to avoid 
> inadvertent
> writes during power-up.
> One can control whether to disable the software write protection at 
> boot
> time with the MTD_SPI_NOR_SWP_ configs.
>> 
>> After this patch I can write to the flash on the
>> Inteno XG6846 router.
>> 
>> The flash memory also supports dual and quad SPI
>> modes. This does not currently manifest, but by
> 
> The fasted mode is chosen after SFDP parsing, so you should use quad
> reads if your controller also supports 4 I/O lines.
>> turning on SFDP parsing, the right SPI modes are
>> emitted in
>> /sys/kernel/debug/spi-nor/spi1.0/capabilities
>> for this chip, so we also turn on this.
>> 
>> Cc: stable@vger.kernel.org
>> Suggested-by: Michael Walle <michael@walle.cc>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Changes in v2:
>> - Only add the write access flags.
>> - Use SFDP parsing to properly detect the various
>>   available SPI modes.
>> - Link to v1: 
>> https://lore.kernel.org/r/20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org
>> ---
>>  drivers/mtd/spi-nor/winbond.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/winbond.c 
>> b/drivers/mtd/spi-nor/winbond.c
>> index 834d6ba5ce70..6c82e525c801 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -121,7 +121,8 @@ static const struct flash_info winbond_nor_parts[] 
>> = {
>>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>>  		NO_SFDP_FLAGS(SECT_4K) },
>>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
> 
> while here try, using INFO with INFO(0xef4018, 0, 0, 0), those
> parameters shall be discovered at run-time, so we prepare to get rid of
> explicitly setting them sooner or later.

This is an entry matching various flash families from Winbond, see my
reply in v1. I'm not sure we should remove these as we could break the
older ones, which might or might not have SFDP tables. We don't know.

> 
>> -		NO_SFDP_FLAGS(SECT_4K) },

Thus, I'd also keep this one.

-michael

>> +		PARSE_SFDP
>> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> 
> Looks good. Also I would like you to run a small sanity test, just to
> make sure the flash works after your changes. You can do that with
> mtd_debug utility, see an example on Miquel's commit message from:
> https://lore.kernel.org/linux-mtd/d479489736ee193609816dc2003bd0fb@walle.cc/T/#m3550973e0884ec4a288d344fabd4a9c3b64af46e
> 
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
