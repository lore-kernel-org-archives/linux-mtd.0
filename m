Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9036AC282DE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mc1bZkkdHfBWz+vOEipUqx/gli1uP6ysGW2yz6vhFbc=; b=tXI8ZzZpcreaYv
	3lNDHRHuGZMc5CPnpgYNMCGwUYwd+2Ocfkk7c72qDMyQ+EcVT6sDAgBmvSen4QjII0vkzNEkFu/2R
	B3rYMb+SXcPzy/Zd75xe1Cx3ZEUzPOk3JpI5T5trgW3bS9d0DBxWA/O+kgMxZC03bAEXPqUyyB9BC
	3f4FcjmITAIll3g3fpOth1rsT9Arzw9HvpHG4dQbSBiwh1Qjlha55b4QM3U7OHCteFenRTeQwrqIR
	ZCuPoG3C2QPlFnYbrnuWE1ELraEMGcKkuhcNdYyitiRWgloksYTcQunFUePf9f0PtKBkYFfNqnMk9
	VDeQW4YZpZtMaVhSmwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7OO-0000000AT5T-26s7;
	Thu, 06 Mar 2025 09:19:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Fq-0000000ARtN-0So6
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 09:10:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bcbdf79cdso2159265e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 01:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741252255; x=1741857055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tN16NGGx/95g9rx+yQ6oZi4rmDu8bCDsZdK+zJvVznI=;
        b=cT0jg+Ec2tpa58dpUvIft0QXYI10IuJEc+ayAxRzS1iKZAS9uWup5hD2PvGnFO7v6E
         t1DTm6esOAH8LBLEP2SAHOFQ2mLxn9dh57VHodnDXiV3c1JGN6PXLdZWv6kC22Stm/7R
         UpJXgv5oslkmpG+YYkhocncJhjWq3LSNZQgeFJ++19xPJ+W/yWnFX2RONTUENPuvW8ju
         fALPX0z20v6eghnAd5vB4PATfmzZMRxhkl17xSMiWCBroh4vrkNXgJYjXhk1WSo1B+Uy
         J994Pj7tuhNusDQdFhBUENqnRQ9hrQRZCoBzxh0q9z0z4/zVcBzGv3169nubqrIbgT9i
         k4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741252255; x=1741857055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tN16NGGx/95g9rx+yQ6oZi4rmDu8bCDsZdK+zJvVznI=;
        b=Ep1hCoFNRarlJrPOAFwy2/JKms7CdNXBc2tICUhGgk7utAULXVYkZIPxz8t31DZ20d
         RF0YfO0aKaa9ClR90orxlXRsk1I6yB21YJT53JnnNMqE4RoPjmAlOjJ2S0502ISivFX+
         NFMeoGOSmH6hzDMvABsb3/h0fBLRPksdGPmOlD1q9MraePUsXQvugCP+e66YFGJ5TOjD
         2ySxQNYBuZ04jfc082JCOfuMstydCjMjubIGFLD8bEASKHbDRZ9//3Ne57U3efQaloYW
         Aw/5DOpV9CkdFFk+mN+zuoVxu2JOLMNwtkNNoS26/MqFzq0lFAcSVcY2shiviAREM8Rc
         P+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU/o/yh3X6NjCq4Xkvi8tuZkpSZVAVrZQX9HEYSE0y4f9E1LS1MtWjKrXBUW3eupHvII9vzmIIoRZ4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Nq2iqNNgc6+XiXK2j4ngxnnkYc9Ws7D3ilgu+2eNluHY6ZjK
	L7UnLmPk8v4Y3TkV7zNZN4zPooVaHSEZbYY0xpbPqfz7R+oTV02Wcv/gAMBujnbSKnIrOarL7Dp
	a
X-Gm-Gg: ASbGncsprdZj7FeoC2X3AI+HB4NyZiHktTth6O18Ro9+B+AJxfuVVwzK2LQxr56rL6E
	DZ5eao0MA9Zr96rX9y7CUh5HBlqDtkaGNIe/IF2642fiW8XMyre24FtOn9B+6XylMv73fOVH89l
	V8i4BTok/lHMulFFhAeXFB2D+ROJXdLx+cxAVoF6MB3TK8XzgEt5toaBGEBxgBkUwHFfRVszyqR
	y/iJG3hB4kb4qK+Oc/czdLMnNDPB2MfrJmtARsX3oZxBlN87tpLYrhGXkJ6tsYU0ryxTJMSw7Td
	DwOcYjXOoSy+RtREKZXjKia6PcVwlXy2vZqEjMkYhqI3HPpFtKpaXw==
X-Google-Smtp-Source: AGHT+IGbmWH12q0oH0l9u656j7YSKd4B1+DuJJ5Tv4FfjDn745/uTx8L4UjyOIbWFjxB05chPwZ2yw==
X-Received: by 2002:a05:6000:1844:b0:390:f698:ecd0 with SMTP id ffacd0b85a97d-3911f726495mr5583521f8f.11.1741252255578;
        Thu, 06 Mar 2025 01:10:55 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1030cfsm1402164f8f.90.2025.03.06.01.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:10:54 -0800 (PST)
Message-ID: <f47b9e82-2d0a-4999-bc26-82cb55558f79@linaro.org>
Date: Thu, 6 Mar 2025 09:10:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: nand: Fix a kdoc comment
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
References: <20250305194955.2508652-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250305194955.2508652-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_011058_156819_E2BA6488 
X-CRM114-Status: GOOD (  14.61  )
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



On 3/5/25 7:49 PM, Miquel Raynal wrote:
> The max_bad_eraseblocks_per_lun member of nand_device obviously
> describes a number of *maximum* number of bad eraseblocks per LUN.
> 
> Fix this obvious typo.
> 
> Fixes: 377e517b5fa5 ("mtd: nand: Add max_bad_eraseblocks_per_lun info to memorg")
> Cc: stable@vger.kernel.org

no trivial fixes for stable please.

replace Cc to stable with:
Cc: <stable+noautosel@kernel.org> # fix kdoc comment

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/nand.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 0e2f228e8b4a..07486168d104 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -21,7 +21,7 @@ struct nand_device;
>   * @oobsize: OOB area size
>   * @pages_per_eraseblock: number of pages per eraseblock
>   * @eraseblocks_per_lun: number of eraseblocks per LUN (Logical Unit Number)
> - * @max_bad_eraseblocks_per_lun: maximum number of eraseblocks per LUN
> + * @max_bad_eraseblocks_per_lun: maximum number of bad eraseblocks per LUN
>   * @planes_per_lun: number of planes per LUN
>   * @luns_per_target: number of LUN per target (target is a synonym for die)
>   * @ntargets: total number of targets exposed by the NAND device


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
