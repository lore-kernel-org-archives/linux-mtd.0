Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2A1C02182
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2025 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPKlQ+qeFKNc1/9h7xF/uzricAvsHRgRT0siMImlnOY=; b=S9xujUaphTVEO4
	tNysP17ylBRQaHgP2MNtob5NYoInFnZ6gJUzQII56sUF2iBN7M8CAnX/Yj7hSiJr4/ToSNSJYhzDE
	Px0+5lJW9lWURvPDAPEu3Gua57eXG3ltcFOtfrEneVwIIOq9dPjeQRfzJw0zNeUjaKLu63MhGbH8g
	BPGjWDNj8jiYLNx0lVHOskXFJs7f1XvNmjeIrqSGMg+IKZpSRRQvJkW+7RpKEH6HQI2+WLQLnroP9
	SFawnX8eso/v2DrhzXbMQ/IBb2I3TVcH6gtdnJ5AJXZDO14dx2m7JAzLusgQGCsfthd7oYlwMkszc
	pF0Ny9ODHujYe2YnLe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAvm-00000007T81-1VOh;
	Tue, 21 Jan 2025 09:52:22 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAvi-00000007T7H-2EQA
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jan 2025 09:52:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67045240006;
	Tue, 21 Jan 2025 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737453133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uzx+ima533i2B3erww6sRd4ZFqiY2yLhURObUkbr6UU=;
	b=WhyGUd9pED86l/r/qroagh42SkZ9qL03kPmieYraxWCFxgoqAZ+RHerMhqZFJLLOcD0olG
	jJM6Twy1SXSNSFQcOaMiOxdWSTbjWLF+KwBotiudW92Vwzm/x9Dsbh1SlP6t0UVmMjNjWD
	rm4LoCEUkgJjQXSCRiOTMmrPOXmh9ui9nLY6RiENucE0TikhuQ305/Mvvdb8xcic3sOArF
	drixxfnjJ0WhWHeXl8+BWDWannzonCsBZeu8b6h2Qt34/soktE0qHMf6llG6nWGkGLc+hd
	XIVaXlkxxNkwbiTDwDHsilmyEg0JaTFwhPf18xbXXacloU2ZJbb/IbVzNDPuBQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumar.l.rabara@intel.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux@treblig.org,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  u.kleine-koenig@baylibre.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
 when DMA is not ready
In-Reply-To: <20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	(niravkumar l. rabara's message of "Thu, 16 Jan 2025 11:21:52 +0800")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 21 Jan 2025 10:52:11 +0100
Message-ID: <87plkgpk8k.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_015218_730421_C05BD34F 
X-CRM114-Status: GOOD (  17.21  )
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

SGVsbG8sCgpPbiAxNi8wMS8yMDI1IGF0IDExOjIxOjUyICswOCwgbmlyYXZrdW1hci5sLnJhYmFy
YUBpbnRlbC5jb20gd3JvdGU6CgpUeXBvIChwcm9iKSBpbiB0aGUgdGl0bGUuCgo+IEZyb206IE5p
cmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2a3VtYXIubC5yYWJhcmFAaW50ZWwuY29tPgo+Cj4gVXNl
IGRlZmVycmVkIGRyaXZlciBwcm9iZSBpbiBjYXNlIHRoZSBETUEgZHJpdmVyIGlzIG5vdCBwcm9i
ZWQuCgpPbmx5IGRldmljZXMgYXJlIHByb2JlZCwgbm90IGRyaXZlcnMuCgo+IFdoZW4gQVJNIFNN
TVUgaXMgZW5hYmxlZCwgYWxsIHBlcmlwaGVyYWwgZGV2aWNlIGRyaXZlcnMsIGluY2x1ZGluZyBO
QU5ELAo+IGFyZSBwcm9iZWQgZWFybGllciB0aGFuIHRoZSBETUEgZHJpdmVyLgo+Cj4gRml4ZXM6
IGVjNGJhMDFlODk0ZCAoIm10ZDogcmF3bmFuZDogQWRkIG5ldyBDYWRlbmNlIE5BTkQgZHJpdmVy
IHRvIE1URCBzdWJzeXN0ZW0iKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVk
LW9mZi1ieTogTmlyYXZrdW1hciBMIFJhYmFyYSA8bmlyYXZrdW1hci5sLnJhYmFyYUBpbnRlbC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVy
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250
cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5j
Cj4gaW5kZXggOGQxZDcxMGU0MzlkLi41ZTI3ZjU1NDZmMWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKPiBAQCAtMjkwOCw3ICsyOTA4
LDcgQEAgc3RhdGljIGludCBjYWRlbmNlX25hbmRfaW5pdChzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwg
KmNkbnNfY3RybCkKPiAgCQlpZiAoIWNkbnNfY3RybC0+ZG1hYykgewo+ICAJCQlkZXZfZXJyKGNk
bnNfY3RybC0+ZGV2LAo+ICAJCQkJIlVuYWJsZSB0byBnZXQgYSBETUEgY2hhbm5lbFxuIik7Cj4g
LQkJCXJldCA9IC1FQlVTWTsKPiArCQkJcmV0ID0gLUVQUk9CRV9ERUZFUjsKCkRvZXMgaXQgd29y
ayBpZiB0aGVyZSBpcyBubyBETUEgY2hhbm5lbCBwcm92aWRlZD8gVGhlIGJpbmRpbmdzIGRvIG5v
dAptZW50aW9uIERNQSBjaGFubmVscyBhcyBtYW5kYXRvcnkuCgpBbHNvLCB3b3VsZG4ndCBpdCBi
ZSBtb3JlIHBsZWFzYW50IHRvIHVzZSBhbm90aGVyIGhlbHBlciBmcm9tIHRoZSBETUEKY29yZSB0
aGF0IHJldHVybnMgYSBwcm9wZXIgcmV0dXJuIGNvZGU/IFNvIHdlIG5vdyB3aGljaCBvbmUgYW1v
bmcKLUVCVVNZLCAtRU5PREVWIG9yIC1FUFJPQkVfREVGRVIgd2UgZ2V0PwoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
