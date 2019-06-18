Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD81C31E51
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 08:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 434EA20B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 08:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MpizGnpf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yDfxhvks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 434EA20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JJxB4YrjKxXeZozjnWhVRZTB9Wluh2ouTwvAvkL2VU=; b=MpizGnpfR8S3Q3
	aAWNfSH/dcsyZk5bOU/h5ErO9VH8PDqblYaWY6jLYfeNGy7QO6sSIO03X7PbKmQzmsE4+vY3Qe1WX
	onwIj6SGd+yvcdCzmYRIHXT/oFfdqU/pOG/ncDzXPAWJgWtNhlQHtPD/RCYPb+TUI39yCqqD3Ers6
	RknvZ58n8n0ZXzsBnVvIKyadL1cHuAIFPJd2H23ZzuhmVxDtays5HACuHA5BkO9Cg+sfsDiYPSAKs
	pClWFiQ3Y4f0jDzqWeloyGugv/5dhEdRFB39OJgi3qarIE2LHvC1EHdZ7dHlJwWGEuOoqm+xjHIUH
	4tG11sYsDhx0L0zj7fiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd97O-0008II-61; Tue, 18 Jun 2019 08:05:26 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd97L-0008Hu-4D
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2019 08:05:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5I85BZW057695;
 Tue, 18 Jun 2019 03:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560845111;
 bh=rqxRt6oDr5osNCoeNISWT/YZOH8MGyRASxGNyRpR7nE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yDfxhvks9CvNjyF7OJ+wArUbDjJHUCrPiWgMmMfoaXtu/ZzMx3yxGifGF+SB6yuRA
 2JC0V68hbj0YH9CWOfB6w6HPN/d96abRpMvdKWhZ0A8Zjd8ETBoAC3zpdsh8gc902L
 AA01xNSqqnlDbkXyi5gTDFuQOM6u9JIbCn08gFcs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5I85BiK069426
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2019 03:05:11 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 18
 Jun 2019 03:05:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 18 Jun 2019 03:05:11 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5I858Nu116881;
 Tue, 18 Jun 2019 03:05:09 -0500
Subject: Re: [PATCH v6 11/11] mtd: cfi_cmdset_0002: Disable write buffer
 functions if FORCE_WORD_WRITE is 1
To: Tokunori Ikegami <ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
 <20190526153904.28871-12-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1dadbf1c-6c71-27fb-12e9-8d07b6f250bf@ti.com>
Date: Tue, 18 Jun 2019 13:35:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190526153904.28871-12-ikegami.t@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190618_010523_256509_6A51EB47 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/05/19 9:09 PM, Tokunori Ikegami wrote:
> Some write buffer functions are not used when FORCE_WORD_WRITE is set to 1.
> So the compile warning messages are output if FORCE_WORD_WRITE is 1.
> To resolve this disable the write buffer functions if FORCE_WORD_WRITE is 1.
> 
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> Changes since v5:
> - Add the patch.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 477bc3d65e68..2144221029e9 100755

Your patch seems to be changing permissions here:
warning: drivers/mtd/chips/cfi_cmdset_0002.c has type 100644, expected
100755

Please fix this up.

> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c

[...]

> @@ -1836,6 +1840,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
>  	return 0;
>  }
>  > +#if !FORCE_WORD_WRITE
>  static int __xipram do_write_buffer_wait(struct map_info *map,
>  					 struct flchip *chip, unsigned long adr,
>  					 map_word datum)
> @@ -2064,6 +2069,7 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	return 0;
>  }
> +#endif /* !FORCE_WORD_WRITE */
>  

This should be part of the patch that introduces do_write_buffer_wait()

>  /*
>   * Wait for the flash chip to become ready to write data
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
