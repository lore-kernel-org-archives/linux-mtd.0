Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F77C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx58YOEJyca8x56fKsjwtAUxSusgfMdZsHTdhcmc8N4=; b=rjRoYYwbI3yZxe
	j5RwNPHsuzkJFyjjQan637D5llcP9wUKppG+MA+3Nyb/z81PwV5b8XPGm2dfYphd3+0HSmBkXcO+c
	NhsVEUy3sxsN67MILoqZDc+kG0Us0uH0K0cKsrWzEORitqlnO2PvL0Qwi3703CnrMeHqKKh+ZICYd
	LhLMV5Q4jYoCCDPbL8cEVLTw8pU+LkV+fIYg7dfwMFIbAOHDfsDTjcKZGD5dkGQVrAjbgwPlgd9Gv
	G+RH5El6meEExzggd3W6vBVny+N+FjJYIx3jkru7+TRkrRwvp7729MqjgZUIVl3yPAPhuecilfynn
	AMDMwYaOhDNsaiCgwdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWoj-00DVbB-2d;
	Tue, 19 Dec 2023 09:55:13 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWog-00DVZs-2c;
	Tue, 19 Dec 2023 09:55:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1915034144so503769666b.0;
        Tue, 19 Dec 2023 01:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702979708; x=1703584508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG64c7dRFIL5Y3MImZBgQFQYMUNsfuD/yEeTvtHu888=;
        b=jycjz8Lo272PliqFitpYWt4eCoSO298sOE6ksjYmrThUCBo3e4TCEzWhMicOVeykhS
         sUFCKDr0OmkIMmG/eQ4Mj22VY5j93mZlyALwUOfMbr3YLaTpx9weFJ8nDXXe0aYO83qz
         tWasaS2DB1ApNGUglFX89wh+3psbk+yacrmJf2UOPgdmnB/acCaX7kufb4tYXxvDFbFs
         DOqm5At//nvGeLA1CmT9bBTPQSXw+q1/cSw5Rdjf/x6yNdI2tRIE31NOJHtaQjPZpQSj
         eLmeh/j87LQtaoB6k1EseabZIcc8wemycYh6De3BqEgyavg10cGDLhxEFyMFutEYIZSX
         8qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702979708; x=1703584508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DG64c7dRFIL5Y3MImZBgQFQYMUNsfuD/yEeTvtHu888=;
        b=fXKAXJu+XcxOChYsgZ6wtD2/SjedAdKEC06PCFAkpgg7d2IH4ufwdsUNmO76arB6IX
         93/hiMuwxDltw7EmMvhYikHEa1GMozSxlGUHqyiHqJKY8Uu7uvbmvj3jAfzcQp2OiDsG
         6/xM1/UooVi5vCdrzCyr+Xnw0eTkmHyThJz9xgSvC+Z8FQnxyjZa9ntyit38yffTXzW1
         PXWrrTvyqhq3qH+8cJl9VV92YWDbYyAMIItKMjxtUXd2K58DZ+5BQOkzLEaNFfIDgJNr
         MzaXtNxjT4Va8ua7VooqCrZdTDanuFbxKz0Y6MYiXaSQ8xGqoHUc6mLEzqQ+3a6MIbQN
         eoVg==
X-Gm-Message-State: AOJu0YzovZwosJycYhuqzVaPp8v7KCihMVpActxSt6sxs1vJ/LKMDnHH
	CGg3TtxZlQgLY9qK9gQmMNU=
X-Google-Smtp-Source: AGHT+IFgsycW3lLLHo/b1K3oXGZiIye8ulRB1V67R2Tb1+vQZV6/Q4Pq5c7JsjoIyZKsaS6e2nvObw==
X-Received: by 2002:a17:907:7f8b:b0:a26:861f:c05c with SMTP id qk11-20020a1709077f8b00b00a26861fc05cmr58827ejc.114.1702979707884;
        Tue, 19 Dec 2023 01:55:07 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id s19-20020a170906c31300b00a236e9cfe74sm928058ejz.103.2023.12.19.01.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 01:55:07 -0800 (PST)
Message-ID: <ba8abaf6-6f16-4742-a3ea-ad00d4151698@gmail.com>
Date: Tue, 19 Dec 2023 10:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] nvmem: layouts: add U-Boot env layout
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231218133722.16150-1-zajec5@gmail.com>
 <20231218133722.16150-4-zajec5@gmail.com> <20231218152116.59d59bad@xps-13>
 <13bc621c-5fcb-4710-912c-06e3e80d7337@gmail.com>
 <20231219085517.4b6ec4fc@xps-13>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231219085517.4b6ec4fc@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_015510_854585_F4D93938 
X-CRM114-Status: GOOD (  33.55  )
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

T24gMTkuMTIuMjAyMyAwODo1NSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSYWZhxYIsCj4g
Cj4gemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDE4IERlYyAyMDIzIDIzOjEwOjIwICsw
MTAwOgo+IAo+PiBPbiAxOC4xMi4yMDIzIDE1OjIxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4g
SGkgUmFmYcWCLAo+Pj4KPj4+IHphamVjNUBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAxOCBEZWMg
MjAyMyAxNDozNzoyMiArMDEwMDoKPj4+ICAgIAo+Pj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggbW92ZXMgYWxsIGdlbmVyaWMg
KE5WTUVNIGRldmljZXMgaW5kZXBlbmRlbnQpIGNvZGUgZnJvbSBOVk1FTQo+Pj4+IGRldmljZSBk
cml2ZXIgdG8gTlZNRU0gbGF5b3V0IGRyaXZlci4gVGhlbiBpdCBhZGRzIGEgc2ltcGxlIE5WTUVN
IGxheW91dAo+Pj4+IGNvZGUgb24gdG9wIG9mIGl0Lgo+Pj4+Cj4+Pj4gVGhhbmtzIHRvIHByb3Bl
ciBsYXlvdXQgaXQncyBwb3NzaWJsZSB0byBzdXBwb3J0IFUtQm9vdCBlbnYgZGF0YSBzdG9yZWQK
Pj4+PiBvbiBhbnkga2luZCBvZiBOVk1FTSBkZXZpY2UuCj4+Pj4KPj4+PiBGb3IgYmFja3dhcmQg
Y29tcGF0aWJpbGl0eSB3aXRoIG9sZCBEVCBiaW5kaW5ncyB3ZSBuZWVkIHRvIGtlZXAgb2xkCj4+
Pj4gTlZNRU0gZGV2aWNlIGRyaXZlciBmdW5jdGlvbmFsLiBUbyBhdm9pZCBjb2RlIGR1cGxpY2F0
aW9uIGEgcGFyc2luZwo+Pj4+IGZ1bmN0aW9uIGlzIGV4cG9ydGVkIGFuZCByZXVzZWQgaW4gaXQu
Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Cj4+Pj4gLS0tCj4+Pgo+Pj4gSSBoYXZlIGEgY291cGxlIG9mIGNvbW1lbnRzIGFib3V0IHRo
ZSBvcmlnaW5hbCBkcml2ZXIgd2hpY2ggZ2V0cwo+Pj4gY29weS1wYXN0ZWQgaW4gdGhlIG5ldyBs
YXlvdXQgZHJpdmVyLCBtYXliZSB5b3UgY291bGQgY2xlYW4gdGhlc2UKPj4+ICh0aGUgbWVtb3J5
IGxlYWsgc2hvdWxkIGJlIGZpeGVkIGJlZm9yZSB0aGUgbWlncmF0aW9uIHNvIGl0IGNhbiBiZQo+
Pj4gYmFja3BvcnRlZCBlYXNpbHksIHRoZSBvdGhlcnMgYXJlIGp1c3Qgc3R5bGUgc28gaXQgY2Fu
IGJlIGRvbmUgYWZ0ZXIsIEkKPj4+IGRvbid0IG1pbmQpLgo+Pj4KPj4+IC4uLgo+Pj4gICAgCj4+
Pj4gK2ludCB1X2Jvb3RfZW52X3BhcnNlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG52bWVt
X2RldmljZSAqbnZtZW0sCj4+Pj4gKwkJICAgICBlbnVtIHVfYm9vdF9lbnZfZm9ybWF0IGZvcm1h
dCkKPj4+PiArewo+Pj4+ICsJc2l6ZV90IGNyYzMyX2RhdGFfb2Zmc2V0Owo+Pj4+ICsJc2l6ZV90
IGNyYzMyX2RhdGFfbGVuOwo+Pj4+ICsJc2l6ZV90IGNyYzMyX29mZnNldDsKPj4+PiArCXNpemVf
dCBkYXRhX29mZnNldDsKPj4+PiArCXNpemVfdCBkYXRhX2xlbjsKPj4+PiArCXNpemVfdCBkZXZf
c2l6ZTsKPj4+PiArCXVpbnQzMl90IGNyYzMyOwo+Pj4+ICsJdWludDMyX3QgY2FsYzsKPj4+PiAr
CXVpbnQ4X3QgKmJ1ZjsKPj4+PiArCWludCBieXRlczsKPj4+PiArCWludCBlcnI7Cj4+Pj4gKwo+
Pj4+ICsJZGV2X3NpemUgPSBudm1lbV9kZXZfc2l6ZShudm1lbSk7Cj4+Pj4gKwo+Pj4+ICsJYnVm
ID0ga2NhbGxvYygxLCBkZXZfc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4+Pgo+Pj4gT3V0IG9mIGN1cmlv
c2l0eSwgd2h5IGtjYWxsb2MoMSwuLi4pIHJhdGhlciB0aGFuIGt6YWxsb2MoKSA/Cj4+Cj4+IEkg
dXNlZCBrY2FsbG9jKCkgaW5pdGlhbGx5IGFzIEkgZGlkbid0IG5lZWQgYnVmZmVyIHRvIGJlIHpl
cm9lZC4KPiAKPiBJIHRoaW5rIGtjYWxsb2MoKSBpbml0aWFsaXplcyB0aGUgbWVtb3J5IHRvIHpl
cm8uCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNs
dWRlL2xpbnV4L3NsYWIuaCNMNjU5Cj4gCj4gSWYgeW91IGRvbid0IG5lZWQgaXQgeW91IGNhbiBz
d2l0Y2ggdG8ga21hbGxvYygpIGluc3RlYWQsIEkgZG9uJ3QgbWluZCwKPiBidXQga2NhbGxvYygp
IGlzIG1lYW50IHRvIGJlIHVzZWQgd2l0aCBhcnJheXMsIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBv
Zgo+IHVzaW5nIGtjYWxsb2MoKSBpbiB0aGlzIGNhc2UuCj4gCj4+Cj4+IEkgc2VlIHRoYXQgbWVt
b3J5LWFsbG9jYXRpb24ucnN0IGhvd2V2ZXIgc2F5czoKPj4gICA+IEFuZCwgdG8gYmUgb24gdGhl
IHNhZmUgc2lkZSBpdCdzIGJlc3QgdG8gdXNlIHJvdXRpbmVzIHRoYXQgc2V0IG1lbW9yeSB0byB6
ZXJvLCBsaWtlIGt6YWxsb2MoKS4KPj4KPj4gSXQncyBwcm9iYWJseSBjbG9zZSB0byB6ZXJvIGNv
c3QgdG8gemVybyB0aGF0IGJ1ZmZlciBzbyBpdCBjb3VsZCBiZSBremFsbG9jKCkuCj4+Cj4+Cj4+
Pj4gKwlpZiAoIWJ1Zikgewo+Pj4+ICsJCWVyciA9IC1FTk9NRU07Cj4+Pj4gKwkJZ290byBlcnJf
b3V0Owo+Pj4KPj4+IFdlIGNvdWxkIGRpcmVjdGx5IHJldHVybiBFTk9NRU0gaGVyZSBJIGd1ZXNz
Lgo+Pj4gICAgCj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJYnl0ZXMgPSBudm1lbV9kZXZpY2VfcmVh
ZChudm1lbSwgMCwgZGV2X3NpemUsIGJ1Zik7Cj4+Pj4gKwlpZiAoYnl0ZXMgPCAwKQo+Pj4+ICsJ
CXJldHVybiBieXRlczsKPj4+PiArCWVsc2UgaWYgKGJ5dGVzICE9IGRldl9zaXplKQo+Pj4+ICsJ
CXJldHVybiAtRUlPOwo+Pj4KPj4+IERvbid0IHdlIG5lZWQgdG8gZnJlZSBidWYgaW4gdGhlIGFi
b3ZlIGNhc2VzPwo+Pj4gICAgCj4+Pj4gKwlzd2l0Y2ggKGZvcm1hdCkgewo+Pj4+ICsJY2FzZSBV
X0JPT1RfRk9STUFUX1NJTkdMRToKPj4+PiArCQljcmMzMl9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1
Y3QgdV9ib290X2Vudl9pbWFnZV9zaW5nbGUsIGNyYzMyKTsKPj4+PiArCQljcmMzMl9kYXRhX29m
ZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX3NpbmdsZSwgZGF0YSk7Cj4+
Pj4gKwkJZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9zaW5n
bGUsIGRhdGEpOwo+Pj4+ICsJCWJyZWFrOwo+Pj4+ICsJY2FzZSBVX0JPT1RfRk9STUFUX1JFRFVO
REFOVDoKPj4+PiArCQljcmMzMl9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9p
bWFnZV9yZWR1bmRhbnQsIGNyYzMyKTsKPj4+PiArCQljcmMzMl9kYXRhX29mZnNldCA9IG9mZnNl
dG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX3JlZHVuZGFudCwgZGF0YSk7Cj4+Pj4gKwkJZGF0
YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9yZWR1bmRhbnQsIGRh
dGEpOwo+Pj4+ICsJCWJyZWFrOwo+Pj4+ICsJY2FzZSBVX0JPT1RfRk9STUFUX0JST0FEQ09NOgo+
Pj4+ICsJCWNyYzMyX29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX2Jy
b2FkY29tLCBjcmMzMik7Cj4+Pj4gKwkJY3JjMzJfZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1
Y3QgdV9ib290X2Vudl9pbWFnZV9icm9hZGNvbSwgZGF0YSk7Cj4+Pj4gKwkJZGF0YV9vZmZzZXQg
PSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9icm9hZGNvbSwgZGF0YSk7Cj4+Pj4g
KwkJYnJlYWs7Cj4+Pj4gKwl9Cj4+Pj4gKwljcmMzMiA9IGxlMzJfdG9fY3B1KCooX19sZTMyICop
KGJ1ZiArIGNyYzMyX29mZnNldCkpOwo+Pj4KPj4+IExvb2tzIGEgYml0IGNvbnZvbHV0ZWQsIGFu
eSBjaGFuY2VzIHdlIGNhbiB1c2UgaW50ZXJtZWRpYXRlIHZhcmlhYmxlcwo+Pj4gdG8gaGVscCBk
ZWNpcGhlciB0aGlzPwo+Pj4gICAgCj4+Pj4gKwljcmMzMl9kYXRhX2xlbiA9IGRldl9zaXplIC0g
Y3JjMzJfZGF0YV9vZmZzZXQ7Cj4+Pj4gKwlkYXRhX2xlbiA9IGRldl9zaXplIC0gZGF0YV9vZmZz
ZXQ7Cj4+Pj4gKwo+Pj4+ICsJY2FsYyA9IGNyYzMyKH4wLCBidWYgKyBjcmMzMl9kYXRhX29mZnNl
dCwgY3JjMzJfZGF0YV9sZW4pIF4gfjBMOwo+Pj4+ICsJaWYgKGNhbGMgIT0gY3JjMzIpIHsKPj4+
PiArCQlkZXZfZXJyKGRldiwgIkludmFsaWQgY2FsY3VsYXRlZCBDUkMzMjogMHglMDh4IChleHBl
Y3RlZDogMHglMDh4KVxuIiwgY2FsYywgY3JjMzIpOwo+Pj4+ICsJCWVyciA9IC1FSU5WQUw7Cj4+
Pj4gKwkJZ290byBlcnJfa2ZyZWU7Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJYnVmW2Rldl9zaXpl
IC0gMV0gPSAnXDAnOwo+Pj4+ICsJZXJyID0gdV9ib290X2Vudl9wYXJzZV9jZWxscyhkZXYsIG52
bWVtLCBidWYsIGRhdGFfb2Zmc2V0LCBkYXRhX2xlbik7Cj4+Pj4gKwlpZiAoZXJyKQo+Pj4+ICsJ
CWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjZWxsczogJWRcbiIsIGVycik7Cj4+Pgo+Pj4g
UGxlYXNlIGRyb3AgdGhpcyBlcnJvciBtZXNzYWdlLCB0aGUgb25seSByZWFzb24gZm9yIHdoaWNo
IHRoZSBmdW5jdGlvbgo+Pj4gY2FsbCB3b3VsZCBmYWlsIGlzIGFwcGFyZW50bHkgYW4gRU5PTUVN
IGNhc2UuCj4+PiAgICAKPj4+PiArCj4+Pj4gK2Vycl9rZnJlZToKPj4+PiArCWtmcmVlKGJ1Zik7
Cj4+Pj4gK2Vycl9vdXQ6Cj4+Pj4gKwlyZXR1cm4gZXJyOwo+Pj4+ICt9Cj4+Pj4gK0VYUE9SVF9T
WU1CT0xfR1BMKHVfYm9vdF9lbnZfcGFyc2UpOwo+Pj4+ICsKPj4+PiArc3RhdGljIGludCB1X2Jv
b3RfZW52X2FkZF9jZWxscyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBudm1lbV9kZXZpY2Ug
Km52bWVtKQo+Pj4+ICt7Cj4+Pj4gKwljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsK
Pj4+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbGF5b3V0X25wOwo+Pj4+ICsJZW51bSB1X2Jvb3Rf
ZW52X2Zvcm1hdCBmb3JtYXQ7Cj4+Pj4gKwo+Pj4+ICsJbGF5b3V0X25wID0gb2ZfbnZtZW1fbGF5
b3V0X2dldF9jb250YWluZXIobnZtZW0pOwo+Pj4+ICsJaWYgKCFsYXlvdXRfbnApCj4+Pj4gKwkJ
cmV0dXJuIC1FTk9FTlQ7Cj4+Pj4gKwo+Pj4+ICsJbWF0Y2ggPSBvZl9tYXRjaF9ub2RlKHVfYm9v
dF9lbnZfb2ZfbWF0Y2hfdGFibGUsIGxheW91dF9ucCk7Cj4+Pj4gKwlpZiAoIW1hdGNoKQo+Pj4+
ICsJCXJldHVybiAtRU5PRU5UOwo+Pj4+ICsKPj4+PiArCWZvcm1hdCA9ICh1aW50cHRyX3QpbWF0
Y2gtPmRhdGE7Cj4+Pgo+Pj4gSW4gdGhlIGNvcmUgdGhlcmUgaXMgY3VycmVudGx5IGFuIHVudXNl
ZCBoZWxwZXIgY2FsbGVkCj4+PiBudm1lbV9sYXlvdXRfZ2V0X21hdGNoX2RhdGEoKSB3aGljaCBk
b2VzIHRoYXQuIEkgdGhpbmsgdGhlIG9yaWdpbmFsCj4+PiBpbnRlbnQgb2YgdGhpcyBmdW5jdGlv
biB3YXMgdG8gYmUgdXNlZCBpbiB0aGlzIGRyaXZlciwgc28gZGVwZW5kaW5nIG9uCj4+PiB5b3Vy
IHByZWZlcmVuY2UsIGNhbiB5b3UgcGxlYXNlIGVpdGhlciB1c2UgaXQgb3IgcmVtb3ZlIGl0Pwo+
Pgo+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IG52bWVtX2xheW91dF9nZXRfbWF0Y2hfZGF0YSgpIHVz
ZXM6Cj4+IGxheW91dC0+ZGV2LmRyaXZlcgo+IAo+IEknbSBzdXJwcmlzZWQgLmRyaXZlciBpcyB1
bnNldC4gV2VsbCBhbnl3YXksIHBsZWFzZSBlaXRoZXIgZml4IHRoZSBjb3JlCj4gaGVscGVyIGFu
ZCB1c2UgaXQgb3IgZHJvcCB0aGUgY29yZSBoZWxwZXIsIGJlY2F1c2Ugd2UgaGF2ZSBubyB1c2Vy
IGZvcgo+IGl0IG90aGVyd2lzZT8KCkkgYmVsaWV2ZSBpdCdzIGJlY2F1c2Ugb2YgYSB2ZXJ5IG1p
bmltYWxpc3RpYyAibnZtZW1fYnVzX3R5cGUiIGJ1cwppbXBsZW1lbnRhdGlvbi4KCiBGcm9tIGEg
cXVpY2sgbG9vayBpdCBzZWVtcyB0aGF0IGRlZmF1bHQgZXhwZWN0ZWQgRk9SV0FSRC10cmFjZSBp
czoKZHJpdmVyX3JlZ2lzdGVyKCkKYnVzX2FkZF9kcml2ZXIoKQpkcml2ZXJfYXR0YWNoKCkKX19k
cml2ZXJfYXR0YWNoKCkKZHJpdmVyX3Byb2JlX2RldmljZSgpCl9fZHJpdmVyX3Byb2JlX2Rldmlj
ZSgpCnJlYWxseV9wcm9iZSgpCgpJdCdzIHJlYWxseV9wcm9iZSgpIHRoYXQgc2VlbXMgdG8gc2V0
IGRldi0+ZHJpdmVyIHBvaW50ZXIuCgoKPj4gSXQgZG9lc24ndCB3b3JrIHdpdGggbGF5b3V0cyBk
cml2ZXIgKHNpbmNlIHJlZmFjdG9yaW5nPykgYXMgZHJpdmVyIGlzCj4+IE5VTEwuIFRoYXQgcmVz
dWx0cyBpbiBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiB0cnlpbmcgdG8gcmVhY2gKPj4g
b2ZfbWF0Y2hfdGFibGUuCj4+Cj4+IFRoYXQgaXMgd2h5IEkgdXNlZCB1X2Jvb3RfZW52X29mX21h
dGNoX3RhYmxlIGRpcmVjdGx5Lgo+Pgo+PiBJZiB5b3Uga25vdyBob3cgdG8gZml4IG52bWVtX2xh
eW91dF9nZXRfbWF0Y2hfZGF0YSgpIHRoYXQgd291bGQgYmUKPj4gZ3JlYXQuIERvIHdlIG5lZWQg
ZHJpdmVyX3JlZ2lzdGVyKCkgc29tZXdoZXJlIGluIE5WTUVNIGNvcmU/CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
