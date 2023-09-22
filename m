Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D898E6FE2F
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azjVza/u4m6XFjFo6x22e8V3Jo1Z9YoPeaUurvIvc7U=; b=sf51lu9HUPWuYV
	b7qvtL0FpQ+aAOu3QrFeI8km2HV0j1oXd0IpzfkEe5dsFNIvDFPtXor5URAGe6WF0oFgHhHcBAFkn
	e96JDL1m97AjuD8csxZFCvxrZZ8uytOpTRf/AY9guk/LzpINCr4f7G9W30oxnyhoOyebjTN8ne0BG
	3L3QkjGXuRpOGE3IwjJPqdFUuPmolOVyqiGb381/ZzRlLgGM8Rz+CgFE6bMqncxuqYgThIuYxe55e
	xZ9MKj8gi0ReDJLfdUI8K9PSfrvw+hGW7P/oKUTfDXT5RqirgW1V7EowLmM08UeLe8F5BV3dWdZ+6
	ADB805SphOxfsMeSmxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjgeY-0099qZ-1r;
	Fri, 22 Sep 2023 13:57:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjgeV-0099pZ-1F
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 13:57:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-403012f27e3so23158345e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695391019; x=1695995819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYmcQp7vI7x84q3XTY7R5Vsp8JpMVN4Mce8y4Mffa3s=;
        b=J9FLr2WGbVxDG212bP9QA9ijeATZ30JSOJS7s4+pLWm7DJeS/TWuQZdnrj39VLHntX
         IinwO4aRgb11ZhT0fjVVL5mQ8IzyOAE61Ijo9yQOy9+6wQ+xut0YaJYp7zntpXePU15D
         tEERJ5PP90rBUovAwbnAPGkxwofTEQ6ed+ziFsbtAjWBUrFTDOizFRze0RZYts9tHBUZ
         nw6zhycE8AEpQSaNSVYzbaYnh/brvQkOGQ38wOWlQmypMXrZ/+cKh435V7Br0kfjdEDS
         I4DrN7OuBfE9PNqyLW/ATttlaXv2pVmwTl7z1HydBInoZYefZ86rZVXJV1IhCofzskqb
         iNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695391019; x=1695995819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYmcQp7vI7x84q3XTY7R5Vsp8JpMVN4Mce8y4Mffa3s=;
        b=iZyhqFaPILiQ2W+yfSK1pawkcuWh34TpLs2pAMlvD3RYOBNAxgSgP5jSuNTWqhxNZt
         y0j2LphHgHLGoPil9mYTlHDQKkryulqFSGeBwV+/0gkO4WhbZTZFRd6wrk/6WtK/bRld
         pF3zsx8fksLS2z+sQ1iiIGiUTM8unEnAPq5yWTIFWmmUeH5BdKD7nm/h8E9aDKRp/2aR
         iSq+NyYoZqd18HFkNs+xD8YzJ+T3qwCEQj7uwH05fLZXhrBSo/HiOIBou0j7UcWOW6de
         78zx003xewpfJQQXTofnadY4G0iLQx6jNHgF8xDMFtu1Wp0OSG6989kltemeDH2Clqd8
         KorA==
X-Gm-Message-State: AOJu0YyKU67RAhGB87jF7RXdem9azphQq3nH45tb/SmTl+dfYvxJLWzi
	IY4ZArIfGWva2IsQBsMZwt0=
X-Google-Smtp-Source: AGHT+IHETahtZVL/bYzSY6bMwgQV/TMYomewYLE+hdM2b2wIWq+JY9YvTsNAagOx7mEnUcaGH/8z7w==
X-Received: by 2002:a05:600c:2304:b0:402:8896:bb7b with SMTP id 4-20020a05600c230400b004028896bb7bmr7939578wmo.6.1695391018517;
        Fri, 22 Sep 2023 06:56:58 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id b12-20020adff90c000000b0031fb91f23e9sm4498772wrr.43.2023.09.22.06.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 06:56:57 -0700 (PDT)
Message-ID: <e045afaa-bc38-4fed-966e-a034e106c86c@gmail.com>
Date: Fri, 22 Sep 2023 16:56:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
Content-Language: en-US, tr, en-GB
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dhruva Gole <d-gole@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_065703_445714_D1803587 
X-CRM114-Status: GOOD (  13.32  )
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

On 2023-09-21 21:45 +03:00, Simon Glass wrote:
> Binman[1] is a tool for creating firmware images. It allows you to
> combine various binaries and place them in an output file.
> 
> Binman uses a DT schema to describe an image, in enough detail that
> it can be automatically built from component parts, disassembled,
> replaced, listed, etc.
> 
> Images are typically stored in flash, which is why this binding is
> targeted at mtd. Previous discussion is at [2] [3].
> 
> [1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
> [2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
> [3] https://www.spinics.net/lists/devicetree/msg626149.html
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  .../bindings/mtd/partitions/binman.yaml       | 50 +++++++++++++++
>  .../bindings/mtd/partitions/binman/entry.yaml | 61 +++++++++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml   |  1 +
>  MAINTAINERS                                   |  5 ++
>  4 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml

This doesn't match the schema in [2], but seems more like v1 of that. Is
that intentional?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
