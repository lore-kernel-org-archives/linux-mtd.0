Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CF0C47DD3
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hFnc250M9i0pqKvmfdtWdolHTljmbaNPdgijTQRQRw=; b=OU9qyeAPSpGTKT
	UiDPNLHnY8WfBm1716A2/McA+FtQR79y/T/cZRqdnJ+ljFyn2aoTrTc+jczGyvcIpjcx+r3ul9BYK
	HKvhTdFM2Mzqpv10bW1KuaMsq2c+8/FE5xEMT5AyEyh/pT57hrZR015AVh2zHgqUeXD0sb7Y634UB
	BDR5MtSFWZkvSeywpyaMIQfBmaF0LDv+Eg+vLd1Z1s1KiZEZDofh+8cI8jhGvdWBkjwWOYVkpv/MM
	3NDM7w1t1F+QezLTTEmmzFhVbMzw/dC8DTBNvN3pmKjroKX44YTUVr0IAPiQg9BxK3rAkV8oyHLVx
	gEGDb7qoo9deaL391+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhYO-004WSJ-0x;
	Fri, 19 Jan 2024 05:36:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhYK-004WQj-2N
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 05:36:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40e9ed20ffcso1144995e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 21:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705642586; x=1706247386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ojAQrKurCVDTpDyr9Ud8UUA59iisRxNip7GO8MCjIo=;
        b=mq6Wp1leu1PoNkS48w7+lavxdGaGJoSmVKt1ZZo44KV4Cp+dnUA48NPbGWi7bithQJ
         79QIqS/NRxLCXpta55ZdFNF9bUu3Z4YhntOAyxz1GDIFUZKX+hOBBzUTmWFxa0s/1Hef
         wKT03Gj8qwlmZIK3ZqU23Uyk7ZAq+KRQNmberSRTNvhgCifMErPMqF65Jc0/ddItfeTj
         VLGqy7qSiG8rxXe+v2O17I0D6JEawG2ubykJeYpgh1OAfElbT8pgnEszOVoMe935G+6r
         nFJekbOejX2B7sG34JYOqZ+c/rvV1ORjoh2RU9REh2RpsdOVHsDdnQXkaQh3RW91aRQ3
         I4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705642586; x=1706247386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ojAQrKurCVDTpDyr9Ud8UUA59iisRxNip7GO8MCjIo=;
        b=YD/MjAlB/DjgyGiUQ6595vtNZoxTACuubOQ7qyoex8GQW87Zeul8kcQhzJemWOyH/6
         davtLX6QcBD+qFQLwKoyqh1duvVSarrybBfKiRu/r8xvsS8fCP5ojx1Q0KYgpuTV5S8a
         NP2zSc4wjpL6IdE7RXK7ykPLbwSbAkC0VjUNMfmFerT/A7F3Ip/LsegJl1IchdQcOR+o
         qxIT+fdNcuIgvT7um+QLjvH1+pk59KI/9qYcfhgrs8fwfM3XFNLmSoF1x5hnyyukdDSd
         holqpjiaEaoDWzBODwTlTUb2b78ph1HRbQefkl3aTSYdfjEY8MfHDggf07db4N6NGNv5
         54dA==
X-Gm-Message-State: AOJu0YxverFRgkPVwbcIHvYKaylQdQQEnAgknYPToMQFp1dMRq0GGHXL
	iGI7GT3+YzmXzfJXXhMiMsoxx33QKKj6F9X70712E05OXVavMaQxOHAb44s20O8=
X-Google-Smtp-Source: AGHT+IHrVI4oY2pMxT9TBfDrffE6L2KwXvHH72Vz5VkiemXhVD26PJJFGqJUEoXqdWldgAqugJlPlw==
X-Received: by 2002:a05:600c:1990:b0:40e:50ac:d24e with SMTP id t16-20020a05600c199000b0040e50acd24emr1438421wmq.13.1705642586217;
        Thu, 18 Jan 2024 21:36:26 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l6-20020a7bc346000000b0040d81ca11casm27067641wmj.28.2024.01.18.21.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 21:36:25 -0800 (PST)
Date: Fri, 19 Jan 2024 08:36:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dregan@broadcom.com
Cc: dregan@mail.com, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	computersforpeace@gmail.com, kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
	william.zhang@broadcom.com, anand.gore@broadcom.com,
	kursad.oney@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com, baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/10] mtd: rawnand: brcmnand: Add BCMBCA read data
 bus interface
Message-ID: <4b3f4316-0da4-4fde-a806-7b579948db50@moroto.mountain>
References: <20240118195356.133391-1-dregan@broadcom.com>
 <20240118195356.133391-6-dregan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118195356.133391-6-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_213628_776888_258930D7 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, Jan 18, 2024 at 11:53:51AM -0800, dregan@broadcom.com wrote:
> diff --git a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
> index 3e2f3b79788d..e97e13ae246c 100644
> --- a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
> @@ -26,6 +26,18 @@ enum {
>  	BCMBCA_CTLRDY		= BIT(4),
>  };
>  
> +#if defined(CONFIG_ARM64)
> +#define ALIGN_REQ		8
> +#else
> +#define ALIGN_REQ		4
> +#endif
> +
> +static inline bool bcmbca_nand_is_buf_aligned(void *flash_cache,  void *buffer)
> +{
> +	return IS_ALIGNED((uintptr_t)buffer, ALIGN_REQ) &&
> +				IS_ALIGNED((uintptr_t)flash_cache, ALIGN_REQ);
> +}
> +
>  static bool bcmbca_nand_intc_ack(struct brcmnand_soc *soc)
>  {
>  	struct bcmbca_nand_soc *priv =
> @@ -56,6 +68,20 @@ static void bcmbca_nand_intc_set(struct brcmnand_soc *soc, bool en)
>  	brcmnand_writel(val, mmio);
>  }
>  
> +static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
> +				 void __iomem *flash_cache,  u32 *buffer, int fc_words)
> +{
> +	/*
> +	 * memcpy can do unaligned aligned access depending on source
> +	 * and dest address, which is incompatible with nand cache. Fallback
> +	 * to the memcpy for io version
> +	 */
> +	if (bcmbca_nand_is_buf_aligned((void *)flash_cache, buffer))
> +		memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
> +	else
> +		memcpy_fromio((void *)buffer, flash_cache, fc_words * 4);
> +}

This comment is confusing or maybe the if statement is reversed...
We're falling back to memcpy_fromio() for the unaligned accesses but the
comment says we're falling back to memcpy().

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
