Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120FBCD5BD5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPw2ZGFqptAfCFF1sSPzt8pl2N+JNh86U3QK/rt84zE=; b=ASj+9p/iIRQlpL
	gJYTLd/+joWx/ZY61ggK6ZR1FtM+zStHHZPL2ZpoI9MqiyCvPV6f7iynidqutLmcYpbB4aKRhZbWC
	2EadqdJG1XTQaF2im3ArvixSn7z9mk8Yp83jj9Vy6gtC+YS3JUMvqx7xwe3/rVM6QlA7d5aI+SgOp
	/Zc38GXlnnGX3FTUD9HKIWZIbOul4bWvDF/OWdNdwy9MxDQLNmzbGfnhAvuBWOFtjd5ooE2e367cT
	VxsstqVAvmJVMVQ2thJmtfrBBB1mAiOLVAu4DE1EOuHZqVJy3khoaewCcqnQ/RxSp8CL55vw4BdPC
	C3VnB1AYxlKiyPggN9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDOQ-000000045c5-0uYE;
	Wed, 27 May 2026 12:29:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDOM-000000045bE-2c38
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 12:29:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE1304E42D68;
	Wed, 27 May 2026 12:29:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94EDE601A1;
	Wed, 27 May 2026 12:29:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF12C10888060;
	Wed, 27 May 2026 14:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779884982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QZ113z6If22F9e7yLjEYBGa8nC6AiS+7y7cHO6FwrLw=;
	b=TcCuC7b/TXN+rKfVRcGh3hgYCx88DnANr3Ht11vtP3a3dTHDoUEhm48zZvp/HGk+rzrahp
	SksbeZ/R9YwN9diBFa5eMF1DzDu790CLc5/myv594+VUub+tc2hDOLFZaitE8c3q8znsxl
	ntM9vux5zKobcn1710W0qRYnsVzIb4+eeE9VTXA6NJSUdRO5w4N6a53Z0fvEseiFJaZ7rL
	WO56fPDRf2utMqPyYJeEpLAEo9o59Es9VvJYxIxf5NOREkzZJ1pj0RrGbHLLJphd+vYbgi
	XtrXAE/5UHll4VJSkx8LoibBtzY6RcXHjSkM0J+1bkfeeLihL/e3I5XV6GE+lw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Qing Wu <ses1er@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spinand: dosilicon: Add support for additional
 models
In-Reply-To: <20260527100021.76247-1-ses1er@gmail.com> (Qing Wu's message of
	"Wed, 27 May 2026 06:00:21 -0400")
References: <20260527100021.76247-1-ses1er@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 14:29:39 +0200
Message-ID: <87v7c9hw7g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_052946_814069_A3099871 
X-CRM114-Status: GOOD (  11.73  )
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

T24gMjcvMDUvMjAyNiBhdCAwNjowMDoyMSAtMDQsIFFpbmcgV3UgPHNlczFlckBnbWFpbC5jb20+
IHdyb3RlOgoKPiBBZGQgc3VwcG9ydCBmb3IgYWRkaXRpb25hbCBEb3NpbGljb24gU1BJIE5BTkQg
Y2hpcHMuCj4KPiBEYXRhc2hlZXRzIGZvciBjaGlwcyBpbmNsdWRlZCBpbiB0aGlzIHBhdGNoOiBo
dHRwczovL3d3dy5kb3NpbGljb24uY29tL1NQSSUyME5BTkQlMjBGbGFzaC5odG1sCj4KPiBUZXN0
ZWQgb24gYSBUUC1MaW5rIFRMLTdEUjcyNTAgd2l0aCBhIERvc2lsaWNvbiBEUzM1UTFHQiAoMHhF
NSAweEYxKQo+Cj4gU2lnbmVkLW9mZi1ieTogUWluZyBXdSA8c2VzMWVyQGdtYWlsLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gQ2hhbmdlZCB0aXRsZQo+IC0gVXBkYXRlZCAyIGJ5dGVz
IGZvciBCQk0KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDUyMDAwMzczMy44MjUxNC0xLXNlczFlckBnbWFpbC5jb20vCj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IEZpeGVkIGNvbXBpbGF0aW9uIGVycm9ycy4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI2MDIxNzIxMTQyNy45MTIwLTEtc2VzMWVyQGdtYWlsLmNvbQo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9kb3NpbGljb24uYyB8IDIxOCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMDMgaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvZG9z
aWxpY29uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9kb3NpbGljb24uYwo+IGluZGV4IGY5OTg5
OTg2NmNlYi4uZmNkOTY3YzFiY2JjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2Rvc2lsaWNvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvZG9zaWxpY29uLmMKPiBA
QCAtOSwyMSArOSwyNyBAQAo+ICAKPiAgI2RlZmluZSBTUElOQU5EX01GUl9ET1NJTElDT04gICAg
ICAgIDB4RTUKPiAgCj4gKyNkZWZpbmUgRE9TSUNPTl9TVEFUVVNfRUNDX01BU0sJCQlHRU5NQVNL
KDYsIDQpCj4gKyNkZWZpbmUgRE9TSUNPTl9TVEFUVVNfRUNDX05PX0JJVEZMSVBTCQkoMCA8PCA0
KQo+ICsjZGVmaW5lIERPU0lDT05fU1RBVFVTX0VDQ18xVE8zX0JJVEZMSVBTCSgxIDw8IDQpCj4g
KyNkZWZpbmUgRE9TSUNPTl9TVEFUVVNfRUNDXzRUTzZfQklURkxJUFMJKDMgPDwgNCkKPiArI2Rl
ZmluZSBET1NJQ09OX1NUQVRVU19FQ0NfN1RPOF9CSVRGTElQUwkoNSA8PCA0KQo+ICsKPiAgc3Rh
dGljIFNQSU5BTkRfT1BfVkFSSUFOVFMocmVhZF9jYWNoZV92YXJpYW50cywKPiAtCQlTUElOQU5E
X1BBR0VfUkVBRF9GUk9NX0NBQ0hFXzFTXzFTXzRTX09QKDAsIDEsIE5VTEwsIDAsIDApLAo+IC0J
CVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FDSEVfMVNfMVNfMlNfT1AoMCwgMSwgTlVMTCwgMCwg
MCksCj4gLQkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9GQVNUXzFTXzFTXzFTX09QKDAs
IDEsIE5VTEwsIDAsIDApLAo+IC0JCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FDSEVfMVNfMVNf
MVNfT1AoMCwgMSwgTlVMTCwgMCwgMCkpOwo+ICsJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FD
SEVfWDRfT1AoMCwgMSwgTlVMTCwgMCksCj4gKwkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNI
RV9YMl9PUCgwLCAxLCBOVUxMLCAwKSwKPiArCQlTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hF
X09QKHRydWUsIDAsIDEsIE5VTEwsIDApLAo+ICsJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FD
SEVfT1AoZmFsc2UsIDAsIDEsIE5VTEwsIDApKTsKClNwdXJpb3VzIGNoYW5nZXM/IFRoaXMgY2Fu
bm90IGJlIGV2ZW4gY29tcGlsZSB0ZXN0ZWQuCgpQbGVhc2UgZG9uJ3QgcnVzaCB5b3VyIHY0LgoK
QWxzbyBwbGVhc2UgcnVuIGdldF9tYWludGFpbmVycy5wbCwgdGhlIENjIGxpc3QgaXMgbm90IGNv
bXBsZXRlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
