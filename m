Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13689C982C3
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j68EkLTBNUp4l/Q/sc5HYghkLCFyG2jBkMO4kRQdF8g=; b=g9E4nIJYWvV6ui
	tvgTRxh8Ssuxj2C8FFlFm/w7b8Q6iKw4MO+4aD45h3uXTGba5mh8zcVUBux+Pm01Tswuyc7kY9rNu
	RK/LErfvRN5LHeYR1kyagPhlg4ta3jYvgCC4o9sibsr5mTDi+Mey/GuZio98KLCVMoQzKgeKjvoJf
	7BUrmEdCZ4+pw1m5FImX8njZO3FdD19kPZRdn5x0AqDF+GAdZH7+r4Ll+HyNzCLcMr+dz85df+1bw
	WVSUGTp6v6ejkZhcGZ9hnpIYf4Tr09qMbIVOx5a8DxEB19OxnQxmmkNFpscBpWRz0wuHKWzweJaYH
	SsrLIfoOL3VQNlfYaGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rJ9-00000009XJp-3LSK;
	Wed, 16 Sep 2026 15:12:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rJ6-00000009XIK-2SWY
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 15:12:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2A11C653E5;
	Wed, 16 Sep 2026 15:12:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF7E060337;
	Wed, 16 Sep 2026 15:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D80FB11C7B02C;
	Wed, 16 Sep 2026 17:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789571534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=quuIl1qQ1CatIDWdv+/finp0pmoVfonu/MDoOFq07A4=;
	b=AimCvowfLlMvokrdjJX5e2YCiM28fEhNcPXWxmeWSB94JsYqVuHiSBLg7yjTCjvfK49btr
	2bCB2l1AbcJoB7Ys8jM47/Uc6VuirvZ6/qmipEHIYv6Eh58gFgDWHIQEHoWPVnWbOWxSTf
	IhF5SRLQQzzWHJMsdmkTqpRLkMpYpIX8FXH1eO4R6tjuFObwH1FBhPdJ0P76SCfQ99Yzom
	RihUsUp6vhI99csxxGsER4VYINT7EB4p3qkVBbQtPJhgDw5+jOUstGsCgK1qmdqLMvRUiX
	fIC+ccDGY4BqzrUWKfIZFsIKs1wxTExrENwQjWP4Q43PyRZlsiAwjy8c6yUtkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at
 256 bytes on an x8 device
In-Reply-To: <20260915075028.21658-1-orgads@gmail.com> (Orgad Shaneh's message
	of "Tue, 15 Sep 2026 07:50:03 +0000")
References: <20260915071339.15172-1-orgads@gmail.com>
	<20260915075028.21658-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 16 Sep 2026 17:12:11 +0200
Message-ID: <8733v9mdro.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_081220_788368_6CD1BACC 
X-CRM114-Status: GOOD (  22.69  )
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

T24gMTUvMDkvMjAyNiBhdCAwNzo1MDowMyBHTVQsIE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IFRoZSB3b3JkIGNvdW50IG9mIHRoZSBXcml0ZSB0byBCdWZmZXIgY29t
bWFuZCBpcyBhIHNpbmdsZSBidXMgd29yZCBwZXIKPiBkZXZpY2UsIHNvIGFuIHg4IGRldmljZSBj
YW4gYmUgdG9sZCB0byBwcm9ncmFtIGF0IG1vc3QgMjU2IGJ5dGVzCj4gcmVnYXJkbGVzcyBvZiB0
aGUgYnVmZmVyIHNpemUgaXQgYWR2ZXJ0aXNlcy4KPgo+IEEgTWljcm9uIE0yOUVXIChhbiB4MTYg
cGFydCB3aXJlZCBpbiB4OCBtb2RlKSBhZHZlcnRpc2VzIGEgNTEyLWJ5dGUKPiB3cml0ZSBidWZm
ZXIuIGNmaV9hbWRzdGRfd3JpdGVfYnVmZmVycygpIHVzZWQgdGhlIGZ1bGwgNTEyLCBDTUQoNTEx
KQo+IHRydW5jYXRlZCB0aGUgY291bnQgdG8gMHhmZiBvbiB0aGUgd2F5IG91dCwgYW5kIHRoZSBj
aGlwIGFib3J0ZWQgdGhlCj4gcHJvZ3JhbSBvbiB0aGUgMjU3dGggZGF0YSBieXRlLgoKVGhpcyBz
ZW50ZW5jZSBkb2VzIG5vdCBtZWFuIGFueXRoaW5nLCBJJ20gc29ycnkuCgo+IEV2ZXJ5IGZ1bGwt
c2l6ZSBjaHVuayBmYWlsZWQgd2hpbGUgdGhlCgpmYWlsZWQ/IGRvIHlvdSBoYXZlIGhhcmR3YXJl
IHRoYXQgYWN0dWFsbHkgdHJpZ2dlcmVkIHRoYXQgaXNzdWU/Cgo+IHBhcnRpYWwgb25lcyBhdCB0
aGUgc3RhcnQgb2YgYSB3cml0ZSB3ZW50IHRocm91Z2g6Cj4KPiAgIE1URCBkb193cml0ZV9idWZm
ZXJfd2FpdCgpOiBzb2Z0d2FyZSB0aW1lb3V0LCBhZGRyZXNzOjB4MDMyNzhiZmYuCj4gICBqZmZz
MjogV3JpdGUgb2YgNDE2NCBieXRlcyBhdCAweDAyYzc4OWI0IGZhaWxlZC4gcmV0dXJuZWQgLTUs
IHJldGxlbiA2OAo+ICAgamZmczI6IE5vIHNwYWNlIGZvciBnYXJiYWdlIGNvbGxlY3Rpb24uIEFi
b3J0aW5nIEdDIHRocmVhZAo+Cj4gQ2xhbXAgTWF4QnVmV3JpdGVTaXplIGluIHRoZSB3cml0ZS1i
dWZmZXIgZml4dXAgZm9yIHg4IGRldmljZXMsIGFuZCBrZWVwCj4gbXRkLT53cml0ZWJ1ZnNpemUg
KGNvbXB1dGVkIGJlZm9yZSB0aGUgZml4dXBzIHJ1bikgY29uc2lzdGVudCB3aXRoIGl0Lgo+Cj4g
VGhlIGJ1ZyBwcmVkYXRlcyB0aGUgZ2l0IGhpc3RvcnksIHNvIHRoZXJlIGlzIG5vIEZpeGVzOiB0
YWcuCgpUaGF0J3MgaW5jb3JyZWN0LiBJdCBpbmRpY2F0ZXMgdW50aWwgd2hlbiB3ZSBuZWVkIHRv
IGJhY2twb3J0IGl0LiBTbyBpZgppdCdzIHRoZSBmaXJzdCBHaXQgY29tbWl0LCBpdCdzIHRoZSBm
aXJzdCBHaXQgY29tbWl0LgoKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEFzc2lzdGVk
LWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNQo+IFNpZ25lZC1vZmYtYnk6IE9yZ2FkIFNoYW5laCA8
b3JnYWRzQGdtYWlsLmNvbT4KPiAtLS0KPgo+IHYyOiB0ZXN0IHRoZSBkZXZpY2Ugd2lkdGggKGNm
aS0+ZGV2aWNlX3R5cGUpIGluc3RlYWQgb2YgdGhlIGFnZ3JlZ2F0ZSBidXMKPiAgICAgd2lkdGgu
IG1hcF9iYW5rd2lkdGhfaXNfMSgpIGlzIGZhbHNlIGZvciB4OCBkZXZpY2VzIGludGVybGVhdmVk
IG9uIGEKPiAgICAgd2lkZXIgYnVzLCB3aGljaCBoYXZlIHRoZSBzYW1lIDI1Ni1ieXRlIGNlaWxp
bmc6IGRvX3dyaXRlX2J1ZmZlcigpCj4gICAgIHNlbmRzIENNRCh3b3JkcyAtIDEpLCBhbmQgQ01E
KCkgcmVwbGljYXRlcyB0aGF0IGNvdW50IGludG8gZWFjaAo+ICAgICBkZXZpY2UncyBsYW5lLCB3
aGVyZSBpdCBpcyB0cnVuY2F0ZWQgdG8gOCBiaXRzIC0gc28gdHdvIHg4IGNoaXBzIHdpdGgKPiAg
ICAgYSA1MTItYnl0ZSBidWZmZXIgYXJlIHRvbGQgMjU1IHdvcmRzIGFuZCBhcmUgc3RpbGwgc2Vu
dCA1MTIgYnl0ZXMKPiAgICAgZWFjaC4gZGV2aWNlX3R5cGUgaXMgYWxzbyBpbW11bmUgdG8gbWFw
X2Jhbmt3aWR0aF9pc18xKCkgY29tcGlsaW5nIHRvCj4gICAgIGEgY29uc3RhbnQgMCB3aGVuIENP
TkZJR19NVERfTUFQX0JBTktfV0lEVEhfMSBpcyBvZmYuIENhdWdodCBieSB0aGUKPiAgICAgU2Fz
aGlrbyByZXZpZXcgYm90Lgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiAtLS0g
YS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gQEAgLTI4Myw2ICsyODMsMjEgQEAgc3RhdGljIHZv
aWQgZml4dXBfdXNlX3dyaXRlX2J1ZmZlcnMoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAkJcHJf
ZGVidWcoIlVzaW5nIGJ1ZmZlciB3cml0ZSBtZXRob2RcbiIpOwo+ICAJCW10ZC0+X3dyaXRlID0g
Y2ZpX2FtZHN0ZF93cml0ZV9idWZmZXJzOwo+ICAJfQo+ICsKPiArCS8qCj4gKwkgKiBUaGUgd29y
ZCBjb3VudCBvZiB0aGUgV3JpdGUgdG8gQnVmZmVyIGNvbW1hbmQgaXMgYSBzaW5nbGUgYnVzCj4g
KwkgKiB3b3JkIHBlciBkZXZpY2UsIHNvIGFuIHg4IGRldmljZSBjYW4gYmUgdG9sZCB0byBwcm9n
cmFtIGF0IG1vc3QKPiArCSAqIDI1NiBieXRlcyBob3dldmVyIGxhcmdlIGEgYnVmZmVyIGl0IGFk
dmVydGlzZXMgLSBpbmNsdWRpbmcgd2hlbgo+ICsJICogc2V2ZXJhbCBvZiB0aGVtIGFyZSBpbnRl
cmxlYXZlZCBvbiBhIHdpZGVyIGJ1cywgd2hlcmUgQ01EKCkKPiArCSAqIHJlcGxpY2F0ZXMgdGhl
IGNvdW50IGludG8gZWFjaCBkZXZpY2UncyBsYW5lIGFuZCBpdCBpcyB0cnVuY2F0ZWQKPiArCSAq
IHRoZXJlLgo+ICsJICovCj4gKwlpZiAoY2ZpLT5kZXZpY2VfdHlwZSA9PSBDRklfREVWSUNFVFlQ
RV9YOCAmJgo+ICsJICAgIGNmaS0+Y2ZpcS0+TWF4QnVmV3JpdGVTaXplID4gOCkgewo+ICsJCWNm
aS0+Y2ZpcS0+TWF4QnVmV3JpdGVTaXplID0gODsKPiArCQltdGQtPndyaXRlYnVmc2l6ZSA9IGNm
aV9pbnRlcmxlYXZlKGNmaSkgPDwKPiArCQkJCSAgICBjZmktPmNmaXEtPk1heEJ1ZldyaXRlU2l6
ZTsKCklkZWFsbHksIEknZCBsaWtlIGZlZWRiYWNrIGZyb20gVmlnbmVzaCBvbiB0aGlzLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
