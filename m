Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D180C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQurJQSeiTtEnNEVveGglo/aJgjtUSxkcT14Uaq7TkI=; b=GB30wI9zYvnJuu
	C+ueBMH7lWsAUe99iZFQXbeHdiK7mBTf+MdCWPskqzBs4WjA5PtfPR2tTcDZPFhiLBwrN0o4xxoA5
	Sh3R9P+jmWjT0nnKyR2572GWalGXNbJo062u7hP53FbZnA4gVQbl37gM2atwCroFJWrwFzKrtJ8CD
	ZKIl59gV/eyf3R3DQV8n4NBeIckg+y0COD3LVcXIMs1e5/rQreWcX+lek0reDngxP8YrFH8u3mmpe
	I+J5LIWcuPujK26pbQ9jofm1E2hEYXRjF1oBVL3RReNQs7SRZilYMIM8nnPCF1FkDjbdJw7nYrko6
	SyJk/xXAH4jQ+6lLfZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWURD-009kNF-39; Tue, 22 Mar 2022 02:39:59 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUR8-009kLw-Ud
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:39:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id t2so17035760pfj.10
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4zT38W/g3Nlr5yWulzhtGBybnz/7yz2x7YGjZPuQI/k=;
 b=hLL+roDqm7W+xRi4+GuFdSbzPUWo+gNAt1Gqr4yhI0t7jOMmtUqkePjf7KzLpBk0pL
 Idc2bZIftCtqRbxz6i/KxPJ1R2oyrpdtnb9ajbPnCYYTfZIoR74Vf4lNNIz0lb7+HxAB
 G6T3QSVPfLtOds39XblzMmg/lTluBuIZO4gp9463lekRxwUD8b8g8WMZFV8dG1fR6Dlt
 56Kt7EPUmQsE3/+FTjcTW5csMTIxKAknKjRr2nu5ZgK8VgJk22Umli8+k7+RpKdWhX9D
 GIeHCb9mKIG2e7szp8ySUJl2NwPp4IJ270xru5dL3/1LDMLcSuq+9fnpkWHTopxgtyrg
 RFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4zT38W/g3Nlr5yWulzhtGBybnz/7yz2x7YGjZPuQI/k=;
 b=T7zIaQVvqSNoNqGHzhNBXy8+Q4gM4/ehZosQMiSvj9boNapYG2oRmESfyqD2Hew68Y
 IQm0MHE/wAb6FXHxD6Z6crEDsf+kYcs05Y3mvqLBQczr9SqXmr2NIYn/lGt5Hp1QQuau
 lVtF3XwlcBqInUj/2Uvz+oOMh3pi9WWTdrdgttSfteBxkUTP72lIWhJXZgAbpCvCCpaO
 hj854eQqmpfZpoS1Ssfziy/H5M2nQoUPIC3eFqX0MmxovRNvbkEHIxINrW2dZ3EkyLYJ
 63dX5hYJtAJ8aXUSbhVB4L9qF070nESCMDBO2LOx0P8PqHeC9qOpoi1/FcsXHoH6hPkI
 qt8Q==
X-Gm-Message-State: AOAM532KV0tT1omDQh/HUI5HawdFUJD4kvnsIuWmyO5s5dmtlsHBnAPV
 0zEez+qdHo0xVwiPtgQAZaBY9JDP47U=
X-Google-Smtp-Source: ABdhPJxiSHJ1ylSMabnIDO7zYp4X5PXuw9twxYJKtZru9KM23TEAqcwhkyxFsXToYcYvra1MASeZqQ==
X-Received: by 2002:a05:6a00:781:b0:4f4:2a:2d89 with SMTP id
 g1-20020a056a00078100b004f4002a2d89mr26694381pfu.13.1647916793925; 
 Mon, 21 Mar 2022 19:39:53 -0700 (PDT)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116]) by smtp.gmail.com with ESMTPSA id
 gb5-20020a17090b060500b001c6d46f7e75sm752580pjb.30.2022.03.21.19.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 19:39:53 -0700 (PDT)
Message-ID: <faae174c-bb3f-e4e2-dc6c-b79186d9804c@gmail.com>
Date: Tue, 22 Mar 2022 11:39:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com> <20220316182100.6e2e5876@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220316182100.6e2e5876@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_193955_018748_E77559A1 
X-CRM114-Status: GOOD (  20.83  )
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

SGkgTWlxdcOobC1zYW4sCgpPbiAyMDIyLzAzLzE3IDI6MjEsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gSGkgVG9rdW5vcmksCj4KPiBpa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMTcg
TWFyIDIwMjIgMDA6NTQ6NTQgKzA5MDA6Cj4KPj4gQXMgcG9pbnRlZCBvdXQgYnkgdGhpcyBidWcg
cmVwb3J0IFsxXSwgYnVmZmVyZWQgd3JpdGVzIGFyZSBub3cgYnJva2VuIG9uCj4+IFMyOUdMMDY0
Ti4gVGhpcyBpc3N1ZSBjb21lcyBmcm9tIGEgcmV3b3JrIHdoaWNoIHN3aXRjaGVkIGZyb20gdXNp
bmcgY2hpcF9nb29kKCkKPj4gdG8gY2hpcF9yZWFkeSgpLCBiZWNhdXNlIERRIHRydWUgZGF0YSAw
eEZGIGlzIHJlYWQgb24gUzI5R0wwNjROIGFuZCBhbiBlcnJvcgo+PiByZXR1cm5lZCBieSBjaGlw
X2dvb2QoKS4KPiBWaWduZXNoLCBJIGJlbGlldmUgeW91IHVuZGVyc3RhbmQgdGhpcyBpc3N1ZSBi
ZXR0ZXIgdGhhbiBJIGRvLCBjYW4geW91Cj4gcHJvcG9zZSBhbiBpbXByb3ZlZCBjb21taXQgbG9n
Pwo+Cj4+IE9uZSB3YXkgdG8gc29sdmUgdGhlIGlzc3VlIGlzIHRvIHJldmVydCB0aGUgY2hhbmdl
Cj4+IHBhcnRpYWxseSB0byB1c2UgY2hpcF9yZWFkeSBmb3IgUzI5R0wwNjROLgo+Pgo+PiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9iNjg3YzI1OS02NDEzLTI2YzktZDRjOS1iM2FmYTY5
ZWExMjRAcGVuZ3V0cm9uaXguZGUvCj4+Cj4+IEZpeGVzOiBkZmVhZTEwNzM1ODMoIm10ZDogY2Zp
X2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVyIHRvIGNoZWNrIGNvcnJlY3QgdmFsdWUi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21haWwuY29t
Pgo+PiBUZXN0ZWQtYnk6IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+Cj4+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL2NoaXBz
L2NmaV9jbWRzZXRfMDAwMi5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrLS0tLQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgYi9kcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+PiBpbmRleCBlNjhkZGYwZjdmYzAuLjZjNTdmODVl
MWI4ZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMK
Pj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPj4gQEAgLTg2Niw2
ICs4NjYsMjMgQEAgc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX2NoZWNrKHN0cnVjdCBtYXBfaW5m
byAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+PiAgIAkJY2hpcF9jaGVjayhtYXAsIGNoaXAs
IGFkZHIsICZkYXR1bSk7IFwKPj4gICAJfSkKPj4gICAKPj4gK3N0YXRpYyBib29sIF9feGlwcmFt
IGNmaV91c2VfY2hpcF9yZWFkeV9mb3Jfd3JpdGUoc3RydWN0IG1hcF9pbmZvICptYXApCj4gQXQg
dGhlIHZlcnkgbGVhc3QgSSB3b3VsZCBjYWxsIHRoaXMgZnVuY3Rpb246Cj4gY2ZpX3VzZV9jaGlw
X3JlYWR5X2Zvcl93cml0ZXMoKQo+Cj4gWWV0LCBJIHN0aWxsIGRvbid0IGZ1bGx5IGdldCB3aGF0
IGNoaXBfcmVhZHkgaXMgdmVyc3VzIGNoaXBfZ29vZC4KVGhpcyB3YXMgZGVsZXRlZCBhcyB0byB1
c2UgdGhlIHF1aXJrcyBmbGFnIGluc3RlYWQuCj4KPj4gK3sKPj4gKwlzdHJ1Y3QgY2ZpX3ByaXZh
dGUgKmNmaSA9IG1hcC0+ZmxkcnZfcHJpdjsKPj4gKwo+PiArCXJldHVybiBjZmktPm1mciA9PSBD
RklfTUZSX0FNRCAmJiBjZmktPmlkID09IDB4MGMwMTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlu
dCBfX3hpcHJhbSBjaGlwX2dvb2RfZm9yX3dyaXRlKHN0cnVjdCBtYXBfaW5mbyAqbWFwLAo+PiAr
CQkJCQlzdHJ1Y3QgZmxjaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+ICsJCQkJCW1h
cF93b3JkIGV4cGVjdGVkKQo+PiArewo+PiArCWlmIChjZmlfdXNlX2NoaXBfcmVhZHlfZm9yX3dy
aXRlKG1hcCkpCj4+ICsJCXJldHVybiBjaGlwX3JlYWR5KG1hcCwgY2hpcCwgYWRkcik7Cj4gSWYg
cG9zc2libGUgYW5kIG5vdCB0b28gaW52YXNpdmUgSSB3b3VsZCBkZWZpbml0ZWx5IGFkZCBhICJx
dWlya3MiIGZsYWcKPiBzb21ld2hlcmUgaW5zdGVhZCBvZiB0aGlzIGNmaV91c2VfY2hpcF9yZWFk
eV9mb3Jfd3JpdGUoKSBjaGVjay4KQWRkZWQgdGhlIHF1aXJrcyBmbGFnIGJ5IHRoZSB2ZXJzaW9u
IDUgcGF0Y2guCj4KPiBBbnl3YXksIEkgd291bGQgbW92ZSB0aGlzIHRvIHRoZSBjaGlwX2dvb2Qo
KSBpbXBsZW1lbnRhdGlvbiBkaXJlY3RseSBzbwo+IHdlIHBhcnRpYWxseSBoaWRlIHRoZSBxdWly
a3MgY29tcGxleGl0eSBmcm9tIHRoZSBjb3JlLgoKWWVzIGFsc28gYWRkZWQgdGhlIGNoaXBfZ29v
ZCB0byBjaGVjayB0aGUgcXVpcmtzIGZsYWcuCgpSZWdhcmRzLApJa2VnYW1pCgo+Cj4+ICsKPj4g
KwlyZXR1cm4gY2hpcF9nb29kKG1hcCwgY2hpcCwgYWRkciwgZXhwZWN0ZWQpOwo+PiArfQo+PiAr
Cj4+ICAgc3RhdGljIGludCBnZXRfY2hpcChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZs
Y2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyBhZHIsIGludCBtb2RlKQo+PiAgIHsKPj4gICAJREVD
TEFSRV9XQUlUUVVFVUUod2FpdCwgY3VycmVudCk7Cj4+IEBAIC0xNjg2LDcgKzE3MDMsNyBAQCBz
dGF0aWMgaW50IF9feGlwcmFtIGRvX3dyaXRlX29uZXdvcmRfb25jZShzdHJ1Y3QgbWFwX2luZm8g
Km1hcCwKPj4gICAJCSAqICJjaGlwX2dvb2QiIHRvIGF2b2lkIHRoZSBmYWlsdXJlIGR1ZSB0byBz
Y2hlZHVsaW5nLgo+PiAgIAkJICovCj4+ICAgCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1l
bykgJiYKPj4gLQkJICAgICFjaGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsIGRhdHVtKSkgewo+PiAr
CQkgICAgIWNoaXBfZ29vZF9mb3Jfd3JpdGUobWFwLCBjaGlwLCBhZHIsIGRhdHVtKSkgewo+PiAg
IAkJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwo+PiAgIAkJCXByaW50ayhLRVJOX1dBUk5J
TkcgIk1URCAlcygpOiBzb2Z0d2FyZSB0aW1lb3V0XG4iLCBfX2Z1bmNfXyk7Cj4+ICAgCQkJeGlw
X2Rpc2FibGUobWFwLCBjaGlwLCBhZHIpOwo+PiBAQCAtMTY5NCw3ICsxNzExLDcgQEAgc3RhdGlj
IGludCBfX3hpcHJhbSBkb193cml0ZV9vbmV3b3JkX29uY2Uoc3RydWN0IG1hcF9pbmZvICptYXAs
Cj4+ICAgCQkJYnJlYWs7Cj4+ICAgCQl9Cj4+ICAgCj4+IC0JCWlmIChjaGlwX2dvb2QobWFwLCBj
aGlwLCBhZHIsIGRhdHVtKSkgewo+PiArCQlpZiAoY2hpcF9nb29kX2Zvcl93cml0ZShtYXAsIGNo
aXAsIGFkciwgZGF0dW0pKSB7Cj4+ICAgCQkJaWYgKGNmaV9jaGVja19lcnJfc3RhdHVzKG1hcCwg
Y2hpcCwgYWRyKSkKPj4gICAJCQkJcmV0ID0gLUVJTzsKPj4gICAJCQlicmVhazsKPj4gQEAgLTE5
NjYsMTQgKzE5ODMsMTQgQEAgc3RhdGljIGludCBfX3hpcHJhbSBkb193cml0ZV9idWZmZXJfd2Fp
dChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKPj4gICAJCSAqICJjaGlwX2dvb2QiIHRvIGF2b2lkIHRo
ZSBmYWlsdXJlIGR1ZSB0byBzY2hlZHVsaW5nLgo+PiAgIAkJICovCj4+ICAgCQlpZiAodGltZV9h
ZnRlcihqaWZmaWVzLCB0aW1lbykgJiYKPj4gLQkJICAgICFjaGlwX2dvb2QobWFwLCBjaGlwLCBh
ZHIsIGRhdHVtKSkgewo+PiArCQkgICAgIWNoaXBfZ29vZF9mb3Jfd3JpdGUobWFwLCBjaGlwLCBh
ZHIsIGRhdHVtKSkgewo+PiAgIAkJCXByX2VycigiTVREICVzKCk6IHNvZnR3YXJlIHRpbWVvdXQs
IGFkZHJlc3M6MHglLjhseC5cbiIsCj4+ICAgCQkJICAgICAgIF9fZnVuY19fLCBhZHIpOwo+PiAg
IAkJCXJldCA9IC1FSU87Cj4+ICAgCQkJYnJlYWs7Cj4+ICAgCQl9Cj4+ICAgCj4+IC0JCWlmIChj
aGlwX2dvb2QobWFwLCBjaGlwLCBhZHIsIGRhdHVtKSkgewo+PiArCQlpZiAoY2hpcF9nb29kX2Zv
cl93cml0ZShtYXAsIGNoaXAsIGFkciwgZGF0dW0pKSB7Cj4+ICAgCQkJaWYgKGNmaV9jaGVja19l
cnJfc3RhdHVzKG1hcCwgY2hpcCwgYWRyKSkKPj4gICAJCQkJcmV0ID0gLUVJTzsKPj4gICAJCQli
cmVhazsKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
