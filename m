Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3992CC27C54
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWzHFc2+s5MjPjqCD4GkBc+OrDeh5wCPrOqS9k4nfuw=; b=PVGzABEMtxfLoc
	fq6jQSM7g/w+KV4pQZI+tFbxov9t2dv6ulpR/I+EcHY6AyTS3M0QRXwhr7rwPs3ZRzyBS7WlTK9Ta
	864L4p+beS86zQRDfKw4jMJcX6L1WB3ppNWO0AjQ6/bLutzuPM4fdT6tDLEe3h/LYs2Js8bJCi8HT
	nrGou9/M+MPZ7fxdEEYd64W7encka1A11RDpDgi2GEdICtl4cotZ/JfJCLBUd65YD/e/FR5b21J9+
	TpUOpaSYd9RHLJI+PexUqyUarlnLG1hDc69plWAeXWkadI4oZx6UgmXJ6SMWpNv8KLDRvz1cs4k4C
	2maEKAh5MHj6Daxf6x+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGpu-0000000AhzS-13Go;
	Thu, 06 Jun 2024 17:23:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGpt-0000000Ahz8-0Dpo
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Jun 2024 17:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FedF7oPNdqEHHuz3xwLH/2qCzL60HSgGzIWdOOictbg=; b=RZ9LEP/Awp3wZrbcoo6Mu46y2T
	VUpW6RO/btTewLRma8PcqKG776hBWBst06WJbUWKTCH3EL0Q9gCaI3TNU4TBzkW2L+mvFID+sVwbN
	y6Cn9O4WCdoVEBQ/C7fSfmF9GS3J2tT/C/+FhhGbNHINzM5kiJi/bd9rUwlt5xElDhfg9MpkCQmMW
	8LGlQ1J64caETlWnF9+5GLKRY5WqjMEn3Mb7CxLH4YV+luBeVc76no9wYDUCU1xu98gZXTRnc7vz1
	Jf0MMH9K+0xJhW73Uq7IFdGoPeYBSE056jVMEjYgWebvRRvFFNWoZJDhEFbaWUrf3L3OhTX04FKZh
	iOgL05yQ==;
Received: from www530.your-server.de ([188.40.30.78])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGpq-00000001fiC-0mwL
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 17:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FedF7oPNdqEHHuz3xwLH/2qCzL60HSgGzIWdOOictbg=; b=FPpehQCxUOysukHnwgSo9tnbW9
	BCihYTPtfMSlFzboPjZijiIEGyz+GdYfLd/HrMnHchxFF/4hVPywBldgzxXt/ktfM1ZAoE3FI+Kzw
	XmPkaIqI25ncKL6rVy2/wvF4f9W0XQqWOyu1bKY51xnVcFlEdS9cMP+lzaeS2cg3fV35y/LuWi1hu
	9qPudxhAouqNt4/5qHMDrPWf9YHMrLIlU28EdRXbimH1Tbt2BinGwqO8ERIQCEuzKUqxrqgRZ2MVZ
	PDyNHA7KJ0uKIZFKepEtLmYIJui+Z5sRhT0QSUaTcKAuzTzqW/gP80mHyPJfOKZ/EgOxzJASGIY/b
	Sz+UKIwQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sFGpl-0002rG-Mz; Thu, 06 Jun 2024 19:23:26 +0200
Received: from [80.62.117.184] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sFGph-000MWE-31;
	Thu, 06 Jun 2024 19:23:25 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Rasmus
 Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: macronix: enable quad/dual speed
 for mx25l3205d chips
In-Reply-To: <cdd6bc25-6282-4e43-9909-16ab918ed983@linaro.org> (Tudor
	Ambarus's message of "Thu, 6 Jun 2024 14:33:16 +0100")
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
	<20240603-macronix-mx25l3205d-fixups-v2-2-ff98da26835c@geanix.com>
	<cdd6bc25-6282-4e43-9909-16ab918ed983@linaro.org>
Date: Thu, 06 Jun 2024 19:23:25 +0200
Message-ID: <87v82m9e9e.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27298/Thu Jun  6 10:30:08 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_182334_229050_5DCFA908 
X-CRM114-Status: GOOD (  17.72  )
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

Tudor Ambarus <tudor.ambarus@linaro.org> writes:

> On 6/3/24 14:09, Esben Haabendal wrote:
>> Macronix engineers apparantly do not understand the purpose of having
>> an ID actually identify the chip and its capabilities. Sigh.
>> 
>> The original Macronix SPI NOR flash that identifies itself as 0xC22016
>> with RDID was MX25L3205D. This chip does not support SFDP, but does
>> support the 2READ command (1-2-2).
>> 
>> When Macronix announced EoL for MX25L3205D, the recommended
>> replacement part was MX25L3206E, which conveniently also identifies
>> itself as 0xC22016. It does not support 2READ, but supports DREAD
>> (1-1-2) instead, and supports SFDP for discovering this.
>> 
>> When Macronix announced EoL for MX25L3206E, the recommended
>> replacement part was MX25L3233F, which also identifies itself as
>> 0xC22016. It supports DREAD, 2READ, and the quad modes QREAD (1-1-4)
>> and 4READ (1-4-4). This also support SFDP.
>> 
>> So far, all of these chips have been handled the same way by the Linux
>> driver. The SFDP information have not been read, and no dual and quad
>> read modes have been enabled.
>> 
>> The trouble begins when we want to enable the faster read modes. The
>> RDID command only return the same 3 bytes for all 3 chips, so that
>> doesn't really help.
>> 
>> Instead, we can use the SPI_NOR_TRY_SFDP flag, which forces the spi-nor
>> system to try using SFDP, but fallback to the parameters specified in
>> struct flash_info.
>> 
>> This way, boards using MX25L3205D will continue as before this change.
>> That is without taking advantage of the 1-2-2 that it supports.
>> 
>> For MX25L3206E and MX25L3233F, the SFDP parameters are used, and they will
>> therefore be using the optimal dual or quad mode supported by the flash
>> and the SPI controller it is attached to.
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  drivers/mtd/spi-nor/macronix.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index ea6be95e75a5..090f28e05a5d 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -61,7 +61,7 @@ static const struct flash_info macronix_nor_parts[] = {
>>  		.id = SNOR_ID(0xc2, 0x20, 0x16),
>>  		.name = "mx25l3205d",
>>  		.size = SZ_4M,
>> -		.no_sfdp_flags = SECT_4K,
>> +		.no_sfdp_flags = SECT_4K | SPI_NOR_TRY_SFDP,
>>  	}, {
>
> let's remove support for MX25L3205D. You'll then be able to drop the
> flash entry altogether and instead rely on SFDP to discover the flash's
> capabilities.

So anybody updating their Linux kernel for boards using MX25L3205D will
get a bad surprise? While in the embedded world, upgrading Linux kernel
is not the common case, it doesn't seem right to knowingly make it
difficult to those few who actually tries to do the right thing.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
