Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C611C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 22:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTMCYQZawitbdtF9JYVMF/RxF/GWM7KK4e2RVvRp2Bc=; b=uNfrU8P6RmsPO4
	iDwjKvVil3YYPrm+mgjgj6szYq9U5QAT2x2Iv0UQM9T8ltXVZxBFKajJq+nQ8z6onxk3oWnTMg35x
	vrshT5u/GlY6mbN3vzTe2kZgQD3i4UZC6EQ+1slk3xecsk5DlTDaK5ckDaUtB0WNGxgQGK0LraqwJ
	5f63ZzUg5zcvJAx+fDyf6d14d/yzIKA+AD0iaxeuKfWzUlGyYPMekqAVpT9ZJzJbFkaxnWd2Bvm1e
	DO2hsvqGrUtKSD/AU6HDIG8XK6euu5by/pTdAmvIVZpDVaNgwyf+R2awG5PmAsiZ9ECD1jO5dz70U
	HDoIX6ZfCMBcOe0to7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLoi-00CCmd-2V;
	Mon, 18 Dec 2023 22:10:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLof-00CCln-1t;
	Mon, 18 Dec 2023 22:10:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso43787735e9.1;
        Mon, 18 Dec 2023 14:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702937422; x=1703542222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGd5eZtf8Hv14giEbllgU0p0iNlUw0xe+ZL+XhV0YwA=;
        b=EjWa2LdW7l4qR1Usn9yCxXVqqTwa6LUMLj0VsSg0NPGMmzKBDRHmzbgELmKrPBUS1V
         Pn4x7HXNQp0tFpLiNroTqzyfqR7ItcnLhqDkHCkluj6YQiLdpHbXYVDNVxTGitSimKjv
         ZPnure4iuPUS8duzxsCC4xOJll3SgV6WrsySqDZjzDJDJW20E0YnySV83CHp/fAdbX9H
         Pt7qHkZsa+quTJQ3RCME1l1g+LGynZjcuzK34oeIMjYCpkrS3/uFwpJQHegJfUF6Tph0
         iNq5YpYW2remlm8XGxARJNdRYE5FEcmi2EomS/hBu/2+j9OgGUaloM6yk2sd2iioo+Hs
         XR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702937422; x=1703542222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGd5eZtf8Hv14giEbllgU0p0iNlUw0xe+ZL+XhV0YwA=;
        b=gYcW47xkLs02ylE9mv7E4f7MqbznvCa8jLCkZq1saajXwYyI1SISkP8j94wXn8975p
         ONDvq4ThDv2jP4fWIYzfRkNmRKsUyD6vCLTF8tcka6CIzXKtBTR098fRWNgtwChCVfQA
         3ikd+PArqXwEvPy9YwPT9pG8feB1PrTn/tAwI8I0CODA/Fyjdxx4o2LsSncJzHzrWPh4
         weoQvRFYBpOWqTURzeZ6J8jUCwYqNGyQX2Tw9nrptGZ9XGZtCs8vVwd7MC4nh0FSKHYm
         PqCiL4qTBm4BqPAZA8Fhek0dd1/ECcmgx6YOZ6AXpSPTNXWepS+YOQ7O752A8raWtTZJ
         9Sjg==
X-Gm-Message-State: AOJu0YxqDpADMRoXpxDvLQpLmnuYvXtilGwWOLWO1k+hTGQ7/jZV9f5b
	d2qewGZUIcPbQBSpyEVY/08=
X-Google-Smtp-Source: AGHT+IEBbcmVZ5J1up2cuYJCebaOe8ZMt+KkRSENCjqveVZvpvJnjm6IWHNe5Kipr+m+yLqv2VxZYg==
X-Received: by 2002:a05:600c:4e8d:b0:40c:2787:571e with SMTP id f13-20020a05600c4e8d00b0040c2787571emr6555783wmq.7.1702937421627;
        Mon, 18 Dec 2023 14:10:21 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id vs6-20020a170907a58600b00a1f99e749dasm11859919ejc.210.2023.12.18.14.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 14:10:21 -0800 (PST)
Message-ID: <13bc621c-5fcb-4710-912c-06e3e80d7337@gmail.com>
Date: Mon, 18 Dec 2023 23:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] nvmem: layouts: add U-Boot env layout
Content-Language: en-US
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
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231218152116.59d59bad@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_141025_624673_DEA15C3B 
X-CRM114-Status: GOOD (  33.04  )
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

T24gMTguMTIuMjAyMyAxNToyMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSYWZhxYIsCj4g
Cj4gemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDE4IERlYyAyMDIzIDE0OjM3OjIyICsw
MTAwOgo+IAo+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+
IFRoaXMgcGF0Y2ggbW92ZXMgYWxsIGdlbmVyaWMgKE5WTUVNIGRldmljZXMgaW5kZXBlbmRlbnQp
IGNvZGUgZnJvbSBOVk1FTQo+PiBkZXZpY2UgZHJpdmVyIHRvIE5WTUVNIGxheW91dCBkcml2ZXIu
IFRoZW4gaXQgYWRkcyBhIHNpbXBsZSBOVk1FTSBsYXlvdXQKPj4gY29kZSBvbiB0b3Agb2YgaXQu
Cj4+Cj4+IFRoYW5rcyB0byBwcm9wZXIgbGF5b3V0IGl0J3MgcG9zc2libGUgdG8gc3VwcG9ydCBV
LUJvb3QgZW52IGRhdGEgc3RvcmVkCj4+IG9uIGFueSBraW5kIG9mIE5WTUVNIGRldmljZS4KPj4K
Pj4gRm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGQgRFQgYmluZGluZ3Mgd2UgbmVl
ZCB0byBrZWVwIG9sZAo+PiBOVk1FTSBkZXZpY2UgZHJpdmVyIGZ1bmN0aW9uYWwuIFRvIGF2b2lk
IGNvZGUgZHVwbGljYXRpb24gYSBwYXJzaW5nCj4+IGZ1bmN0aW9uIGlzIGV4cG9ydGVkIGFuZCBy
ZXVzZWQgaW4gaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4KPj4gLS0tCj4gCj4gSSBoYXZlIGEgY291cGxlIG9mIGNvbW1lbnRzIGFib3V0
IHRoZSBvcmlnaW5hbCBkcml2ZXIgd2hpY2ggZ2V0cwo+IGNvcHktcGFzdGVkIGluIHRoZSBuZXcg
bGF5b3V0IGRyaXZlciwgbWF5YmUgeW91IGNvdWxkIGNsZWFuIHRoZXNlCj4gKHRoZSBtZW1vcnkg
bGVhayBzaG91bGQgYmUgZml4ZWQgYmVmb3JlIHRoZSBtaWdyYXRpb24gc28gaXQgY2FuIGJlCj4g
YmFja3BvcnRlZCBlYXNpbHksIHRoZSBvdGhlcnMgYXJlIGp1c3Qgc3R5bGUgc28gaXQgY2FuIGJl
IGRvbmUgYWZ0ZXIsIEkKPiBkb24ndCBtaW5kKS4KPiAKPiAuLi4KPiAKPj4gK2ludCB1X2Jvb3Rf
ZW52X3BhcnNlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0s
Cj4+ICsJCSAgICAgZW51bSB1X2Jvb3RfZW52X2Zvcm1hdCBmb3JtYXQpCj4+ICt7Cj4+ICsJc2l6
ZV90IGNyYzMyX2RhdGFfb2Zmc2V0Owo+PiArCXNpemVfdCBjcmMzMl9kYXRhX2xlbjsKPj4gKwlz
aXplX3QgY3JjMzJfb2Zmc2V0Owo+PiArCXNpemVfdCBkYXRhX29mZnNldDsKPj4gKwlzaXplX3Qg
ZGF0YV9sZW47Cj4+ICsJc2l6ZV90IGRldl9zaXplOwo+PiArCXVpbnQzMl90IGNyYzMyOwo+PiAr
CXVpbnQzMl90IGNhbGM7Cj4+ICsJdWludDhfdCAqYnVmOwo+PiArCWludCBieXRlczsKPj4gKwlp
bnQgZXJyOwo+PiArCj4+ICsJZGV2X3NpemUgPSBudm1lbV9kZXZfc2l6ZShudm1lbSk7Cj4+ICsK
Pj4gKwlidWYgPSBrY2FsbG9jKDEsIGRldl9zaXplLCBHRlBfS0VSTkVMKTsKPiAKPiBPdXQgb2Yg
Y3VyaW9zaXR5LCB3aHkga2NhbGxvYygxLC4uLikgcmF0aGVyIHRoYW4ga3phbGxvYygpID8KCkkg
dXNlZCBrY2FsbG9jKCkgaW5pdGlhbGx5IGFzIEkgZGlkbid0IG5lZWQgYnVmZmVyIHRvIGJlIHpl
cm9lZC4KCkkgc2VlIHRoYXQgbWVtb3J5LWFsbG9jYXRpb24ucnN0IGhvd2V2ZXIgc2F5czoKID4g
QW5kLCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGl0J3MgYmVzdCB0byB1c2Ugcm91dGluZXMgdGhh
dCBzZXQgbWVtb3J5IHRvIHplcm8sIGxpa2Uga3phbGxvYygpLgoKSXQncyBwcm9iYWJseSBjbG9z
ZSB0byB6ZXJvIGNvc3QgdG8gemVybyB0aGF0IGJ1ZmZlciBzbyBpdCBjb3VsZCBiZSBremFsbG9j
KCkuCgoKPj4gKwlpZiAoIWJ1Zikgewo+PiArCQllcnIgPSAtRU5PTUVNOwo+PiArCQlnb3RvIGVy
cl9vdXQ7Cj4gCj4gV2UgY291bGQgZGlyZWN0bHkgcmV0dXJuIEVOT01FTSBoZXJlIEkgZ3Vlc3Mu
Cj4gCj4+ICsJfQo+PiArCj4+ICsJYnl0ZXMgPSBudm1lbV9kZXZpY2VfcmVhZChudm1lbSwgMCwg
ZGV2X3NpemUsIGJ1Zik7Cj4+ICsJaWYgKGJ5dGVzIDwgMCkKPj4gKwkJcmV0dXJuIGJ5dGVzOwo+
PiArCWVsc2UgaWYgKGJ5dGVzICE9IGRldl9zaXplKQo+PiArCQlyZXR1cm4gLUVJTzsKPiAKPiBE
b24ndCB3ZSBuZWVkIHRvIGZyZWUgYnVmIGluIHRoZSBhYm92ZSBjYXNlcz8KPiAKPj4gKwlzd2l0
Y2ggKGZvcm1hdCkgewo+PiArCWNhc2UgVV9CT09UX0ZPUk1BVF9TSU5HTEU6Cj4+ICsJCWNyYzMy
X29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX3NpbmdsZSwgY3JjMzIp
Owo+PiArCQljcmMzMl9kYXRhX29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2lt
YWdlX3NpbmdsZSwgZGF0YSk7Cj4+ICsJCWRhdGFfb2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0IHVf
Ym9vdF9lbnZfaW1hZ2Vfc2luZ2xlLCBkYXRhKTsKPj4gKwkJYnJlYWs7Cj4+ICsJY2FzZSBVX0JP
T1RfRk9STUFUX1JFRFVOREFOVDoKPj4gKwkJY3JjMzJfb2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0
IHVfYm9vdF9lbnZfaW1hZ2VfcmVkdW5kYW50LCBjcmMzMik7Cj4+ICsJCWNyYzMyX2RhdGFfb2Zm
c2V0ID0gb2Zmc2V0b2Yoc3RydWN0IHVfYm9vdF9lbnZfaW1hZ2VfcmVkdW5kYW50LCBkYXRhKTsK
Pj4gKwkJZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9yZWR1
bmRhbnQsIGRhdGEpOwo+PiArCQlicmVhazsKPj4gKwljYXNlIFVfQk9PVF9GT1JNQVRfQlJPQURD
T006Cj4+ICsJCWNyYzMyX29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdl
X2Jyb2FkY29tLCBjcmMzMik7Cj4+ICsJCWNyYzMyX2RhdGFfb2Zmc2V0ID0gb2Zmc2V0b2Yoc3Ry
dWN0IHVfYm9vdF9lbnZfaW1hZ2VfYnJvYWRjb20sIGRhdGEpOwo+PiArCQlkYXRhX29mZnNldCA9
IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX2Jyb2FkY29tLCBkYXRhKTsKPj4gKwkJ
YnJlYWs7Cj4+ICsJfQo+PiArCWNyYzMyID0gbGUzMl90b19jcHUoKihfX2xlMzIgKikoYnVmICsg
Y3JjMzJfb2Zmc2V0KSk7Cj4gCj4gTG9va3MgYSBiaXQgY29udm9sdXRlZCwgYW55IGNoYW5jZXMg
d2UgY2FuIHVzZSBpbnRlcm1lZGlhdGUgdmFyaWFibGVzCj4gdG8gaGVscCBkZWNpcGhlciB0aGlz
Pwo+IAo+PiArCWNyYzMyX2RhdGFfbGVuID0gZGV2X3NpemUgLSBjcmMzMl9kYXRhX29mZnNldDsK
Pj4gKwlkYXRhX2xlbiA9IGRldl9zaXplIC0gZGF0YV9vZmZzZXQ7Cj4+ICsKPj4gKwljYWxjID0g
Y3JjMzIofjAsIGJ1ZiArIGNyYzMyX2RhdGFfb2Zmc2V0LCBjcmMzMl9kYXRhX2xlbikgXiB+MEw7
Cj4+ICsJaWYgKGNhbGMgIT0gY3JjMzIpIHsKPj4gKwkJZGV2X2VycihkZXYsICJJbnZhbGlkIGNh
bGN1bGF0ZWQgQ1JDMzI6IDB4JTA4eCAoZXhwZWN0ZWQ6IDB4JTA4eClcbiIsIGNhbGMsIGNyYzMy
KTsKPj4gKwkJZXJyID0gLUVJTlZBTDsKPj4gKwkJZ290byBlcnJfa2ZyZWU7Cj4+ICsJfQo+PiAr
Cj4+ICsJYnVmW2Rldl9zaXplIC0gMV0gPSAnXDAnOwo+PiArCWVyciA9IHVfYm9vdF9lbnZfcGFy
c2VfY2VsbHMoZGV2LCBudm1lbSwgYnVmLCBkYXRhX29mZnNldCwgZGF0YV9sZW4pOwo+PiArCWlm
IChlcnIpCj4+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjZWxsczogJWRcbiIsIGVy
cik7Cj4gCj4gUGxlYXNlIGRyb3AgdGhpcyBlcnJvciBtZXNzYWdlLCB0aGUgb25seSByZWFzb24g
Zm9yIHdoaWNoIHRoZSBmdW5jdGlvbgo+IGNhbGwgd291bGQgZmFpbCBpcyBhcHBhcmVudGx5IGFu
IEVOT01FTSBjYXNlLgo+IAo+PiArCj4+ICtlcnJfa2ZyZWU6Cj4+ICsJa2ZyZWUoYnVmKTsKPj4g
K2Vycl9vdXQ6Cj4+ICsJcmV0dXJuIGVycjsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKHVf
Ym9vdF9lbnZfcGFyc2UpOwo+PiArCj4+ICtzdGF0aWMgaW50IHVfYm9vdF9lbnZfYWRkX2NlbGxz
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0pCj4+ICt7Cj4+
ICsJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7Cj4+ICsJc3RydWN0IGRldmljZV9u
b2RlICpsYXlvdXRfbnA7Cj4+ICsJZW51bSB1X2Jvb3RfZW52X2Zvcm1hdCBmb3JtYXQ7Cj4+ICsK
Pj4gKwlsYXlvdXRfbnAgPSBvZl9udm1lbV9sYXlvdXRfZ2V0X2NvbnRhaW5lcihudm1lbSk7Cj4+
ICsJaWYgKCFsYXlvdXRfbnApCj4+ICsJCXJldHVybiAtRU5PRU5UOwo+PiArCj4+ICsJbWF0Y2gg
PSBvZl9tYXRjaF9ub2RlKHVfYm9vdF9lbnZfb2ZfbWF0Y2hfdGFibGUsIGxheW91dF9ucCk7Cj4+
ICsJaWYgKCFtYXRjaCkKPj4gKwkJcmV0dXJuIC1FTk9FTlQ7Cj4+ICsKPj4gKwlmb3JtYXQgPSAo
dWludHB0cl90KW1hdGNoLT5kYXRhOwo+IAo+IEluIHRoZSBjb3JlIHRoZXJlIGlzIGN1cnJlbnRs
eSBhbiB1bnVzZWQgaGVscGVyIGNhbGxlZAo+IG52bWVtX2xheW91dF9nZXRfbWF0Y2hfZGF0YSgp
IHdoaWNoIGRvZXMgdGhhdC4gSSB0aGluayB0aGUgb3JpZ2luYWwKPiBpbnRlbnQgb2YgdGhpcyBm
dW5jdGlvbiB3YXMgdG8gYmUgdXNlZCBpbiB0aGlzIGRyaXZlciwgc28gZGVwZW5kaW5nIG9uCj4g
eW91ciBwcmVmZXJlbmNlLCBjYW4geW91IHBsZWFzZSBlaXRoZXIgdXNlIGl0IG9yIHJlbW92ZSBp
dD8KClRoZSBwcm9ibGVtIGlzIHRoYXQgbnZtZW1fbGF5b3V0X2dldF9tYXRjaF9kYXRhKCkgdXNl
czoKbGF5b3V0LT5kZXYuZHJpdmVyCgpJdCBkb2Vzbid0IHdvcmsgd2l0aCBsYXlvdXRzIGRyaXZl
ciAoc2luY2UgcmVmYWN0b3Jpbmc/KSBhcyBkcml2ZXIgaXMKTlVMTC4gVGhhdCByZXN1bHRzIGlu
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aGVuIHRyeWluZyB0byByZWFjaApvZl9tYXRjaF90
YWJsZS4KClRoYXQgaXMgd2h5IEkgdXNlZCB1X2Jvb3RfZW52X29mX21hdGNoX3RhYmxlIGRpcmVj
dGx5LgoKSWYgeW91IGtub3cgaG93IHRvIGZpeCBudm1lbV9sYXlvdXRfZ2V0X21hdGNoX2RhdGEo
KSB0aGF0IHdvdWxkIGJlCmdyZWF0LiBEbyB3ZSBuZWVkIGRyaXZlcl9yZWdpc3RlcigpIHNvbWV3
aGVyZSBpbiBOVk1FTSBjb3JlPwoKCj4+ICsKPj4gKwlvZl9ub2RlX3B1dChsYXlvdXRfbnApOwo+
PiArCj4+ICsJcmV0dXJuIHVfYm9vdF9lbnZfcGFyc2UoZGV2LCBudm1lbSwgZm9ybWF0KTsKPj4g
K30KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
