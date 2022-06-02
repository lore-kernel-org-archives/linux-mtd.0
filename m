Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C14C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jun 2022 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z48dAjdfkgqXAkpiQ+pA3GjGL7Q+s92TMssPl4uRI6E=; b=t/fAEBnBGHsjVq
	c8Ev05+5hRpYrTN+zQZ1Wb2M9vL6UamkuF5jZRDZQ+6bnm3eQFKJtvmnVLHRz3+okeL+iX8Xfgf7h
	SWOv8onozlL/Biwg+hYc7sPgukLSZ4poWWPSZyB7/ZL76EsFNhgu3CL2aAJQlhddcu5k0RS8d6pWu
	iuTmzlJABL82e6CM0TwYDGPSD9pNa4WJ/1U+0Rd1ajoJ3bco0KzI3irhHUWwdJx/QsQzOoZPrZ8Y6
	7UhrX83knWKmyV9jNTfMciMfZKFN0Ikk2FBtx2lVWN73sO91yreNQjcXPVexUSG62h3nRS57DEJJR
	I7OG0SjiVJbmEwdrsWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweSs-001leo-4W; Thu, 02 Jun 2022 06:37:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweSo-001ldj-QU
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2022 06:37:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z7so4958730edm.13
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2022 23:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P+SVKsijP6JkUgNOco2XQmqekWV6FYkMFTb8nxQO5ww=;
        b=m8c+W7QgyV419RzrHTmnU1lGVvxFj1lycM/jla3m2HZRFzackfP82Ocf0pcBBhq+nc
         gw9FxoQoK4g83ngSbEQQ2dSjZD9nBv50f3M1Cq2aB5EiTclnSK9QiiggPVOwrOMacXwq
         IfqcWeNqsfL8UZMkux6dbflF9hQSJ4d3TzSOvQuRTH9IELyTcxmUTd6Z8lXcwgQhK9r5
         EAsHXEJSJDgqKmaYa2k6fBEj+8/+d+mEWdo4dtl3c4/4SknIcB5pKxqJ+uUxKty45m7m
         Ujy4U1b/ghF1wXJkHTvanrg/Qqb4BjMJyuRoLR02xnluLPoeToDgj2iOChQ1/XSyusXD
         MBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P+SVKsijP6JkUgNOco2XQmqekWV6FYkMFTb8nxQO5ww=;
        b=NVygqHEGj0kOuA5F8ZaFZHHsIZ4T80B6Z2pVTBHokr/GXG2Dbwp4MLVFR6MgdAymUx
         1vlLXAXAkDqeyuYnPo5vlpr8whsGhgrr3qJvSoaxaZCZED5xfUmysukasv2wxTUfI4td
         4RQf5fFuoVNz60gnXS+Tegh3F90e7qAeI3F2jgKPvt1dApFuOYUQ3kTzvHTK+6vZNqfd
         QKAFdszM4ZYpke0BHU+DrMbZuVrtsZlXHW21I02SB0LwC3ZO3/qh95CS/pnWfnUyZkf6
         ITcjiflhXdXfbfetXOxbkJTh8YfWu6nHFXZcW3Iu8+pfaXF32GvNhpw033RtluI7sgez
         CMOQ==
X-Gm-Message-State: AOAM5303bDrj/QyM99yIvhwT8RzRFkSXWRuclb+d3uHDWqu2QgIkXCI4
	0AUSk2Vvv8O5omyYgBT+z5zysQ==
X-Google-Smtp-Source: ABdhPJzvPQWmTxwqNMXeu7trZCjNJkphaQbsMtBiWxqHxuG0WA17vaqx3Y07SBGsaskn4cdpMdEDKw==
X-Received: by 2002:aa7:cb4a:0:b0:42d:d232:34d7 with SMTP id w10-20020aa7cb4a000000b0042dd23234d7mr3679077edt.201.1654151865385;
        Wed, 01 Jun 2022 23:37:45 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906b09900b006f52dbc192bsm1432623ejy.37.2022.06.01.23.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:37:44 -0700 (PDT)
Message-ID: <b1b87be5-a048-b713-c9f2-84b948aa6718@linaro.org>
Date: Thu, 2 Jun 2022 08:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
 devicetree@vger.kernel.org, gengdongjiu@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux@armlinux.org.uk, michael@walle.cc,
 miquel.raynal@bootlin.com, mturquette@baylibre.com, novikov@ispras.ru,
 olof@lixom.net, p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
 robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
 sumit.semwal@linaro.org, tudor.ambarus@microchip.com, vigneshr@ti.com,
 xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
 <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
 <20220601182418.okoofgannw6vbcxo@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601182418.okoofgannw6vbcxo@proprietary-killer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_233746_941180_EDE8BAEA 
X-CRM114-Status: UNSURE (   9.77  )
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

On 01/06/2022 20:24, Marty E. Plummer wrote:

>>> Either or. Whatever makes the workload easier is what I'm looking for.
>>
>> Sorry, you need to be more specific. Apply is not a job for you, for the
>> patch submitter.
>>
>> Then you miss here important piece - which is the first patch. DTS goes
>> always via separate branch (or even tree) from driver changes. That's
>> why bindings are always separate first patches.
>>
> So, add a 4: arch/arm/boot/dts/soc.dtsi and 5: arch/arm/boot/dts/board.dts
> to the above list, or should those be the same patch as well?

For me does not matter, sub architecture maintainer might have preference.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
