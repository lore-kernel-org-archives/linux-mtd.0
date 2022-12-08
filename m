Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A99C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9om7D0H8qkZ/CcOUADMFzNWXtW1eehUuP/VTkdjysKw=; b=TFYX0jYD2YHamJ
	tYZW31TYJRE0ZLQKRm+yPVZdPNaTKWEgHHKfEE1hmtzQLeGRlpyI658UXRnZ5UN1PAmfjzUyTHab5
	OcA480yscVLbL2lsgRIsM0gjC4X0AvliMEwxFTrgBTqW6aePcAd2UZoejH/nuvXXUgRP/1S/RMsY8
	GdPyRuu1SnwZ5zGamCvQ+f+s1TxWKQdQABEP/GUzmlb0HJVhg1JLLBxwisaH306IERhW3aFfdeNDj
	hH8oDicVEO3ljWScnNQFt/qcOpybb7uRiID6F1dof5FX3uZQzq+7s/pT7t2SxFwqZL2q32uJxSAK9
	PMOUMFfbJmUQpliuqyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cfk-00AQ2G-Rw; Thu, 08 Dec 2022 08:54:29 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CY4-00AHqi-Sh
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 08:46:34 +0000
Received: by mail-lj1-x22e.google.com with SMTP id x6so808019lji.10
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeN4tbC8QYcjeXtnRCV0L0VBx1w71ZeUSLmAb6QYLH4=;
        b=qH4NqlWKo3zt47ik7YIU7kmdLYYcvVcO6GSKeDJl6/FJDRKqjaKiZ20t70P3vsf5en
         um9WTdmrMn0KhBo63A72CPiffEesD3chqRklTOKElHTQ4s2trN/3Zm/GF/By4MdxhqXm
         vTax0XL5x02hgxffuacSJPfnFtYy1DvGMzk6aVd3SLy/vM3Z4lW1GnG1m1FEag5ta2Bt
         tN2HRl85CSq/83+XNMmD1hS0qu5Fx0fsLwFanA2YLaQTzAro8a+h4HLCDwuHXsVqFNcQ
         sVBatq/pAHSSUMeH0R140l91GO9ceAMmsmEfvL/YNTrKlK3EX3zbBaPSvJRI4gFdX93x
         Gtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeN4tbC8QYcjeXtnRCV0L0VBx1w71ZeUSLmAb6QYLH4=;
        b=UVlABSow6uBH74OElRhu14YCiwFEZsT6kdCXfm0p3WITjvlEv1m3z/wprggvMxO6Lb
         bMgInLC+4ORd2TS5xhR03uyzisk1mx+KJCGIM+ETqmbfFcls6g6tmKXa6fkfbKcyDKlF
         D6YXe2w9Esg8ojqYKb0xiWFfvVznLuTH6bXXFPEWSt5rSUZrHWEgIvoWDbPaFegeGXUX
         nyh+0o44AYEqRfeOG1Wrsf2Of1zUdwkmDIxNfd2hPEx5tLSPgS46iHxACuqOK7l/0PzN
         q3W8ZsbxerZ2NX7HoQ4OfQEKgQR2G1A+nRMZBzkKiMWCQbWb7CygGULCox2AaDD9vpAu
         vNNg==
X-Gm-Message-State: ANoB5pkMInbwkojOt6rUc/Q3nzVHRCI8KAxy7HQdKbEwae93Alov2a0v
	e0qr9SloJDyCBGe48+X1D4VA8g==
X-Google-Smtp-Source: AA0mqf4oyc9MWULxVZ5mmTZx6NmoFsEfusvnFxRcT6pk965wUtiV7p7TVZN0HGcgHbu3gYT4dV3T2A==
X-Received: by 2002:a05:651c:50f:b0:279:dbb8:4549 with SMTP id o15-20020a05651c050f00b00279dbb84549mr8910987ljp.79.1670489188855;
        Thu, 08 Dec 2022 00:46:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m18-20020a194352000000b004b55ca53543sm2169721lfj.233.2022.12.08.00.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 00:46:28 -0800 (PST)
Message-ID: <d5f58e82-2644-3e16-f27a-de72ed8ab74d@linaro.org>
Date: Thu, 8 Dec 2022 09:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
 <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
 <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
 <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
 <b877af37-462e-c923-41c0-09c370062700@collabora.com>
 <97408c484927b6520ec79b23220496d628156e5f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <97408c484927b6520ec79b23220496d628156e5f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_004632_994535_A7CC9FF3 
X-CRM114-Status: UNSURE (   9.31  )
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

T24gMDgvMTIvMjAyMiAwMjoxNSwgWGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cj4+
Pgo+Pj4gVGhlcmUgaGF2ZSB0d28gcnggcmVsYXRlZCB0aW1pbmcgcHJvcGVydGllcyBpbiBzcGkt
cGVyaXBoZXJhbC0KPj4+IHByb3BzLgo+Pj4gVGhlIHJ4LXNhbXBsZS1kZWxheS1ucyBoYXZlIGJl
ZW4gdXNlZCBpbiBNZWRpYXRlayBzbmZpIGRyaXZlciB0bwo+Pj4gYWRqdXN0Cj4+PiBjb250cm9s
bGVyIHNhbXBsZSBkZWxheS4KPj4+IEhvd2V2ZXIgYW5vdGhlciBzcGktcngtZGVsYXktdXMgaXMg
aW4gbWljcm9zZWNvbmRzLiBUYWtlIDUyTUh6IGZvcgo+Pj4gZXhhbXBsZSwgdGhlIGNsb2NrIGN5
Y2xlIHdpbGwgYmUgMTkuMjNucyB3aGljaCBsb3dlciB0aGFuIDF1cy4gVGhpcwo+Pj4gbWF5Cj4+
PiBub3QgZWFzeSB0byBieSBvbmUgY2xvY2sgY3ljbGUuCj4+Pgo+Pgo+PiBJIGFncmVlLCBidXQg
bm90aGluZyBwcmV2ZW50cyB5b3UgZnJvbSBhZGRpbmcgeW91ciBvd24gcHJvcGVydHkgZm9yCj4+
IHRoYXQuCj4+Cj4+IEkgcHJvcG9zZSAibWVkaWF0ZWsscngtbGF0Y2gtbGF0ZW5jeS1ucyIgb3Ig
Im1lZGlhdGVrLHJ4LWxhdGVuY3ktbnMiLCAKPj4gc28gdGhhdAo+PiB3ZSBjYW4gc3BlY2lmeSB0
aGUgZGVsYXkgaW4gbmFub3NlY29uZHM6IGluIHRoYXQgY2FzZSwgd2hlbiB3ZQo+PiBzcGVjaWZ5
IDE5bnMsCj4+IHRoZSBkcml2ZXIgd2lsbCBzYWZlbHkgcm91bmQgdGhhdCByZXN1bHRpbmcgaW4g
NTJNSHogPT0gMTkuMjNucyA9Pgo+PiAxOW5zIHZhbGlkLgo+IAo+IFdpbGwgYmUgZml4ZWQgaW4g
bmV4dCBzZXJpZXMuCgpJIGFtIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNoLCBidXQgYWZ0ZXIgZXhw
bGFuYXRpb25zIEkgd2FzIGFsc28gZmluZQp3aXRoIGNsb2NrIGN5Y2xlcyBhcyB1bml0LiBJdCdz
IHN0aWxsIHF1aXRlIHNwZWNpZmljIHVuaXQgYW5kIEkgdGhpbmsKc2V2ZXJhbCB0aW1pbmdzIG9u
IGJ1c2VzIGFyZSBjbG9jay1jeWNsZSBkZXBlbmRlbnQsIG5vdCB0aW1lIGRlcGVuZGVudC4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
