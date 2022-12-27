Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5C7C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Dec 2022 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN+FLPwWVRqzZ8dOvM+WF+W9X5a9caBLUTH+laR3otY=; b=v5vyLmDeR+J/rW5+w8JDDkCsjq
	KcNTwWiQE+K1VJ73nn6VoHUYFAH1T+3v0qgj6HVtjozkpjZOOxMwrGi4/K8pY/di+39fOSpwmcFDn
	Z0CvyTo3+dqyU0hSglVQD1cPJglsbPW9DF+6xsiIm0Mo0M+KVFEMITMAivIPTdJTrm9K7isvj5gXZ
	zJHtNNErcbtkwwIJUX1+HjzY4R8u50eK3Im3dNHI8TeLysUS+97RPaGisd7mlTph7ZsXud+FJrdmQ
	0SgLBVS5jYeDwBwp4vfgoZ14B2+x122NlHRFUq2Amsp/TPp3jrCfHeUL5cQNL3aNaVHQFplNBz4oL
	s1twVzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9DP-00Cvc6-PJ; Tue, 27 Dec 2022 12:37:56 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9DK-00CvXW-5s
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2022 12:37:52 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 74D8A15D5;
	Tue, 27 Dec 2022 13:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672144663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAAvJN77bvgX7oGEekHJcV4mBzu/DWg2fOxNjin+9Hc=;
	b=CSdxd9zIl65XUlXt2RIzmcidEvaoXvNPRocz5E8L4+rLCOEXYxE1mO4PqLEKpfydZ5uXlu
	ehVFfLL7hyuDxxKKpOsA/n7uv8JHG/Qa5qZcfNPMItpNKfgUuD0KzGrwPUI7ceO7b+Nuz1
	h6f3cMNZ0UcojcdDJfQTtS6LdiwUSbkS5Dq+rCLMdNTM04XbulwHLLIYOsgSGb6YFekJGI
	5axoPSly5aZe83WMuOlrPgNK3iZVDzhIQ4XUzY7vX2Yewmit7tQaFnRLSnqDRmFkxyHQ+I
	JvxuFN6mQGJCjuRboX+EQRlEH5Z+7q2Q8plMGrnK2feSX+SsMfvrwJCYv568Lw==
MIME-Version: 1.0
Date: Tue, 27 Dec 2022 13:37:43 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Add support for IS25LX256 operating
 in 1S-8S-8S octal read mode
In-Reply-To: <eafebda5-7342-dfa9-7745-543d5f7d6f3d@linaro.org>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-4-nathan.morrison@timesys.com>
 <9927a8c3-40cf-2c69-46c6-f660ff2422b1@linaro.org>
 <eafebda5-7342-dfa9-7745-543d5f7d6f3d@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <14b5fc24d0e9391807768c595a4277ee@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_043750_413348_66C52040 
X-CRM114-Status: GOOD (  19.00  )
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

QW0gMjAyMi0xMi0yNiAwOToxNywgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+IE9uIDI2LjEyLjIw
MjIgMTA6MDQsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IEhpLCBOYXRoYW4sCj4+IAo+PiBUaGUg
c2VyaWVzIGlzIHN0YXJ0aW5nIHRvIGxvb2sgZ29vZCwgYnV0IEknbGwgbmVlZCBhbm90aGVyIHZl
cnNpb24sCj4+IHBsZWFzZS4KPj4gCj4+IE9uIDAyLjEyLjIwMjIgMTU6NTUsIE5hdGhhbiBCYXJy
ZXR0LU1vcnJpc29uIHdyb3RlOgo+Pj4gVGhpcyBhZGRzIHRoZSBJUzI1TFgyNTYgY2hpcCBpbnRv
IHRoZSBJU1NJIGZsYXNoX2luZm8gcGFydHMgdGFibGUKPj4gCj4+IERlc2NyaWJlIHlvdXIgY2hh
bmdlcyBpbiBpbXBlcmF0aXZlIG1vb2QsIGUuZy4gIkFkZCBzdXBwb3J0IGZvcgo+PiBTMjVMWDI1
NiIgaW5zdGVhZCBvZiAiVGhpcyBhZGRzIC4uLiIKPj4gCj4+IEl0IG1heSB3b3J0aCB0byByZS1y
ZWFkCj4+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3Vi
bWl0dGluZy1wYXRjaGVzLmh0bWwKPj4gb25jZSBpbiBhIHdoaWxlLgo+PiAKPj4+IAo+Pj4gU2ln
bmVkLW9mZi1ieTogTmF0aGFuIEJhcnJldHQtTW9ycmlzb24gPG5hdGhhbi5tb3JyaXNvbkB0aW1l
c3lzLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgfCAzMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMy
IGluc2VydGlvbnMoKykKPj4+IAo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
aXNzaS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKPj4+IGluZGV4IDg5YTY2YTE5ZDc1
NC4uMzYyYmMzNjAzZDhmIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3Np
LmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4+PiBAQCAtMjksNiArMjks
MzUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyAKPj4+IGlzMjVscDI1Nl9m
aXh1cHMgPSB7Cj4+PiDCoMKgwqDCoMKgIC5wb3N0X2JmcHQgPSBpczI1bHAyNTZfcG9zdF9iZnB0
X2ZpeHVwcywKPj4+IMKgIH07Cj4+PiArc3RhdGljIGludAo+Pj4gK2lzMjVseDI1Nl9wb3N0X2Jm
cHRfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpub3IsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBzZmRwX2JmcHQg
KmJmcHQpCj4+PiArewo+Pj4gK8KgwqDCoCAvKgo+Pj4gK8KgwqDCoMKgICogSVMyNUxYMjU2IHN1
cHBvcnRzIGJvdGggMVMtMVMtOFMgYW5kIDFTLThTLThTLgo+Pj4gK8KgwqDCoMKgICogSG93ZXZl
ciwgdGhlIEJGUFQgZG9lcyBub3QgY29udGFpbiBhbnkgaW5mb3JtYXRpb24gZGVub3RpbmcgCj4+
PiB0aGlzCj4+PiArwqDCoMKgwqAgKiBmdW5jdGlvbmFsaXR5LCBzbyB0aGUgcHJvcGVyIGZhc3Qg
cmVhZCBvcGNvZGVzIGFyZSBuZXZlciAKPj4+IHNldHVwLgo+Pj4gK8KgwqDCoMKgICogV2UncmUg
Y29ycmVjdGluZyB0aGlzIGlzc3VlIHZpYSB0aGUgZml4dXAgYmVsb3cuwqAgUGFnZSAKPj4+IHBy
b2dyYW0KPj4+ICvCoMKgwqDCoCAqIGNvbW1hbmRzIGFyZSBkZXRlY3RlZCBhbmQgc2V0dXAgcHJv
cGVybHkgdmlhIHRoZSA0QkFJVCAKPj4+IGxvb2t1cC4KPj4+ICvCoMKgwqDCoCAqLwo+IAo+IFdo
eSBkb24ndCB5b3Ugc2V0IHRoZSBSRUFEIHN1cHBvcnQgd2hlbiBwYXJzaW5nIHRoZSA0YmFpdCB0
YWJsZT8KClRoYXQgd291bGQgZGV2aWF0ZSBmcm9tIHRoZSByZWFkIGhhbmRsaW5nIG9mIGFsbCB0
aGUgb3RoZXIgbW9kZXMuCgo+IFdlIG5lZWQgdG8gc2VlIHRoZSBTRkRQIGR1bXAgdG8gZGV0ZXJt
aW5lIGhvdyB3ZSB0cmVhdCB0aGlzLiBJJ20gbm90Cj4gc3VyZSBhIHBvc3RfYmZwdCBob29rIGlz
IHRoZSByaWdodCB0aGluZyB0byBkbyBmb3IgdGhpcyBmbGFzaC4KClNlZToKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbXRkL2UwNzEwNWQ0MWVjNjJhNmVlNDdjYTAyOTVjYTM0N2RjQHdh
bGxlLmNjLwoKQnV0IHllcywgSSBtaXNzZWQgdGhhdCB5b3Ugc2hvdWxkIGluY2x1ZGUgdGhlIHNm
ZHAgZHVtcCBhbmQgc29tZSBvdGhlcgpjb21tYW5kcyBpbiB0aGUgY29tbWVudCBzZWN0aW9uIG9m
IHRoZSBwYXRjaCB3aGljaCBhZGRzIHN1cHBvcnQgZm9yIHRoYXQKZmxhc2ggKHNlZSBUdWRvcnMg
cmVwbHkpLgoKVHVkb3IsIHdoYXQgaXMgdGhlIHN0YXR1cyBvZiB5b3VyIGRvY3VtZW50YXRpb24g
cGF0Y2g/IEknZCByZWFsbHkgbGlrZQp0byByZWZlciB0byB0aGUga2VybmVsIGRvY3MgaW5zdGVh
ZCBvZiBoYXZpbmcgd3JpdGUgdGhlIHNhbWUgb3ZlciBhbmQKb3ZlciBhZ2FpbiA7KQoKLW1pY2hh
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
