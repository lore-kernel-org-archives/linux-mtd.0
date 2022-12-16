Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D6C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/e5MyIu0R9cVjFzR7yWmulwtVdjqSxODdhr4h5m7rVo=; b=lheF+oXEFo9VKQ
	s570polsu9OgWJPYNv5Y8yWpm/qZSwEnOBXVAtpla4azlawjM50BxudDc2LJqFcZbZ8cT5Euv0iJ3
	TSfNt7Tkesne31UcsBiMs5HywXzM8ISB0vXUoP6pnLIPIGKf8GhtJcLfT4A8+XNrq3/If3JpBXbb1
	TALqKR9K060FNNyfE1vFzfcQz2z9lL8KtTlXh/oYNKkU4fZ8QMx/VuOU7a8UBcQm9CkVxzsnMs6lB
	kA/6teErRYb5OAkCg36JYleQsfzY9hual52aqru50AmBoxbpMnN1dPoFeh3jFJdbciXxJ1DPRp8EZ
	TfZilPHbyB3v+lT+bDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68pY-00ESVj-Sy; Fri, 16 Dec 2022 11:24:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68pV-00ESSi-KM; Fri, 16 Dec 2022 11:24:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id h12so2145523wrv.10;
        Fri, 16 Dec 2022 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4VXbJEHeIKsxV2etXdXC9p74o9+DjjUHAD3709lTso=;
        b=K7M2M+rnek8TsNzxL6ToBmEA11M3fhHINdOlnI8lFu9ZTErErwxUfXbk6k5Ru80qU/
         D1Bjj+o9ySUzVezoLXlPciNiRhHChqvHdsy3ebTncTSyHLabX3D7Z6umY+rUgKpQOOxD
         Ei8ppSoC9lUsLBZzMcNRnEDN5mZiljHqzIf0Ca4KMmSJ6nEzVI4OTZPmqo34JY+OtJvb
         jE3irjg6TltoO32Eh0HzMQ8lJgSlsZuHHkNG5+Ihumc1vXAxBjti52GmDjMktNR5H4AX
         exPGX0JFUGeEkbzhgehWpqzQMVo59nt7TzCx5ycRclXgeHlJyOoyEU5rxiVSu/2TrKZJ
         icNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4VXbJEHeIKsxV2etXdXC9p74o9+DjjUHAD3709lTso=;
        b=H9+UiFktqhfzehYV7UK1Hvd+LgSNPzYTvtg+u3CAgK0eRf4xAwBArPTu+EEoWQgvNA
         4nUFJaneMh/q4plyqfYlSlnWBkAM+VYAgasRUbveaRLEpd9PVCYwGlHva3fGFC5crq2I
         U5fJJrhbYYcc2BAmpWqXUOl3ehSLKwba4tWYdmXBU1HfGaXy6EEjcoBrnzwFoCfOSdpC
         SlR4KwbvI46o/S9Jal27RpHDeHOQZlzIuaBTolDxGT63QFX0B3kBMNH8VW8QsRJVadtE
         xPuoZUZRHRdUJUjFTDqQLJrGgD/g4Fh5ePb9d28CCcDTLIi4le7XA+9yNQVMTUxapDFI
         0buw==
X-Gm-Message-State: ANoB5pn5CbJAdqrSG+1ljvuzgVvtWtdFwEEFrG4T3zWbwHgiT6c2ih9j
	b5zRwUO3UwAVmjeKJtCYJII=
X-Google-Smtp-Source: AA0mqf4SMH1j0IY24v9NVD4Fb4t/t5rk7U6fmdMg4y7MdplN62WS3Wir4dKDp2SDEt0uAZBmKOwwpA==
X-Received: by 2002:adf:f145:0:b0:242:486:5037 with SMTP id y5-20020adff145000000b0024204865037mr20176287wro.32.1671189879020;
        Fri, 16 Dec 2022 03:24:39 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d5611000000b002424b695f7esm1998289wrv.46.2022.12.16.03.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:24:38 -0800 (PST)
Message-ID: <fb69f5da-1ea8-a0f3-1c3f-8269ad693f4e@gmail.com>
Date: Fri, 16 Dec 2022 12:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 8/9] arm/arm64: dts: mediatek: Fix existing NAND
 controller node name
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-9-xiangsheng.hou@mediatek.com>
 <3729df62-8d39-db47-0b57-2bef37cc5830@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3729df62-8d39-db47-0b57-2bef37cc5830@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032441_704708_70D09E0A 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMy8xMi8yMDIyIDEwOjQyLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
PiBJbCAwOS8xMi8yMiAwNzo0MywgWGlhbmdzaGVuZyBIb3UgaGEgc2NyaXR0bzoKPj4gQ2hhbmdl
IHRoZSBleGlzdGluZyBub2RlIG5hbWUgaW4gb3JkZXIgdG8gbWF0Y2ggTkFORCBjb250cm9sbGVy
IERUCj4+IGJpbmRpbmdzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFuZ3NoZW5nIEhvdSA8eGlh
bmdzaGVuZy5ob3VAbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMv
bXQyNzAxLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpIHwgMiArLQo+PiDCoCBhcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpwqAgfCAyICstCj4+IMKgIDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+IAo+IFNwbGl0dGluZyB0
aGlzIGluIHR3byBjb21taXRzLCBvbmUgZm9yIEFSTSBhbmQgb25lIGZvciBBUk02NCB3b3VsZCBw
cm9iYWJseQo+IGJlIGJldHRlciwgYnV0IHNpbmNlIEkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3Bpbmlv
bnMgb24gdGhhdC4uLgoKWWVzIHBsZWFzZSBzcGxpdCB0aGlzIHVwLgoKVGhhbmtzIQoKPiAKPiBS
ZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
