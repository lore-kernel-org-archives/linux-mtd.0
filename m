Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4FDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7XOw01fYoQpjXfDL6FWq9TDUOidw5WbuQSQn10O52Q=; b=cC9YfS0DZtzc53
	bE2QpuOq/s5IaxTfg3etnE1B3ukqUsZZxKFQYPDvsKPMecvrm5pu9XLdAFF1M0lpTxYG2IOvitMc6
	2YD6ctiQ+ylwLKv32bwSe6mFwLz5XPfFHB5HFuRWLlBftMp9yFhW7NxR0XQU8Jvsr8ra7p6V6dwF3
	gVaX3ZVTprNR2E/O3WqT2CUnV1S7d+1nVlhO55ScWvEVvWXFYDJQJn2gcWuYDSR5aqBGDxfVEXoRS
	SMt5aScCCVBuOkmNZqeaYPt8KwkGlTPSdUyF/z8f6H2ECgbTX4T3O6QtXoxNaeJ8Gi1vr2Neaj+9q
	pboeSKp+4x7YXFmCsapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBoC-00CWos-Vc; Tue, 12 Apr 2022 08:23:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBoA-00CWmj-9z
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 08:23:31 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 32so14439039pgl.4
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gyrYbauxjPaWclooKJn/hrAsYXOy+/frieJJ/OTDBFY=;
 b=GK+W9vKpAguKJLGc8nUI0FFmuwES/dxXHn3pT6bo04ps4aY+/qlMgV2UGoAtjTtQw8
 GDDD+BRA4ZKb3YQNfC98H720Ob1gRczHWaUfvrRaVJV1Cajcmb967p+5oow1nLZvcm4j
 UECuyBFzs2nzdg0JStGhfIFGHlCtFFkxzBcAFMVEUCHIuQDRQVUBlHVcB9V6OJbQlhxf
 2qQATXvKM2c2NRQmK5tKLekn6J861eTIr021N4PsEfHHsUo7Hx4yQz6LpslMMylku0UP
 U5lRUhsCSocCGJX4XslCdvhFXk5FxFLPOwCcUM4JU+lGpzWNBNzB1wN4Lxp/yISVCoOG
 r3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gyrYbauxjPaWclooKJn/hrAsYXOy+/frieJJ/OTDBFY=;
 b=eBpB6J7ROQ6W/gCeMGH++aJvnLwxeXw/Tr1NULIFS9yIdGtzC5Y1cPvqTLMNkJPDyW
 wvSD67YEqPdMWK5oXysBOSGisnmDSL5IYVxRMwAnsX53EtKiIqKIWrBI0t2irb0SwqQ0
 tBiAc20dhdMcbBsrJ3SKObJb+Yo8sr7Vr8ObEaag0Z4JpqZA6YhCrW3FwGbzj4KhWxb9
 Fgv/kyM9+CJ7LE2XSZNyXgUEIuap/MkeWNfDYczlNmkD7MHjzUwXxZGGrBdIerGSWijX
 CMlzphKU0ZlQR10siIVjCTh14qNL5QwaEYa9YcDNKa6FdeI/HNLQ7+/AyhXA9udEhbCZ
 drtw==
X-Gm-Message-State: AOAM530/5e0viFOCN6MBJgXHagwb5AxxGavgDsMLN/ebNPSY4KLqR/ev
 eumuI4mQQ8OQzDOvNAU2bPrfoN8zORrmlX6SQGw=
X-Google-Smtp-Source: ABdhPJyu2IzZL5JsRvXeXyzTtw7BsyS1eaDhNkE2C+IuVlvVmERn2qRNc6suaSyU2MeJtksNwjYYKw==
X-Received: by 2002:a65:6956:0:b0:399:1f0e:6172 with SMTP id
 w22-20020a656956000000b003991f0e6172mr29356681pgq.286.1649751807937; 
 Tue, 12 Apr 2022 01:23:27 -0700 (PDT)
Received: from [192.168.1.101] ([159.226.95.33])
 by smtp.gmail.com with ESMTPSA id
 q27-20020aa7961b000000b004fdf7a4d49esm30886644pfg.170.2022.04.12.01.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:23:27 -0700 (PDT)
Message-ID: <bf603638-cc34-b185-3001-9caeba1884d7@gmail.com>
Date: Tue, 12 Apr 2022 16:23:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bastian Hecht <hechtb@googlemail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202204121253.NcZifMQi-lkp@intel.com>
 <20220412063703.8537-1-linmq006@gmail.com> <20220412090649.33bb3f8b@xps13>
 <61783400-4df2-47af-78a7-7acb715c3a71@gmail.com>
 <20220412094822.3818ebc2@xps13>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220412094822.3818ebc2@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_012330_383110_0B1ED1BF 
X-CRM114-Status: GOOD (  22.99  )
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

SGkgTWlxdWVsLAoKT24gMjAyMi80LzEyIDE1OjQ4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Cj4+
PiBIaSBNaWFvcWlhbiwKPj4+Cj4+PiBsaW5tcTAwNkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAx
MiBBcHIgMjAyMiAwNjozNjo1MiArMDAwMDoKPj4+ICAKPj4+PiB3YWl0X2Zvcl9jb21wbGV0aW9u
X3RpbWVvdXQoKSByZXR1cm5zIHVuc2lnbmVkIGxvbmcgbm90IGludC4KPj4+PiBJdCByZXR1cm5z
IDAgaWYgdGltZWQgb3V0LCBhbmQgcG9zaXRpdmUgaWYgY29tcGxldGVkLgo+Pj4+IFRoZSBjaGVj
ayBmb3IgPD0gMCBpcyBhbWJpZ3VvdXMgYW5kIHNob3VsZCBiZSA9PSAwIGhlcmUKPj4+PiBpbmRp
Y2F0aW5nIHRpbWVvdXQgd2hpY2ggaXMgdGhlIG9ubHkgZXJyb3IgY2FzZS4KPj4+Pgo+Pj4+IEZp
eGVzOiA4MzczOGQ4N2UzYTAgKCJtdGQ6IHNoX2ZsY3RsOiBBZGQgRE1BIGNhcGFiaWx0eSIpCj4+
Pj4gU2lnbmVkLW9mZi1ieTogTWlhb3FpYW4gTGluIDxsaW5tcTAwNkBnbWFpbC5jb20+Cj4+Pj4g
LS0tCj4+Pj4gY2hhbmdlIGluIHYyOgo+Pj4+IC0gaW5pdGlhbGl6ZSByZXQgdG8gMS4KPj4+PiAt
LS0KPj4+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYyB8IDggKysrKystLS0KPj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYwo+Pj4+IGluZGV4IGI4NWI5YzZmY2M0Mi4uMjM3MzI1
MWY1ODViIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMK
Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jCj4+Pj4gQEAgLTM4NCw3
ICszODQsOCBAQCBzdGF0aWMgaW50IGZsY3RsX2RtYV9maWZvMF90cmFuc2ZlcihzdHJ1Y3Qgc2hf
ZmxjdGwgKmZsY3RsLCB1bnNpZ25lZCBsb25nICpidWYsCj4+Pj4gIAlkbWFfYWRkcl90IGRtYV9h
ZGRyOwo+Pj4+ICAJZG1hX2Nvb2tpZV90IGNvb2tpZTsKPj4+PiAgCXVpbnQzMl90IHJlZzsKPj4+
PiAtCWludCByZXQ7Cj4+Pj4gKwlpbnQgcmV0ID0gMTsgIAo+Pj4gRG9lcyBub3QgbG9vayByaWdo
dC4gSSBrbm93IHRoaXMgZnVuY3Rpb24gcmV0dXJucyA+IDAgb24gcG9zaXRpdmUKPj4+IG91dGNv
bWVzIGJ1dCB0aGlzIGRvZXMgbm90IG1ha2UgYW55IHNlbnNlIGluIHRoZSBmaXJzdCBwbGFjZS4g
IAo+PiBZZXMsIEkgbWFkZSBhIG1pc3Rha2UsIE5vdyBJIHJlYWxpemUgdGhhdCBpbiB2MiwgaXQg
d2lsbCByZXR1cm4gMSBpbiBlcnJvciBwYXRoCj4+Cj4+IHdoZW4gRE1BIHN1Ym1pdCBmYWlsZWQu
Cj4gTm90IDEsIGJ1dCBhIHByb3BlciBlcnJvciBjb2RlIHBsZWFzZSAoLUVUSU1FRE9VVCwgLUVJ
TlZBTCwgd2hhdGV2ZXIpCj4KPj4gQW5kIGZvciBwYXRjaCB2MSwgaXQgd2lsbCByZXR1cm4gMMKg
IGlmIGNhbGxzIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCBzdWNjZWVkcy4KPj4KPj4+IFRo
aXMgZnVuY3Rpb24gaXMgc3RhdGljIGFuZCBvbmx5IGNhbGxlZCB0d2ljZSwgcGxlYXNlIHR1cm4g
aXQgaW50bwo+Pj4gc29tZXRoaW5nIGxpa2U6Cj4+Pgo+Pj4gaWYgKGRtYV9maWZvX3RyYW5zZmVy
KCkpCj4+PiAJZXJyb3IKPj4+IGVsc2UKPj4+IAlvayAgCj4+IFNvIEkgd2FudCB0byBrZWVwIHJl
dD4wIG1lYW5zIHN1Y2Nlc3MuCj4+Cj4+IE9yIGNvdWxkIEkgc2V0IHJldCA+IDAgYWZ0ZXIgaW4g
d2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkgc3VjY2VzcyBwYXRoPwo+Pgo+PiBsaWtlOgo+
Pgo+PiDCoMKgwqAgaWYodGltZV9sZWZ0ID09IDApCj4+Cj4+IMKgwqDCoCDCoMKgwqAgwqDCoMKg
IHJldCA9IC1FVElNRURPVVQ7Cj4+Cj4+IMKgwqDCoCBlbHNlCj4+Cj4+IMKgwqDCoCDCoMKgwqDC
oMKgIMKgIHJldCA9IDE7Cj4gWW91IGNhbiBpbml0aWFsaXplIHJldCB0byB6ZXJvIGF0IHRvIHRv
cC4gU28gdGhhdCBhbnl0aGluZyAhPSAwIGlzIGFuCj4gZXJyb3IgKGxpa2UgYSBsb3Qgb2YgZnVu
Y3Rpb25zIGluIHRoZSBrZXJuZWwpLiAKClRoYW5rcyBmb3IgeW91ciBhZHZpY2UsIEkgd2lsbCBk
byB0aGlzLgo+IEFuZCB1c2U6Cj4KPiAJaWYgKGRtYV9maWZvX3RyYW5zZmVyKCkpCj4gCQllcnJv
cigpOwpJIHRoaW5rIGtlZXBpbmcgdGhlIG9yaWdpbmFsIGNvbmRpdGlvbiBzdHJ1Y3R1cmUgaXMg
YmV0dGVyLApzb21ldGhpbmcgbGlrZToKCmlmIChkbWFfZmlmb190cmFuc2ZlcigpPT0wKQoJc3Vj
Y2VlZCgpOwoKSW4gdGhpcyB3YXksIG9ubHkgbWlub3IgY2hhbmdlcyBpcyBuZWVkZWTigJTigJRv
bmx5IG5lZWQgdG8gdXBkYXRlIHRoZSBzeW1ib2wgaW4gY29uZGl0aW9uLgpPdGhlcndpc2UgSXQg
bmVlZHMgdG8gcmVzdHJ1Y3R1cmUgdGhlIGNvZGUgYW5kIGJlIG1vcmUgY29tcGxpY2F0ZWQuCgoK
VGhhbmtzLAoKPj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Cj4+Cj4+IFRoYW5rcywKPj4KPj4+PiAr
CXVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Owo+Pj4+ICAKPj4+PiAgCWlmIChkaXIgPT0gRE1BX0ZS
T01fREVWSUNFKSB7Cj4+Pj4gIAkJY2hhbiA9IGZsY3RsLT5jaGFuX2ZpZm8wX3J4Owo+Pj4+IEBA
IC00MjUsMTMgKzQyNiwxNCBAQCBzdGF0aWMgaW50IGZsY3RsX2RtYV9maWZvMF90cmFuc2Zlcihz
dHJ1Y3Qgc2hfZmxjdGwgKmZsY3RsLCB1bnNpZ25lZCBsb25nICpidWYsCj4+Pj4gIAkJZ290byBv
dXQ7Cj4+Pj4gIAl9Cj4+Pj4gIAo+Pj4+IC0JcmV0ID0KPj4+PiArCXRpbWVfbGVmdCA9Cj4+Pj4g
IAl3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmZsY3RsLT5kbWFfY29tcGxldGUsCj4+Pj4g
IAkJCQltc2Vjc190b19qaWZmaWVzKDMwMDApKTsKPj4+PiAgCj4+Pj4gLQlpZiAocmV0IDw9IDAp
IHsKPj4+PiArCWlmICh0aW1lX2xlZnQgPT0gMCkgewo+Pj4+ICAJCWRtYWVuZ2luZV90ZXJtaW5h
dGVfYWxsKGNoYW4pOwo+Pj4+ICAJCWRldl9lcnIoJmZsY3RsLT5wZGV2LT5kZXYsICJ3YWl0X2Zv
cl9jb21wbGV0aW9uX3RpbWVvdXRcbiIpOwo+Pj4+ICsJCXJldCA9IC1FVElNRURPVVQ7Cj4+Pj4g
IAl9Cj4+Pj4gIAo+Pj4+ICBvdXQ6ICAKPj4+IFRoYW5rcywKPj4+IE1pcXXDqGwgIAo+Cj4gVGhh
bmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
