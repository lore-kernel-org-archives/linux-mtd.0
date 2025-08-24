Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB774CA0EFC
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8mcAUCdBSpVx/bLYIjT61+dabzXva4tcY3OOzWBB0E=; b=oZ2lue2yOamAP7
	oGuqabOlq3fkrm0pPdxcMwrPR/1aOuPIMvmNTU4B2fXe1J0hhKhphyqsEtBTjU8UyiUSUOF0PXumc
	ydC+vBGZv+EsXBmZEVL3WV9MxCmRhl7c8nZzoTj/F8FdCcizfapAvGjMiFMsX+BWDuPo/kWVN0Rjn
	SAkduSdwLGEE7uo3Kn8hiO3bhbIM/p3UuIrDRiIuh0rjpwx+LUfxUpbsAihrzGUw53jhgIYdSxvQ4
	4/yCTV+iXx2Pu+UAdAzeaazHWwktGj3g/bbS0qYFoL5h+1d+XYFulFTmRvtnjeegTa7gJ0kiwjbgj
	DjHkyQvcNhxo5nXhx8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDYb-00000006LJB-2LDZ;
	Sun, 24 Aug 2025 16:27:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDY5-00000006LHM-38WF
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 16:26:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 800BE1A0C63;
	Sun, 24 Aug 2025 16:26:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 536E2605F1;
	Sun, 24 Aug 2025 16:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEE511C228BA3;
	Sun, 24 Aug 2025 18:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756052786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EN2uw03uQCiUxP4yNZYaMtufKIXdaP5nDTBBVTj3pDM=;
	b=tTpqh9yAUftbHe5jJ5v7pD6DihH4ClLMkGFI3HnLY1dUZrsP65Et6en3YfPH/dwVXbWqgV
	+Qe/N6TTN9SOPyfIr5ewMTfKD6pTqNifDUR5N6ja/4heN/0bKdK9U5Wa+fIRsWH9Q48b6e
	+7cf9N2mHxBesIDY9k+3oltMXYCVcKZaYv6i1FAwJ6voWtaqcR+2OhHxCASw3P/d2WF/og
	ZP9T813d3PUFl28E8njmgmTry3epu+3UNe2EnuoqyI4MBBAQUHTECBWuAvNtaaJbqXtaO/
	kDqvpjX8UuY4RWMyzeaqBp/YsKFf19vPHZVCsH8I8SAXcxDTpYe/i6NFyoDRMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/4] mtd: spinand: try a regular dirmap if
 creating a dirmap for continuous reading fails
In-Reply-To: <20250814065423.3980305-3-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 14 Aug 2025 09:54:21 +0300")
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
	<20250814065423.3980305-3-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:26:16 +0200
Message-ID: <87jz2sit3r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_092629_916417_3120D7BF 
X-CRM114-Status: GOOD (  15.71  )
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

T24gMTQvMDgvMjAyNSBhdCAwOTo1NDoyMSArMDMsIE1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hh
aWwua3NoZXZldHNraXlAaW9wc3lzLmV1PiB3cm90ZToKCj4gQ29udGludW91cyByZWFkaW5nIG1h
eSByZXN1bHQgaW4gbXVsdGlwbGUgZmxhc2ggcGFnZXMgcmVhZGluZyBpbiBvbmUKPiBvcGVyYXRp
b24uIFR5cGljYWxseSBvbmx5IG9uZSBmbGFzaCBwYWdlIGhhcyByZWFkL3dyaXR0ZW4gKGEgbGl0
dGxlIGJpdAo+IG1vcmUgdGhhbiAyLTQgS2IpLCBidXQgY29udGludW91cyByZWFkaW5nIHJlcXVp
cmVzIHRoZSBzcGkgY29udHJvbGxlcgo+IHRvIHJlYWQgdXAgdG8gNTEyIEtiIGluIG9uZSBvcGVy
YXRpb24gd2l0aG91dCB0b2dnbGluZyBDUyBpbiBiZWV0d2Vlbi4KPgo+IFJvdWdobHkgc3BlYWtp
bmcgc3BpIGNvbnRyb2xsZXJzIGNhbiBiZSBkaXZpZGVkIG9uIDIgY2F0ZWdvcmllczoKPiAgKiBz
cGkgY29udHJvbGxlcnMgd2l0aG91dCBkaXJtYXAgYWNjZWxlcmF0aW9uIHN1cHBvcnQKPiAgKiBz
cGkgY29udHJvbGxlcnMgd2l0aCBkaXJtYXAgYWNjZWxlcmF0aW9uIHN1cHBvcnQKPgo+IFVzdWFs
bHksIGZpcnN0IG9mIHRoZW0gaGF2ZSBubyBpc3N1ZXMgd2l0aCBsYXJnZSByZWFkaW5nIHN1cHBv
cnQuCj4gU2Vjb25kIGdyb3VwIG9mdGVuIHN1cHBvcnRzIGFjY2VsZXJhdGlvbiBvZiBzaW5nbGUg
cGFnZSBvbmx5IHJlYWRpbmcuCj4gVGh1cyBlbmFibGluZyBvZiBjb250aW51b3VzIHJlYWRpbmcg
Y2FuIGJyZWFrIGZsYXNoIHJlYWRpbmcuCj4KPiBUaGlzIHBhdGNoIHRyaWVzIHRvIGNyZWF0ZSBk
aXJtYXAgZm9yIGNvbnRpbnVvdXMgcmVhZGluZyBmaXJzdCBhbmQKPiBmYWxsYmFjayB0byByZWd1
bGFyIHJlYWRpbmcgaWYgc3BpIGNvbnRyb2xsZXIgcmVmdXNlcyB0byBjcmVhdGUgaXQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWtoYWlsIEtzaGV2ZXRza2l5IDxtaWtoYWlsLmtzaGV2ZXRza2l5QGlv
cHN5cy5ldT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgNDMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBpbmRleCAwOWRk
NmU0MGUzMDguLjBmODYzNjA0NzM2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtMTA5Myw2
ICsxMDkzLDM5IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9tdGRfYmxvY2tfaXNyZXNlcnZlZChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mZnMpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+
ICtzdGF0aWMgc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rlc2MgKnNwaW5hbmRfY3JlYXRlX3JkZXNj
X2hlbHBlcigKCkNhbiB3ZSBkcm9wIF9oZWxwZXIgZnJvbSB0aGUgbmFtZT8gSnVzdCBzcGluYW5k
X2NyZWF0ZV9yZGVzYygpIHNvdW5kcwphcyB1c2VmdWwuCgo+ICsJCQkJCXN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCwKPiArCQkJCQlzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBfaW5mbyAqaW5m
bykKPiArewo+ICsJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kID0gc3BpbmFuZF90b19uYW5kKHNw
aW5hbmQpOwo+ICsJc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rlc2MgKmRlc2MgPSBOVUxMOwo+ICsK
Ckxvb2tzIGdvb2Qgb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
