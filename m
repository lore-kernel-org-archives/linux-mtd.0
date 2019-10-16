Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE3DECE599
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 06:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3A920872
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 06:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Njf1PCRU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F72cyCwH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3A920872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qUNdtGWPRSQENS22X5AKZCWhPyEXNg9wKatqsH64CdU=; b=Njf1PCRUNX+l0CpyXa0JZTNc8q
	mA8q8j+GNzMhL0vADIqI3itFw4Pt/dDGh9yBk5PIKe4u/8+shYxmeiRogUSeB+RskCRIZqgqeIURK
	COCNx/aFQT+8xCE9aViLdW53JVFts0pk3OKJdez48HTEXaNErEfrh4TSLgJ8ueNL2gOwy5Hs/DnG7
	dO5sfoqxPXfHsJWwejJ87I+3AcVcINHO354abkqGC/GOUjmlow2Jb0YSVN6ra3n+4a5y3oAI2nmbF
	d0n66PSu/D91sSgXJGc5Ou5mzR6ji8W2YHsP+mEsAy/MYXGvSOOd5cWcNYkAma6AMoxh2et9OABqB
	P1ADVC7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKcsC-000395-Jv; Wed, 16 Oct 2019 06:33:28 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKcs9-00038m-7K
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 06:33:26 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9G6XE2c027563;
 Wed, 16 Oct 2019 01:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1571207594;
 bh=JJY+04i0nHPEBM+vEGxFwckJZNHnKcG0o1TjCxdARU4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=F72cyCwHL/9awHQqNmV1w0ljP07yyBMnj78tfmv1Ic2mBLK2VsiFvfUKRJtq+cYrh
 JYFE/+j5dhesZAWYjFx1cmTT0oSZmieAW7q94BsQ12ufVq1BZs+wAZjHyOVCMfsfEQ
 PMZothfmy+V4n+GEnl/FOX/4P+8c4CXNCAtYX8D0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9G6XEE5114484
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Oct 2019 01:33:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 01:33:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 01:33:14 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9G6XBOw031266;
 Wed, 16 Oct 2019 01:33:12 -0500
Subject: Re: [PATCH 2/2] mtd: cfi_cmdset_0002: fix delayed error detection on
 HyperFlash
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
 <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e5124cbf-c9bd-ec0e-b68f-1882646eb264@ti.com>
Date: Wed, 16 Oct 2019 12:03:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_233325_367652_0A7ED888 
X-CRM114-Status: GOOD (  25.01  )
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

Hi,

On 04/10/19 12:04 AM, Sergei Shtylyov wrote:
> The commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
> status register") added checking for the status register error bits into
> chip_good() to only return 1 if these bits are zero. Unfortunately, this
> means that polling using chip_good() always reaches a time-out condition
> when erase or program failure bits are set. I think the status register
> error checking should be fully delegated to cfi_check_err_status() that
> should return whether any error bits were set or not...
> 

Please reword last sentence to drop "I think". Something like:

Lets fully delegate the function of determining error condition to
cfi_check_err_status() and make chip_good() only look for Device
Ready/Busy condition.

> Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   55 +++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 25 deletions(-)
> 
> Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
> ===================================================================
> --- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -123,14 +123,14 @@ static int cfi_use_status_reg(struct cfi
>  		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
>  }
>  
> -static void cfi_check_err_status(struct map_info *map, struct flchip *chip,
> -				 unsigned long adr)
> +static int cfi_check_err_status(struct map_info *map, struct flchip *chip,
> +				unsigned long adr)
>  {
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	map_word status;
>  
>  	if (!cfi_use_status_reg(cfi))
> -		return;
> +		return 0;
>  
>  	cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>  			 cfi->device_type, NULL);
> @@ -138,7 +138,7 @@ static void cfi_check_err_status(struct
>  
>  	/* The error bits are invalid while the chip's busy */
>  	if (!map_word_bitsset(map, status, CMD(CFI_SR_DRB)))
> -		return;
> +		return 0;
>  
>  	if (map_word_bitsset(map, status, CMD(0x3a))) {
>  		unsigned long chipstatus = MERGESTATUS(status);
> @@ -155,7 +155,9 @@ static void cfi_check_err_status(struct
>  		if (chipstatus & CFI_SR_SLSB)
>  			pr_err("%s sector write protected, status %lx\n",
>  			       map->name, chipstatus);
> +		return 1;
>  	}
> +	return 0;
>  }
>  
>  /* #define DEBUG_CFI_FEATURES */
> @@ -852,20 +854,16 @@ static int __xipram chip_good(struct map
>  
>  	if (cfi_use_status_reg(cfi)) {
>  		map_word ready = CMD(CFI_SR_DRB);
> -		map_word err = CMD(CFI_SR_PSB | CFI_SR_ESB);
> +
>  		/*
>  		 * For chips that support status register, check device
> -		 * ready bit and Erase/Program status bit to know if
> -		 * operation succeeded.
> +		 * ready bit
>  		 */
>  		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>  				 cfi->device_type, NULL);
>  		curd = map_read(map, addr);
>  
> -		if (map_word_andequal(map, curd, ready, ready))
> -			return !map_word_bitsset(map, curd, err);
> -
> -		return 0;
> +		return map_word_andequal(map, curd, ready, ready);
>  	}
>  
>  	oldd = map_read(map, addr);
> @@ -1703,8 +1701,11 @@ static int __xipram do_write_oneword_onc

Nit: for some reason, your diff has function names truncated abruptly
which makes its slightly harder to locate the context. I use git
format-patch that produces better readable contexts.

>  			break;
>  		}
>  
> -		if (chip_good(map, chip, adr, datum))
> +		if (chip_good(map, chip, adr, datum)) {
> +			if (cfi_check_err_status(map, chip, adr))
> +				ret = -EIO;
>  			break;
> +		}
>  
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
> @@ -1777,7 +1778,6 @@ static int __xipram do_write_oneword_ret
>  	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
>  	if (ret) {
>  		/* reset on all failures. */
> -		cfi_check_err_status(map, chip, adr);
>  		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
> @@ -1974,12 +1974,17 @@ static int __xipram do_write_buffer_wait
>  		 */
>  		if (time_after(jiffies, timeo) &&
>  		    !chip_good(map, chip, adr, datum)) {
> +			pr_warn("MTD %s(): software timeout, address:0x%.8lx.\n",
> +				__func__, adr);

Since we are returning an error condition, this should be pr_err() (I
know that rest of the file does not follow this convention, but lets
make sure new code does)


Rest looks fine to me. Thanks for the patch!

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
