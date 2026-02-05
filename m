Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D93CECD994
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRLTkBQzVvCMEytUnl3esebAigE6phJQNDosG9MIEOg=; b=mZUIiHQX6/9SkF
	tUJPmczDaVPUU1DkZEnLOlrEb5DbEQUNPOubn+2LAzStQrfVLX6hqrGsPlTvK7bJSGps4TlWxKXBI
	3Onfkmrjr51q4J1mGMnROKyV5qPDZsWREGCUjOLDNISafGKDamYZQlUElX+NvcPdAKj3PRjb4CJM9
	Ec+dzVSB7FNBeIPr3gxjAV8mhWvcnlf5yJ/MaqXgAMtdHxvec2I+ANRYW+4KeHt5fIcMY/s+SCfSm
	8iOUOLun9Cqk8Q12to/AVYvA+XZhHNm8kdWy65paIgYLR/HlzeCSlPR42aajhH2C6mdYNpt3RH9AM
	JUSfj56b3RIAmQVV7LUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3GH-0000000AIeY-3I0r;
	Thu, 05 Feb 2026 17:35:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3GF-0000000AIdk-3x9T
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:35:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2BCFC243B0;
	Thu,  5 Feb 2026 17:35:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5C4D6074D;
	Thu,  5 Feb 2026 17:35:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50207102F1B6D;
	Thu,  5 Feb 2026 18:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770312919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vld0CwrTKp6gj1x5sj0jTt+NLXnGpu7Rmrhf+jvx4m4=;
	b=rtfsTAenHQxdtnbs/RJ8tmRBjLsIr69L+ANIHf5cP4qgDq+GKxpHTJ0UZEMQ5gD3lnIHrZ
	RwOnNudt2li4HsN+pjrOiHIPgLW/h/kqsbzi8U740YhVVDR0YqsGWSLZIdfuB/HtVDKcl7
	LhMfmqzxmSbg7sNs/vtqJ2VDBuMABWGEqy2AwgpS/+fgs3yjYBS1reRS+RtonXxxODzAiR
	1twssWyIG/Fw6zXZ/W3eZf+sQtb7uRE7ZmEoSLFx/Ltt69dj/lGdCwDpI4Hb5RF3f+biXl
	QbHMZJnydx1Wd1p5Y/mrHqAsow0fN82We/4Q7jUlsudwejY7LTGHfW/k3j7ptw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 03/12] mtd: spinand: perform controller tuning
 during probe
In-Reply-To: <20260113141617.1905039-4-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:08 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-4-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:35:15 +0100
Message-ID: <87tsvvgkks.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093524_143601_9EA4F0CE 
X-CRM114-Status: GOOD (  15.09  )
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

SGkgU2FudGhvc2gsCgpPbiAxMy8wMS8yMDI2IGF0IDE5OjQ2OjA4ICswNTMwLCBTYW50aG9zaCBL
dW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IFNQSSBjb250cm9sbGVycyBtYXkgbmVlZCB0
dW5pbmcgZm9yIHJlbGlhYmxlIGhpZ2gtc3BlZWQgb3BlcmF0aW9uLgo+IFdpdGhvdXQgaXQsIGNv
bnRyb2xsZXJzIHVzZSBjb25zZXJ2YXRpdmUgdGltaW5nIHRoYXQgbGltaXRzIHBlcmZvcm1hbmNl
Lgo+Cj4gQ2FsbCBzcGlfbWVtX2V4ZWN1dGVfdHVuaW5nKCkgZHVyaW5nIHByb2JlIHRvIG9wdGlt
aXplIHRpbWluZyBmb3IKPiB0aGUgZGV2aWNlJ3MgcmVhZCBhbmQgd3JpdGUgb3BlcmF0aW9ucy4g
RmFpbHVyZXMgYXJlIG5vbi1mYXRhbCBhcwo+IGNvbnRyb2xsZXJzIGZhbGwgYmFjayB0byBkZWZh
dWx0IHRpbWluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGku
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCAxNCArKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUu
Ywo+IGluZGV4IDAzNDY5MTZiMDMyYi4uMmE0NWQxMDQ3NzM2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUu
Ywo+IEBAIC0xNjU4LDYgKzE2NTgsNyBAQCBzdGF0aWMgaW50IHNwaW5hbmRfcHJvYmUoc3RydWN0
IHNwaV9tZW0gKm1lbSkKPiAgewo+ICAJc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kOwo+
ICAJc3RydWN0IG10ZF9pbmZvICptdGQ7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCByZWFkX29wLCB3
cml0ZV9vcDsKPiAgCWludCByZXQ7Cj4gIAo+ICAJc3BpbmFuZCA9IGRldm1fa3phbGxvYygmbWVt
LT5zcGktPmRldiwgc2l6ZW9mKCpzcGluYW5kKSwKPiBAQCAtMTY3Niw2ICsxNjc3LDE5IEBAIHN0
YXRpYyBpbnQgc3BpbmFuZF9wcm9iZShzdHJ1Y3Qgc3BpX21lbSAqbWVtKQo+ICAJaWYgKHJldCkK
PiAgCQlyZXR1cm4gcmV0Owo+ICAKPiArCXJlYWRfb3AgPSAqc3BpbmFuZC0+b3BfdGVtcGxhdGVz
LnJlYWRfY2FjaGU7Cj4gKwl3cml0ZV9vcCA9ICpzcGluYW5kLT5vcF90ZW1wbGF0ZXMud3JpdGVf
Y2FjaGU7CgpUaGVzZSB3aWxsIGJlY29tZToKCiArCXJlYWRfb3AgPSAqc3BpbmFuZC0+b3BfdGVt
cGxhdGVzLT5yZWFkX2NhY2hlOwogKwl3cml0ZV9vcCA9ICpzcGluYW5kLT5vcF90ZW1wbGF0ZXMt
PndyaXRlX2NhY2hlOwoKYWZ0ZXIgcmViYXNpbmcgb24gbmFuZC9uZXh0IG9yIG5leHQgLXJjMS4K
Cj4gKwo+ICsJcmV0ID0gc3BpX21lbV9leGVjdXRlX3R1bmluZyhtZW0sICZyZWFkX29wLCAmd3Jp
dGVfb3ApOwo+ICsJaWYgKHJldCAmJiByZXQgIT0gLUVPUE5PVFNVUFApIHsKPiArCQlkZXZfd2Fy
bigmbWVtLT5zcGktPmRldiwgIkZhaWxlZCB0byBleGVjdXRlIFBIWSB0dW5pbmc6ICVkXG4iLAo+
ICsJCQkgcmV0KTsKPiArCQkvKgo+ICsJCSAqIFR1bmluZyBmYWlsdXJlIGlzIG5vbi1mYXRhbDsg
dGhlIGNvbnRyb2xsZXIgZmFsbHMgYmFjayB0bwo+ICsJCSAqIGRlZmF1bHQgdGltaW5nLCByZWR1
Y2luZyBzcGVlZCBidXQgZW5zdXJpbmcgb3BlcmF0aW9uLgo+ICsJCSAqLwo+ICsJfQoKQ2FuIHdl
IG1vdmUgdGhlIGNvbW1lbnQgYmVmb3JlIHNwaV9tZW1fZXhlY3V0ZV90aW1pbmcoKT8gVGhlbiBu
byBtb3JlCmJyYWNrZXRzIG5lZWRlZCBhbmQgaXQgd2lsbCBiZSBlYXNpZXIgdG8gcmVhZCAoaW1v
KS4KCkxHVE0gb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
