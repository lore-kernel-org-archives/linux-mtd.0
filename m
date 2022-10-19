Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC1C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60i5iKVenXv2VvFFxPa9iKPZZjyidninRkF9y4bTBMI=; b=nJpcWgWq2MmV2E
	HBqtYk/wmyy0zxtwMu+VH12fX3k+g7aMuAfIz6GiKpOtsab1ixfA/WJyP23GxgWIvbwxMmXBxM81h
	MTtZfhEOAhrbvEefkpgUz5OXgXKLQOxXZz+1g63YILlsZwcfqqgJbp+3DV+TXpeGcmkHqt39TOrEz
	PoeqrjsHKjhPRZ5iH5R7D6hyNcEmODWXIXzwW48obA1fX5jmgubFMvQNIN+gkwEx8JNbwpols2wvg
	f+rPeE997OI/bptn6lCYYrP5gm2g1IKaaR7yZmoMRiPh3kKL492vR9bxtU6Rh3GcDnzA2KNiHLAoQ
	srslZHlYLXhECcg/UbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBm9-003sw7-85; Wed, 19 Oct 2022 16:18:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBm5-003slJ-Kk
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 16:18:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 67so17671706pfz.12
        for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2022 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHdxxkHNwY3CsIcLJd9wZNwlnOIdg2aDwUrsaM+r1Gc=;
        b=Tsv40/LVb5Cvzxdj7/TjpE7jEhcfOsq1qmEcTcC7JBTkuTDOdE7OmXhN3HaUBK8pfQ
         znDjlwmd5LC82ZbamGj/aCydivlY6XINM5EwU1o94Fkb11aWrY4JHhQvDC9cXvDGh4gh
         9hC11Rg15j6owh31MoYqSBJla9+Q4KW1xPHia+XPOhk9QAohpWNpnieSQuKnS6J9CVDC
         u1wDVBYO4IHIFBHjul5L9gXwFbMTOmSiIh78j+EUtvfKsGZkaEtER3LHfn1kKlmIvTnt
         6MHG5Ze3/JGJBr4HjwZBNJYz3sZEUBKLCUKCYHOb3XzWZK/wqP4R7lahmhq/u/zpd9rr
         CbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHdxxkHNwY3CsIcLJd9wZNwlnOIdg2aDwUrsaM+r1Gc=;
        b=2Wm3o6XLXgaTKRT/CarFFNuw9JmXxbEacvotpZUiMJSYj5iJimp2AK2xQih43K6bka
         4A6KiuPK7byMW7Shz28flRcj3N8SOiVzEF6V+WTcOfwRhByHP46gKzEzuzI76WIKW163
         YuP1952UTtQQPPzahg+bmRaE2rw5kk9Gyw9C6jwQp4bA58Ie2jhgMY9ejGKgro4nEJbR
         r7DbSRKphfNx3duku8BJe0df8v1LzvXWhImz4KHSiwq25if34Z/esQojIty7FUuVK2eo
         AwjTaimCvChCsMk+FjEFZRyw9CJHbLZbwPLCBJVBeJ+fMcD1lM+8tPtkF7i5QUxcTr+I
         JD5w==
X-Gm-Message-State: ACrzQf1XVJQlDL0tgnwlvYL4yYQohYfnKDR6FMM1Wji1JtBgXhUkEWnP
	N+QNao3MlbhuD3KHN1H50Fw=
X-Google-Smtp-Source: AMsMyM6II3DeP3HzHIQU+++I5HvN5t5SICOHh0qR+3tKZ9icgqy7uK7TF+dvBUAzh6f5v45vY8qW9A==
X-Received: by 2002:a62:e70f:0:b0:562:d556:8cf2 with SMTP id s15-20020a62e70f000000b00562d5568cf2mr9398840pfh.78.1666196309902;
        Wed, 19 Oct 2022 09:18:29 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:7452:2764:978:d1eb? ([240b:10:2720:5500:7452:2764:978:d1eb])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902714c00b001714e7608fdsm11000100plm.256.2022.10.19.09.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 09:18:29 -0700 (PDT)
Message-ID: <27c519fa-26b1-b9a1-9e4b-d2aff1f63b93@gmail.com>
Date: Thu, 20 Oct 2022 01:18:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] mtd: cfi: add fixups to support MT28FW02GBBA1HPC
Content-Language: en-US
To: Andreas Oetken <ennoerlangen@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andreas Oetken <andreas.oetken@siemens-energy.com>
References: <20221019154924.15088-1-ennoerlangen@gmail.com>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20221019154924.15088-1-ennoerlangen@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_091833_742164_6B670D8F 
X-CRM114-Status: GOOD (  23.31  )
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

SGksCgpPbiAyMDIyLzEwLzIwIDA6NDksIEFuZHJlYXMgT2V0a2VuIHdyb3RlOgo+IEFwcGx5IGV4
aXN0aW5nIGZpeHVwcyB0byBNVDI4RlcwMkdCQkExSFBDIGZyb206Cj4gQ29tbWl0IDBhOGU5ODMw
NWY2M2RlYWYwYTc5OWQ1Y2Y1NTMyY2M4M2FmMDM1ZDEgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjoK
PiBVc2UgY2hpcF9yZWFkeSgpIGZvciB3cml0ZSBvbiBTMjlHTDA2NE4iKQo+IENvbW1pdCAwZmUz
ZWRlNzk0MWRmY2Q2ZmQ1NDBmYzJiMDg2NDUzZDNlZThmMjM2ICgibXRkOiBjZmk6IEFkZCBlYXJs
eQo+IGZpeHVwIGZvciBTNzBHTDAyR1MiKQo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBPZXRr
ZW4gPGVubm9lcmxhbmdlbkBnbWFpbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC9jaGlwcy9j
ZmlfY21kc2V0XzAwMDIuYyB8ICA0ICsrKy0KPiAgIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9wcm9i
ZS5jICAgICAgIHwgMTUgKysrKysrKysrKysrKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAw
MDIuYwo+IGluZGV4IDliZDY1ZjNmODA1Yy4uNGUwYmMyYTFhYmI1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gKysrIGIvZHJpdmVycy9tdGQvY2hp
cHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBAQCAtNDQxLDggKzQ0MSwxMCBAQCBzdGF0aWMgdm9pZCBm
aXh1cF9xdWlya3Moc3RydWN0IG10ZF9pbmZvICptdGQpCj4gICAJc3RydWN0IG1hcF9pbmZvICpt
YXAgPSBtdGQtPnByaXY7Cj4gICAJc3RydWN0IGNmaV9wcml2YXRlICpjZmkgPSBtYXAtPmZsZHJ2
X3ByaXY7Cj4gICAKPiAtCWlmIChjZmktPm1mciA9PSBDRklfTUZSX0FNRCAmJiBjZmktPmlkID09
IDB4MGMwMSkKPiArCWlmIChjZmktPm1mciA9PSBDRklfTUZSX0FNRCAmJiBjZmktPmlkID09IDB4
MGMwMSB8fAo+ICsJICAgIGNmaS0+bWZyID09IENGSV9NRlJfSU5URUwgJiYgY2ZpLT5pZCA9PSAw
eDIyN2UpIC8qTVQyOEZXMDJHQkJBMUhQQyovCgpUaGlzIHBhdGNoIGlzIG5vdCBiYXNlZCBvbiB0
aGUgbWFpbmxpbmUgY29kZSBzaW5jZSBpbXBsZW1lbnRlZCBhcyBiZWxvdyAKb24gbWFpbmxpbmUu
CiA+ICNkZWZpbmUgUzI5R0wwNjROX01OMTLCoMKgwqAgwqDCoMKgIDB4MGMwMQogPiAuLi4KID7C
oCDCoMKgIGlmIChjZmktPm1mciA9PSBDRklfTUZSX0FNRCAmJiBjZmktPmlkID09IFMyOUdMMDY0
Tl9NTjEyKQoKPiAgIAkJY2ZpLT5xdWlya3MgfD0gQ0ZJX1FVSVJLX0RRX1RSVUVfREFUQTsKPiAr
ClRoZSBlbXB0eSBsaW5lIGFkZGVkIGlzIG5vdCBuZWNlc3NhcnkgdG8gYWRkIEkgdGhpbmsuCj4g
ICB9Cj4gICAKPiAgIC8qIFVzZWQgdG8gZml4IENGSS1UYWJsZXMgb2YgY2hpcHMgd2l0aG91dCBF
eHRlbmRlZCBRdWVyeSBUYWJsZXMgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX3Byb2JlLmMgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfcHJvYmUuYwo+IGluZGV4IGNmNDI2
OTU2NDU0Yy4uMTAyYzFmZmI5YWFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2Nm
aV9wcm9iZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3Byb2JlLmMKPiBAQCAtMTg2
LDkgKzE4NiwyMiBAQCBzdGF0aWMgdm9pZCBmaXh1cF9zNzBnbDAyZ3NfY2hpcHMoc3RydWN0IGNm
aV9wcml2YXRlICpjZmkpCj4gICAJcHJfd2FybigiQmFkIFM3MEdMMDJHUyBDRkkgZGF0YTsgYWRq
dXN0IHRvIGRldGVjdCAyIGNoaXBzXG4iKTsKPiAgIH0KPiAgIAo+ICsKPiArc3RhdGljIHZvaWQg
Zml4dXBfbXQyOGZ3MDJnYmJhMWhwY19jaGlwcyhzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSkKPiAr
ewo+ICsJLyoKPiArCSAqIE1UMjhGVzAyR0JCQTFIUEMgZmxhc2ggcmVwb3J0cyBhIHNpbmdsZSAy
NTYgTWlCIGNoaXAsIGJ1dCBpcyByZWFsbHkgbWFkZSB1cAo+ICsJICogb2YgdHdvIDEyOCBNaUIg
Y2hpcHMgd2l0aCAxMDI0IHNlY3RvcnMgZWFjaC4KPiArCSAqLwo+ICsJY2ZpLT5jZmlxLT5EZXZT
aXplID0gMjc7Cj4gKwljZmktPmNmaXEtPkVyYXNlUmVnaW9uSW5mb1swXSA9IDB4MjAwMDNmZjsK
PiArCXByX3dhcm4oIkJhZCBNVDI4RlcwMkdCQkExSFBDIENGSSBkYXRhOyBhZGp1c3QgdG8gZGV0
ZWN0IDIgY2hpcHNcbiIpOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjZmlfZWFy
bHlfZml4dXAgY2ZpX2Vhcmx5X2ZpeHVwX3RhYmxlW10gPSB7Cj4gICAJeyBDRklfTUZSX0FNRCwg
MHg0ODAxLCBmaXh1cF9zNzBnbDAyZ3NfY2hpcHMgfSwKPiAtCXsgfSwKPiArCXsgQ0ZJX01GUl9J
TlRFTCwgMHgyMjdlLCBmaXh1cF9tdDI4ZncwMmdiYmExaHBjX2NoaXBzfSwKQSBzcGFjZSBzaG91
bGQgYmUgYWRkZWQgYmV0d2VlbiAiZml4dXBfbXQyOGZ3MDJnYmJhMWhwY19jaGlwcyIgYW5kICJ9
Ii4KPiArCXsgfQo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIGludCBfX3hpcHJhbSBjZmlfY2hpcF9z
ZXR1cChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
