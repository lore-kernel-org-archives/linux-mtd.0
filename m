Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D6D2E9F0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sp9+PTw8/IQQthWkgCyv6fGnvRESQ7ZLIaLEC5EAXJs=; b=ejMUfFEvoK+nUU
	gho2NzRuXBfhBKKQ0dxM8bu16Ak491Lmua+QZ9sZCwYUKXBFZGAc+FlAQXK2Vw6OovAnzm/RfNUO6
	yetlbzIUoXKDl4q0YS3vqOGBGyzBp2XOd4tLDcq98WR0d/cD77XZe/ObJvwFG8rK31ieWEt3qUN3m
	qvmT7HfoxkphYhMpf8y/Gmb9Xc+n0IWCcGlzC/1ftzgSL89wraPdvbn2PQhRhkTt/ZWm0JzFNtANM
	GggPaHFwdNsWOxUb06rxsagH8K8Fr+iooS8fYTkwXbeE7A9VD5Lwr2Z2VHhbSbNgwMO9ZIVahhCUy
	DCvGO/pvERKya/B2hlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVX1-00000000LSC-11HR;
	Mon, 11 Nov 2024 14:36:43 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVVo-00000000LDy-22Dq
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:35:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9e8522445dso822260466b.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731335726; x=1731940526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLnMMIEFVPuvIElYENom7790GnOLZ10ipAw6/ptkQmU=;
        b=ogffznzwXjpsgd5R9Iq1AO4UvVwxMQOLAQrTmEmqvZjrzSZcGjdBTg9UmiEZihKgSs
         fgr4NdmwfF7U/YDLNETiMlG1pzqNVQ14i3KAlMuJ1TdIKW0vaniVBWH/u7QinGQS8g3r
         AS7yGS/S1IaJeXJHXCzALwj0h2OOiUypPFf/0PDLuAGoCTiLkakAXmxr45Aw3IqeWKNb
         Q8t1EjS1KcssPl92wfqQpDBcU9Dm4DjZZHqpwQVPFTcpryT2MDcIowLfcHnf7KsrRzVe
         EiddCewTXAlyeuwrU9xUNdXwusXWkbOuZg+K1dz7M2WJ/pkkBQMBBiJ4SJF5e71Eiifk
         dAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335726; x=1731940526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLnMMIEFVPuvIElYENom7790GnOLZ10ipAw6/ptkQmU=;
        b=GFDDuTLuNTU0InhW8PzH3sl2o80l2nBs20JfTZXGntqdapd2uVRJtWq7nigHAvmFnM
         QKwDFAz4ezU9SqTqNuYum7+8MCdoTL+Ikkwlu0/cgmuKq+EI3iMAJwz7aWN/3G4pMcz1
         sihFeEXl2bsgUt2zBUZfnWEnI63RxFYIxmKbh+AinCuCygftnIEoa8hM/+QoPWXJoxLm
         VNUHSS44PdW96RUMfuSB6ZOA/o4fI1O+zMS/b/OuD7YPZj+iM86q9uiivx8yh68pQZdc
         zcLtpHOEw/yVTf9A27tMV4RsoFn+ttlQEbhe/uVdYUk+My7kVjSkzdf2XRSESQkKsU+h
         hTjA==
X-Forwarded-Encrypted: i=1; AJvYcCXURtRGlmQtc4PRemIhS7cSp+tlsozGHNz0Ktxkpzq5kably/E00rc07GWKJn6M606dvHwZvVkKSu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkAclfR/uvzedxo7uH3b2teNtNnKt/+Jzioxs5l5S86orDze78
	CAY89k6Vvxy5pbdxa3PZS/SEq5nE3KL/gXLCqck05hWWfVZqSmjPJ5Mv0rrVrQI=
X-Google-Smtp-Source: AGHT+IEpv164JsnmQty3/uVxJL4q/z/TFjLw8T+y/UoHQHuSo7V3bvyRydQi+vpy5Ssnlz7tyRuBkQ==
X-Received: by 2002:a17:907:6d24:b0:a9a:9df:5581 with SMTP id a640c23a62f3a-a9eeffeee58mr1280694566b.38.1731335726454;
        Mon, 11 Nov 2024 06:35:26 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc50afsm610346666b.122.2024.11.11.06.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:35:25 -0800 (PST)
Message-ID: <589d95d3-9153-475b-86f7-886ec41cd4f4@linaro.org>
Date: Mon, 11 Nov 2024 14:35:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] mtd: spinand: Add support for read DTR operations
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-23-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-23-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_063528_571633_E3E4C2D1 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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



On 10/25/24 5:14 PM, Miquel Raynal wrote:
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),	

do we want some names to these hex values?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
