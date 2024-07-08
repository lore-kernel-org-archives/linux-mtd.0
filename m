Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E1CC3271E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNd9aI7Kwvuh7/Ar/jhZhxM1gPKE+ivsvxIa+uGm1Ls=; b=kMRr9jf4b/ImvV
	jURxjRwGtE/7MFelntE7/mgF79lCWc0UiE+DOG+1ErnHoIew4Ij+u+Yho8mE7ForZXIY+XDeAefqh
	iGzNND5N+q4vzZiXvOsEEkJSXdtP1qcJR9IRSnb3j1xpVzZz00F7yIzy+sAHSb6ZftviMAfNXtzkd
	ADgGgX9WxVsVPeEXIztYk5n6ezIKC1WNLfAG7rPHqNTWzLBs+2pSyz78qXyFsar9utLn+tDlH2hOV
	kQy2QwU23/PHsbG/CjV7muWuMDjStcHEmgKspzVLx1iZrbuSct7lEEoLIZyee5Bu6D+S8bOiJ57u0
	1WUHAy8qN/PdfnYgWMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQktO-00000003LYv-3cO3;
	Mon, 08 Jul 2024 09:42:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQktL-00000003LXU-11ty;
	Mon, 08 Jul 2024 09:42:40 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-58bac81f3f9so4710510a12.2;
        Mon, 08 Jul 2024 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720431757; x=1721036557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPFgBOg0BwvjqhaIzOQzuUDIJVPwIY9J0BPpaCd2cV8=;
        b=dCBibxMf7kax7NoG6OQibkK6UaRfP0z/HQ4JXNma1Qmo3QItK8/aWn7T9BR/eT/i+D
         OdU8VRs0Q/bZx0DBpFNNwkCTcV+zyP7R6Z4kFQiP+JXIASw5OzX54gRi5l1QJ5o3zMLT
         RBs39fNXbIzSFSN62TMgKCji9T72QZ1O0G/ADkWdae4uEVLxtjoIab8gOQgWfvlr5Vjv
         1Rbp4Z58ExksRW6/WkOzV3tgCHxVf2a5dScdS2qMeRrBhQZGstQs/BlbcE6cKd/G5cAI
         F61IiUyPDDMmVZ4ZsO+ZB3Sqhw5ZG4qU9A7rnZrIjhlOT3ePaaKgu4bJU9WeZY4PIqz9
         jfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431757; x=1721036557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPFgBOg0BwvjqhaIzOQzuUDIJVPwIY9J0BPpaCd2cV8=;
        b=MPCu6pBIHuaDkwYsUQqgfAsc/w8IuNnSJNx55/5GuOgIQOfSGquOHcQmBeFOg0TAPu
         afCT7cNgZ8gAaYP/ZbFT10+v0dT01t8eaZVhfCJ6ozW+lKCHjJMGFzob5pwQfVy+DYz7
         TkoCEyVIPgIuu0o29BAEzcZyji51kB3QHxXGUz6NZmpwIMl2YA7mipIDkyvGcGdXTsHb
         31bxKW3AvVZCVHfPbnY/v2NDwWe1OY/aLvvCdJ/YZLBv3PU92OzL18dQvGz296g9/a/+
         t/m6+YJVXsSzU2Qic4FWHEPzTfyWbwI2f4s08NQcbIZpNCY0MCqN9TmPGOOdXBuFoy/i
         tPWw==
X-Forwarded-Encrypted: i=1; AJvYcCUgS/OIH9WZALSeo7HZyGsi+dhdYANiIX4azRvszjPza4LWy9FVIkVajKrdpFGRdHBc2XOVqTZdXmUtAmY+6sXL9+nuequIQI5if1iKNRBStJDb3cEp2rsWc5tW8wHZLM4wwtUAA4T01leUBQfT+AT2d3DD
X-Gm-Message-State: AOJu0YwRmthaTItes+gdvBXRfFuyadgfreRLL32t4WTA0GqhLOosTs5N
	9viqS1IIbz42P7DsNVbHoTbSzbYiIJ9a74Rjwne/yPoTEJ8pJtqE
X-Google-Smtp-Source: AGHT+IGJTVwfxRPLlqsy1KIoSb8jqnFfw/igQQIrxqMOb9EfhE4RP8yDb4xRHk0zohcC0359UuhRFw==
X-Received: by 2002:a05:6402:2349:b0:57c:aac9:cd8 with SMTP id 4fb4d7f45d1cf-58e5a7e8b66mr7953030a12.8.1720431756473;
        Mon, 08 Jul 2024 02:42:36 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5925eb01124sm1539068a12.32.2024.07.08.02.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:42:35 -0700 (PDT)
Message-ID: <329fefa1-5274-4f74-8d7a-aaf8d2a65189@gmail.com>
Date: Mon, 8 Jul 2024 11:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: convert U-Boot env to a layout
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 u-boot@lists.denx.de, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240705225821.13196-1-zajec5@gmail.com>
 <20240708083208.322f4418@xps-13>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240708083208.322f4418@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_024239_304796_7EF80C7B 
X-CRM114-Status: GOOD (  18.95  )
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

T24gOC4wNy4yMDI0IDA4OjMyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IHphamVjNUBnbWFpbC5j
b20gd3JvdGUgb24gU2F0LCAgNiBKdWwgMjAyNCAwMDo1ODoyMSArMDIwMDoKPiAKPj4gRnJvbTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pgo+PiBVLUJvb3QgZW52aXJvbm1l
bnQgdmFyaWFibGVzIGNhbiBiZSBzdG9yZWQgaW4gdmFyaW91cyBkYXRhIHNvdXJjZXMuIE1URAo+
PiBpcyBqdXN0IG9uZSBvZiBhdmFpbGFibGUgb3B0aW9ucy4gUmVmYWN0b3IgRFQgYmluZGluZyBp
bnRvIGEgbGF5b3V0IHNvCj4+IGl0IGNhbiBiZSB1c2VkIHdpdGggVUJJIHZvbHVtZXMgYW5kIG90
aGVyIE5WTUVNIGRldmljZXMuCj4+Cj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIzMTIyMTE3MzQyMS4xMzczNy0xLXphamVjNUBnbWFpbC5jb20vCj4+IFNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gLS0tCj4+IEknbSBzZW5k
aW5nIHRoaXMgUEFUQ0ggd2l0aG91dCBMaW51eCBjaGFuZ2VzIHRvIHNlZSBpZiB0aGlzIGlzIHRo
ZQo+PiByaWdodCBhcHByb2FjaCAtIGZvciBkZXZlbG9wZXJzIGFuZCAoRFQpIG1haW50YWluZXJz
IHRvIHJldmlldyBpdCBmaXJzdC4KPj4KPj4gTXkgcHJldmlvdXMgYXR0ZW1wdCAoc2VlIGFib3Zl
IExpbmspIHR1cm5lZCBvdXQgaW4gcmVmdXNhbCBzbyBJJ20ganVzdAo+PiB0cnlpbmcgdG8gc2F2
ZSBzb21lIHRpbWUgaW4gY2FzZSB0aGlzIG9uZSBnb2VzIHdyb25nIGFzIHdlbGwuCj4+Cj4+IEhv
cGVmdWxseSB0aGUgaW5jbHVkZWQgZXhhbXBsZSAod2hpY2ggSSByZWFsbHkgdGhpbmsgd2Ugc2hv
dWxkIGFkZCkKPj4gZXhwbGFpbnMgd2VsbCBob3cgSSB0aGluayB0aGlzIGJpbmRpbmcgc2hvdWxk
IGJlIHVzZWQgd2l0aCBsYXlvdXRzLgo+Pgo+PiBJZiBJIGdldCBzb21lIHBvc2l0aXZlIGZlZWRi
YWNrIEknbGwgd29yayBvbiBWMiB3aXRoIGFjdHVhbCBMaW51eAo+PiBjaGFuZ2VzLgo+Pgo+IAo+
IEkgYW0gc3RpbGwgaW4gZmF2b3Igb2YgdGhpcyBjaGFuZ2UuIEkga25vdyBmcm9tIGEgYmluZGlu
ZyBwZXJzcGVjdGl2ZQo+IGl0IG1pZ2h0IGJlIHF1ZXN0aW9uYWJsZTsgYnV0IGZyb20gYW4gT1Mg
cGVyc3BlY3RpdmUgaXQgbWFrZXMgdG90YWwKPiBzZW5zZSB0byBkZXByZWNhdGVkIHRoZSBvbGQg
VS1Cb290IGVudiAiZGV2aWNlIiBkcml2ZXIgaW4gZmF2b3Igb2YgdGhpcy4KClBsZWFzZSBub3Rl
IHRoYXQgYXQgdGhpcyBwb2ludCBJIGRpZG4ndCBkZWNpZGUgdG8gZGVwcmVjYXRlIHRoZSBvbGQK
YmluZGluZyAodXNpbmcgInUtYm9vdCxlbnYiIGZvciBmbGFzaCBkZXZpY2UgcGFydGl0aW9uKS4g
VGhhdCB3b3VsZApyZXF1aXJlIG1peGluZyAibnZtZW0tbGF5b3V0IiB3aXRoICJwYXJ0aXRpb25z
IiB3aGljaCBJIGJlbGlldmUgUm9iCm9iamVjdGVkIHRvLgoKTXkgUEFUQ0ggaW4gaXRzIGN1cnJl
bnQgZm9ybSBqdXN0IGFsbG93cyByZXVzaW5nIHRoaXMgYmluZGluZyB3aXRoCiJudm1lbS1sYXlv
dXQicyB3aGljaCBpcyBuZWVkZWQgZm9yIGNhc2VzIHdoZXJlIHdlIGFncmVlZCB0byBhbGxvdwoi
bnZtZW0tbGF5b3V0IiAoVUJJIHZvbHVtZXMgYW5kIHB1cmUgLSBub24tTVREIC0gTlZNRU0gZGV2
aWNlcykuCgpJZiB3ZSB3YW50IHRvIHJlZmFjdG9yIHRoaXMgYmluZGluZyBpbiBNVEQgcGFydGl0
aW9ucyBjb250ZXh0IEkgaG9wZSB3ZQpjYW4gaGFuZGxlIHRoYXQgYXQgZGlmZmVyZW50IHRpbWUg
aWYgd2UgYWdyZWUgb24gc29tZSBzb2x1dGlvbi4gSSBob3BlCmFuZCBJIGRvbid0IHRoaW5rIHRo
aXMgc2hvdWxkIGJlIGEgYmxvY2tlZCBmb3IgdGhpcyBQQVRDSC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
