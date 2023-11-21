Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1533FC54FB9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mv6NZBR8+oGn03x5OE54NjJ/X0nH5P+iVjHBQUdgDdM=; b=Zhclj/EvVxbyAB
	6Bqkr2lQUZCZa09uWnHOIBAQhyYOWgHmM42l7vrBymHTfIPPSCxOtluZHIpPbk5kj/j9UluQLLgps
	Jw5yL2LQY1987L16F+EGct+sr20/6KmJ4d7DOUUSVRYpkf4Iw+rWSm4EsXx5Jnc2WmJypgPkBubGi
	NM9MxbJUwNh88i2tIJCUhZia1qZ+MOOtPf2zFCmIPC8rypB8el+/0GcYJ5KlatiP/+8NQVs+dYZ2N
	PfN4QuT456mUSK0dIHyMBX7syEK7iHSue/A6UMIlT23ztIZdP4guJ4gag7Aj27aTC+TGwxdIaQ/Jt
	/aNI/jXxC69b2Xvs7zWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MlY-00G5g1-01;
	Tue, 21 Nov 2023 09:09:56 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MlV-00G5et-1R
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 09:09:54 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-543923af573so7701813a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Nov 2023 01:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700557788; x=1701162588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZTIWvgotrQilE4YfnTkbDvatsoOAZEj1UzatXDpZnY=;
        b=Mju5HKvW9ddttCOvnp8a73odcL+I2ulii68DtAio4wKV78sGv8qE2fK5lC8xNV+E4S
         DC21y4aTDmE47J7k55cq60uCHEzV+OFdkdzP0elNvn0dS0jukJjHNRlT0LkAevLwjERT
         IvgXoFY+v12ndp+O3hQvB25kKHL6aQ7u1KaJou5oCJBpwdPC+OyaYNpjAVkYuDoZrVMz
         CeooyZ3RTxLA8d68FHZvPofU/jmU/xlWDFL8SBKlGtJiOSBtK0Bh0nfWMva9RN0lpbuM
         gPOSbncu5baENT42EQhANnCIavHyqNkISmdV4V7HRHyM+Jqh7yR4LKmzASxDY5UonfYG
         QC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557788; x=1701162588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZTIWvgotrQilE4YfnTkbDvatsoOAZEj1UzatXDpZnY=;
        b=VT+lCC/+Kbypz77ZBNV4MqZyDrA8Dr6dynmvIJi0g/ouaUKJTdjm9MRYh7Or3mbhEI
         sJOXWWCsEbSfxi95UZobghJvo3CNQWx975rNQdb/ZXfS/I9iJoX5VH1Y5EA6HDhT7O46
         Lc8FnMNlJoqRsFfBFkM9qMijFno8RiGFurfhqXQ8TxuQvepfqFf8uVLsvSEjuBffKRhf
         s063agicPK94WZf8NwZbZW4uzsFbXhwFHnqpRNxbaOnB8KdRoepeIXSVO6Z8SGm7qOpL
         BTJWW/3kyfHEMB4r//j0pznj8jdozqP2kzwY1gXphLzTPEdvxlL6dQIsKNamTdPAkFjq
         3FJg==
X-Gm-Message-State: AOJu0Yya7aVLChPaheGFD5nPL9JqCdHkcVHDlYxyY3ghOPwr0zRFQoNM
	Pl6V/XgxdTLKuPk1cfeCFb5QlxFKUO6bDvohTCs=
X-Google-Smtp-Source: AGHT+IGtpYcY6P0/8g+eON6QdDyfr/fO0ziVl+ZvmP24cITH1K+B6cy752zY2zsihMUCiR2PBNlGEg==
X-Received: by 2002:aa7:c748:0:b0:548:4da2:fecc with SMTP id c8-20020aa7c748000000b005484da2feccmr1512375eds.3.1700557787740;
        Tue, 21 Nov 2023 01:09:47 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id u12-20020a056402064c00b00548550301cesm4070371edx.48.2023.11.21.01.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 01:09:47 -0800 (PST)
Message-ID: <fb66cdb7-e89e-47a0-96ef-022a512ceebb@linaro.org>
Date: Tue, 21 Nov 2023 09:09:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Michael Walle <michael@walle.cc>, liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com>
 <8eba400c77127b0df74d2a336561a49d@walle.cc>
 <CAAQoYRkw5hUONJ32sGKxgv5XtO24Vc6=KojankTG73u5E7jPBw@mail.gmail.com>
 <844becc9c6fde66c4d60a621b5462998@walle.cc>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <844becc9c6fde66c4d60a621b5462998@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_010953_507857_02F73747 
X-CRM114-Status: GOOD (  11.86  )
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



On 11/21/23 08:51, Michael Walle wrote:
> Hi Jaime,
> 
> [please keep the CC list in replies].
> 
>>> and sometimes incorrect. Therefore, at least drop it and just list the
>>> IDs.
>> Could I know patch 6/6 only or patch 5/6 should remove name as well?
> 
> I'd say yes. Tudor? Pratyush? New flash additions without names?

Why do you need a flash addition in the first place? Haven't we agreed
that we'll apply the vendor fixup based on the manufacturer ID?

Anyway, flash additions without names is fine by me.

Cheers,
ta
> 
> As, mentioned last time, for OF we might introduce an of_compatible
> (thats then ABI) - or - we can use the numeric ID in the device tree,
> as it's already used for PHY IDs or PCI IDs.
> 
> Jaime, could you try to use
> 
> /* Apply vendor fixups */
> { .id = SNOR_ID(0xc2) }
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
