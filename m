Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D83C4725D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ha5+UWfefOwQxBGsf4mp957lAhlIBWQNVlXawHZXnko=; b=R14FbDrKca7V9M
	wot52TOMf1WM6PsmJ4iAvpNg8++spSpUyyE/1c0CwjeqqXCidYkS0adL2Gi35LtCXmMknkXrg34EL
	Lc42wkMWE6bPyaEc/h52Cy0lQWO+LF5T8qGyOUmINPnV9qP+t9hv0RfKb4C5shHWQn5/v2TF2wO3S
	kODU7bSEzqNQ2S4Kp7R141oi6TQcq2+Nf8ZTecs2zqEiGcUOVVFuAyjc+6/vb6KWrBY4l9osvnfkv
	UicdW2PzieGfWWY83recUZRZuVgV2HmnqXv6ee3HsdB9mujBnV2LpUqcsn8ICUEbljX/k+WOi+oq2
	YDm+RSijoxGIPynlhOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiNU-004b7E-0Z;
	Fri, 19 Jan 2024 06:29:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiNQ-004b6B-34
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 06:29:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d711d7a940so3686535ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 22:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705645753; x=1706250553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9WOV8q2+PYYDJHx0FFedLNJ/vUe4gv6r0slG33Tqk3E=;
        b=NQWsbM5S82Y9v7LyezQXIHLWJIBmbKsgfUmeiuQ6VKAvtrcXUKI/6kvQcpzUS9jx/U
         q5WZEMmhzhcVyJn2U5igJsMjApXFSOfgPzVXdqLJ/F+mY9zkDeKxVqSpi1TiyKSgzrTz
         A6qEONbrcA3WznmFW5tSnfp+1mcNk8RAVPAHOpueWXc77wsFsWbd5tz8SN/gC656mBXp
         H4OpQTknjhool3YsRh+u1o8FTy7kOjo7G901Gb2xpYLxwvO5Mv6k/gniU5NQmTmrpDmb
         SvSIHGEQmSvUpfHV44ZqWBGvs65xx81GaXNFeP+h0SRIluj5A7C8LoiAR13cyxoeeX6i
         KZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705645753; x=1706250553;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WOV8q2+PYYDJHx0FFedLNJ/vUe4gv6r0slG33Tqk3E=;
        b=A++xshvilOdh2c2vXwTmJcsN0Cif/5e6ip0HJgrmuktaDyoLGe0BOr3wNKXUrdfExc
         JJHpI1Koizc/Jidb4IWKXtj7yk4IBV6+RK+UaYBnbD/f6NkNCs47VP4xoNEnHQsrgZHX
         hHKWewBD5vbPmWfkvXJdiybR+g4Jj3JJCnCPdSIg+9Ju4lw3nCiOwEfV+C3pfRm/SkPd
         wo9B6lv6pkzke6IjIpLKSAFs7Z+QTELnUcGGNfR0jeXE6VgZ7cVPgqseSRKgcq1z40GG
         mpG3YgXOdmdFvt6f6rWAk24MPULcoakIgV2sWpYr0j4e5TanPSvM6Tdd1aQyB2IpqnBX
         BvzA==
X-Gm-Message-State: AOJu0YyhiuTSc947wB6zBKuU/BnGrHtIaM5IjC/nvS/w6uMCU2AeDUnK
	F8OxcCgT0NVHGePMCbOGi9DUWtSiUDLvVmhN+WsUC1Zepo/NWpih
X-Google-Smtp-Source: AGHT+IEtg8EmjDh3qMqJz6xb046psGP7D9lyzoY5B9mh+qoWP7l2VXd1mT5C175Bwu/64Pj/XY5sTw==
X-Received: by 2002:a17:903:191:b0:1d5:4e3e:3c26 with SMTP id z17-20020a170903019100b001d54e3e3c26mr2277463plg.43.1705645753348;
        Thu, 18 Jan 2024 22:29:13 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id j17-20020a170902f25100b001d70e83f9c3sm1728982plc.242.2024.01.18.22.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 22:29:13 -0800 (PST)
Message-ID: <d63b6363-2d90-4fed-97c3-be69948aae57@gmail.com>
Date: Fri, 19 Jan 2024 15:29:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
From: Takahiro Kuwano <tkuw584924@gmail.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <740bf235110e05eae9ec7768603e6e2a@walle.cc>
 <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
Content-Language: en-US
In-Reply-To: <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_222917_014050_CAF2E7DB 
X-CRM114-Status: GOOD (  24.69  )
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

T24gMS8xMi8yMDI0IDQ6MTQgUE0sIFRha2FoaXJvIEt1d2FubyB3cm90ZToKPiBPbiAxLzUvMjAy
NCA5OjIzIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBIaSwKPj4KPj4+IC1zdGF0aWMgdm9p
ZCBzcGlfbm9yX3NldF9tdGRfaW5mbyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4gK3N0YXRpYyBp
bnQgc3BpX25vcl9zZXRfbXRkX2VyYXNlcmVnaW9ucyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4g
K3sKPj4+ICvCoMKgwqAgc3RydWN0IHNwaV9ub3JfZXJhc2VfbWFwICptYXAgPSAmbm9yLT5wYXJh
bXMtPmVyYXNlX21hcDsKPj4+ICvCoMKgwqAgc3RydWN0IHNwaV9ub3JfZXJhc2VfcmVnaW9uICpy
ZWdpb24gPSBtYXAtPnJlZ2lvbnM7Cj4+PiArwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0g
Jm5vci0+bXRkOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgbXRkX2VyYXNlX3JlZ2lvbl9pbmZvICptdGRf
cmVnaW9uOwo+Pj4gK8KgwqDCoCB1MzIgZXJhc2Vfc2l6ZTsKPj4+ICvCoMKgwqAgdTggZXJhc2Vf
bWFzazsKPj4+ICvCoMKgwqAgaW50IG5fcmVnaW9ucywgaSwgajsKPj4+ICsKPj4+ICvCoMKgwqAg
Zm9yIChpID0gMDsgIXNwaV9ub3JfcmVnaW9uX2lzX2xhc3QoJnJlZ2lvbltpXSk7IGkrKykKPj4+
ICvCoMKgwqDCoMKgwqDCoCA7Cj4+Cj4+IFBsZWFzZSBwdXQgdGhhdCBpbnRvIGEgaGVscGVyIHdo
aWNoIHJldHVybnMgdGhlIG51bWJlciBvZiByZWdpb25zLgo+Pgo+IFllcywgSSB3aWxsIGRvIGl0
Lgo+IAo+PiBGV0lXLCBJIHJlYWxseSBkaXNsaWtlIHRoZSBtYWdpYyBhcm91bmQgZW5jb2Rpbmcg
YWxsIHNvcnRzIG9mIHN0dWZmCj4+IGludG8gdGhlIG9mZnNldC4gSXQgbWFrZXMgdGhlIGNvZGUg
anVzdCBoYXJkIHRvIHJlYWQuCj4+Cj4+Cj4+PiArCj4+PiArwqDCoMKgIG5fcmVnaW9ucyA9IGkg
KyAxOwo+Pj4gK8KgwqDCoCBtdGRfcmVnaW9uID0gZGV2bV9rY2FsbG9jKG5vci0+ZGV2LCBuX3Jl
Z2lvbnMsIHNpemVvZigqbXRkX3JlZ2lvbiksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4KPj4gV2hvJ3MgdGhlIG93bmVyPyBtdGQtPmRldiBv
ciBub3ItPmRldj8KPj4KPiBJIHRoaW5rIGl0IHNob3VsZCBiZSBub3ItPmRldi4KPiBUaGUgbXRk
IGRldmljZSBpcyBub3QgeWV0IHJlZ2lzdGVyZWQgYXQgdGhpcyBwb2ludC4KPiAKPj4+ICvCoMKg
wqAgaWYgKCFtdGRfcmVnaW9uKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+
Pj4gKwo+Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbl9yZWdpb25zOyBpKyspIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAocmVnaW9uW2ldLm9mZnNldCAmIFNOT1JfT1ZFUkxBSURfUkVHSU9O
KSB7Cj4+Cj4+IEJ0dy4gd2hhdCBpcyBhbiBvdmVybGFpZCByZWdpb24/IEkgY291bGRuJ3QgZmlu
ZCBhbnkgY29tbWVudAo+PiBhYm91dCBpdC4KPj4KPiBJdCBpcyB0aGUgcmVtYWluaW5nIHBhcnQg
b2YgcmVndWxhciBzZWN0b3IgdGhhdCBvdmVybGFpZCBieSA0S0Igc2VjdG9ycy4KPiBJbiBTRU1Q
RVIgY2FzZSwgcmVndWxhciBzZWN0b3IgaXMgMjU2S0IuIElmIDMyIHggNEtCIHNlY3RvcnMgYXJl
IG92ZXJsYWlkIG9uCj4gYm90dG9tIGFkZHJlc3MsIDEyOEtCIGlzIG92ZXJsYWlkIHJlZ2lvbi4g
VGhlIGVyYXNlIG9wY29kZSBmb3IgdGhpcyByZWdpb24gaXMKPiBzYW1lIGFzIDI1NktCIHNlY3Rv
cnMuCj4gCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcmFzZV9zaXplID0gcmVnaW9uW2ld
LnNpemU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVyYXNlX21hc2sgPSByZWdpb25baV0ub2Zmc2V0ICYgU05PUl9FUkFTRV9UWVBFX01B
U0s7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSBTTk9SX0VSQVNF
X1RZUEVfTUFYIC0gMTsgaiA+PSAwOyBqLS0pIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGVyYXNlX21hc2sgJiBCSVQoaikpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcmFzZV9zaXplID0gbWFwLT5lcmFzZV90eXBlW2pdLnNp
emU7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgwqAgbXRkX3Jl
Z2lvbltpXS5lcmFzZXNpemUgPSBlcmFzZV9zaXplOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIG10ZF9y
ZWdpb25baV0ubnVtYmxvY2tzID0gZGl2NjRfdWwocmVnaW9uW2ldLnNpemUsIGVyYXNlX3NpemUp
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIG10ZF9yZWdpb25baV0ub2Zmc2V0ID0gcmVnaW9uW2ldLm9m
ZnNldCAmCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
flNOT1JfRVJBU0VfRkxBR1NfTUFTSzsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCBt
dGQtPm51bWVyYXNlcmVnaW9ucyA9IG5fcmVnaW9uczsKPj4+ICvCoMKgwqAgbXRkLT5lcmFzZXJl
Z2lvbnMgPSBtdGRfcmVnaW9uOwo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4gMDsKPj4+ICt9Cj4+
PiArCj4+PiArc3RhdGljIGludCBzcGlfbm9yX3NldF9tdGRfaW5mbyhzdHJ1Y3Qgc3BpX25vciAq
bm9yKQo+Pj4gwqB7Cj4+PiDCoMKgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9ICZub3ItPm10
ZDsKPj4+IMKgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IG5vci0+ZGV2Owo+Pj4gQEAgLTM0
MzksNiArMzQ4MywxMSBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX3NldF9tdGRfaW5mbyhzdHJ1Y3Qg
c3BpX25vciAqbm9yKQo+Pj4gwqDCoMKgwqAgbXRkLT5fcmVzdW1lID0gc3BpX25vcl9yZXN1bWU7
Cj4+PiDCoMKgwqDCoCBtdGQtPl9nZXRfZGV2aWNlID0gc3BpX25vcl9nZXRfZGV2aWNlOwo+Pj4g
wqDCoMKgwqAgbXRkLT5fcHV0X2RldmljZSA9IHNwaV9ub3JfcHV0X2RldmljZTsKPj4+ICsKPj4+
ICvCoMKgwqAgaWYgKHNwaV9ub3JfaGFzX3VuaWZvcm1fZXJhc2Uobm9yKSkKPj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gMDsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0dXJuIHNwaV9ub3Jfc2V0X210
ZF9lcmFzZXJlZ2lvbnMobm9yKTsKPj4KPj4gbXRkLT5lcmFzZXNpemUgaXMgc2V0IHNvbWV3aGVy
ZSBlbHNlLCBwbGVhc2UgbW92ZSBpdCBpbnRvIHRoaXMKPj4gZnVuY3Rpb24sIGJlY2F1c2UgaXQg
d2lsbCBhbHNvIGhhdmUgYSBzcGVjaWFsIGNhc2UgZm9yIHRoZQo+PiBub25fdW5pZm9ybSBmbGFz
aGVzLiBNYXliZSB3ZSdsbCBuZWVkIG91ciBvd24gZXJhc2VzaXplIHN0b3JlZAo+PiB0b2dldGhl
ciB3aXRoIHRoZSBvcGNvZGUuCj4+Cj4gTGV0IG1lIGludHJvZHVjZSBwYXJhbXMtPmVyYXNlc2l6
ZSB3aGljaCBzZXQgdGhyb3VnaCBTRkRQIHBhcnNlLCB0aGVuCj4gCj4gICAgIG10ZC0+ZXJhc2Vz
aXplID0gbm9yLT5wYXJhbXMtPmVyYXNlc2l6ZTsKPiAKPiBsaWtlIGFzIG90aGVyICdzaXplJyBw
YXJhbXMuCj4gCkkgdHJpZWQgdG8gaW1wbGVtZW50IHRoaXMsIGJ1dCBmb3VuZCBtdGQtPmVyYXNl
c2l6ZSBpcyBzZXQgaW4gc29tZSBmaXh1cCBob29rcwppbiBtYW51ZmFjdHVyZXIgZHJpdmVyIGFu
ZCBuZWVkIHRvIHRoaW5rIGNhcmVmdWxseSBhYm91dCBjaGFuZ2luZyB0aGVtLgpMZXQgbWUgZG8g
dGhpcyBsYXRlciBpbiBhbm90aGVyIHNlcmllcyBvZiBwYXRjaGVzLgoKVGhhbmtzLApUYWthaGly
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
