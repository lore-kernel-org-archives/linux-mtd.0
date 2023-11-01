Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6CC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVzU3KQovtAJbY0dEICvs3L6MB7dMuEY09EjTcTSD1o=; b=0Ku6HL5vgAqPk7
	EWBMRIfLawr0Ur63Fa3xk0TVLmZ6e+rZ7g9Fw1M4ZlTfFiIAGddlFUIOaA05J11RyFwNseSnv8aNv
	f293xx2TqNxG2OxMPyjbSLyAZCD+/zBf/PATFlODqitPcmY4RFW5EYOhVOG1OV03fTxoZRYtCwU9e
	3Yoi/fFJb5mrPdKJOu1jbn6CdSLq+uoh9/epPd5qxtFEbfpQm/DQOMXlCDxpBzacRjW6ZV0FWJRiF
	YFEPg/ozcb0kpr0ZD6kbHnGKkyyEWO258AkAogNFZILH39FPr7PjeaaHOtqqiIUbg7fHuVaCAmQAa
	abmqK5bxnjIKr5wAEJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBuH-007czm-2v;
	Wed, 01 Nov 2023 14:09:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBuB-007cy8-0x
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:09:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1048336766b.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698847747; x=1699452547; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfCyyNTF3ONdLZ0bDRHlWNWwMYNoRtBQUMFhCJRtUHc=;
        b=EbMittMuyEfYB+Y331We3JYq7UYun+9sCTXgYw/lDrQXGppou7EVsce3O0z5g/+0nS
         LiYPDbCWfTdBJL+gxg1feulUAYYc/vEesyR0uro8Q/cTiqH2AxTaOKD/LlskTahYWtGa
         ovBXg6BK0GjCrf1kJd/02j/kgvkaDFtIrMsu9hvDdlVTW/000ivBkGD3xv93ib17e3DN
         /OZqdM04AaAkdU0bP4BroQulNqRGyzNI1s/JM+SH9PkK6PNxfGJH4a1K2umhmmVvLDq7
         AYUPSOb0EWeemyXEK4xUxqWkPgdfMwmXc/1l1e7W6c6zBHF+msAUago3A4VT9izzeEtT
         eg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698847747; x=1699452547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfCyyNTF3ONdLZ0bDRHlWNWwMYNoRtBQUMFhCJRtUHc=;
        b=hdwiVKVHQPDGobfrLwlOYnPr+U5wDSf5uunOzH7hYeW5L2YJKurdsQiIrlu0F/lDXW
         iUnXiGo10cXrFAvftUKEweYX9jpo4Hw/IBRHgDMTJBwCcxFQ8rJXWEwgHTi826cqTLXn
         vS4gmIczxikWJGAUdOKKLYFwoJ7ONguiCda2S6eeenznMUyGtPuGCQZ00HUwscebMSVv
         jE1Lupa/EsgcTXitwKgkzk0lcOtfFEYQ3xBRqQJLQW4m8/Hd/B+xanmh4AkFsBteM1U9
         YRSzU9WrI4VJ05ZqsCRr7dLo/sG7kG8onTtzhqR4UIA+QvlJmAbYjHeRVjb3iC1VTTeN
         zBLw==
X-Gm-Message-State: AOJu0Yw3T1qywkEUFZH+kzA+dhh7ksfqQEsFzaGlM+yWHHaDfNBxzh8s
	viIXlmPc4XyP0qqtKbPMvrW1nQ==
X-Google-Smtp-Source: AGHT+IG2N4T71oFmD8O4sQ8TvupSrykTT45qTfE1kMmrlrq2VXyLIBKZCPQDSMqpslRoRuYX5RAQaA==
X-Received: by 2002:a17:906:3c0a:b0:9c7:5207:280a with SMTP id h10-20020a1709063c0a00b009c75207280amr1427415ejg.55.1698847747104;
        Wed, 01 Nov 2023 07:09:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709064b1200b00977cad140a8sm2447727eju.218.2023.11.01.07.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 07:09:06 -0700 (PDT)
Message-ID: <cfa413e0-db41-45d1-bab0-ac4c9eb6ef77@linaro.org>
Date: Wed, 1 Nov 2023 14:09:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
 <20231101094325.95851-3-tudor.ambarus@linaro.org>
 <05fb3eac-0f1f-44f4-83b8-6ac5914c73c4@linaro.org>
 <56dd3e191743caf2b94a4bef7938df37@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <56dd3e191743caf2b94a4bef7938df37@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_070911_402833_4A7B9F38 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8xLzIzIDEyOjU1LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpIFR1ZG9yLAo+IAo+
IE9uIDAxLzExLzIwMjMgMDY6NDgsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IG9vcHMsIGhl
cmUgSSB3YW50ZWQgdG8gY2hlY2sgZm9yIG51bGwsIHdoZW4gbnVsbCwgc2V0IHRoZSBkZWZhdWx0
Lgo+PiBUYWthaGlybyBhbmQgRmFiaW8sIHdvdWxkIHlvdSBwbGVhc2UgdXBkYXRlIHdoZW4vaWYg
dGVzdGluZz8KPj4KPj4gwqDCoMKgwqBpZiAoIW5vci0+cGFyYW1zLT5jaGlwX2VyYXNlX29wY29k
ZSkKPiAKPiBJIGFwcGxpZWQgdGhpcyBjaGFuZ2Ugb24gdG9wIG9mIHlvdXIgc2VyaWVzLgo+IAo+
IGZsYXNoX2VyYXNlIGNvbW1hbmQgY29tcGxldGVzIHZlcnkgZmFzdDoKPiAKPiB+IyBmbGFzaF9l
cmFzZSAvZGV2L210ZDAgMCAwCj4gRXJhc2luZyAxMzEwNzIgS2lieXRlIEAgMCAtLSAxMDAgJSBj
b21wbGV0ZQo+IAo+IEFmdGVyIHRoYXQsIEkgcnVuICdoZXhkdW1wIC1DIC9kZXYvbXRkMCcsIGJ1
dCBJIHNlZSB0aGF0IHRoZSBvcmlnaW5hbAo+IGNvbnRlbnQgaXMgc3RpbGwgdGhlcmUuCgpZZXMs
IEkgaGFkIGEgd3JvbmcgY29uZmlndXJhdGlvbiBmb3IgdGhlIGRpZSBlcmFzZSBjb21tYW5kLiBX
aWxsIHNlbmQgYSB2Mi4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
