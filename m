Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989D9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 23:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibqzfgG4GvtZh0vhJ+2Uvp+yHIm8Z8ZNzvbzA3+DA7k=; b=CDbclk7G98yHDQ
	UDig9bp3a0bZQcekD4dbX/it0oSy8uSrr1G9IiCg2iuNAcda5+1Du2SBQOflvSXyrVI83FjharW3X
	LIcFyXahgS5ZuSQvnpf60ew4sL3o52MRb2MJoea2Ht67ZrOxC8aDJByhWrBRDJZvGPLh1q19HXnl6
	g3pfjfQ7+iskouCBOC9A3E2x6Jsy0CKNcqwp4RMf9/XaHEVbRLkA/yAWH0F4VRSCzWY3f1CVy+dof
	hsT9dOwrKn4+8AcdZOdDXAyXWSkRspfp/0khaNaCaRwMBupUnpHq727LtWc0gSh3/t5OB38XFkDAc
	yiYijmvDnZ6uIasUl60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWo80-00CS2r-NK; Tue, 22 Mar 2022 23:41:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWo7w-00CS2O-Jj
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 23:41:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so2905705pjh.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2022 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cTF+QgPjxI48go+dtifjuWURINhtnYn10gBUGeqfm30=;
 b=UrKKC4ZwuMQOCMuCuTL/GY4FErohZ6Y3iSuhA3dcjqky+ai+u1F97J4cgTQ1lld3Jj
 saLQezFhU/4eVD49bYOMrvuktivwoP+Ywi6y8UbC5/T4hmkgzi16qXz1mHMKKbpeyXo+
 KgVmCbusg9QFx/8dc6Rj8HRdq1ZJV7Zwe4yab6vCqAxNC3V5zuFel5QhxvM9jQHv0BsL
 b3vT/tc8/kI02xbuAB5vSbLSlL+HExgv3RR127xZxitDoGOaEl1bzkrE42B0WfwkOxzM
 0tPmYCEZT20lGqrwBPxjksUvLkFtgP1bVEqvr6w/Rc85iYW5NU5p2pNQKFSXOmWiIhtf
 7v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cTF+QgPjxI48go+dtifjuWURINhtnYn10gBUGeqfm30=;
 b=Kf8qj3qpG+QHPDJudnfLyVIFvA7rcETRaDaAb0DbexsoYDcjQUZlabcvet1ZIZ+xGw
 0zwTDO/dW6HIP2mj2iRnc2wNiYyc+PnPOAtOAxLzPNyFoECQeIrECGmvUTeTbRy4lccg
 GwL0yGVHQwTha4x68FY7lt8+axWd/es9TmVEwBjz5VktXQghXwT9P+0U4QRYur7SUmSG
 cRu9vKuJDTc6nBwtUpVvsKzrOnRSDOQDvemAfUURv+6T+Ne0+k3j4bysbIiExj7oEB6w
 eKm45WW0V59xZXkHxEEtltRbHRo0AqSuxbnYqALmHkjVpvCITMtM95JnJYD25tvPS+Mo
 BNtQ==
X-Gm-Message-State: AOAM532Qj4mHZDMZCC/7ug3BQ5ST8Tb7ydoUeEJPHxLRMdCcz7p5dBFI
 ttl8LK0o9TJcNxuTHzAbtbM=
X-Google-Smtp-Source: ABdhPJz9ulARpHD4Y/1qM//gYoLwJALTEdnYi2b6Ch+ZiT40u2CyXO9Oa5L/nCGnfZkNafmXch519A==
X-Received: by 2002:a17:902:ccd1:b0:154:359:7e17 with SMTP id
 z17-20020a170902ccd100b0015403597e17mr20648803ple.42.1647992483423; 
 Tue, 22 Mar 2022 16:41:23 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:21fa:ea93:9e2b:20e7?
 ([240b:10:2720:5500:21fa:ea93:9e2b:20e7])
 by smtp.gmail.com with ESMTPSA id
 y85-20020a626458000000b004fa77892f76sm14945539pfb.200.2022.03.22.16.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 16:41:22 -0700 (PDT)
Message-ID: <b3632c33-1132-2787-1d16-fbb21c0abace@gmail.com>
Date: Wed, 23 Mar 2022 08:41:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 3/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220322021001.138206-1-ikegami.t@gmail.com>
 <20220322021001.138206-4-ikegami.t@gmail.com> <20220322193427.1b9ad36a@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220322193427.1b9ad36a@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_164124_705725_487A4283 
X-CRM114-Status: GOOD (  21.91  )
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

SGkgTWlxdWVsLXNhbiwKCk9uIDIwMjIvMDMvMjMgMzozNCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBIaSBUb2t1bm9yaSwKPgo+IGlrZWdhbWkudEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAyMiBN
YXIgMjAyMiAxMToxMDowMSArMDkwMDoKPgo+PiBJdCBpcyBmb3IgdGhlIG1vZGVsIG51bWJlciAw
MSwgMDIsIFYxIGFuZCBWMi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVG9rdW5vcmkgSWtlZ2FtaSA8
aWtlZ2FtaS50QGdtYWlsLmNvbT4KPj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+
PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+PiBDYzogbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gLS0tCj4+ICAgZHJpdmVycy9tdGQvY2hpcHMvY2Zp
X2NtZHNldF8wMDAyLmMgfCAxOSArKysrKysrKysrLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2Nm
aV9jbWRzZXRfMDAwMi5jCj4+IGluZGV4IDU5MzM0NTMwZGQ0Ni4uNjc0NTNmNTljNjljIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+PiArKysgYi9k
cml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+PiBAQCAtNDgsNiArNDgsNyBAQAo+
PiAgICNkZWZpbmUgU1NUNDlMRjA0MEIJCTB4MDA1MAo+PiAgICNkZWZpbmUgU1NUNDlMRjAwOEEJ
CTB4MDA1YQo+PiAgICNkZWZpbmUgQVQ0OUJWNjQxNgkJMHgwMGQ2Cj4+ICsjZGVmaW5lIFMyOUdM
MDY0Tl9NTjEyCQkweDBjMDEKPj4gICAKPj4gICAvKgo+PiAgICAqIFN0YXR1cyBSZWdpc3RlciBi
aXQgZGVzY3JpcHRpb24uIFVzZWQgYnkgZmxhc2ggZGV2aWNlcyB0aGF0IGRvbid0Cj4+IEBAIC00
NDUsNyArNDQ2LDcgQEAgc3RhdGljIHZvaWQgZml4dXBfcXVpcmtzKHN0cnVjdCBtdGRfaW5mbyAq
bXRkKQo+PiAgIAlzdHJ1Y3QgbWFwX2luZm8gKm1hcCA9IG10ZC0+cHJpdjsKPj4gICAJc3RydWN0
IGNmaV9wcml2YXRlICpjZmkgPSBtYXAtPmZsZHJ2X3ByaXY7Cj4+ICAgCj4+IC0JaWYgKGNmaS0+
bWZyID09IENGSV9NRlJfQU1EICYmIGNmaS0+aWQgPT0gMHgwYzAxKQo+PiArCWlmIChjZmktPm1m
ciA9PSBDRklfTUZSX0FNRCAmJiBjZmktPmlkID09IFMyOUdMMDY0Tl9NTjEyKQo+PiAgIAkJY2Zp
LT5xdWlya3MgfD0gQ0ZJX1FVSVJLX0RRX1RSVUVfREFUQTsKPj4gICB9Cj4+ICAgCj4+IEBAIC00
NzUsNyArNDc2LDcgQEAgc3RhdGljIHN0cnVjdCBjZmlfZml4dXAgY2ZpX2ZpeHVwX3RhYmxlW10g
PSB7Cj4+ICAgCXsgQ0ZJX01GUl9BTUQsIDB4MDA1NiwgZml4dXBfdXNlX3NlY3NpIH0sCj4+ICAg
CXsgQ0ZJX01GUl9BTUQsIDB4MDA1QywgZml4dXBfdXNlX3NlY3NpIH0sCj4+ICAgCXsgQ0ZJX01G
Ul9BTUQsIDB4MDA1RiwgZml4dXBfdXNlX3NlY3NpIH0sCj4+IC0JeyBDRklfTUZSX0FNRCwgMHgw
YzAxLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyB9LAo+PiArCXsgQ0ZJX01GUl9BTUQsIFMyOUdM
MDY0Tl9NTjEyLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyB9LAo+PiAgIAl7IENGSV9NRlJfQU1E
LCAweDEzMDEsIGZpeHVwX3MyOWdsMDY0bl9zZWN0b3JzIH0sCj4+ICAgCXsgQ0ZJX01GUl9BTUQs
IDB4MWEwMCwgZml4dXBfczI5Z2wwMzJuX3NlY3RvcnMgfSwKPj4gICAJeyBDRklfTUZSX0FNRCwg
MHgxYTAxLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycyB9LAo+PiBAQCAtODMzLDcgKzgzNCw3IEBA
IHN0YXRpYyBpbnQgX194aXByYW0gY2hpcF9yZWFkeShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3Ry
dWN0IGZsY2hpcCAqY2hpcCwKPj4gICAJCQkgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCBtYXBf
d29yZCAqZXhwZWN0ZWQpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSA9IG1h
cC0+ZmxkcnZfcHJpdjsKPj4gLQltYXBfd29yZCBkLCB0Owo+PiArCW1hcF93b3JkIG9sZGQsIGN1
cmQ7Cj4+ICAgCWludCByZXQ7Cj4+ICAgCj4+ICAgCWlmIChjZmlfdXNlX3N0YXR1c19yZWcoY2Zp
KSkgewo+PiBAQCAtODQ0LDIwICs4NDUsMjAgQEAgc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX3Jl
YWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+PiAgIAkJICov
Cj4+ICAgCQljZmlfc2VuZF9nZW5fY21kKDB4NzAsIGNmaS0+YWRkcl91bmxvY2sxLCBjaGlwLT5z
dGFydCwgbWFwLCBjZmksCj4+ICAgCQkJCSBjZmktPmRldmljZV90eXBlLCBOVUxMKTsKPj4gLQkJ
dCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4+ICsJCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFkZHIp
Owo+PiAgIAo+PiAtCQlyZXR1cm4gbWFwX3dvcmRfYW5kZXF1YWwobWFwLCB0LCByZWFkeSwgcmVh
ZHkpOwo+PiArCQlyZXR1cm4gbWFwX3dvcmRfYW5kZXF1YWwobWFwLCBjdXJkLCByZWFkeSwgcmVh
ZHkpOwo+PiAgIAl9Cj4+ICAgCj4+IC0JZCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4+IC0JdCA9
IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4+ICsJb2xkZCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4+
ICsJY3VyZCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4+ICAgCj4+IC0JcmV0ID0gbWFwX3dvcmRf
ZXF1YWwobWFwLCBkLCB0KTsKPj4gKwlyZXQgPSBtYXBfd29yZF9lcXVhbChtYXAsIG9sZGQsIGN1
cmQpOwo+PiAgIAo+PiAgIAlpZiAoIXJldCB8fCAhZXhwZWN0ZWQpCj4+ICAgCQlyZXR1cm4gcmV0
Owo+PiAgIAo+PiAtCXJldHVybiBtYXBfd29yZF9lcXVhbChtYXAsIHQsICpleHBlY3RlZCk7Cj4+
ICsJcmV0dXJuIG1hcF93b3JkX2VxdWFsKG1hcCwgY3VyZCwgKmV4cGVjdGVkKTsKPiBMb29rcyBs
aWtlIHRoZXJlIGlzIGEgcmViYXNlIGlzc3VlLgoKVGhlIGNoYW5nZXMgYWRkZWQgYXJlIGZvciB0
aGUgcGF0Y2ggdjQgMS8zIGNvbW1lbnQgYmVsb3cuIFNvcnJ5IEkgbWlzc2VkIAp0byB1cGRhdGUg
dGhlIGNvbW1pdCBtZXNzYWdlIHNvIHdpbGwgdXBkYXRlIGl0IGFzIHNvLgogwqA+IEEgbG90IG9m
IHRoZSBkaWZmIGlzIGp1c3QgYSByZW5hbWUuIEkgYW0gbm90IGFnYWluc3QgYSByZW5hbWUgaWYg
eW91CiDCoD4gZmVlbCBpdCdzIGJldHRlciwgYnV0IGluIHRoaXMgb3JkZXI6CiDCoD4gMTogcHJl
cGFyZSB0aGUgZml4CiDCoD4gMjogZml4CiDCoD4gMzogcmVuYW1lL2RlZmluZSBpZCdzLCB3aGF0
ZXZlcgoKUmVnYXJkcywKSWtlZ2FtaQoKPgo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgaW50IF9f
eGlwcmFtIGNoaXBfZ29vZChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hp
cCwKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
