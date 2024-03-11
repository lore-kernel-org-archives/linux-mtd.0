Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AA5C5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enEPhHJT5XuJhymCXEzLDAQ/Ba7/eY17st7ZHoq1KUE=; b=N6HSlwv5ecFXiF
	qR1rBqK21QM/gkcIM84ga/DIEsm0Tx3xSqgW3pDoQ95RDCu1+5IgEjHcSfH41bMifPJWC3YODqqfv
	KR3zYUEzVYsV8caLLkyVTixkP0teZTWniac6X6Sg4TRfaA2OcCwpDYnpjgvdNmfJYLygw1cZAqbFL
	EioxjbKZyQcBzoxgRbUHVl+aWH7S9RvL72qGO9G5fnaL0Gw27ncvRzUH5oaligriqTb1FYGvtdKKl
	P+Pt5/VZTuAXoov/zIVKV+D+BIQhcwKtyPeM1Tw3h1Y9EvDKCpwTS3rNXIbDMxPBozpGLnZ08CTwE
	ZspWqa/J7NJ1muwl12bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgIQ-00000001jiw-1zsS;
	Mon, 11 Mar 2024 14:06:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgIL-00000001jaC-3r13
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 14:06:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33e92b3b5c9so1419792f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2024 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710165973; x=1710770773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEfxD47P17376HaVN5QCqzhMLDLW1AovPI/CpxbhNnI=;
        b=xV3a6Szsw8XwANvlf+XMpf1H0B2aeK/ElDJMGP5xEOobRovzvGMiDc45ZMTiBwnuTg
         gHHwJjx1fGq3LUZ/rTjb+3WZwTGW825QG1TRnQMG4LY6C0AzWRXaXDzir8/cUad7VZ/i
         W2zS9//YRIQWjyPI/tmBYGjoaU2AzIJZS5Wcu7S/ylVBuqYM0T69LM4Csh63NaYcVn+j
         4JeQVjH+34rNDUfmrEO4zMT7xDoyTxla1n9Zmp5grGdrj9Hd/8di5Ga0dS6v7uJ66ClO
         JH2gTVWbrA8S4qS/OHYyC2quJLFxYyN/PYmy4Md8Nd5xgFsIg/8XAfone4vJsX20P7iN
         zvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165973; x=1710770773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEfxD47P17376HaVN5QCqzhMLDLW1AovPI/CpxbhNnI=;
        b=ltWHDH7oqbJoqfgilhuIMoCTSYxp9zsppfz3cb4/9HiQgayqxbB2y2eDNEBHlrhkrc
         vsx+PbgsSdg5uwCPv8Ho2v1gUVWQJibEXG0IMwQV0gKp+YIkK8ovImyjxXsE8fT9NIDT
         52gJ1yE/RkET0WVgD4mX9GWyfProTYZ1JGiRk/WmdW9IQEfw+Git/Q99+MUMGgL4XYLm
         7DcpD4Vl2SvKsRpSxY0UrZmoTPn3BIEBeorTbVmiWIY+t7KqXMlleHrgFM1MT0puKtax
         /uO37u6STGVFfjFNJ6RmQypLkbjLj/ciUnScD87OAGahOVlAuhUO57bCToMFZteDID8Y
         Uo3A==
X-Forwarded-Encrypted: i=1; AJvYcCX+Toj/Bqo9/3Iu0uKqrVl0JBrFM0RkBTlcUF9crmbnsq+kR+KTfR299lxZPHIo2Knb3C5bjbVL94M3BplodpaliKZTPrSI3bNj2qszZg==
X-Gm-Message-State: AOJu0Yyc+0GZ0KDGKkdZPgQdvDQ/EezlW08NvAuwIr8rDhTIHfRNN0HS
	bIkFG07UPfCrv8WNg1nYA+taIAd7jyjVuqxbErhs8+dubcPGlbptzykMxkOrthA=
X-Google-Smtp-Source: AGHT+IG/g+fTjxWn4gTCH5rhKjgGvyr7sRc72LxPlTBMSdatMB2C+byQhEO6+eXSpLHPxb527WCirA==
X-Received: by 2002:adf:f1c8:0:b0:33d:f3c4:6002 with SMTP id z8-20020adff1c8000000b0033df3c46002mr4387671wro.1.1710165972907;
        Mon, 11 Mar 2024 07:06:12 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id m18-20020adffa12000000b0033d8ce120f2sm6531216wrr.95.2024.03.11.07.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 07:06:12 -0700 (PDT)
Message-ID: <f6b8d9bc-d95a-4d85-a2bc-820b1206fcaf@linaro.org>
Date: Mon, 11 Mar 2024 14:06:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] MIPS: mobileye: eyeq5: add octal flash node to eval
 board DTS
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240308-cdns-qspi-mbly-v1-0-a503856dd205@bootlin.com>
 <20240308-cdns-qspi-mbly-v1-11-a503856dd205@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240308-cdns-qspi-mbly-v1-11-a503856dd205@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_070626_130853_4F83B014 
X-CRM114-Status: GOOD (  12.97  )
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

CgpPbiAzLzgvMjQgMTc6MTgsIFRow6lvIExlYnJ1biB3cm90ZToKPiBBZGQgU1BJLU5PUiBvY3Rh
bCBmbGFzaCBub2RlIHRvIGV2YWx1YXRpb24gYm9hcmQgZGV2aWNldHJlZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBh
cmNoL21pcHMvYm9vdC9kdHMvbW9iaWxleWUvZXllcTUtZXBtNS5kdHMgfCAxNSArKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1LWVwbTUuZHRzIGIvYXJjaC9taXBz
L2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1LWVwbTUuZHRzCj4gaW5kZXggNjg5OGIyZDgyNjdkLi4w
ZTVmZWU3YjY4MGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5
ZXE1LWVwbTUuZHRzCj4gKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1LWVw
bTUuZHRzCj4gQEAgLTIxLDMgKzIxLDE4IEBAIG1lbW9yeUAwIHsKPiAgCQkgICAgICA8MHg4IDB4
MDIwMDAwMDAgMHgwIDB4N0UwMDAwMDA+Owo+ICAJfTsKPiAgfTsKPiArCj4gKyZvc3BpIHsKPiAr
CWZsYXNoMDogZmxhc2hAMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKPiAr
CQlyZWcgPSA8MD47IC8qIGNoaXAgc2VsZWN0ICovCj4gKwo+ICsJCXNwaS1tYXgtZnJlcXVlbmN5
ID0gPDQwMDAwMDAwPjsKPiArCQlzcGktcngtYnVzLXdpZHRoID0gPDg+Owo+ICsJCWNkbnMscmVh
ZC1kZWxheSA9IDwxPjsKPiArCQljZG5zLHRzaHNsLW5zID0gPDQwMD47Cj4gKwkJY2Rucyx0c2Qy
ZC1ucyA9IDw0MDA+Owo+ICsJCWNkbnMsdGNoc2gtbnMgPSA8MTI1PjsKPiArCQljZG5zLHRzbGNo
LW5zID0gPDUwPjsKClRoZXNlIGNkbnMgcHJvcGVydGllcyBsb29rIGJhZCwgdGhleSBieXBhc3Mg
U1BJIE5PUiBlbnRpcmVseS4gSSdkIGNoZWNrCmlmIHRoZXNlIHRpbWluZ3MgY2FuIGJlIGRldGVy
bWluZWQgYXQgU0ZEUCBwYXJzaW5nIHRpbWUsIHRoZW4gSSdkIHBhc3MKdGhlbSB0byB0aGUgU1BJ
IGNvbnRyb2xsZXIuCgpJIHNlZSB0aGVzZSBwcm9wZXJ0aWVzIGFyZSBhbHJlYWR5IGFjY2VwdGVk
IGluIHRoZSBiaW5kaW5ncyBmaWxlIGZvciBmZXcKeWVhcnMgbm93LiBTb21ldGhpbmcgdG8gaW1w
cm92ZSBsYXRlciBvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
