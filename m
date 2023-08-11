Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA976C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxleBl65CENHs3oKvRE/nMi+6nA9hDYaLf0uRkG3Gwo=; b=Yia+paI7eIkmHj
	WcMKEKGd3g6nBVTEiVqFCAOe+ZbLujEZWz+x2V7UHay0FTkLnzeghOqHETNNsPdM/sfZJeg+8aDce
	vTLktD6ecfu7DyPzBuhoyIue9g8K76Jlm+OZv/m/kCpg9v9O/h2rSSjuhu3Z6tAe2aGtNo5U7g2s1
	w1thixiDSqJ2PCzQW64+WFLSJUwJFejdsIyqEax4lIeTR/Vwk6WqrtjoRym5etITWDFb/MjhAobKF
	+4mxtT9/L01vQYP396fz1BRPw1OVVWAgLBynds3xsPliM8Wd+glETLg0tD2KGUhiJqVtsdgjK1gZv
	GJdKIscgbPK/LKIFs33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP7Y-00A7FZ-1h;
	Fri, 11 Aug 2023 10:11:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP7V-00A7EN-23
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 10:11:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5236a9788a7so2386324a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2023 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691748705; x=1692353505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqWWsXX18Vr9nyJzxcvLIMpTeq5ekcwK3gXWHrZto9c=;
        b=GjrCSkm7XeAtB+feoSR01gnNQRT73GsbkgefVe8e7FvcEP6oUSBgGPIO8mFZQY8UwE
         V0UhbmttDdlmJzE0+jZsmp8v/Ty/eR6Dv7AwIDrmMW91u2MR28f9zWF0giUBuSiqBc+8
         mf8uxUqJsPM/O3wh+Lr/LI0brYh4YqVmO1gUK3VkBPKlOhBrjhJ808qMc7Y7QRePQtIA
         WB8teQVHFC0QyK+tqbCyvZf+01xXEoC4ceNxPYkYnBwUO03kx4wudk3neQs6Q5CTZar7
         to3eyi5RXyHWXstVdtUdzUnzV+QfB5/+HPKKI7NpRqHrPCxftxL4dQx0PvorstoLYx0g
         G5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691748705; x=1692353505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqWWsXX18Vr9nyJzxcvLIMpTeq5ekcwK3gXWHrZto9c=;
        b=MP1kL4Ubwy0d9lR0qnoWieMO7lRCdV/D59525Twe4jI76DaAV9izXfDiH/TfAiT9KY
         RyYRyW4kLJHB/jUtnOxjEoJeFXbcGHUiJmXIya77ql2VMgpzVJhUEejy9XlrrZdAX4Bf
         dL5dDAQHu8rWDIYTZrWcsFUkP9HODd8Fc/kWWIcm/ZJmm6WDMJV3xFsPXtJ5z0tyirfp
         XZtq1qVQaj4A7VFoghX9y9NLov81l9M/muiStTdkPTA3vFNRBwhX5SCmhFNdJ5ljbsJs
         KZBx2T4AwcAsStrIheBmnDSwc26LFf0Qx7niHx5NAjy3ynTiTEfIBuu/b70D6A0h/VHT
         UOJQ==
X-Gm-Message-State: AOJu0YwRpXSJLVtTtshkrfdkaN+uWPvBrTdU0or8UElcEbRABOPkkHvm
	OFeQUPZm93+L1LHPGYdddjGXnA==
X-Google-Smtp-Source: AGHT+IEyUkbWxUdqH74NXUTExRAHtT3L/IPv+afwrggRFLJlW1wO6T/5nUfhFs7JJZb+T8wdeB9PzA==
X-Received: by 2002:a17:907:2724:b0:99b:ead0:2733 with SMTP id d4-20020a170907272400b0099bead02733mr1415227ejl.72.1691748705533;
        Fri, 11 Aug 2023 03:11:45 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.74])
        by smtp.gmail.com with ESMTPSA id cb1-20020a170906a44100b0099cad8e04f3sm2049005ejb.48.2023.08.11.03.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 03:11:44 -0700 (PDT)
Message-ID: <5c608c4d-ee22-5941-041c-37c6ecd8e4f8@linaro.org>
Date: Fri, 11 Aug 2023 11:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
To: liao jaime <jaimeliao.tw@gmail.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com>
 <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
 <92234e4c5aca657a966d7c4d9d5f219a@kernel.org>
 <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_031149_672606_40DEC267 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA4LzExLzIzIDEwOjAzLCBsaWFvIGphaW1lIHdyb3RlOgo+PiBTbyBiZXR0ZXIgaW5jbHVk
ZSBzb21lIHByb3ByaWV0YXJ5IHRhYmxlcyBpbiB5b3VyIG5leHQgTk9SIGZsYXNoZXMg8J+YiQo+
IEluIG15IG9waW5pb24sIHRoaXMgbWF5IG5vdCBhIGdvb2Qgd2F5IGJlY2F1c2Ugb2YgU0ZEUCBp
cyBncm93aW5nIHVwCj4gdGhlbiBwcm9wcmlldGFyeSB0YWJsZXMgbWF5IGhhdmUgY29uZmxpY3Qg
YWRkcmVzcyBpbiB0aGUgZnV0dXJlLgo+IFNvIHRoYXQgTWFjcm9uaXggb2N0YWwgZmxhc2hlcyBk
aWRuJ3QgaW5jbHVkZSBpdCBub3cuCj4gCgpTRkRQIGFuZCB2ZW5kb3IgdGFibGVzIGNhbid0IGNv
bGxpZGUgYXMgdGhleSB1c2UgZGlmZmVyZW50IFBhcmFtZXRlcgpJRCBNU0IgaW4gdGhlIFBhcmFt
ZXRlciBIZWFkZXIuIENoZWNrIHNlY3Rpb24gNi4zLjMgaW4gamVzZDIxNmYtMDIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
