Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A6CD11DD
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2024 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpaZ6VLdQVKCDI62DYVtY2vnhaGQIJ+RmDnrJ7Z9g6o=; b=es1OCwmocoQ4dC
	gFrljkqcQKfkQIuraA/Qu8YTM/BJZ4KM9bG02rtv3iJcPDlhRl48pU5NNYD+qwfHEFV2uBX0QNYOD
	kcWSBI69UWQAGSGfTfo7+PfXn3DIKxuzDDvegFJ/+AbInFJ1o2vZ18WiLWFac3r2GMooi71B1rdSA
	6aYY9kn3rSnx+EQlpXTmHYgngh16tSGxHVvVAAkNwQY0dVGkgVjMO4eS+ufhdTIZvXEO5wojIgn8N
	lWgjiCaRQEXRzhOiI5vuTmG0qSsJOGVJaZendP3XwvdbuYWg8MizoENbA78nQw8AYKblBNlMH305p
	v/XJ8kLvRbEkY2JOI91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBcK-00000000RuI-07A7;
	Fri, 29 Mar 2024 12:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBaI-00000000R4K-0w5Q
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 Mar 2024 12:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I6SqBEsoY1Vn7ttHCCdsyclZUL3xSFWBxIPmWDNmwdw=; b=CdKGQN8ryaC9q08jLm1Wk0hUCk
	XdjgoWxPoy55hOnxU7f8hksWYjmgCJpwD5XMm4fFyk7AkYb8XpaWlZISMMnvEyAOFAjXgYpZ3uQ//
	QbXJudOxMaXauVUbtWeYbPkf6676Ied4p8twzOyPRTuIxL6FdsffUh5WG8gjxBjYreI7dcqCWlm8+
	unJIiX4Puoo7OmCE6Rr0MWNPpQ3De6UksLOwga2VYdtnVxJ5wAAlgGkYXAhDkqsUpUlt/fAiIgUgJ
	4O/Iwtcjas0CgZrx1DqBSFrNrPKiVKqCMX2pTJqn4Eg78B3/2rFj0g1IZOhATW40KMW8MxIwlbqsU
	I9dyPszA==;
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBaE-00000001Z8p-0pA8
	for linux-mtd@lists.infradead.org;
	Fri, 29 Mar 2024 12:43:49 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d715638540so8806071fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2024 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711716222; x=1712321022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I6SqBEsoY1Vn7ttHCCdsyclZUL3xSFWBxIPmWDNmwdw=;
        b=P4Qi8pJsJAI8xunLDE5Au0uduVkHmxD8TA4WUx7nQ5wM97OCgtNFmgXMmnKmDJpHiz
         AQZfPCZl9/j/uJoDVHgcXeOwZVZvFXUQc+mdBeTy3xTot8I9WmuBgP++Dsy6g8kldcOs
         mEnxI+8t06VFiniYdB7LOvIPtExz4zoaHkw/fobMejwDO9hx/G4bYYq4beXgm8uEohsY
         vBCq+wTLRc8etWnkHZlraLwA26jZ3BTVvkS5sdJ9aOeE1dXYXQHJ2iivf7EfrY7b849F
         QkEU6GRID0MNnw5kzBVqbcvVBKtW5+9zRTpLEWLAviKZkvTD47J1SdKKPRsIwKp/rPtS
         o4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711716222; x=1712321022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6SqBEsoY1Vn7ttHCCdsyclZUL3xSFWBxIPmWDNmwdw=;
        b=oaYpESxItkJb9BuZEiL8ri44VFYmZoivCvuzNxKiqEASryX2AZi3ipx/REzhmFz7nX
         L/X7RRBO8lVLEUldsLj6SFcNnMRqMT11j8jPh31Q45sluXK9Fcp56TiZTQE0ApwMmyd1
         IYI0TMZSQsgIX4T6PxfWkmnSMPxPP4dZvqCEp15Qz99Tszj/XoJkWWccLtALt4vVUIsF
         D5MuV4tNvToq4CKqACfipVxBtu1c8Mu79mTIbZSlLqPbfHkc4dxCyDDbsHcVa0+4FYcX
         8bjBh+7MGkur/3PdtFUeuJIYhBFgx8ZTDzwujMAPF3AX1sTDROHMWzw5qnXMA6taURWE
         KhZw==
X-Forwarded-Encrypted: i=1; AJvYcCVttKo5EXbiZLZtKK8/akRAHG7lU9mLUFcA69+4jdred6VuSE5izOI3yCZMGPU3+j2pQ7hqozzvcNnosdAEOW4kGrjNkG1VnaGAH0PJ2A==
X-Gm-Message-State: AOJu0YwMWfLm/PYI3ZNC93KQWLSh1sO10D2HI8320HiYMA34WcZnZ7tr
	XwKI83J93CmUYciUaTcBCeE4gTh+qXTIoZ9IiLlGKszY05Jm8HBBkJr/TSJPl6Q=
X-Google-Smtp-Source: AGHT+IHj1CqyeeMc7Jx1ZqklwSAHRddwaj85h3duBiYuahqk8FtM0x8jOZ6anq38yzh9vcPccDnGRQ==
X-Received: by 2002:a05:651c:1a13:b0:2d4:a925:d5bc with SMTP id by19-20020a05651c1a1300b002d4a925d5bcmr1488329ljb.16.1711716221973;
        Fri, 29 Mar 2024 05:43:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id jb2-20020a05600c54e200b004155387c08esm549913wmb.27.2024.03.29.05.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 05:43:41 -0700 (PDT)
Message-ID: <a8eaa566-bcc8-4558-bcf0-38b7fc1551b3@linaro.org>
Date: Fri, 29 Mar 2024 13:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] spi: add driver for intel graphics on-die spi
 device
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
 <20240328122236.1718111-6-alexander.usyskin@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328122236.1718111-6-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_124346_457018_5ABA68DC 
X-CRM114-Status: GOOD (  20.58  )
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

On 28/03/2024 13:22, Alexander Usyskin wrote:
> Add auxiliary driver for intel discrete graphics
> on-die spi device.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/spi/Kconfig        |  11 +++
>  drivers/spi/Makefile       |   1 +
>  drivers/spi/spi-intel-dg.c | 146 +++++++++++++++++++++++++++++++++++++

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline), work on fork of kernel
(don't, instead use mainline) or you ignore some maintainers (really
don't). Just use b4 and everything should be fine, although remember
about `b4 prep --auto-to-cc` if you added new patches to the patchset.

...

> +
> +	spi->base = devm_ioremap_resource(device, &ispi->bar);
> +	if (IS_ERR(spi->base)) {
> +		dev_err(device, "mmio not mapped\n");
> +		ret = PTR_ERR(spi->base);
> +		goto err;
> +	}
> +
> +	dev_set_drvdata(&aux_dev->dev, spi);
> +
> +	dev_dbg(device, "bound\n");

Sorry, no. No silly function success messages. There is existing
infrastructure for this. Drop.

> +
> +	return 0;
> +
> +err:
> +	kref_put(&spi->refcnt, intel_dg_spi_release);
> +	return ret;
> +}
> +
> +static void intel_dg_spi_remove(struct auxiliary_device *aux_dev)
> +{
> +	struct intel_dg_spi *spi = dev_get_drvdata(&aux_dev->dev);
> +
> +	if (!spi)
> +		return;
> +
> +	dev_set_drvdata(&aux_dev->dev, NULL);
> +
> +	kref_put(&spi->refcnt, intel_dg_spi_release);
> +}
> +
> +static const struct auxiliary_device_id intel_dg_spi_id_table[] = {
> +	{
> +		.name = "i915.spi",
> +	},
> +	{
> +		.name = "xe.spi",
> +	},
> +	{
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, intel_dg_spi_id_table);
> +
> +static struct auxiliary_driver intel_dg_spi_driver = {
> +	.probe  = intel_dg_spi_probe,
> +	.remove = intel_dg_spi_remove,
> +	.driver = {
> +		/* auxiliary_driver_register() sets .name to be the modname */
> +	},
> +	.id_table = intel_dg_spi_id_table
> +};
> +
> +module_auxiliary_driver(intel_dg_spi_driver);
> +
> +MODULE_ALIAS("auxiliary:i915.spi");
> +MODULE_ALIAS("auxiliary:xe.spi");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
