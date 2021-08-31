Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09809C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 11:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CFB260E98
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 11:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CFB260E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqSArWhQV7Wh1e11tjdEf2M1ZO6cn1DB5iPBEbu8eWk=; b=ilreQSE2kYs5LI
	lV+dSBzTdcfG65M59jC81iYet3yv+9eqaLQlUxSpt7pO3NmfSU/qZvxGDnIR65kZl7A3pYdxMA5JS
	bmCXzGwQdZEiD2VXRocFX9dC4KlM7nFahWI08qnJa4UQsWEohxFJxJV6ra3zy4U4NNBzf/xwtuJ7B
	XJdHrAl46nej/VeRj/ylBdQ/1Uav4XfTBejTqP7CFGtIJINLDWxxtLjZeKxY/Hl7m5xqxBtWVwo5X
	l2/JqL8VCcs/pNSTQ66J1bpHHGDBC8OaR1Vw1UiXITj12IW3DVMaGF9G2LqzBUlx/IZzUUZ2mqTeq
	CfwqFA25pwcLHWALs9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL2A5-0029qw-Fq; Tue, 31 Aug 2021 11:42:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL2A2-0029q2-HR
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 11:42:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3EDC41BF210;
 Tue, 31 Aug 2021 11:42:32 +0000 (UTC)
Date: Tue, 31 Aug 2021 13:42:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V2] mtd: rawnand: qcom: Update code word value for raw read
Message-ID: <20210831134231.14413a4f@xps13>
In-Reply-To: <1630400200-2522-1-git-send-email-mdalam@codeaurora.org>
References: <1630400200-2522-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_044238_755594_E68061B2 
X-CRM114-Status: GOOD (  19.42  )
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

SGkgTWQsCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1
ZSwgMzEgQXVnIDIwMjEKMTQ6MjY6NDAgKzA1MzA6Cgo+IEZyb20gUVBJQyBWMiBvbndhcmRzIHRo
ZXJlIGlzIGEgc2VwYXJhdGUgcmVnaXN0ZXIgdG8gcmVhZAo+IGxhc3QgY29kZSB3b3JkICJRUElD
X05BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXX24iLgo+IAo+IHFjb21fbmFuZGNfcmVhZF9jd19y
YXcoKSBpcyB1c2VkIHRvIHJlYWQgb25seSBvbmUgY29kZSB3b3JkCj4gYXQgYSB0aW1lLiBJZiB3
ZSB3aWxsIGNvbmZpZ3VyZSBudW1iZXIgb2YgY29kZSB3b3JkcyB0byAxIGluCj4gaW4gUVBJQ19O
QU5EX0RFVjBfQ0ZHMCByZWdpc3RlciB0aGVuIFFQSUMgY29udHJvbGxlciB0aGlua3MKPiBpdHMg
cmVhZGluZyB0aGUgbGFzdCBjb2RlIHdvcmQsIHNpbmNlIGZyb20gUVBJQyBWMiBvbndhcmRzCj4g
d2UgYXJlIGhhdmluZyBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFkIHRoZSBsYXN0IGNvZGUgd29y
ZCwKPiB3ZSBoYXZlIHRvIGNvbmZpZ3VyZSAiUVBJQ19OQU5EX1JFQURfTE9DQVRJT05fTEFTVF9D
V19uIgo+IHJlZ2lzdGVyIHRvIGZldGNoIGRhdGEgZnJvbSBjb250cm9sbGVyIGJ1ZmZlciB0byBz
eXN0ZW0KPiBtZW1vcnkuCj4gCj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCgpZb3UgbWlzcyB0aGUg
Rml4ZXMgdGFnIHdoaWNoIGlzIGNlcnRhaW5seSB0aGUgbW9zdCBpbXBvcnRhbnQuCgo+IFNpZ25l
ZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KPiAKPiBbVjJd
Cj4gICogQWRkZWQgc3RhYmxlIHRhZ3MKClRoZSBjaGFuZ2Vsb2cgc2hvdWxkIG5vdCBiZSBwYXJ0
IG9mIHRoZSBjb21taXQgbWVzc2FnZS4KWW91IHNob3VsZCBwdXQgaXQuLi4KCj4gLS0tCgouLi5o
ZXJlLgoKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgOCArKysrKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCBlZjBiYWRlLi4wNGU2ZjdiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0xNjc2LDEzICsxNjc2LDE3IEBAIHFjb21f
bmFuZGNfcmVhZF9jd19yYXcoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsCj4gIAlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPiAgCWlu
dCBkYXRhX3NpemUxLCBkYXRhX3NpemUyLCBvb2Jfc2l6ZTEsIG9vYl9zaXplMjsKPiAgCWludCBy
ZXQsIHJlZ19vZmYgPSBGTEFTSF9CVUZfQUNDLCByZWFkX2xvYyA9IDA7Cj4gKwlpbnQgcmF3X2N3
ID0gY3c7Cj4gIAo+ICAJbmFuZF9yZWFkX3BhZ2Vfb3AoY2hpcCwgcGFnZSwgMCwgTlVMTCwgMCk7
Cj4gIAlob3N0LT51c2VfZWNjID0gZmFsc2U7Cj4gIAo+ICsJaWYgKG5hbmRjLT5wcm9wcy0+cXBp
Y192MikKPiArCQlyYXdfY3cgPSBlY2MtPnN0ZXBzIC0gMTsKPiArCj4gIAljbGVhcl9iYW1fdHJh
bnNhY3Rpb24obmFuZGMpOwo+ICAJc2V0X2FkZHJlc3MoaG9zdCwgaG9zdC0+Y3dfc2l6ZSAqIGN3
LCBwYWdlKTsKPiAtCXVwZGF0ZV9yd19yZWdzKGhvc3QsIDEsIHRydWUsIGN3KTsKPiArCXVwZGF0
ZV9yd19yZWdzKGhvc3QsIDEsIHRydWUsIHJhd19jdyk7Cj4gIAljb25maWdfbmFuZF9wYWdlX3Jl
YWQoY2hpcCk7Cj4gIAo+ICAJZGF0YV9zaXplMSA9IG10ZC0+d3JpdGVzaXplIC0gaG9zdC0+Y3df
c2l6ZSAqIChlY2MtPnN0ZXBzIC0gMSk7Cj4gQEAgLTE3MTEsNyArMTcxNSw3IEBAIHFjb21fbmFu
ZGNfcmVhZF9jd19yYXcoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsCj4gIAkJbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIGN3LCAzLCByZWFkX2xvYywgb29iX3Np
emUyLCAxKTsKPiAgCX0KPiAgCj4gLQljb25maWdfbmFuZF9jd19yZWFkKGNoaXAsIGZhbHNlLCBj
dyk7Cj4gKwljb25maWdfbmFuZF9jd19yZWFkKGNoaXAsIGZhbHNlLCByYXdfY3cpOwo+ICAKPiAg
CXJlYWRfZGF0YV9kbWEobmFuZGMsIHJlZ19vZmYsIGRhdGFfYnVmLCBkYXRhX3NpemUxLCAwKTsK
PiAgCXJlZ19vZmYgKz0gZGF0YV9zaXplMTsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
