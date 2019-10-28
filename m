Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B089CA9EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 19:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F8C214B2
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 19:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dwQcusJM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="G/5u+GNL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F8C214B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OrV7EiSpVLie6/Wi2ay5D/GIkElfoJbJXWheZvcbais=; b=dwQcusJMYuxtUL2hwWTciK4Hot
	Jc731EWO/mVXYaiCeEAUEi8WP1tHaIV7t25eUeCqYssBNp2Vi/VJwYs/2z8cWguivgE2AUnwbtxYk
	/j3pVVBoqgUNziKQGEOjgpDYFuZuT9bDLCc7nZhknu0gZMHp+w42fN2GyJgJaTKa6TSwbTBJMExXx
	W+Le0hrM29GK0bwqGHnTtUgAsYmOj+GO+f7dm/ieZsG5v3SP49EMCziBdikZx1j71DveXdKS76eK0
	KxXj+kqwAoCYOYhra9QhJ92Rp8k94Ud/L9MSDSlQRwweGJAN4m9STV8q5s4S9uaFxIUK5EryTWAiq
	UaPWq/kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPAU8-0005we-HB; Mon, 28 Oct 2019 19:15:24 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPAU5-0005wD-II
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 19:15:23 +0000
Received: by mail-lj1-x241.google.com with SMTP id m7so12590231lji.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2019 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p+1fqspKfIFvwcr38DIrHxckY7p26muWlSRMdgdXIxU=;
 b=G/5u+GNLJsMVFuNqypRICmKTmVWJRVE+tKcqL3SENMJ1BUSArkgHbdjTAPDE/Jliqz
 WJIXdPryBBe/E7VN0C8xkIjJk7bMFkY+EJDTlsoaHnP7SQM31lfBxVB5Traqz7w3nR1l
 N1nwZWAeQrtOM6hhFWeQOFbcgahg1WbixX662CW7RdbXe4xpyWmQCIgPXNaPMlcsnl0B
 NomLrr/SwZl7MxIQZTjCTxrs7R0L2++hscFFh2gYdkgA/7SaMDp8EmKmzvBvE3Dakc/O
 um+mudZ8wjZffuLOlAx0NSqsQ5vKfVsKAhmiMdi/QRAssE1ImJmqqrvylNHJz2FJlEhg
 CLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=p+1fqspKfIFvwcr38DIrHxckY7p26muWlSRMdgdXIxU=;
 b=IrVAPWKuEuQYD82Sl4yP9IoKNHOTRIXWAH++qiRcVyXfD5R2Ov6wMpBhbSzkrjiXb4
 9qLN6O+i/htDW0qTl2W+Q65ugxowIU8WURtcos0vmRsWTPVo2InIitEiRxqNPA34pqru
 e9VoDhz1QWia+a0N8zTwnJ3rbdLtIssqVzMPItRMfpswQRp//txLZffBLEICo4X8rz0+
 3XWV4BztTKu9ufd9E8SDXCbu6/Jy7wjg8OS/EEaz6BJOM1BTfbKk+3iMHPvc5Oo3aDny
 KAQr7Irvoc47G2XETp0FQXeAIV3uFviV5fDl4ReMamu1DlLWmCXxPSzoBcbclSOHtzZR
 rtdw==
X-Gm-Message-State: APjAAAWzrip4xeX93tRPF0nuqb3Jd5r6AP5C5xB8Ozfb7CmjwfEBi0vd
 p7+v7Cwiw6n9pzJJ5bRVAT0ZoBblJq8=
X-Google-Smtp-Source: APXvYqw2/Dceaq0L0qhpsSrJmLHqjmSYBpbyM5w+Sp7jdoF2fgehMoGXJLetlp1mW4hUa0TIPxdaeg==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr12504694ljg.192.1572290118697; 
 Mon, 28 Oct 2019 12:15:18 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4840:6ad1:bb94:1046:3ad2:6a64])
 by smtp.gmail.com with ESMTPSA id r18sm5542295ljg.32.2019.10.28.12.15.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 12:15:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: cfi_cmdset_0002: fix delayed error detection on
 HyperFlash
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
 <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
 <e5124cbf-c9bd-ec0e-b68f-1882646eb264@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0526aa49-0649-b0d1-e72f-9b5bb8f284a5@cogentembedded.com>
Date: Mon, 28 Oct 2019 22:15:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e5124cbf-c9bd-ec0e-b68f-1882646eb264@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_121521_789617_4D155483 
X-CRM114-Status: GOOD (  22.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 10/16/2019 09:33 AM, Vignesh Raghavendra wrote:

>> The commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
>> status register") added checking for the status register error bits into
>> chip_good() to only return 1 if these bits are zero. Unfortunately, this
>> means that polling using chip_good() always reaches a time-out condition
>> when erase or program failure bits are set. I think the status register
>> error checking should be fully delegated to cfi_check_err_status() that
>> should return whether any error bits were set or not...
>>
> 
> Please reword last sentence to drop "I think". Something like:
> 
> Lets fully delegate the function of determining error condition to
> cfi_check_err_status() and make chip_good() only look for Device
> Ready/Busy condition.

   OK. :-)

>> Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  drivers/mtd/chips/cfi_cmdset_0002.c |   55 +++++++++++++++++++-----------------
>>  1 file changed, 30 insertions(+), 25 deletions(-)
>>
>> Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
>> ===================================================================
>> --- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
>> +++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
>> @@ -123,14 +123,14 @@ static int cfi_use_status_reg(struct cfi
>>  		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
>>  }
>>  
>> -static void cfi_check_err_status(struct map_info *map, struct flchip *chip,
>> -				 unsigned long adr)
>> +static int cfi_check_err_status(struct map_info *map, struct flchip *chip,
>> +				unsigned long adr)
>>  {
>>  	struct cfi_private *cfi = map->fldrv_priv;
>>  	map_word status;
>>  
>>  	if (!cfi_use_status_reg(cfi))
>> -		return;
>> +		return 0;
>>  
>>  	cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>>  			 cfi->device_type, NULL);
>> @@ -138,7 +138,7 @@ static void cfi_check_err_status(struct
>>  
>>  	/* The error bits are invalid while the chip's busy */
>>  	if (!map_word_bitsset(map, status, CMD(CFI_SR_DRB)))
>> -		return;
>> +		return 0;
>>  
>>  	if (map_word_bitsset(map, status, CMD(0x3a))) {
>>  		unsigned long chipstatus = MERGESTATUS(status);
>> @@ -155,7 +155,9 @@ static void cfi_check_err_status(struct
>>  		if (chipstatus & CFI_SR_SLSB)
>>  			pr_err("%s sector write protected, status %lx\n",
>>  			       map->name, chipstatus);
>> +		return 1;

   So are you OK with extending the set of the error signalling bits I
did here, or I should really have accounted only for ESB and PSB bits
being error signals?

>>  	}
>> +	return 0;
>>  }
>>  
>>  /* #define DEBUG_CFI_FEATURES */
[...]
>> @@ -1703,8 +1701,11 @@ static int __xipram do_write_oneword_onc
> 
> Nit: for some reason, your diff has function names truncated abruptly
> which makes its slightly harder to locate the context. I use git
> format-patch that produces better readable contexts.

   I use quilt for development, not a big fan of git in this role. :-)

[...]
>> @@ -1974,12 +1974,17 @@ static int __xipram do_write_buffer_wait
>>  		 */
>>  		if (time_after(jiffies, timeo) &&
>>  		    !chip_good(map, chip, adr, datum)) {
>> +			pr_warn("MTD %s(): software timeout, address:0x%.8lx.\n",
>> +				__func__, adr);
> 
> Since we are returning an error condition, this should be pr_err() (I
> know that rest of the file does not follow this convention, but lets
> make sure new code does)

   OK, I was looking at the other timeout code and failed to notice
that this printk() was converted to pr_err() by Ikegami-san... 

> Rest looks fine to me. Thanks for the patch!

   TY for the review.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
