Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A79ECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vpuL1O50x4Sj1TqMb2PLyqZfQqIhz0tTwo9w1L/YQU=; b=ebemHzzuDzDBvN
	QWDv6uQEAfAZeYdmrPfYVX15niUQqtnePSSRnC2HTlmz8glL75hy6oBSpdpoUnF6AOfvuHxw55oYg
	e9Ro3fQPhMkHyBWhYw/zeUSIiN+Uu4F9q9bl4SAAEVkk0Oc22HqLv3ik+1YGAV3Gjid4YTuXyNzG4
	+iRxneTmnBJkbKN/e+ctSmCatly4suqTGmCG8dxqXclqhJ+rP+dGfYTzXo+1LB99G+YBMEHjOK44i
	fisKBkXopDCzDl7v6R2Ul+5tZ44Zg/XwO3f2fZKaZbJjjuc5at2eIxa8xYzPMuEwytmQJbtgfho3o
	kC1wMqcESeRyOt/dTygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTf3s-00ARDR-A1; Thu, 01 Sep 2022 07:56:28 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTf3p-00ARBa-Tw
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:56:27 +0000
Received: by mail-lj1-x22d.google.com with SMTP id z23so14163283ljk.1
        for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2022 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=r8eeyBUz/AejyYcfK9aDruO5TFd1r/0aWMzRXUi01rA=;
        b=Qtph0lOE/qbpWfkG8HO7vELfP8Rw1uUguP0CrXIrkXL16FdDT/XQadqIBIOTDN1Lxe
         9sngKQPoFyKpMk0O+N3quz2IZpbswTuW8aVFYTYT1qVP+OeVDuOIqpf06tygeBEFVU4+
         6zBmQRIgSBc+5tgEHNmoaqTG6j1EikX6hORXR7HZIrDRNbMnNzO9PN+0twaVEI5+nkGu
         TxRZNtODuRjaO+Hw6RZEb9oUu7nYJga8Py08MOmCJYIWEmMTQJISiaaz4rGTfrQuXa+2
         XWLgaOzwDzFUtjpqWr5bB+Cjz8O7BV72B/5R1UDx72Esh/RJjfUq6ESyKLXR0NKda7n1
         74Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=r8eeyBUz/AejyYcfK9aDruO5TFd1r/0aWMzRXUi01rA=;
        b=OjJPSr4JSJgl9bTTrTUpKtYKIcfnQ7tXXpLu50029L/RaIuvT7Frm1Pls/zq3SofnZ
         /x4JLNM/PSFTNbRpn5iNc0+TBAQM42ED1eFdtzFMlzyHXMxMWRj6zaQNU+rj1OaJRqL8
         i7+hJQJCOgum4KA5sUN0zO3R6AXaqdYPzK50TQOgQ9zQSk6MZRTIjJAam3pZwnlF+u1O
         RYpV/FuJ2Wyzeft4fMrnbaVkd6dzM1mA3GV0hUgvnwyC5HKclIBJtuKUVDMEj4c4ptKC
         xTC/KYMKATHWydnMH04rZo8BIQ2uKKLrJ2F01L+FyOeZxoIjVFrHjNA7Aa8dn000pp1M
         FS/A==
X-Gm-Message-State: ACgBeo315unjzb28nsS5lLB/0HnilUdfplryLHUR8RYXPB90Qo+bnjLQ
	7XU/e9aaPknorAy5JCiOXhB7Ag==
X-Google-Smtp-Source: AA6agR7nX/X8aC54yXCn5glhEfcjq587P8aXcd+d9X6kHSUljHmf4I9rbPjvsR36jIJPljXf/DS4Dw==
X-Received: by 2002:a2e:9942:0:b0:265:e313:7fb7 with SMTP id r2-20020a2e9942000000b00265e3137fb7mr4534739ljj.449.1662018980742;
        Thu, 01 Sep 2022 00:56:20 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c22-20020a056512325600b0049496855494sm377446lfr.104.2022.09.01.00.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 00:56:20 -0700 (PDT)
Message-ID: <6b06f88e-128d-7ce6-b97b-b5cacfc4834d@linaro.org>
Date: Thu, 1 Sep 2022 10:56:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
 property
Content-Language: en-US
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
 <20220901072914.30205-2-sai.krishna.potthuri@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072914.30205-2-sai.krishna.potthuri@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_005625_997958_40F4DB80 
X-CRM114-Status: GOOD (  10.97  )
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

On 01/09/2022 10:29, Sai Krishna Potthuri wrote:
> SPI-NOR flashes have RESET pin which can be toggled using GPIO
> controller, for those platforms reset-gpios property can be used to
> reset the flash device.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---

You still miss the user (DTS) of this change... The JEDEC spec did not
mention a reset pin. Can you provide the user?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
