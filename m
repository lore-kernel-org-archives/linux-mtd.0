Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05263C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:08:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C546120661
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8LROfLM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=8devices-com.20150623.gappssmtp.com header.i=@8devices-com.20150623.gappssmtp.com header.b="yY1sWNHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C546120661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=8devices.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDPuo47W4D4XDx82hR68UGedlR+3j3r258Nl8r4iEQU=; b=d8LROfLMkdMwEhEY/HuN7SxYU
	sJRqubBY1kBjTaFmGn33NX6MaHrZztjnFKS5M0Dko2iDY3heHP4S5X8sN2p9lt11Mc9DVgS+mBGe8
	UI43jwQvQLg2IAu73IwQOgSO4NBMtg56M371POgBFRtoLj26b8a1/YiujIV1SY2MhIT2t3i2kqilu
	kAbSyjdNo5PSF1bi/yzPI8eJ0UvwV9y9ttQP8Ha28A36oUZRPH6+qTxxd0hTCckEWiNIDnuhFcLgp
	sDcrBGM6raALSfkdee4o2mT0TVoM+uAdE+R42hsh0x076KCodngrUdu/KZfZ+n4sC7TUccKFNdfqM
	dZg7jDR+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQm5L-0005Tu-9L; Tue, 21 Apr 2020 06:08:43 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQm5I-0005S0-5J
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:08:41 +0000
Received: by mail-lj1-x244.google.com with SMTP id l19so10160106lje.10
 for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2020 23:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=8devices-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=anAoqwoHTpqf4IvLEEWYid6qMG3By9XKSiIRQ2ZmR2s=;
 b=yY1sWNHdKVrd6OqGUwYoEZsqZU8oOWGez3Z7JHWVKZ+Pm2YJpGBQTP7MJzz/a1B7vn
 28TCF/B4aJj8m9bcblJvlCDtB92UFdZYcus4Xd/+sijondE29jbhwDpzgSKw3LnzuU+v
 GkP8y0kUuAReBFcdpZC9wVMPQYyCrLLMs/gFq0SB7GDSXbR3dhxzjJokQiU04tfqkfvS
 cu9md4tyK/gsEoYBkR6L1w0/uvqJQC0giX6KkRMwox2pmVn+GYNkCA1lA4O5mDRR174E
 t52USxr3IQZq0C3YTsGYQcVQdpvPEIfbrncJliQJ8K6856rIfi5Ht/2kN8hvbmgeIt78
 3OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=anAoqwoHTpqf4IvLEEWYid6qMG3By9XKSiIRQ2ZmR2s=;
 b=ojJ9fLc/vzaxt9bTemR8FqQ+mcLgQ2KVoNUv8WnSkNZ6HC39q739Djb+zE3nuAMVes
 suLiKr5yBwb7JVZIDxpjz/8GR6duUyijk5Jdvsp2NtAlzv+4Qjk8Hy2IqiyOlWQjMiLz
 1D/ud4ITJOENzv7E3Bq6dmvSOOijL4lNFS+zgnaTx065/nRVQQWZhCRb31nYVkJsqKt9
 4Kx42Cwkt/etysfrCzlCMvaVWzO7tRm05bbpzzuUonXWSiACs1OsNdPyLuHoBaguA573
 QCmgtw2pyi0CBUoj8ImiMZxzyfgNNrJrMhkwl+VEdlqt9KiatEjJ/LhEBCF6kxUan+Zt
 3iGw==
X-Gm-Message-State: AGi0Pub5LBVwMNx3Yq6Ci41iTgHWe4MY8SLrQNDPeJ3y9lIY+XkMxWiR
 D7QwS/C42sVeDXxre+NXcGyrFQ==
X-Google-Smtp-Source: APiQypK6vAMYuGyFGCw76ZYqUiM7A0BbV9xjJWkX1yGi0sIqy0mpuXb9nXrynmhaIUp4xxnbEqd+tw==
X-Received: by 2002:a2e:8e68:: with SMTP id t8mr11840472ljk.93.1587449316566; 
 Mon, 20 Apr 2020 23:08:36 -0700 (PDT)
Received: from [192.168.2.239] (78-62-132-154.static.zebra.lt. [78.62.132.154])
 by smtp.googlemail.com with ESMTPSA id k2sm1096666ljg.7.2020.04.20.23.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 23:08:34 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix 4-byte opcode support for w25q256
To: Tudor.Ambarus@microchip.com, gch981213@gmail.com, robimarko@gmail.com
References: <1586958510-24012-1-git-send-email-mantas@8devices.com>
 <43054851.jYS1km7NsV@192.168.0.120>
From: Mantas <mantas@8devices.com>
Message-ID: <e4826369-f239-4b67-1da8-f7d9c8357abe@8devices.com>
Date: Tue, 21 Apr 2020 09:08:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <43054851.jYS1km7NsV@192.168.0.120>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_230840_229190_B564FBBE 
X-CRM114-Status: GOOD (  22.47  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020-04-20 13:53, Tudor.Ambarus@microchip.com wrote:
> On Wednesday, April 15, 2020 4:48:30 PM EEST Mantas Pucka wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe
>>
>> There are 2 different chips (w25q256fv and w25q256jv) that share
>> the same JEDEC ID. Only w25q256jv fully supports 4-byte opcodes.
>> Use SFDP header version to differentiate between them.
>>
>> Signed-off-by: Mantas Pucka <mantas@8devices.com>
>> ---
>>   drivers/mtd/spi-nor/sfdp.c    |  4 ----
>>   drivers/mtd/spi-nor/sfdp.h    |  6 ++++++
>>   drivers/mtd/spi-nor/winbond.c | 30 ++++++++++++++++++++++++++++--
>>   3 files changed, 34 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index f6038d3..27838f6 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -21,10 +21,6 @@
>>   #define SFDP_4BAIT_ID          0xff84  /* 4-byte Address Instruction Table
>> */
>>
>>   #define SFDP_SIGNATURE         0x50444653U
>> -#define SFDP_JESD216_MAJOR     1
>> -#define SFDP_JESD216_MINOR     0
>> -#define SFDP_JESD216A_MINOR    5
>> -#define SFDP_JESD216B_MINOR    6
>>
>>   struct sfdp_header {
>>          u32             signature; /* Ox50444653U <=> "SFDP" */
>> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
>> index e0a8ded..b84abd0 100644
>> --- a/drivers/mtd/spi-nor/sfdp.h
>> +++ b/drivers/mtd/spi-nor/sfdp.h
>> @@ -7,6 +7,12 @@
>>   #ifndef __LINUX_MTD_SFDP_H
>>   #define __LINUX_MTD_SFDP_H
>>
>> +/* SFDP revisions */
>> +#define SFDP_JESD216_MAJOR     1
>> +#define SFDP_JESD216_MINOR     0
>> +#define SFDP_JESD216A_MINOR    5
>> +#define SFDP_JESD216B_MINOR    6
>> +
>>   /* Basic Flash Parameter Table */
>>
>>   /*
>> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> index 17deaba..50b2478 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -8,6 +8,32 @@
>>
>>   #include "core.h"
>>
>> +static int
>> +w25q256_post_bfpt_fixups(struct spi_nor *nor,
>> +                        const struct sfdp_parameter_header *bfpt_header,
>> +                        const struct sfdp_bfpt *bfpt,
>> +                        struct spi_nor_flash_parameter *params)
>> +{
>> +       /*
>> +        * W25Q256JV supports 4B opcodes but W25Q256FV does not.
>> +        * Unfortunately, Winbond has re-used the same JEDEC ID for both
>> +        * variants which prevents us from defining a new entry in the parts
>> +        * table.
>> +        * To differentiate between W25Q256JV and W25Q256FV check SFDP
>> header +        * version: only JV has JESD216A compliant structure
>> (version 5) +        */
>> +
>> +       if (bfpt_header->major == SFDP_JESD216_MAJOR &&
>> +           bfpt_header->minor == SFDP_JESD216A_MINOR)
> 
> Not sure if this is generic enough. Are you sure that the JV version will
> never have an update for the sfdp tables?
> 

No, I'm not sure. I also don't know about other changes that may come 
with a version update: will it have 4B opcode table? will it be 
different version again (say KV) with it's own quirks? Fix only what 
needs fixing was the idea. But I guess chances of new chip with no 4B 
opcodes and new SFDP table are pretty slim, so I'm OK with having >= in v2.

>> +               nor->flags |= SNOR_F_4B_OPCODES;
>> +
>> +       return 0;
>> +}
>> +
>> +static struct spi_nor_fixups w25q256_fixups = {
>> +       .post_bfpt = w25q256_post_bfpt_fixups,
>> +};
>> +
> 
> If the post_bfpt hook is called, you already have a valid bfpt table. If the
> differentiator between the JV and FV versions is that only the JV defines the
> SFDP tables, then your w25q256_post_bfpt_fixups() can look as:
> 
> static int w25q256_post_bfpt_fixups()
> {
> 	nor->flags |= SNOR_F_4B_OPCODES;
> 	return 0;
> }

FV chip that I have, do actually have SFDP tables (with 
minor_version==0). I've saw Chuanhong reporting that some FV chips don't 
have SFDP, but certainly this is not the case for all of them.


Best regards,
Mantas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
