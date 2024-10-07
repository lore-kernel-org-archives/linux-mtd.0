Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0E6CFB440
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gq+jkOJEisDEdwCcT3na11bNrrteI75ME/udwNeBUCo=; b=YjNCKhWq7INa7i
	pSboojN3mQUVzXHbvW5Uy8tl+eMicOiANOFec+Zm61rbx2CZFvJ4J4jWIYmWd4naWcuxBR47QXPUG
	G8rq278n+6H4n9Itu4f4Ma4FTZ/Jtn7nvT61uLtAi3jhwcqzFgPF8RqjkyEIYhzwxVgTEpkGRxE9P
	QsfLg1UNJ43uH/HwLjvXoy/lcY538PH7nQjR3EGtWmeEINTrfpLwpknnLXpreuJOotOzS6a3Rrafv
	1+fg2s6AOyRCj1B42iK3k8Chbmnv/KGU4XCMyIlxbmxPNSdqys9UvEAkQHCsOKWIL4jUOwXAeyHLa
	Cwddq5eaE6jtsdsI6iPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxggu-00000001LRu-1NCh;
	Mon, 07 Oct 2024 05:53:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxggr-00000001LQX-1WNQ
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 05:53:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20b0b5cdb57so36919935ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 06 Oct 2024 22:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728280432; x=1728885232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ36maaM61bVWfMkeU+vpfLVDn7NuLQ5YuAf/8r7CWY=;
        b=gQ7XHd1cVj79FHfp95xh/n1SRQmbJHuGAvd2w00qUcoH7GkRoHldlMTKxxwNpBgAW/
         PSByVoZsnPf/pTUNKBudxAR70srthcQSxNYY28nxbh6oZZR9k4vIMVI9aG5/uBJHhp4T
         1Zy0nY6nJJY/JzLm/N4yv9FbZDazjqiDurPhOumO4Cf1wzrMj8AOx9TRDwszeOzK/yu6
         HrvhZ3CfXG/w+Qhcx2KZzfkIV4PP0JOx/VLIJ2JKNqJg+QEKHfdPwz/gUlWEVH9+LgZs
         lai9rTPUUKCPDUkB1mw4qd0ijHJ1I7/EFJnQ3lqruL8QB3RFmJWxcXjH5fyqlZMLW7Jz
         cxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728280432; x=1728885232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ36maaM61bVWfMkeU+vpfLVDn7NuLQ5YuAf/8r7CWY=;
        b=eEZXj1aANcq3PBmeSNZkfROKUOmQdbDTN3Q21EQWWFrvZ43ofnBjE3IjrwNJXr/akR
         FGWJLk9oXV2tgNfNcIGXSm5nE8pab2NdG6UuPrAVQJk+xqtLTPYqE9xfJOoyrqmqMtin
         w6qmR32+GjNwkIbKyAFtvK4zyLV6bvUs5XrIbxSFfzHavNG7u9E3Dyl6GI0L56E12DO1
         GMshwbKmcRb/fkdYZd4vVmfEAF5mzOOPVGfmttnFydAP9aZpdeZq/rYJTBwxsF4rrQnQ
         tBvuuj2dT4nOgy+HVpVBWT3D0zPz8yCHZNw73kFJj3jRXVxAE7CG8bTLKsOzkuBAeMsU
         Z/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXORqdUay0/k3dIbr3vkPZ/IwcKym4f5uer+a+LZS2sOXc4CLdlwU5VSnJlgU7dmQmP9NMnx+KA7+4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIhX/wz1/q3sf4gXe86kAC/Mi6Bd6S5StGy9j2VsRlLIlWcMYw
	yueZk8O6lKYdu6r1mH4xONQbby/MGtT5jtk9nuwVM0uqBE41MW+D975xshftNpuN/c+SyFFwtGU
	QxJdVR5DHRg0Z1RBIXm+jzwA/4X1zqqRl
X-Google-Smtp-Source: AGHT+IGCz+Jf3GxKJ8O2TlBj52jNeBIiKJfZfDjCJGtQIHzjg3udSmQA/AVTbMsyCuEpHc2EwWh5/psjbE2l+oDsXdc=
X-Received: by 2002:a17:90a:10d0:b0:2e0:855b:9b21 with SMTP id
 98e67ed59e1d1-2e1b38a3412mr20890076a91.8.1728280432184; Sun, 06 Oct 2024
 22:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240905055333.2363358-1-linchengming884@gmail.com>
 <20240905055333.2363358-3-linchengming884@gmail.com> <20241001121724.5edbb64b@xps-13>
In-Reply-To: <20241001121724.5edbb64b@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 7 Oct 2024 13:53:29 +0800
Message-ID: <CAAyq3SZvr3RVUAfMOWQqCqDOyj9QfAmiSdUHwyt=tmrbNRFFOg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nand: Add read retry support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_225353_433603_9FC0D3CB 
X-CRM114-Status: GOOD (  29.83  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQxMOaciDHml6Ug6YCx5LqMIOS4i+WNiDY6MTflr6vpgZPvvJoKPgo+IEhpIENoZW5n
IE1pbmcsCj4KPiBsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgIDUgU2Vw
IDIwMjQgMTM6NTM6MzMgKzA4MDA6Cj4KPiA+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21p
bmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gV2hlbiB0aGUgaG9zdCBFQ0MgZmFpbHMgdG8gY29y
cmVjdCB0aGUgZGF0YSBlcnJvciBvZiBOQU5EIGRldmljZSwKPiA+IHRoZXJlJ3MgYSBzcGVjaWFs
IHJlYWQgZm9yIGRhdGEgcmVjb3ZlcnkgbWV0aG9kIHdoaWNoIGhvc3Qgc2V0dXBzCj4gPiBmb3Ig
dGhlIG5leHQgcmVhZCByZXRyeSBtb2RlIGFuZCBtYXkgcmVjb3ZlciB0aGUgbG9zdCBkYXRhIGJ5
IGhvc3QKPiA+IEVDQyBhZ2Fpbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExp
biA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFu
ZC9zcGkvY29yZS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+ID4gaW5kZXggZTBiNjcxNWU1ZGZlLi4yZjIxZWE5MjYxMzIgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gQEAgLTY0MCw2ICs2NDAsNyBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfbXRkX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLAo+ID4gICAg
ICAgc3RydWN0IG5hbmRfaW9faXRlciBpdGVyOwo+ID4gICAgICAgYm9vbCBkaXNhYmxlX2VjYyA9
IGZhbHNlOwo+ID4gICAgICAgYm9vbCBlY2NfZmFpbGVkID0gZmFsc2U7Cj4gPiArICAgICB1OCBy
ZXRyeV9tb2RlID0gMDsKPiA+ICAgICAgIGludCByZXQgPSAwOwo+ID4KPiA+ICAgICAgIGlmIChv
cHMtPm1vZGUgPT0gTVREX09QU19SQVcgfHwgIXNwaW5hbmQtPmVjY2luZm8ub29ibGF5b3V0KQo+
ID4gQEAgLTY1NywyMCArNjU4LDQ1IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9tdGRfcmVhZChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sCj4KPiBUaGlzIHdpbGwgbm8gbG9uZ2VyIGFw
cGx5IHdpdGggY29udGludW91cyBzdXBwb3J0IGFkZGVkIGluLiBIb3dldmVyCj4gcGxlYXNlIG1h
a2UgdGhpcyBvbmx5IGluIHRoZSBub24gY29udGludW91cyBwYXRoLiBJIGRvbid0IHRoaW5rIGl0
IGNhbgo+IGZseSBpbiB0aGUgb3RoZXIuCgpUaGFua3MgZm9yIHlvdXIgaGVscGZ1bCBzdWdnZXN0
aW9ucy4KCj4KPiA+ICAgICAgICAgICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiA+Cj4gPiArcmVhZF9yZXRyeToKPiA+ICAgICAgICAgICAgICAgcmV0ID0g
c3BpbmFuZF9yZWFkX3BhZ2Uoc3BpbmFuZCwgJml0ZXIucmVxKTsKPiA+ICAgICAgICAgICAgICAg
aWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FQkFETVNHKQo+ID4gICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4KPiA+IC0gICAgICAgICAgICAgaWYgKHJldCA9PSAtRUJBRE1TRykKPiA+ICsg
ICAgICAgICAgICAgaWYgKHJldCA9PSAtRUJBRE1TRyAmJiBzcGluYW5kLT5pbmZvLT5maXh1cHMp
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoc3BpbmFuZC0+cmVhZF9yZXRyaWVzICYm
ICgocmV0cnlfbW9kZSArIDEpIDwgc3BpbmFuZC0+cmVhZF9yZXRyaWVzKSkgewo+Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArK3JldHJ5
X21vZGU/Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXRyeV9tb2RlKys7Cj4K
PiBTbyB0aGlzIGNhbiBiZSBkcm9wcGVkLgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBzcGluYW5kLT5pbmZvLT5maXh1cHMtPnNldHVwX3JlYWRfcmV0cnkoc3BpbmFu
ZCwgcmV0cnlfbW9kZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4K
PiBObywgeW91IG5lZWQgdG8gc2V0IGVjY19mYWlsZWQgaGVyZS4KPgo+ID4gKwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogUmVzZXQgZWNjX3N0YXRzOyByZXRyeSAqLwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkLT5lY2Nfc3RhdHMgPSBvbGRfc3RhdHM7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJlYWRfcmV0cnk7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIE5vIG1vcmUgcmV0cnkgbW9kZXM7IHJlYWwgZmFpbHVyZSAqLwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZWNjX2ZhaWxlZCA9IHRydWU7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICB9IGVsc2UgaWYgKHJldCA9PSAtRUJBRE1T
Rykgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGVjY19mYWlsZWQgPSB0cnVlOwo+ID4gLSAg
ICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgbWF4X2JpdGZsaXBzID0gbWF4X3QodW5zaWduZWQgaW50LCBtYXhfYml0Zmxp
cHMsIHJldCk7Cj4gPiArICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAgICAgIHJldCA9
IDA7Cj4gPiAgICAgICAgICAgICAgIG9wcy0+cmV0bGVuICs9IGl0ZXIucmVxLmRhdGFsZW47Cj4g
PiAgICAgICAgICAgICAgIG9wcy0+b29icmV0bGVuICs9IGl0ZXIucmVxLm9vYmxlbjsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgLyogUmVzZXQgdG8gcmV0cnkgbW9kZSAwKi8KPiA+ICsgICAgICAg
ICAgICAgaWYgKHJldHJ5X21vZGUpIHsKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHJ5
X21vZGUgPSAwOwo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gc3BpbmFuZC0+aW5m
by0+Zml4dXBzLT5zZXR1cF9yZWFkX3JldHJ5KHNwaW5hbmQsIDApOwo+Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0cnlfbW9kZSk7Cj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gdGhpcyBpZiBjbGF1
c2UgaXMgdXNlbGVzcy4KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHJ5X21vZGUgPSAw
Owo+Cj4gQW5kIHRoZW4gdGhpcyBjYW4gYmUgZHJvcHBlZCBmcm9tIGhlcmUuCj4KPiA+ICsgICAg
ICAgICAgICAgfQo+ID4gICAgICAgfQo+ID4KPiA+ICsKPgo+IFNwdXJpb3VzIGxpbmUKPgo+ID4g
ICAgICAgaWYgKG9wcy0+c3RhdHMpIHsKPiA+ICAgICAgICAgICAgICAgb3BzLT5zdGF0cy0+dW5j
b3JyZWN0YWJsZV9lcnJvcnMgKz0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBtdGQtPmVjY19z
dGF0cy5mYWlsZWQgLSBvbGRfc3RhdHMuZmFpbGVkOwo+ID4gQEAgLTEwOTUsNiArMTEyMSw5IEBA
IGludCBzcGluYW5kX21hdGNoX2FuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCwKPiA+ICAgICAgICAgICAgICAgc3BpbmFuZC0+ZmxhZ3MgPSB0YWJsZVtpXS5mbGFnczsKPiA+
ICAgICAgICAgICAgICAgc3BpbmFuZC0+aWQubGVuID0gMSArIHRhYmxlW2ldLmRldmlkLmxlbjsK
PiA+ICAgICAgICAgICAgICAgc3BpbmFuZC0+c2VsZWN0X3RhcmdldCA9IHRhYmxlW2ldLnNlbGVj
dF90YXJnZXQ7Cj4gPiArICAgICAgICAgICAgIHNwaW5hbmQtPmluZm8gPSBpbmZvOwo+ID4gKyAg
ICAgICAgICAgICBpZiAoc3BpbmFuZC0+aW5mby0+Zml4dXBzICYmIHNwaW5hbmQtPmluZm8tPmZp
eHVwcy0+aW5pdF9yZWFkX3JldHJ5KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNwaW5hbmQt
PnJlYWRfcmV0cmllcyA9IHNwaW5hbmQtPmluZm8tPmZpeHVwcy0+aW5pdF9yZWFkX3JldHJ5KHNw
aW5hbmQpOwo+Cj4gTm93IEkgZ2V0IHlvdSBpbml0LiBPaywgZmluZS4KPgo+ID4KPiA+ICAgICAg
ICAgICAgICAgb3AgPSBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50KHNwaW5hbmQsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLT5vcF92YXJpYW50
cy5yZWFkX2NhY2hlKTsKPgoKVGhhbmsgeW91IGZvciBhbGwgeW91ciBzdWdnZXN0aW9ucy4KSSB3
aWxsIG1vZGlmeSB0aGUgcGF0Y2ggYWNjb3JkaW5nIHRvIHlvdXIgYWR2aWNlLgoKPgo+IFRoYW5r
cywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
