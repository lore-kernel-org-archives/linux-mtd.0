Return-Path: <SRS0=26vX=L3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4642DC07E97
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 16:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E78861930
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E78861930
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:
	MIME-Version:References:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J8XB39pgC2eSrHdq7UJYvQGEL5AW4ffiU8+1GL73xII=; b=UdslDKHDaRBLytOep+SepyzbqS
	rx/IdmMm+oyM6cdVEAGRCK8PUDeGRbcGmD9XQ95eWqCSRLd36/pQC6zQzunxfV9+0qv3ztS3oFTHC
	oTMHebNLfb3+tswde0aKVamjqmY6f9XarKboywHVBRaPsa4/Boftx9uD+N5SiIY/ebkP74Akm4uDW
	tLIJTASfhz5i579lA2lIvoK9x77k2nn/ELJ7jb0doMB6tyx8Z9gAuCuMp2pK5Y63z8Qo0ttOZTq+L
	yYXGI8965jZErkw8go4svFmhyhxKB4oi20AxwexNq8B4U6KY33WgAAuQqe/10sOBVm5pP+ZSJB/rX
	ZfaL2OHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lziT4-0056O2-G3; Sat, 03 Jul 2021 16:26:10 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lziT1-0056Ng-4Z
 for linux-mtd@lists.infradead.org; Sat, 03 Jul 2021 16:26:08 +0000
Received: from [IPv6:2a02:6d40:3433:fe01:3924:339d:7699:b3c9] (unknown
 [IPv6:2a02:6d40:3433:fe01:3924:339d:7699:b3c9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8821322236;
 Sat,  3 Jul 2021 18:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625329563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyBp0q4SVf2MSK2XfgyJCK59ZJNUPQ1pVvNVAWQSMkI=;
 b=JrBfohToQLp2rt6aXBVPFjFBZOeZljlR1IKKY6xuPa94OckCoYUVK8A6yOYzVFnoH3uVBh
 kodapbtmet+MtzmTMXQozWuQFICiqLxaSU0XtPiSOAqYQwEDCjIbV8d1wdol4Mu62b9nRK
 KfoQS7PLE76cddf6Y8mPwNf9Wje/yrM=
Date: Sat, 03 Jul 2021 18:08:38 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <9bb2acac-aeb8-d2b2-8df0-9acfd972ec5d@microchip.com>
References: <20210702093841.32307-1-michael@walle.cc>
 <9bb2acac-aeb8-d2b2-8df0-9acfd972ec5d@microchip.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
CC: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux@roeck-us.net
From: Michael Walle <michael@walle.cc>
Message-ID: <9F46D75C-D00D-4577-A337-7411049EC7D9@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_092607_381910_6F43AC09 
X-CRM114-Status: GOOD (  14.81  )
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

Am 3. Juli 2021 11:56:14 MESZ schrieb Tudor.Ambarus@microchip.com:
>On 7/2/21 12:38 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>know the content is safe
>> 
>> There are flash drivers which registers the OTP callbacks although
>the
>> flash doesn't support OTP regions and return -ENODATA for these
>> callbacks if there is no OTP. If this happens, the probe of the whole
>
>why do they register the OTP callback if they don't support OTP?

I don't know. But I certainly won't touch that code :p


>> flash will fail. Fix it by handling the ENODATA return code and skip
>> the OTP region nvmem setup.
>> 
>> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/mtdcore.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index b5ccd3037788..6881d1423dd6 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -880,7 +880,10 @@ static int mtd_otp_nvmem_add(struct mtd_info
>*mtd)
>> 
>>         if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
>>                 size = mtd_otp_size(mtd, true);
>> -               if (size < 0)
>> +               /* ENODATA means there is no OTP region */
>> +               if (size == -ENODATA)
>
>If no OTP data, maybe it's more appropriate for the clients to just
>return a retlen of 0.

you mean already checking ENODATA in mtd_otp_size() and return 0. That would also make the hunk below unnecessary. I'll change it. 

-michael

>
>
>> +                       size = 0;
>> +               else if (size < 0)
>>                         return size;
>> 
>>                 if (size > 0) {
>> @@ -896,7 +899,10 @@ static int mtd_otp_nvmem_add(struct mtd_info
>*mtd)
>> 
>>         if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
>>                 size = mtd_otp_size(mtd, false);
>> -               if (size < 0) {
>> +               /* ENODATA means there is no OTP region */
>> +               if (size == -ENODATA) {
>> +                       size = 0;
>> +               } else if (size < 0) {
>>                         err = size;
>>                         goto err;
>>                 }
>> --
>> 2.20.1
>> 
>> 
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
