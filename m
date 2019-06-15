Return-Path: <SRS0=lAOP=UO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64177C31E50
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 13:42:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C08E21773
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 13:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hwks4RZc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WbVk6i8U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C08E21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzz14ZKaEqV53sQ61rYi3SvccnTFVpv9xRifXhYNk2A=; b=Hwks4RZck0CjbE
	QsDsxz3naCX7hezZAvY25XjoILJ0jfveaaD7p3iVu2kbJFRB8Gyn0uI+qba7B/sMCihZhCStWFE3F
	5NMPQP9g55OF73xB0JRLyDVF2z1d9XLANmXFbdnTf8rmOAR4P2jr1DN86EECIPTRo8Zpujd5uJLT9
	ZPP6ML/9PF3Bgh8O1yT2wXvVt8fc29XcYfgeRag0WsZEQFdhQB7Y5MGjl4gRERrN8W2g4iBjS4xhX
	J6GOFh6jlEiyoCQ7ABBJatlNZwV/MNaopziBq9+8mvsFGpjmvCHw3bgm0ErRXenrN95VEKNpA86Qa
	zkApu+xFBd2t9P44w5ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc8wt-0007P2-Rt; Sat, 15 Jun 2019 13:42:27 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc8wp-0007Ob-TP
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2019 13:42:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5FDgGl6116980;
 Sat, 15 Jun 2019 08:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560606136;
 bh=BBTpWM5W/Hl2u1EIbVstFU/QA1xtLGYLdZ9XyfhWNVc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=WbVk6i8Uvi0O7PyieRmevaCSynEH2vHXrG5m/AanI69dEoXEs4LoEKgoRgQlMszQD
 X05HZoX5GyCwIPxK/zdAgwON5ojgNO6GNmRiLQqHgKdn+8gPbm6PzBahGvbleG3Act
 FV7LzsUJfepqlr6/THoJpR3XAwolYYayzVatzqhw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5FDgGsU078266
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 15 Jun 2019 08:42:16 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 15
 Jun 2019 08:42:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 15 Jun 2019 08:42:15 -0500
Received: from [10.250.133.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5FDgDhU116351;
 Sat, 15 Jun 2019 08:42:14 -0500
Subject: Re: [PATCH v6 02/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
To: Tokunori Ikegami <ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
 <20190526153904.28871-3-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <3ae79920-9162-63f5-e761-80df3e836519@ti.com>
Date: Sat, 15 Jun 2019 19:12:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190526153904.28871-3-ikegami.t@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_064224_038043_E1C8909E 
X-CRM114-Status: GOOD (  17.85  )
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



On 26-May-19 9:08 PM, Tokunori Ikegami wrote:
> For a maintainability by reducing the goto statement remove it from
> do_write_buffer().
> 
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> ---
[...]
>  drivers/mtd/chips/cfi_cmdset_0002.c | 46 +++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 348b54820e4c..ca41f47c00c1 100755
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1887,40 +1887,42 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
>  		 * the failure due to scheduling.
>  		 */
> -		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum))
> +		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
> +			ret = -EIO;
>  			break;
> +		}
>  
>  		if (chip_good(map, adr, datum)) {
>  			xip_enable(map, chip, adr);
> -			goto op_done;
> +			break;
>  		}
>  
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}
>  
> -	/*
> -	 * Recovery from write-buffer programming failures requires
> -	 * the write-to-buffer-reset sequence.  Since the last part
> -	 * of the sequence also works as a normal reset, we can run
> -	 * the same commands regardless of why we are here.
> -	 * See e.g.
> -	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
> -	 */
> -	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> -			 cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> -			 cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
> -			 cfi->device_type, NULL);
> -	xip_enable(map, chip, adr);
> -	/* FIXME - should have reset delay before continuing */
> +	if (ret) {
> +		/*
> +		 * Recovery from write-buffer programming failures requires
> +		 * the write-to-buffer-reset sequence.  Since the last part
> +		 * of the sequence also works as a normal reset, we can run
> +		 * the same commands regardless of why we are here.
> +		 * See e.g.
> +		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
> +		 */
> +		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> +				 cfi->device_type, NULL);
> +		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> +				 cfi->device_type, NULL);
> +		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
> +				 cfi->device_type, NULL);
> +		xip_enable(map, chip, adr);
> +		/* FIXME - should have reset delay before continuing */
>  
> -	printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
> -	       __func__, adr);
> +		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
> +		       __func__, adr);
> +	}
>  

While at that, could you convert this to pr_err()?

> -	ret = -EIO;
> - op_done:
>  	chip->state = FL_READY;
>  	DISABLE_VPP(map);
>  	put_chip(map, chip, adr);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
