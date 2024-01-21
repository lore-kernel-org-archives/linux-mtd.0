Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69528C47DB7
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jan 2024 19:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pamRZZ/GHzemMj8EiMIWlUhYuPAMZEV9DFEMU5cfwy8=; b=2NPTtOEDXc8AV1
	+bATI530qco1LxAMhr2i7CRMY+DLOuTlSw6vRMhISKAItPw30MuKD8AL2Y+rW1qCRFAuUaXb2lVsl
	gWVc53OdglfVz5Nf4oaCsan6Wj8Sd1iqx9uMIX7dwWPLEDlS+x83XW3ySzfl0vkCo3hYGJddOlx4h
	4v00EFUxRfx1Pz11HLFFU12VniToeUQUWWIII8H0N/i4hnQMVuzt09lBNzYgNblQMTDNjy4gXPBQp
	M3OZJRZLgsk0t4N153uGMWDpl4ArkLQYH5he/Y8yrN4jNyCm6WLsV8HkwT+vAzbF6qnH7UAxowM8E
	1XCiTVwtnrmSmpqYBmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRdWy-009vEE-33;
	Sun, 21 Jan 2024 19:30:56 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRdWw-009vDR-1B;
	Sun, 21 Jan 2024 19:30:55 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6de83f5a004so1751878a34.1;
        Sun, 21 Jan 2024 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705865392; x=1706470192; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/71KA+Z9avWu2cHYxMou4LBKNLAgsGE7jAm0VTGz0X8=;
        b=ebJhcptYQQfI1MeQtBP/qvX61H/d2CYRUsubjGnFOLTr5u1ahlgsW9VC2Tvpg2tnZa
         gzCBmRmmp0ZmL4k3o3WUiW43z6/nkPnL2RKuQaBpQkzpP4wOMa4H4Dc6Gdhr0bmgze0M
         S52DDiO9RYquQMneXSsd/ZalaI1syIdsTTp0bgA25K3D2XRMdeBslfbskYFsFuvQc/vz
         A8AVGgZYJfy7q9e7RRKiSA2AtAnoXNKGdmHetFk30u67QNn/c9A2q6h/7udekCb8meAE
         gn3WLR5Neji7ccwKJO7U2gWEv8TrBwFrCKUyZ5YD4+6UVDN9z/0z1Yz5S1SEOnvTcZ4U
         AlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705865392; x=1706470192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/71KA+Z9avWu2cHYxMou4LBKNLAgsGE7jAm0VTGz0X8=;
        b=Ml+bboo8JwitA0t6Ua4dkAOxFlaFF5yUWlGsQfgX+ERyAKUeeX3GlCQJrOVm590ck5
         l78MQuiuM/ytdhmOcKYvGCSX7nXHsDarbWltbhwpxQAuBHuaLiqPURsNmKTXh1B45Wuq
         Fr4Y4wq+KZnQsyeeNd9bWRpOCzDziSjbgeMhxf/n+CxUu4OgjeBZUTiPZhkJ2BJWOmTB
         EdxGf/VQvkDzJ3K+ZeKOmjvk/HtJ+K4iRYuKBEfoCkLaU7tGREqSxFHO+xLmpP6pklna
         LSJ1LYSkCmz3YVKavkVTsKgN4Clo3nsTsH5wJ0hAXICwBVi8+SEj87FRRRdYWJw0BWgF
         5Mww==
X-Gm-Message-State: AOJu0YyrnSOUc+RUoumICjZtVU/m7H946j/C1Sb/hs7jXVz/BIY5tmcv
	mupn2WWiCmhTkzB8zBsy9iDRprxFUjbBH01cdjQrE9Rtp803kKDB
X-Google-Smtp-Source: AGHT+IGO0o0J2pAGLhCcX8eCUB4fj3TbCSnOczGo5AbTS9+T9WsIXxEt3XnhQmBNtlHxygiWGN/8Xg==
X-Received: by 2002:a9d:480b:0:b0:6dc:813:6c3f with SMTP id c11-20020a9d480b000000b006dc08136c3fmr4133438otf.38.1705865392022;
        Sun, 21 Jan 2024 11:29:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r28-20020a635d1c000000b005c67a388836sm6901617pgb.62.2024.01.21.11.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 11:29:51 -0800 (PST)
Message-ID: <ed1de0d4-9a88-47b1-a280-b872f6fdecb6@roeck-us.net>
Date: Sun, 21 Jan 2024 11:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Mark Brown <broonie@kernel.org>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sbinding@opensource.cirrus.com,
 lee@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
 <9806d99fab46c928f337b30b21057b3e@walle.cc>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9806d99fab46c928f337b30b21057b3e@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_113054_426028_AB555FF6 
X-CRM114-Status: GOOD (  15.86  )
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

T24gMS8yMS8yNCAxMDowNiwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+PiBGV0lXLCB0aGUgcHJv
YmxlbSBpcyBkdWUgdG8KPj4+Cj4+Pj4gKyNkZWZpbmUgU1BJX0NTX0NOVF9NQVggNAo+Pj4KPj4+
PiBpbiB0aGUgb2ZmZW5kaW5nIHBhdGNoLCBidXQgYXBlZWQyNDAwIEZNQyBzdXBwb3J0cyB1cCB0
byA1IFNQSSBjaGlwIHNlbGVjdHMuCj4+Pj4KPj4+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IGFz
cGVlZF9zcGlfZGF0YSBhc3QyNDAwX2ZtY19kYXRhID0gewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
Lm1heF9jc8KgwqDCoMKgwqDCoMKgID0gNSwKPj4+PiDCoMKgwqDCoF5eXl5eXl5eXl5eXl5eXl5e
Xl4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5oYXN0eXBlwqDCoMKgwqDCoMKgID0gdHJ1ZSwKPj4+
Cj4+Pj4gTGltaXRpbmcgLm1heF9jcyB0byA0IG9yIGluY3JlYXNpbmcgU1BJX0NTX0NOVF9NQVgg
dG8gNSBmaXhlcyB0aGUgcHJvYmxlbSwKPj4+PiB0aG91Z2ggb2YgY291cnNlIEkgZG9uJ3Qga25v
dyBpZiBpbmNyZWFzaW5nIFNQSV9DU19DTlRfTUFYIGhhcyBvdGhlciBzaWRlCj4+Pj4gZWZmZWN0
cy4KPj4+Cj4+PiBZZWFoLCBJIHdhcyBjb21pbmcgdG8gYSBzaW1pbGFyIGNvbmNsdXNpb24gbXlz
ZWxmIC0gdGhlIGxpbWl0IGlzIGp1c3QKPj4+IHRvbyBsb3cuwqAgSSBjYW4ndCBzZWUgYW55IHBy
b2JsZW0gd2l0aCBpbmNyZWFzaW5nIGl0Lgo+Pgo+PiBJdCB3b3VsZCBjb3N0IGEgYml0IG9mIG1l
bW9yeSBhbmQgc29tZXdoYXQgYWZmZWN0IHBlcmZvcm1hbmNlIHNpbmUgbWFueQo+PiBvZiB0aGUg
bmV3bHkgaW50cm9kdWNlZCBsb29wcyBhcmUgYm91bmQgYnkgU1BJX0NTX0NOVF9NQVggYW5kIG5v
dCBieQo+PiBudW1fY2hpcHNlbGVjdC4KPj4KPj4gSXQgYWxzbyBtaWdodCBtYWtlIHNlbnNlIHRv
IGRvY3VtZW50IHRoZSBuZXcgbGltaXQgc29tZXdoZXJlLiBQcmlvcgo+PiB0byB0aGlzIGNvbW1p
dCBpdCB3YXMgbm90IGxpbWl0ZWQgYXQgYWxsLgo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc3BpL3NwaS1kYXZpbmNpLnR4dCBsaXN0cyA1IGNoaXAKPj4gc2VsZWN0cyBpbiBp
dHMgZXhhbXBsZSBmb3IgdGhlIHVzZSBvZiBjcy1ncGlvcy4KPj4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sIGFsc28gZG9lcyBub3QKPj4g
bGlzdCBhIGxpbWl0Lgo+IAo+IEdpdmVuIHRoYXQsIHRoYXQgdGhlIHJlc3Qgb2YgdGhpcyBzZXJp
ZXMgaXMgdW5kZXIgZGlzY3Vzc2lvbiAoYW5kIGVzcC4gd2hldGhlcgo+IGl0IGlzIHRoZSBjb3Jy
ZWN0IHdheSB0byBkbyBpdCkgaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBqdXN0IHJldmVydCB0aGUg
cGlja2VkCj4gcGF0Y2hlcy4KPiAKCkkgY2FuJ3QgcmVhbGx5IGNvbW1lbnQgb24gdGhhdCwgYnV0
IEkgZm91bmQgdGhhdCB0aGVyZSBpcyBhbm90aGVyCmFmZmVjdGVkIGRldmljZXRyZWUgcHJvcGVy
dHk6IG51bS1jcy4gSXRzIHJhbmdlIGlzbid0IGxpbWl0ZWQgaW4KRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sLiBWYXJpb3VzCmR0cy9kdHNp
IGZpbGVzIHVzZSBudW1iZXJzIGFzIGxhcmdlIGFzIDguIFRoZSByYW5nZSBpcyBsaW1pdGVkIGlu
IHNvbWUKYmluZGluZ3MgZmlsZXMsIGJ1dCBub3QgYWxsIG9mIHRoZW0uCkRvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLWxhbnRpcS1zc2MudHh0LCBmb3IgZXhhbXBsZSwK
c2F5cwoKICAgIm51bS1jczogc2VlIHNwaS1idXMudHh0LCBzZXQgdG8gOCBpZiB1bnNldCIKClZh
cmlvdXMgQnJvYWRjb20gZHRzaSBmaWxlcyBzZXQgaXQgdG8gOC4KClNvIEkgZ3Vlc3MgOCB3b3Vs
ZCBiZSB0aGUgYWJzb2x1dGUgbWluaW11bSB0byByZS1lbmFibGUgc3VwcG9ydCBmb3IKYWZmZWN0
ZWQgc3lzdGVtcy4KCkd1ZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
