Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719B7C4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ot9/HZu9aboZeHQOlPDbsd+lth6kf9Zd8k8Xyd455aM=; b=UfXgQXv7YmxMHD
	fFEyJq9NcgIy22UN5SIvAqaHZWq9X9uelEbSuAH1RaQNm33cXA9T1KbysLtVrEafTau4R1SzOTkbL
	L2qSDREpq4EpwEuoP/z8ut+lKG9BdUqRSXHlndgQy83RV9ipD5N2el+pxg283sHvKU8M2EgaIfHnr
	SALq5+izMiKWtTYSXEmG/l/YDZoJVkj73zpF2wlZoBksFaYrxd60Oeve1PFzk3yWlegN8zXu/J7AE
	3pYSmkAghb8kEWjyij86YzmnUN52MjUffAM732BiolsTL36qwmSs7JbB9i/s6crMPDnWT707H6rcN
	chkwy1Zuhdj3XFwlZkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBkn-0023ie-03;
	Fri, 12 Jan 2024 07:14:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBkk-0023hp-12
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 07:14:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso49191195ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 23:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705043692; x=1705648492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZcCtcfT4BTu6odXBObqDEWk1L71u1hK1GHZjozmdjw=;
        b=ckmgY22Qm+R0fyEy7J1wVXEhz791eJ6gk7eUsFn5pJKtRiJZsnIo/E6o8UzlIfqloE
         ZNGXJ9bBNTekvt6Z/N/kKgDpnktNvwYxjMqp9DuI8BIKkjeK+HGAfAv6PlTwNg2576d2
         nF2qrQo4feFbcLCRc+aawYKHGN5j3Z5szDcWGGdzha5rdWjpau5DHt602ZhEMoh4ZiyJ
         RwO2TWO8wCSHhxcZQdsjE/YRdi1eWO0Q5xCZJ6fFnAl5QZxzETQCWLKDpEyfjIHgvKxp
         zUmBvMZrWwINTkp6sPqqfMpmZolVsK+rMLvUObXIYrlwcwJbmILhSCVmUzP/Wthj3Gl6
         YVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705043692; x=1705648492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZcCtcfT4BTu6odXBObqDEWk1L71u1hK1GHZjozmdjw=;
        b=AG3Uq2u2kMS+V0TwSPhxJ/Vy5igZHDjuaYAzb0PrAmPwuaegt5U95s8Z8fUo6/7zrA
         /K0pnXdATntmaq/Vi9ax3fTgPrbW/c13dfyTOsxXoAnnioKWhOPADWN5Ob6HleONrt/p
         ipKv0OW4IWsooiUq2JwHsUiz7BXnV8YolpZA2bvYrPTmBfVig8+/BvyXsM+K4xbU6ls9
         6ownfjubrUXCmxq1yTKzevrdbgdajeKR7HLNX3wOPF6KEuS1mtTK+RN9kOcYs7TPq9CQ
         E2KJ/V8s219BGyjwPkjUyhziUzr1tATgQPzi6FK7PvUYDQPpHHnHeQ3dult/LBZyDtXW
         LNiA==
X-Gm-Message-State: AOJu0YxxyhsVjuWUsh2NjBEN20nQkl0oY8C5weiqSN4YivvapFQZvm3J
	qMLzSM8Q3TY1AkpUU6G7gss=
X-Google-Smtp-Source: AGHT+IFmN7WzWHRttUwJ1Ua4QCxp0da2Qz/CYvDL3oUO1nhfTozgq+0mfV+4ALULAK6tCKTiTRqtOQ==
X-Received: by 2002:a17:903:2990:b0:1d4:d5bb:5d7c with SMTP id lm16-20020a170903299000b001d4d5bb5d7cmr799216plb.110.1705043692286;
        Thu, 11 Jan 2024 23:14:52 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id lo11-20020a170903434b00b001d54b763995sm2396946plb.129.2024.01.11.23.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 23:14:51 -0800 (PST)
Message-ID: <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
Date: Fri, 12 Jan 2024 16:14:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <740bf235110e05eae9ec7768603e6e2a@walle.cc>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <740bf235110e05eae9ec7768603e6e2a@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_231454_360266_C755025C 
X-CRM114-Status: GOOD (  26.72  )
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

T24gMS81LzIwMjQgOToyMyBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPj4gLXN0
YXRpYyB2b2lkIHNwaV9ub3Jfc2V0X210ZF9pbmZvKHN0cnVjdCBzcGlfbm9yICpub3IpCj4+ICtz
dGF0aWMgaW50IHNwaV9ub3Jfc2V0X210ZF9lcmFzZXJlZ2lvbnMoc3RydWN0IHNwaV9ub3IgKm5v
cikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9tYXAgKm1hcCA9ICZub3It
PnBhcmFtcy0+ZXJhc2VfbWFwOwo+PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2VyYXNlX3JlZ2lv
biAqcmVnaW9uID0gbWFwLT5yZWdpb25zOwo+PiArwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRk
ID0gJm5vci0+bXRkOwo+PiArwqDCoMKgIHN0cnVjdCBtdGRfZXJhc2VfcmVnaW9uX2luZm8gKm10
ZF9yZWdpb247Cj4+ICvCoMKgwqAgdTMyIGVyYXNlX3NpemU7Cj4+ICvCoMKgwqAgdTggZXJhc2Vf
bWFzazsKPj4gK8KgwqDCoCBpbnQgbl9yZWdpb25zLCBpLCBqOwo+PiArCj4+ICvCoMKgwqAgZm9y
IChpID0gMDsgIXNwaV9ub3JfcmVnaW9uX2lzX2xhc3QoJnJlZ2lvbltpXSk7IGkrKykKPj4gK8Kg
wqDCoMKgwqDCoMKgIDsKPiAKPiBQbGVhc2UgcHV0IHRoYXQgaW50byBhIGhlbHBlciB3aGljaCBy
ZXR1cm5zIHRoZSBudW1iZXIgb2YgcmVnaW9ucy4KPiAKWWVzLCBJIHdpbGwgZG8gaXQuCgo+IEZX
SVcsIEkgcmVhbGx5IGRpc2xpa2UgdGhlIG1hZ2ljIGFyb3VuZCBlbmNvZGluZyBhbGwgc29ydHMg
b2Ygc3R1ZmYKPiBpbnRvIHRoZSBvZmZzZXQuIEl0IG1ha2VzIHRoZSBjb2RlIGp1c3QgaGFyZCB0
byByZWFkLgo+IAo+IAo+PiArCj4+ICvCoMKgwqAgbl9yZWdpb25zID0gaSArIDE7Cj4+ICvCoMKg
wqAgbXRkX3JlZ2lvbiA9IGRldm1fa2NhbGxvYyhub3ItPmRldiwgbl9yZWdpb25zLCBzaXplb2Yo
Km10ZF9yZWdpb24pLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBf
S0VSTkVMKTsKPiAKPiBXaG8ncyB0aGUgb3duZXI/IG10ZC0+ZGV2IG9yIG5vci0+ZGV2Pwo+IApJ
IHRoaW5rIGl0IHNob3VsZCBiZSBub3ItPmRldi4KVGhlIG10ZCBkZXZpY2UgaXMgbm90IHlldCBy
ZWdpc3RlcmVkIGF0IHRoaXMgcG9pbnQuCgo+PiArwqDCoMKgIGlmICghbXRkX3JlZ2lvbikKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiArCj4+ICvCoMKgwqAgZm9yIChpID0g
MDsgaSA8IG5fcmVnaW9uczsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmVnaW9uW2ld
Lm9mZnNldCAmIFNOT1JfT1ZFUkxBSURfUkVHSU9OKSB7Cj4gCj4gQnR3LiB3aGF0IGlzIGFuIG92
ZXJsYWlkIHJlZ2lvbj8gSSBjb3VsZG4ndCBmaW5kIGFueSBjb21tZW50Cj4gYWJvdXQgaXQuCj4g
Ckl0IGlzIHRoZSByZW1haW5pbmcgcGFydCBvZiByZWd1bGFyIHNlY3RvciB0aGF0IG92ZXJsYWlk
IGJ5IDRLQiBzZWN0b3JzLgpJbiBTRU1QRVIgY2FzZSwgcmVndWxhciBzZWN0b3IgaXMgMjU2S0Iu
IElmIDMyIHggNEtCIHNlY3RvcnMgYXJlIG92ZXJsYWlkIG9uCmJvdHRvbSBhZGRyZXNzLCAxMjhL
QiBpcyBvdmVybGFpZCByZWdpb24uIFRoZSBlcmFzZSBvcGNvZGUgZm9yIHRoaXMgcmVnaW9uIGlz
CnNhbWUgYXMgMjU2S0Igc2VjdG9ycy4KCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyYXNl
X3NpemUgPSByZWdpb25baV0uc2l6ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyYXNlX21hc2sgPSByZWdpb25baV0ub2Zmc2V0ICYgU05P
Ul9FUkFTRV9UWVBFX01BU0s7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChq
ID0gU05PUl9FUkFTRV9UWVBFX01BWCAtIDE7IGogPj0gMDsgai0tKSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyYXNlX21hc2sgJiBCSVQoaikpIHsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyYXNlX3NpemUgPSBtYXAtPmVyYXNl
X3R5cGVbal0uc2l6ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAg
bXRkX3JlZ2lvbltpXS5lcmFzZXNpemUgPSBlcmFzZV9zaXplOwo+PiArwqDCoMKgwqDCoMKgwqAg
bXRkX3JlZ2lvbltpXS5udW1ibG9ja3MgPSBkaXY2NF91bChyZWdpb25baV0uc2l6ZSwgZXJhc2Vf
c2l6ZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBtdGRfcmVnaW9uW2ldLm9mZnNldCA9IHJlZ2lvbltp
XS5vZmZzZXQgJgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgflNOT1JfRVJBU0VfRkxBR1NfTUFTSzsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBt
dGQtPm51bWVyYXNlcmVnaW9ucyA9IG5fcmVnaW9uczsKPj4gK8KgwqDCoCBtdGQtPmVyYXNlcmVn
aW9ucyA9IG10ZF9yZWdpb247Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+
PiArc3RhdGljIGludCBzcGlfbm9yX3NldF9tdGRfaW5mbyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+
PiDCoHsKPj4gwqDCoMKgwqAgc3RydWN0IG10ZF9pbmZvICptdGQgPSAmbm9yLT5tdGQ7Cj4+IMKg
wqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IG5vci0+ZGV2Owo+PiBAQCAtMzQzOSw2ICszNDgz
LDExIEBAIHN0YXRpYyB2b2lkIHNwaV9ub3Jfc2V0X210ZF9pbmZvKHN0cnVjdCBzcGlfbm9yICpu
b3IpCj4+IMKgwqDCoMKgIG10ZC0+X3Jlc3VtZSA9IHNwaV9ub3JfcmVzdW1lOwo+PiDCoMKgwqDC
oCBtdGQtPl9nZXRfZGV2aWNlID0gc3BpX25vcl9nZXRfZGV2aWNlOwo+PiDCoMKgwqDCoCBtdGQt
Pl9wdXRfZGV2aWNlID0gc3BpX25vcl9wdXRfZGV2aWNlOwo+PiArCj4+ICvCoMKgwqAgaWYgKHNw
aV9ub3JfaGFzX3VuaWZvcm1fZXJhc2Uobm9yKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAw
Owo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHNwaV9ub3Jfc2V0X210ZF9lcmFzZXJlZ2lvbnMobm9y
KTsKPiAKPiBtdGQtPmVyYXNlc2l6ZSBpcyBzZXQgc29tZXdoZXJlIGVsc2UsIHBsZWFzZSBtb3Zl
IGl0IGludG8gdGhpcwo+IGZ1bmN0aW9uLCBiZWNhdXNlIGl0IHdpbGwgYWxzbyBoYXZlIGEgc3Bl
Y2lhbCBjYXNlIGZvciB0aGUKPiBub25fdW5pZm9ybSBmbGFzaGVzLiBNYXliZSB3ZSdsbCBuZWVk
IG91ciBvd24gZXJhc2VzaXplIHN0b3JlZAo+IHRvZ2V0aGVyIHdpdGggdGhlIG9wY29kZS4KPiAK
TGV0IG1lIGludHJvZHVjZSBwYXJhbXMtPmVyYXNlc2l6ZSB3aGljaCBzZXQgdGhyb3VnaCBTRkRQ
IHBhcnNlLCB0aGVuCgogICAgbXRkLT5lcmFzZXNpemUgPSBub3ItPnBhcmFtcy0+ZXJhc2VzaXpl
OwoKbGlrZSBhcyBvdGhlciAnc2l6ZScgcGFyYW1zLgoKPiBBbHNvIHRoaXMgc2hvdWxkIGJlIHdy
aXR0ZW4gYXMKPiAKPiBpZiAoIXNwaV9ub3JfaGFzX3VuaWZvcm1fZXJhc2Uobm9yKSkKPiDCoCBz
cGlfbm9yX3NldF9tdGRfZXJhc2VyZWdpb25zKG5vcik7Cj4gCj4gcmV0dXJuIDA7Cj4gCj4gLW1p
Y2hhZWwKPiAKT0ssIHRoYW5rcyEKCj4+IMKgfQo+Pgo+PiDCoHN0YXRpYyBpbnQgc3BpX25vcl9o
d19yZXNldChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiBAQCAtMzUzMSw3ICszNTgwLDkgQEAgaW50
IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25zdCBjaGFyICpuYW1lLAo+PiDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Cj4+IMKgwqDCoMKgIC8qIE5vIG10ZF9pbmZv
IGZpZWxkcyBzaG91bGQgYmUgdXNlZCB1cCB0byB0aGlzIHBvaW50LiAqLwo+PiAtwqDCoMKgIHNw
aV9ub3Jfc2V0X210ZF9pbmZvKG5vcik7Cj4+ICvCoMKgwqAgcmV0ID0gc3BpX25vcl9zZXRfbXRk
X2luZm8obm9yKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPj4KPj4gwqDCoMKgwqAgZGV2X2luZm8oZGV2LCAiJXMgKCVsbGQgS2J5dGVzKVxuIiwg
aW5mby0+bmFtZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChsb25nIGxvbmcpbXRkLT5z
aXplID4+IDEwKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
