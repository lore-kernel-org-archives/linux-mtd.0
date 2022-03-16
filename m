Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51741C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oySTXQExxtksn7AEs6eku9xWRIXQUmp2TmCZ5IcEZVE=; b=kC4IcHxEXCO6+r
	5eoSWshTqTCWvwka8+/K/DIw0JYcDnZinubHO6us2OeJfYJMahbig45eGtDDYvHVqskFWoiE2s+B2
	NQ4B28rD5iYv+CDt06OAmEkmAh9Cxy3q0IrKkwCsmi01Su2jcu1ulSmHg1vLOOsB4GiuJjJNla8tu
	T4RMUpk9zUJDkNFuR1GXx7NgX5n0tat0bgJs0NQS3J8bZ1U0G9cBCE6jBDmYd0/DLMbmFYa9jS0G+
	y2xjDElK0mGcTaCIE9hSjpSBNqnv9bfkihKVSQVLIZQVfV2ktBVdJgG5tUgM0sxHab5h6sFiGf1RY
	7HKk0joV/0s2SUYvS7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUW9d-00DiDg-8X; Wed, 16 Mar 2022 16:05:41 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUW9Y-00DiCT-O3
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 16:05:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d19so4345690pfv.7
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2022 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a9E401mDl8ftw84F8S7wyTJtD/ZrOgIHvw36pVuG6Pk=;
 b=eDocAUHtjFp8OnmNFOZV+ASnUF7zs/aRn4XMVbZMeaUdxAmS52Yt+qeLvrS+H7kSOg
 JpZRUE1QZ6HqbzRat3psSeSYtP4Po6pEeNyxytZ8T0dvBJLouOxUYmaBYKMMXjeBrvdL
 2ySpZ+zzlTcKaG1kUMWHDzDiawn5G7OibYouhxJZiPd554RsfjXsz0+jhm1B+nieo7GO
 KIe4vGuufnXSdufnasQCFqGBxdyFyTh6IwOB6FJAobZGh5SlV6Feh2J1QsklzwNmMTKm
 9R7IiAJelaFHpzzkjGaRkqiqNY1hRb8PAcCHmXty+gfCGdUdPqmh2QbYmbfUE/GKBi4s
 P2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a9E401mDl8ftw84F8S7wyTJtD/ZrOgIHvw36pVuG6Pk=;
 b=Tu6N2W1C+BjJb8M3L+1owJxv61xZIRgmAvc+Xc0cq6wGdiUcH6OkAvaoA/6Ql6CsZX
 Sbe1P8jZqG5vsQgWvpo8G3YWLiwQ7Kp0YVGucl/Xfxo7DnzK6xyh2OIld9bHJ4uNuvXC
 yQshasNO3xzP716Lz2Ncudk+g6jiW3T7H9nhi0O9ICV6kmSlmJ3cIp9NMe0tWG07UZuZ
 ULsNhVLUt99oju896E6bCGs4oKqPivL7OvV3rCpex4V8RJzdrZHj8HD3f2k/s6fRzWML
 +g/jvV2LiaJ1JfvJlt1T48Jnu43JVlLjx2vyl1HQNQWRQaxxURsNqAQEE4SFeCJErvRf
 DDMQ==
X-Gm-Message-State: AOAM532u6tbKSYQHMP5OI2lcin/Q+jDzolHFSha2ETw7YO7lTMhapECM
 UCb3hcxOwvqLgpxzgp/dlWk=
X-Google-Smtp-Source: ABdhPJylR0bz6ztGHZ1y8sNvmcqhIJbgUUaRkaTn1Sk+ZDKzxCmxqvQIFp6aK4CV5nOkTwS8p5iabQ==
X-Received: by 2002:a05:6a00:18a3:b0:4f7:260b:2954 with SMTP id
 x35-20020a056a0018a300b004f7260b2954mr34679230pfh.33.1647446735834; 
 Wed, 16 Mar 2022 09:05:35 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:9500:ad27:b03f:5499?
 ([240b:10:2720:5500:9500:ad27:b03f:5499])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm2916174pgr.37.2022.03.16.09.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 09:05:35 -0700 (PDT)
Message-ID: <b26d67c6-0b35-42ff-18cc-ce998de8bf3a@gmail.com>
Date: Thu, 17 Mar 2022 01:05:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 stable@vger.kernel.org
References: <20220315165607.390070-1-ikegami.t@gmail.com>
 <20220315165607.390070-4-ikegami.t@gmail.com> <20220315195137.6e371f8f@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220315195137.6e371f8f@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_090536_837698_E9170B9C 
X-CRM114-Status: GOOD (  28.55  )
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

SGksCgpPbiAyMDIyLzAzLzE2IDM6NTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgVG9rdW5v
cmksCj4KPiBpa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTYgTWFyIDIwMjIgMDE6
NTY6MDcgKzA5MDA6Cj4KPj4gQXMgcG9pbnRlZCBvdXQgYnkgdGhpcyBidWcgcmVwb3J0IFsxXSwg
dGhlIGJ1ZmZlcmVkIHdyaXRlIGlzIG5vdyBicm9rZW4gb24KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLCBidWZmZXJlZCB3cml0ZXMgYXJlIG5vdyBicm9rZW4KPgo+
PiBTMjlHTDA2NE4uIFRoZSByZWFzb24gaXMgdGhhdCBjaGFuZ2VkIHRoZSBidWZmZXJlZCB3cml0
ZSB0byB1c2UgY2hpcF9nb29kCj4+IGluc3RlYWQgb2YgY2hpcF9yZWFkeS4KPiAiVGhpcyBpc3N1
ZSBjb21lcyBmcm9tIGEgcmV3b3JrIHdoaWNoIHN3aXRjaGVkIGZyb20gdXNpbmcgY2hpcF9nb29k
KCkKPiB0byBjaGlwX3JlYWR5KCksIGJlY2F1c2UgPGV4cGxhaW4gdGhlIGRpZmZlcmVuY2UgaGVy
ZT4uIgo+Cj4gW3BsZWFzZSBub3RlIEkgYW0ganVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aGF0
IHRoZSByb290IGNhdXNlIGlzLAo+IHBsZWFzZSByZXBocmFzZSBpZiBJJ20gd3JvbmddLgpGaXhl
ZCBieSB0aGUgdmVyc2lvbiA0IHBhdGNoZXMuCj4KPj4gT25lIHdheSB0byBzb2x2ZSB0aGUgaXNz
dWUgaXMgdG8gcmV2ZXJ0IHRoZSBjaGFuZ2UKPj4gcGFydGlhbGx5IHRvIHVzZSBjaGlwX3JlYWR5
IGZvciBTMjlHTDA2NE4gc2luY2UgdGhlIHdheSBvZiBsZWFzdCBzdXJwcmlzZS4KPiBzL3NpbmNl
IHRoZSB3YXkgb2YgbGVhc3Qgc3VycHJpc2UvLwpGaXhlZCBieSB0aGUgdmVyc2lvbiA0IHBhdGNo
ZXMuCj4KPgo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9iNjg3YzI1OS02NDEzLTI2
YzktZDRjOS1iM2FmYTY5ZWExMjRAcGVuZ3V0cm9uaXguZGUvCj4+Cj4+IEZpeGVzOiBkZmVhZTEw
NzM1ODMoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVyIHRvIGNoZWNr
IGNvcnJlY3QgdmFsdWUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBUb2t1bm9yaSBJa2VnYW1pIDxpa2Vn
YW1pLnRAZ21haWwuY29tPgo+PiBUZXN0ZWQtYnk6IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVu
Z3V0cm9uaXguZGU+Cj4+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPj4gQ2M6IFZp
Z25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4gQ2M6IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gSSB0aGluayB5b3UgY2FuIGdldCByaWQgb2YgYWxsIHRoZSBhYm92
ZSBDYzogdGFncyBhbmQganVzdCBjb3B5IGFsbCAzCj4gb2YgdXMgKyB0aGUgbWFpbGluZyBsaXN0
IHdoZW4gc2VuZGluZyB5b3VyIHY0LgpGaXhlZCBieSB0aGUgdmVyc2lvbiA0IHBhdGNoZXMuCj4K
Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gLS0tCj4gUGxlYXNlIGFsc28gaW5jbHVk
ZSBhIEZpeGVzL3N0YWJsZSB0YWcgaW4gdGhlIHBhdGNoIGJlZm9yZSAoMi8zKSB0byBleHBsYWlu
Cj4gdGhhdCBib3RoIHBhdGNoZXMgYXJlIHJlcXVpcmVkIGluIG9yZGVyIHRvIGZpeCB0aGUgaXNz
dWUgYW5kIHRoZSBjdXJyZW50IHBhdGNoIGFsb25lIHdvbid0IGFwcGx5Lgo+Cj4gWW91IHNob3Vs
ZCBtZW50aW9uIHRoYXQgd2l0aCBhIG5pY2UgY29tbWVudCBiZWxvdyB0aGUgdGhyZWUgZGFzaGVz
ICgiLS0tIikgaW4gcGF0Y2ggMi8zIGFzIHdlbGwuCj4KPj4gICBkcml2ZXJzL210ZC9jaGlwcy9j
ZmlfY21kc2V0XzAwMDIuYyB8IDEwICsrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAyLmMgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+PiBpbmRl
eCA4ZjNmMDMwOWRjMDMuLmZhMTFkYjA2NmM5OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAyLmMKPj4gQEAgLTg2NywxMCArODY3LDIwIEBAIHN0YXRpYyBpbnQgX194aXByYW0g
Y2hpcF9nb29kKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+PiAg
IAlyZXR1cm4gY2hpcF9jaGVjayhtYXAsIGNoaXAsIGFkZHIsICZleHBlY3RlZCk7Cj4+ICAgfQo+
PiAgIAo+PiArc3RhdGljIGJvb2wgX194aXByYW0gY2ZpX3VzZV9jaGlwX3JlYWR5X2Zvcl93cml0
ZShzdHJ1Y3QgbWFwX2luZm8gKm1hcCkKPj4gK3sKPj4gKwlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNm
aSA9IG1hcC0+ZmxkcnZfcHJpdjsKPj4gKwo+PiArCXJldHVybiBjZmktPm1mciA9PSBDRklfTUZS
X0FNRCAmJiBjZmktPmlkID09IFMyOUdMMDY0Tl9NTjEyOwo+PiArfQo+PiArCj4+ICAgc3RhdGlj
IGludCBfX3hpcHJhbSBjaGlwX2dvb2RfZm9yX3dyaXRlKHN0cnVjdCBtYXBfaW5mbyAqbWFwLAo+
PiAgIAkJCQkJc3RydWN0IGZsY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiAgIAkJ
CQkJbWFwX3dvcmQgZXhwZWN0ZWQpCj4+ICAgewo+PiArCWlmIChjZmlfdXNlX2NoaXBfcmVhZHlf
Zm9yX3dyaXRlKG1hcCkpCj4+ICsJCXJldHVybiBjaGlwX3JlYWR5KG1hcCwgY2hpcCwgYWRkcik7
Cj4+ICsKPj4gICAJcmV0dXJuIGNoaXBfZ29vZChtYXAsIGNoaXAsIGFkZHIsIGV4cGVjdGVkKTsK
Pj4gICB9Cj4+ICAgCj4gVGhpcyBpcyBtdWNoIG1vcmUgdW5kZXJzdGFuZGFibGUuCj4KPiBWaWdu
ZXNoLCBwZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBwcm92aWRlIGEgd2F5IGZvciBtYW51
ZmFjdHVyZXJzCj4gdG8gb3ZlcmxvYWQgY2VydGFpbiBjYWxsYmFja3MgaW5zdGVhZCBvZiBhcHBs
eWluZyBxdWlya3MgbGlrZSB0aGlzIGluCj4gdGhlIGNvZGUuIEJ1dCB0aGF0IHdpbGwgY29tZSBp
biBhIHNlY29uZCB0aW1lIG9mIGNvdXJzZS4KPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
