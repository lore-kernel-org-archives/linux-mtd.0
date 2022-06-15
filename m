Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AC9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoUZW/DL159sDWDAb4IFisvZ39bMnmwhEl4Fludbseg=; b=kCBbfC1yu493KN
	RovlpqH1UY4gl+/ngqvAUmXqfesMX+qq6rFXXXbsbsOwkuCucNTAzVFrLBq+R6/25U0prZ9aasUdy
	jgcaSXHRudHeWSk9b9f5hzjsyncUnJOiWdc4wtd9b/Y+UTbkBDOffCyKAMraOH8sSTLrUmov4MgaV
	xCFT+HvN/FPClX6N8shXQ9uJlp3Q3CoDxki82sk4V8VAVtI7z3Aaz26PCgjDppptXbkG9IPa8WGXr
	8GCQAhMLvDyr0Ib8jXDiwhZGZ2b91U8hmQQJfwZVOKWDYCtHWm8t1KtM/8MiW+JXsWxMr1Rcom+I0
	oz05tvUvy38dFjONnNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Xmh-00FvBz-9K; Wed, 15 Jun 2022 18:30:31 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1XmT-00Fv8a-JQ; Wed, 15 Jun 2022 18:30:21 +0000
Received: by mail-ej1-x631.google.com with SMTP id s12so24933810ejx.3;
        Wed, 15 Jun 2022 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=0tVyV2MItMC7Xp0ChiF5DdKmNUp2ewZ5lqSMGrWKASc=;
        b=gxocVnjFbqdfBUTdrVKam+IQDV5GQh5/vy8ZoEFNIr3dW1TgmwXHMGt1O/02WiD8g2
         rP91nRYckz7bNxVqzjY+uzKfWAxCUvIGlTimiIZyr973U67kM6RQJbjkuBYEU6ItaRTO
         a6Nkf4XIURXKD63XwumNXuR2G9e7pxBmVGERbTcqFxc9WBktPlCqnWu9j270IhPmz3SO
         Ul+bdCduITEeYFAmHvvEluaSNUzwC3X8yAvg6VA+Tq9SGy2HadhTrqK0BywnZVzMNiZt
         DgJQUc/MhKNTRMk86f/PrDNp9NtcU+w04j7WHxc7Egq9l/9ZJJ6Z/lbMMNoIFELUD6qh
         9L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0tVyV2MItMC7Xp0ChiF5DdKmNUp2ewZ5lqSMGrWKASc=;
        b=BGVCZ6Oj0VB5pxzti2PFeVj1Kp2tYjGq5B6mlzQdAfRsjkUSljdo1xagWB/Nycc22d
         gVzaP+z2rUITk4reZnHUXXY/brXON3GtP2MZuHEyQg6DJ7/ofLNdBzxVDKZZKlZzGT/G
         9oXcMj1kXvXxSTX6skcvTmpiwZqSv2eOqRn3H5G1cMKNARuL9greFiPfySDDqDqNHs3I
         ANoBW64VoA12ZzeCMbxYe8vjzfMH8ZroEKrCBCDA5g5qeXaDwzJHBO3ZUcsMq0Y/hKB2
         czDk0O6IpfkaMejbM08WLc2hjNcZDDteFI7nOauZ0yaRQrnDsg/cLAwroSmN5ayQPeA2
         mDig==
X-Gm-Message-State: AJIora/biZ6c+NNT5Zkur7c8wced3fAgNHxd/9TpCUbUT49Mleo/gCky
	KRHD11rYdsLgMOfmvGpRBiw=
X-Google-Smtp-Source: AGRyM1uM41ebjYsi0V8Q6io3lK1TJ3cHgdXH58BCSObJYShmcsB7lz5YVOLlsr7DzxhCAEvYvfp42g==
X-Received: by 2002:a17:906:b208:b0:70e:c7f1:f8bf with SMTP id p8-20020a170906b20800b0070ec7f1f8bfmr997939ejz.143.1655317815135;
        Wed, 15 Jun 2022 11:30:15 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id fw37-20020a170907502500b0071579abcf3csm5425587ejc.111.2022.06.15.11.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 11:30:14 -0700 (PDT)
Message-ID: <c67b209c-4237-4c9f-3150-23a3ef99bc34@gmail.com>
Date: Wed, 15 Jun 2022 20:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 2/2] nvmem: add driver handling U-Boot environment
 variables
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-arm-kernel@lists.infradead.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220611204651.19947-1-zajec5@gmail.com>
 <20220611204651.19947-2-zajec5@gmail.com>
 <1ecbb1af-53d6-1ac1-fd9f-b780a7c50fd9@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1ecbb1af-53d6-1ac1-fd9f-b780a7c50fd9@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_113017_709639_2CCA1443 
X-CRM114-Status: GOOD (  12.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14.06.2022 08:45, Ahmad Fatoum wrote:
>> +	if (err && !mtd_is_bitflip(err)) {
>> +		dev_err(dev, "Failed to read from mtd: %d\n", err);
> 
> Nitpick: %pe

My "err" variable in int, not a pointer (I don't use PTR_ERR()).


>> +static int u_boot_env_add_cells(struct u_boot_env *priv, uint8_t *buf,
>> +				size_t data_offset, size_t data_len)
>> +{
>> +	struct device *dev = priv->dev;
>> +	char *data = buf + data_offset;
>> +	char *var, *value, *eq;
>> +	int idx;
>> +
>> +	priv->ncells = 0;
>> +	for (var = data; var < data + data_len && *var; var += strlen(var) + 1)
>> +		priv->ncells++;
>> +
>> +	priv->cells = devm_kcalloc(dev, priv->ncells, sizeof(*priv->cells), GFP_KERNEL);
>> +	if (!priv->cells)
>> +		return -ENOMEM;
>> +
>> +	for (var = data, idx = 0;
>> +	     var < data + data_len && *var;
>> +	     var = value + strlen(value) + 1, idx++) {
>> +		eq = strchr(var, '=');
>> +		if (!eq)
>> +			break;
>> +		*eq = '\0';
>> +		value = eq + 1;
>> +
>> +		priv->cells[idx].name = devm_kstrdup(dev, var, GFP_KERNEL);
>> +		if (!priv->cells[idx].name)
>> +			return -ENOMEM;
>> +		priv->cells[idx].offset = data_offset + value - data;
>> +		priv->cells[idx].bytes = strlen(value);
> 
> U-Boot environment can't hold binary values?

I believe it can't. In any case \0 is a always a separator.


>> +	}
>> +
>> +	if (WARN_ON(idx != priv->ncells))
>> +		priv->ncells = idx;
>> +
>> +	return 0;
>> +}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
