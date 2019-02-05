Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D45FC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 11:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F691207E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 11:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p606j4m9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r6ZfEohQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F691207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utojDgT8nPiKB7uGe6vaR5iJ7Z5Wi8tthdH/6OJRINE=; b=p606j4m9Jc6sm2
	6n1P4X0T4eLScNk6U1NaHj6r2uJmqxxX3O/ikA0CSIhcxwsBOrQ9tvJked5cIB6Dc+/OF8iDLnY66
	PFjoRVd2o+9rLw5YguWDR2mHf2XL5RtYwMqL7adYnfl3XHNvu7c9KJCZu/7RkgI21gmmgwOF2Sbf0
	Wo5H0BJSHJcdhV+5dF1rLqlrx2Z9NBfcgiUiAF5MsQnRBD3HgVd954kvBJSU0b1RloRrM3hhfefJY
	WA/0bQm08FXCUVHlSvyFPukDGXObF8MKPO9m6C6otcipRjQxHrgYtD7ebI/r1cL17fXIq2LV9uq3x
	HKmj+AuuQ20QOBPoDIRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqzLh-0002XZ-Sj; Tue, 05 Feb 2019 11:57:09 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqzLe-0002Vh-5d
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 11:57:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x15BumdH121239;
 Tue, 5 Feb 2019 05:56:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1549367808;
 bh=GM2ZGZYHrLeSupLXBUQVqBjue0pYqzrIYXlQKjk0Wzo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=r6ZfEohQvUrYvgCR8kh/rWS1/vtpPqfrlAA9eexwajVIfzIWPKbGOnCOar6Q0RkQm
 W5d8AXLYpJmjgbLD7QiiE+UADdPCbN/f/IEXjSL4sNss+LI3lFumYWlwvm9MPnSXR/
 3A9EYfARoaQyWGlmG8yN2qHDfkJridNKPRExZpVA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x15BumVM073925
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Feb 2019 05:56:48 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 5
 Feb 2019 05:56:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 5 Feb 2019 05:56:47 -0600
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x15BujqU009872;
 Tue, 5 Feb 2019 05:56:46 -0600
Subject: Re: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
To: Tokunori Ikegami <ikegami_to@yahoo.co.jp>, "'Boris Brezillon'"
 <bbrezillon@kernel.org>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
 <20190204182004.29894-2-ikegami_to@yahoo.co.jp>
 <002601d4bcb6$cf5aa140$6e0fe3c0$@yahoo.co.jp>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <1ba13d48-8b78-2c74-53b8-cbccbcddaba9@ti.com>
Date: Tue, 5 Feb 2019 17:27:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <002601d4bcb6$cf5aa140$6e0fe3c0$@yahoo.co.jp>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_035706_314773_523696AC 
X-CRM114-Status: GOOD (  30.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Joakim Tjernlund' <Joakim.Tjernlund@infinera.com>,
 'Chris Packham' <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, 'Felix Fietkau' <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 04/02/19 11:54 PM, Tokunori Ikegami wrote:
> Hi,
> 
> Very sorry for many times resending the patch mails.
> Since I could not send the mails correctly with the incorrect mail address.
> Still I can not send correctly the mail to stable@vger.kernel.org so I will
> investigate this later.
> 

You don't have to explicitly send mail/Cc stable@vger.kernel.org. Its just a tag.

From Documentation/process/stable-kernel-rules.rst[1]:
Option 1
********

To have the patch automatically included in the stable tree, add the tag

.. code-block:: none

     Cc: stable@vger.kernel.org

in the sign-off area. Once the patch is merged it will be applied to
the stable tree without anything else needing to be done by the author
or subsystem maintainer.

Along with Fixes tag[2]:
A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
is used to make it easy to determine where a bug originated, which can help
review a bug fix. This tag also assists the stable kernel team in determining
which stable kernel versions should receive your fix.


[1]https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#for-all-other-submissions-choose-one-of-the-following-procedures
[2]https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Regards
Vignesh

> Regards,
> Ikegami
> 
>> -----Original Message-----
>> From: Tokunori Ikegami [mailto:ikegami_to@yahoo.co.jp]
>> Sent: Tuesday, February 5, 2019 3:20 AM
>> To: Boris Brezillon
>> Cc: Tokunori Ikegami; Felix Fietkau; Chris Packham; Joakim Tjernlund;
>> linux-mtd@lists.infradead.org; stable@vger.kernel.org
>> Subject: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
>> in do_write_oneword()
>>
>> As reported by the OpenWRT team, write requests sometimes fail on some
>> platforms.
>> Currently to check the state chip_ready() is used correctly as described
>> by
>> the flash memory S29GL256P11TFI01 datasheet.
>> Also chip_good() is used to check if the write is succeeded and it was
>> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
>> checking").
>> But actually the write failure is caused on some platforms and also it can
>> be fixed by using chip_good() to check the state and retry instead.
>> Also it seems that it is caused after repeated about 1,000 times to retry
>> the write one word with the reset command.
>> By using chip_good() to check the state to be done it can be reduced the
>> retry with reset.
>> It is depended on the actual flash chip behavior so the root cause is
>> unknown.
>>
>> Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
>> Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
>> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: stable@vger.kernel.org
>> ---
>> Changes since v3:
>> - Update the commit message for the comments.
>> - Drop the addition of blanks lines around xip_enable().
>> - Delete unnecessary setting the ret variable to -EIO.
>> - Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.
>>
>> Changes since v2:
>> - Just update the commit message for the comment.
>>
>> Changes since v1:
>> - Just update the commit message.
>>
>> Background:
>> This is required for OpenWrt Project to result the flash write issue as
>> below patche.
>> <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3
>> 932c7b7b7df7d5fbd48f207e77619eaa7>
>>
>> Also the original patch in OpenWRT is below.
>> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/
>> patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>
>>
>> The reason to use chip_good() is that just actually fix the issue.
>> And also in the past I had fixed the erase function also as same way by
>> the
>> patch below.
>>   <https://patchwork.ozlabs.org/patch/922656/>
>>     Note: The reason for the patch for erase is same.
>>
>> In my understanding the chip_ready() is just checked the value twice from
>> flash.
>> So I think that sometimes incorrect value is read twice and it is depended
>> on the flash device behavior but not sure..
>>
>> So change to use chip_good() instead of chip_ready().
>>
>>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>>  mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
>>
>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
>> b/drivers/mtd/chips/cfi_cmdset_0002.c
>> old mode 100644
>> new mode 100755
>> index 72428b6..91a491b
>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>> @@ -1627,29 +1627,31 @@ static int __xipram do_write_oneword(struct
>> map_info *map, struct flchip *chip,
>>  			continue;
>>  		}
>>
>> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
>> +		if (chip_good(map, adr, datum))
>> +			break;
>> +
>> +		if (time_after(jiffies, timeo)){
>>  			xip_enable(map, chip, adr);
>>  			printk(KERN_WARNING "MTD %s(): software
>> timeout\n", __func__);
>>  			xip_disable(map, chip, adr);
>> +			ret = -EIO;
>>  			break;
>>  		}
>>
>> -		if (chip_ready(map, adr))
>> -			break;
>> -
>>  		/* Latency issues. Drop the lock, wait a while and retry
>> */
>>  		UDELAY(map, chip, adr, 1);
>>  	}
>> +
>>  	/* Did we succeed? */
>> -	if (!chip_good(map, adr, datum)) {
>> +	if (ret) {
>>  		/* reset on all failures. */
>>  		map_write(map, CMD(0xF0), chip->start);
>>  		/* FIXME - should have reset delay before continuing */
>>
>> -		if (++retry_cnt <= MAX_RETRIES)
>> +		if (++retry_cnt <= MAX_RETRIES) {
>> +			ret = 0;
>>  			goto retry;
>> -
>> -		ret = -EIO;
>> +		}
>>  	}
>>  	xip_enable(map, chip, adr);
>>   op_done:
>> --
>> 2.11.0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
