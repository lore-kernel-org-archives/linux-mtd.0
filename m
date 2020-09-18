Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BBDC43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 09:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FDB621582
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 09:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2KqQOlSE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="VSrQQHgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FDB621582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AS59q/dcVsfMrtS2i1WiKmNQRC+c34sWggcXdpu99mk=; b=2KqQOlSECsJQPfl6CiWRf8gNr
	0tyqhy3O2VEAQkN6gF2giYgZBb2i4AQwfuH5pYRvBADHg9nFcz0Tf64Z/QnJIMML3FKpAEDKEyRkT
	bZiySX/BL9JR7D8fY3FTAqJIZhAzAVLiB7H/i0u17927768tPnTWvWiTHl8a15GwgJ15Xl3LUOVNl
	NChpSntNPDI7EJL1rXaQCYKtFAMnzR5tQiEAdDPAe/ebn/dmqbdtxwWYntbw1gXSz/Ugb1CgBsaHl
	KhZMWIe3Dm7sn/vKCdeL7FqULDNQmtRNvjHofeosgke/NFF+VdJygsiybua52jxIwPJVIyDMqyysB
	IdwdilNuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJCmQ-0003ni-0u; Fri, 18 Sep 2020 09:34:10 +0000
Received: from forward500j.mail.yandex.net ([2a02:6b8:0:801:2::110])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJCmJ-0003ls-PC; Fri, 18 Sep 2020 09:34:05 +0000
Received: from mxback11q.mail.yandex.net (mxback11q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1b4:0:640:1f0c:10f2])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id 0FA6C11C130F;
 Fri, 18 Sep 2020 12:33:59 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback11q.mail.yandex.net (mxback/Yandex) with ESMTP id eq3W2v4oRz-XureGBcn;
 Fri, 18 Sep 2020 12:33:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1600421638; bh=1O20/U9VvPoOlpk22ZaZ/Nmtp1IaGtgIjUSsYzBxYTg=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=VSrQQHgHIr7Yv24kgxMCGQ0vFrcEJGfeSbegC93TSfMj9GmfRXmXj4kM30SCRSXov
 ftL/791HXWa0l4Z/QpkrIEMYawn/OLl9SN3phfPr3BtdhwwirMhaY/om+vSV23OFgL
 bLz4eBu4h0npK7M/FagbAhFTWXeNtNKv/i2GUKDc=
Authentication-Results: mxback11q.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by vla5-dcf36e533bf7.qloud-c.yandex.net with HTTP;
 Fri, 18 Sep 2020 12:33:56 +0300
From: Evgeny Novikov <novikov@ispras.ru>
Envelope-From: eugenenovikov@yandex.ru
To: Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20200917183001.393245e8@xps13>
References: <20200916194045.6378-1-novikov@ispras.ru>
 <20200917183001.393245e8@xps13>
Subject: Re: [PATCH] mtd: rawnand: mtk: avoid underflow in
 mtk_nfc_nand_chip_init()
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 18 Sep 2020 12:33:56 +0300
Message-Id: <14021600420595@mail.yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_053404_253332_5F93651B 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKMTcuMDkuMjAyMCwgMTk6MzAsICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT46Cj4gSGkgRXZnZW55LAo+Cj4gRXZnZW55IE5vdmlrb3YgPG5vdmlr
b3ZAaXNwcmFzLnJ1PiB3cm90ZSBvbiBXZWQsIDE2IFNlcCAyMDIwIDIyOjQwOjQ1Cj4gKzAzMDA6
Cj4KPj4gwqBJZiBvZl9nZXRfcHJvcGVydHkoKSB3aWxsIHNldCBuc2VscyB0byBuZWdhdGl2ZSB2
YWx1ZXMgdGhlIGRyaXZlciBtYXkKPgo+IElzIHRoaXMgcmVhbGx5IGEgcG9zc2libGUgY2FzZT8K
Pgo+IExvb2tpbmcgYXQgdGhlIE9GIGNvZGUsIEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGV2ZXIgaGFw
cGVuLi4uCgpJIGRvIG5vdCBrbm93IHdoZXRoZXIgdGhpcyBpcyBwb3NzaWJsZSBub3cgb3IgaXQg
d2lsbCBiZSBwb3NzaWJsZSBvbmUgZGF5CmluIHRoZSBmdXR1cmUuCgpPdXIgdG9vbCBhc3N1bWVk
IHRoYXQgdGhpcyBjYW4gaGFwcGVuIGFjY29yZGluZyB0byB0aGUgdHlwZSAoaW50KS4KCkFsc28s
IEkgY2FuIG5vdCBmaW5kIGFueSBkcml2ZXIgdGhhdCBtYXkgc3VmZmVyIGZyb20gdGhpcy4gVHdv
IGV4YW1wbGVzCndoZXJlIG5lZ2F0aXZlIGNhc2VzIGFyZSBmb3JiaWRkZW4gaW50ZW50aW9uYWxs
eSBvciB1bmludGVudGlvbmFsbHk6Ci0gZHJpdmVycy9zYnVzL2NoYXIvb3BlbnByb20uYwotIGRy
aXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9kc2kuYwoKQmVzdCByZWdhcmRzLApF
dmdlbnkKCj4+IMKgYWxsb2NhdGUgaW5zdWZmaWNpZW50IG1lbW9yeSBmb3IgY2hpcC4gTW9yZW92
ZXIsIHRoZXJlIG1heSBiZSB1bmRlcmZsb3cKPj4gwqBmb3IgZGV2bV9remFsbG9jKCkuIFRoaXMg
Y2FuIHJlc3VsdCBpbiB2YXJpb3VzIGJhZCBjb25zZXF1ZW5jZXMgbGF0ZXIuCj4+IMKgVGhlIHBh
dGNoIGNhdXNlcyBtdGtfbmZjX25hbmRfY2hpcF9pbml0KCkgdG8gZmFpbCBmb3IgbmVnYXRpdmUg
dmFsdWVzIG9mCj4+IMKgbnNlbHMuCj4+Cj4+IMKgRm91bmQgYnkgTGludXggRHJpdmVyIFZlcmlm
aWNhdGlvbiBwcm9qZWN0IChsaW51eHRlc3Rpbmcub3JnKS4KPj4KPj4gwqBTaWduZWQtb2ZmLWJ5
OiBFdmdlbnkgTm92aWtvdiA8bm92aWtvdkBpc3ByYXMucnU+Cj4+IMKgLS0tCj4+IMKgwqBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgMiArLQo+PiDCoMKgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IMKgZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFu
ZC5jCj4+IMKgaW5kZXggYWQxYjU1ZGFiMjExLi5kZjk4YTJlZWMyNDAgMTAwNjQ0Cj4+IMKgLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+PiDCoCsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L210a19uYW5kLmMKPj4gwqBAQCAtMTM3Niw3ICsxMzc2LDcgQEAgc3RhdGljIGlu
dCBtdGtfbmZjX25hbmRfY2hpcF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG10a19u
ZmMgKm5mYywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1F
Tk9ERVY7Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgbnNlbHMgLz0gc2l6ZW9mKHUzMik7Cj4+
IMKgLSBpZiAoIW5zZWxzIHx8IG5zZWxzID4gTVRLX05BTkRfTUFYX05TRUxTKSB7Cj4+IMKgKyBp
ZiAobnNlbHMgPD0gMCB8fCBuc2VscyA+IE1US19OQU5EX01BWF9OU0VMUykgewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRldiwgImludmFsaWQgcmVnIHBy
b3BlcnR5IHNpemUgJWRcbiIsIG5zZWxzKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+Cj4gVGhh
bmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
