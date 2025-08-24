Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88EDCA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 17:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzRxESVWjCvVtQh5A/YvtJ3gC4DuuPdVTj15jfz1mXY=; b=3PTQ1lTfgx7b8e
	I7zgX8dfCEHRsU+m16ii7OaEdeAdL1JwfdLJ6JeAcmfjq0IS/3r2a52BLW5I18CIxoU//oK7ZcHOS
	F3cEKF9cx89YUYeMGJGm/zqyvV+UZnQPC8Wb3ZwbRfs37m58IavPbyg8oH1RdIwWEFLgAHBDY+SjR
	BW/25IRpBV2v/K3DxtUwEjRqdYED9EWzK0wLvcgPH7cFufzdFVc/oKmskCy2PVhw4wkOvfuEGDWwt
	ByF5BbzcFIBn0otwbm0qDZlpH/onvLJnLepkTMOIZCbmrIVvMCYhSkUC3Y+qPAHDyFHvEZ5rNkf56
	1W+deEMBhNAeJ5c631rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqE8f-00000006NUi-2bz7;
	Sun, 24 Aug 2025 17:04:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqE8d-00000006NUB-1Paz
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 17:04:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso2131015a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 24 Aug 2025 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756055054; x=1756659854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWdnE3QqvOnTVkBeUwBHNiXhFYB2DD+PzV4D0jhuPw0=;
        b=W5W5k459ZefWJ9SiosoPi8yuFWIOOZdfZd7RmkBZZ8lOnT8hvzZOSrVB6M1wkbNFtE
         Jm0gm1qwNOv1u8sidqxbW6WpPbIBrJ8K4Ovk/pIgnk8dt297+O50A0/bATrVruHt+lps
         h5Y4bA6cGEwk7ohUjKkKur9lO6ktjYbmawz/93kGJDrVwkjSpB+n3eFaxLMgmUCovpuP
         OrOIPGsuCJwls/8N4Emd21mZikZKymi8Abj3CtlMsa8RpN5N35tg5zSZOOcV8KNg5rn7
         KCGdZ5zsYze4VT5xAXD8Ud9i/FcPng/NnTfY84vOdzyqoMIbWW8/NscqDfszKrfhxmO5
         KG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756055054; x=1756659854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWdnE3QqvOnTVkBeUwBHNiXhFYB2DD+PzV4D0jhuPw0=;
        b=ayxwvFBVM8KKTov4Qi+q78H8DUDBOMkLbtski1gWC5PamWE8je7adWpDF5tVkmO2rb
         ZeyhbKOziV5NespCdk+zebIcZw55xR+LGi7SYbHoLP/I/sR6VX0TYfoalfUojvz8BPYk
         CrP57ZsklUpvY6wgKA/QY0LekHZFEyezfCsONNl/DpudfhDxI7Ow6Rp4NOQWpZWd0/z+
         7dqGR4RxqP1yZahGQl2NpD2u5PDPKqIoZtBG5qGZId2aTJRY7Y3MFAv9KaEIB7eo0BNB
         MD2ojvPdjqn3I2vPDdWHODz4NTJwLV2bV+YmvoO6cwXsUCouWZFJCh3had5Jvllv6yfM
         VqjA==
X-Forwarded-Encrypted: i=1; AJvYcCXB33aAPcB+1vjLmy0JXtmDZtqPn2ttRQctPB13hYdq9EPAuqph1cgHFedCyzm8X0NO8pVAw0i39sQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzunLWaP1gj5Mh/OnmQHc+nqvEPwPUgA8YrZkUok8U/+Y4IcuJc
	J6Vh40wi7M95Ebnx10Z8b8k62EnAdLwP9yGmGFKEDHQPZArmj2epPFXl
X-Gm-Gg: ASbGncsAOJt7s+4rcmnWPqZnQKHlUVagw+E4qzjt/smt8Eue9Ct0cd+KqZ0ZcuPSXdu
	ZRNDS5lSEmR52Qot0HzwyWp19FUvT1gpOa1hCxRXsR9E0AIEE/ggEn1U3c/gsaSKBBClCRj9Xo+
	I8HkMLj02Tr0DFFIIewyHm8MGyevQEF4fmcA/ypA5g5709YDQPz388j7wZMabM60/Kq2ttzYtwB
	BXJu88+dztx8n34PouOnsJFrfTmsfKMxeJ/Bsx/9CFELUdGyMu8TO3j2eTRQKAsnx+2WCCMEboY
	cVkw71Y88/IgKCcRV6mzVmmqT7jSIK2xBERZ8Wz+szoQMaJP6sB4u4h+80zDc+VKDwWWMp4w+2B
	//3yGogMQFGa1y8iUoHu59Zs6C2QMGSV+rdwL1dRRbw==
X-Google-Smtp-Source: AGHT+IGKfezQDsIZ2HOwTft+hMXDJZm3c8RDXGSEF5BzzXtE7+0W8PVIoDGVOM+l7HLXJ4aH3DaHuQ==
X-Received: by 2002:a17:903:247:b0:242:9bc4:f1c7 with SMTP id d9443c01a7336-2462efcf6c6mr153982165ad.54.1756055053891;
        Sun, 24 Aug 2025 10:04:13 -0700 (PDT)
Received: from ?IPV6:2408:8362:245d:6225:5a47:caff:fe76:9e11? ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668879763sm46826905ad.108.2025.08.24.10.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 10:04:13 -0700 (PDT)
Message-ID: <016c3003-51f5-4609-b5c4-8888e974b854@gmail.com>
Date: Mon, 25 Aug 2025 01:04:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spinand: add support for FudanMicro FM25S01A
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250810133852.52389-1-cnsztl@gmail.com>
 <87wm6sk9it.fsf@bootlin.com>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <87wm6sk9it.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_100415_373592_1E8B007A 
X-CRM114-Status: GOOD (  18.55  )
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

SGVsbG8gTWlxdWVsLAoKT24gMjAyNS84LzI0IDIzOjQ2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlbGxvIFRpYW5saW5nLAo+IAo+IE9uIDEwLzA4LzIwMjUgYXQgMjE6Mzg6NTIgKzA4LCBUaWFu
bGluZyBTaGVuIDxjbnN6dGxAZ21haWwuY29tPiB3cm90ZToKPiAKPj4gQWRkIHN1cHBvcnQgZm9y
IEZ1ZGFuTWljcm8gRk0yNVMwMUEgU1BJIE5BTkQuCj4+IERhdGFzaGVldDogaHR0cDovL2VuZy5m
bXNoLmNvbS9udm0vRk0yNVMwMUFfZHNfZW5nLnBkZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaWFu
bGluZyBTaGVuIDxjbnN6dGxAZ21haWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9uYW5k
L3NwaS9NYWtlZmlsZSB8ICAyICstCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAg
fCAgMSArCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9zcGkvZm1zaC5jICAgfCA3NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQu
aCAgIHwgIDEgKwo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNo
LmMKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlIGIvZHJp
dmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUKPj4gaW5kZXggMjU4ZGE0MjQ1MWE0Li5lMjg4NzQy
ZWE4ZjAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlCj4+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlCj4+IEBAIC0xLDUgKzEsNSBAQAo+PiAg
ICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gLXNwaW5hbmQtb2JqcyA6PSBj
b3JlLm8gb3RwLm8KPj4gK3NwaW5hbmQtb2JqcyA6PSBjb3JlLm8gZm1zaC5vIG90cC5vCj4gCj4g
WW91J3JlIGFkZGluZyBhIG1hbnVmYWN0dXJlciBkcml2ZXIgaW4gdGhlIG1pZGRsZSBvZiB0aGUg
Y29yZSBmaWxlcy4gRm9yCj4gbm93IHdlIGtpbmQgb2YgaW5mb3JjZSBhbiBhbHBoYWJldGljYWwg
b3JkZXIsIHNvIHBsZWFzZSBtb3ZlIGl0IGJlbG93LgoKb29wcywgc29ycnkgZm9yIHRoYXQsIEkn
dmUgc2VudCB2MiBmb3IgaXQuIFRoYW5rIHlvdSEKClJlZ2FyZHMsClRpYW5saW5nLgoKPiAKPj4g
ICBzcGluYW5kLW9ianMgKz0gYWxsaWFuY2VtZW1vcnkubyBhdG8ubyBlc210Lm8gZm9yZXNlZS5v
IGdpZ2FkZXZpY2Uubwo+PiAgIG1hY3Jvbml4Lm8KPiAKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IEhlcmUKPiAKPj4gICBzcGluYW5kLW9ianMg
Kz0gbWljcm9uLm8gcGFyYWdvbi5vIHNreWhpZ2gubyB0b3NoaWJhLm8gd2luYm9uZC5vIHh0eC5v
Cj4+ICAgb2JqLSQoQ09ORklHX01URF9TUElfTkFORCkgKz0gc3BpbmFuZC5vCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9j
b3JlLmMKPj4gaW5kZXggYjA4OTg5OTBiMmE1Li5lYTQ3MDI4ZDAyMWEgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPj4gQEAgLTExODQsNiArMTE4NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
bmFuZF9tYW51ZmFjdHVyZXIgKnNwaW5hbmRfbWFudWZhY3R1cmVyc1tdID0gewo+PiAgIAkmYWxs
aWFuY2VtZW1vcnlfc3BpbmFuZF9tYW51ZmFjdHVyZXIsCj4+ICAgCSZhdG9fc3BpbmFuZF9tYW51
ZmFjdHVyZXIsCj4+ICAgCSZlc210X2M4X3NwaW5hbmRfbWFudWZhY3R1cmVyLAo+PiArCSZmbXNo
X3NwaW5hbmRfbWFudWZhY3R1cmVyLAo+PiAgIAkmZm9yZXNlZV9zcGluYW5kX21hbnVmYWN0dXJl
ciwKPj4gICAJJmdpZ2FkZXZpY2Vfc3BpbmFuZF9tYW51ZmFjdHVyZXIsCj4+ICAgCSZtYWNyb25p
eF9zcGluYW5kX21hbnVmYWN0dXJlciwKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2Ztc2guYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Ztc2guYwo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjhiMjA5N2JmYzc3MQo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Ztc2guYwo+IAo+IE90aGVyaXNlIHRo
ZSBkcml2ZXIgaXMgc2ltcGxlIGVub3VnaCwgc28gdjIgc2hvdWxkIG1ha2UgaXQgOikKPiAKPiBU
aGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
