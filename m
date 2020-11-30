Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E817C64E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 14:18:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6359C2084C
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 14:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7x3q4vz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="vf875Nc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6359C2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q4vmiMZ3rlSJbEN8Xoc3DyKOL9USRRiDybE55B3dPbQ=; b=U7x3q4vzKjQW1gccgPX5iWfWY
	e9E/WaohhMz+pm94H34Q7yyTV/FrVvqVrQLRYI8yAEvk7NBAwIkHeXsLOTwslUoZBA92LzDfVZbhJ
	j7mOzvBU87eQ+73GeQya4BJnfYxOS3VYfuZgd7uVWV9WaFW76M8Mrm6RuxI2uUUPcvIM3u6Vqb/pG
	8kS7Q1EoyXw9sTdHEUD7cuw+4fCbabVPuUogMQZjktsyn/SSWP1po+TVQGIOc81qx4V6GI8pjceez
	LdbI2GPxErEbuI9l72wLCUGuUGn50aurCJDhyadFuZ2KNmkkzaSznIPNOTdGazAnjn+EJjqhw1Gs4
	FYWUuwYpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjjz5-0003A7-W7; Mon, 30 Nov 2020 14:16:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjjz2-00038c-8b
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 14:16:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9501822EDE;
 Mon, 30 Nov 2020 15:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606745802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc9pLI7KaYmunkJKO/az4YUmYOWPtXleDysNMdmHYns=;
 b=vf875Nc16yGE6Yw0Xl77YgoC6sIvkgvMSScvFPTwKepO/ZfzFHvlWePWWaF7mjWxRaZl1X
 LivP6SyL7Ncx6iJH1uaBzAGoabgv+GxbQdRDtFV6h3n7e2VlmlmfGXWhHhHnuswF2obdRn
 9Xv2Zt2JAxg2suGPDEsUH7Da6UD8jm4=
MIME-Version: 1.0
Date: Mon, 30 Nov 2020 15:16:41 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v6 4/5] mtd: spi-nor: atmel: Fix unlock_all() for
 AT25FS010/040
In-Reply-To: <ba9850c1-a684-6376-7331-2e09567dcb73@microchip.com>
References: <20201126202614.5710-1-michael@walle.cc>
 <20201126202614.5710-5-michael@walle.cc>
 <ba9850c1-a684-6376-7331-2e09567dcb73@microchip.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <a8ce7d3a61d6f7bd988917291e938954@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_091652_433345_E263663F 
X-CRM114-Status: GOOD (  21.08  )
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
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-11-28 09:25, schrieb Tudor.Ambarus@microchip.com:
> On 11/26/20 10:26 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> These flashes have some weird BP bits mapping which aren't supported 
>> in
>> the current locking code. Just add a simple unlock op to unprotect the
>> entire flash array which is needed for legacy behavior.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> changes since v5
>>  - new patch
>> 
>>  drivers/mtd/spi-nor/atmel.c | 53 
>> +++++++++++++++++++++++++++++++++++--
>>  drivers/mtd/spi-nor/core.c  |  2 +-
>>  drivers/mtd/spi-nor/core.h  |  1 +
>>  3 files changed, 53 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
>> index 49d392c6c8bc..fe6a4653823d 100644
>> --- a/drivers/mtd/spi-nor/atmel.c
>> +++ b/drivers/mtd/spi-nor/atmel.c
>> @@ -8,10 +8,59 @@
>> 
>>  #include "core.h"
>> 
>> +/*
>> + * The Atmel AT25FS010/AT25FS040 parts have some weird configuration 
>> for the
>> + * block protection bits. We don't support them. But legacy behaviour 
>> in linux
>> + * is to unlock the whole flash array on startup. Therefore, we have 
>> to support
>> + * exactly this operation.
>> + */
>> +static int atmel_at25fs_lock(struct spi_nor *nor, loff_t ofs, 
>> uint64_t len)
>> +{
>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +static int atmel_at25fs_unlock(struct spi_nor *nor, loff_t ofs, 
>> uint64_t len)
>> +{
>> +       /* We only support unlocking the whole flash array */
>> +       if (ofs || len != nor->params->size)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * Write 0x00 to the status register to try to disable the 
>> write
>> +        * protection. This will fail if SRWD (the datasheet calls it 
>> WPEN) is
>> +        * set. But there is nothing we can do.
>> +        */
> 
> can't we do the same as you did in 5/5?

Sure, but - assuming it is only used for the legacy unlock all operation 
- the
outcome will be the same. It will either keep being locked or all will 
be
unlocked.

That being said, I can also change it to the same as the 
global_unprotect().
I don't have any option on that other than this is simpler.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
