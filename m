Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50BD606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yT85ZUU2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dVL28C5M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r0xtOlBd4+dKt93TujUroQvx4zvX3PpIPLuTA6+OjzE=; b=yT85ZUU27b3L6ullHG6yFZatxN
	wVjPCOVa98x25DAqj3u/EJ3kFXw5/fcenb6p44G0bz2qw1XrSeHkoLQJQQpf/J43FYbiZ+9BaLTIJ
	kTcWaMHEqxbk9DgAvEfcRjKiqYlBfsfROLCGG+GvqzsdZSbPvLjaNXO8BGJadb8Odcqm/aRBjHw5A
	xLYv6r5BiT4Yh661yrhZjQmoKKyj9O7SOslwUcjTF86HgrbbSo9/CGiw1UNx0ITtXaZ0TN+dc6OX7
	YEA7NpTJt6yVpeJOJPjqUg6xtdHvp8sc3XiTer0sPeIKF2r44I7vM4Q/ZvNg5VHIxW2Qzc7VrINsI
	leRgKPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgXS-000000095Az-3xiJ;
	Wed, 18 Nov 2026 14:21:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgXO-000000095AE-4700
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 14:21:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 81B6F4E4162A;
	Wed, 18 Nov 2026 14:21:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DF1B5FE9B;
	Wed, 18 Nov 2026 14:21:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4B4F11BC220F;
	Wed, 18 Nov 2026 15:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795011682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=koOA3+uyeaO+yGsJ2lbzCEqTAi1LlA5ojHCIwS8nkFo=;
	b=dVL28C5M1iHlKNScWIc5QWCr1TK41/mIj/V2RhQms8jF7udysTvfZ4qv5gXHQWnKKHvjji
	716dw/wiRDCo4DdhCb+X9kRImFyzJLmLNVc2BCSSCJ2Fhx9UbVlLVWTVHw/FVFx+4nO0a3
	KItzbMPit9xC2YA7EA4nvyN+o5LWK/iYTbFRL4FAKkHP+qtLYFxkcxS7oVIuASJIjFM5LK
	txYyTmtCN/cxpcbTHyMCx3Ey73rNzuz6wslYr5OgDyfZE50r+9iEQnp/Okyq3Y76DCJjRJ
	HMzpq08hP2mymX3psfhnf+0/QkQpZarZ6XuJxgXP2OP3Mh5Yur0a2o2DQn7c0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <michael@walle.cc>
Cc: <haibo.chen@oss.nxp.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Michael Walle" <mwalle@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <imx@lists.linux.dev>,  "Haibo Chen" <haibo.chen@nxp.com>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH v5] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
In-Reply-To: <DMYBR7I0R1PK.25FUNB24SPCFS@walle.cc> (Michael Walle's message of
	"Wed, 18 Nov 2026 13:10:38 +0100")
References: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
	<DMYBR7I0R1PK.25FUNB24SPCFS@walle.cc>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 15:21:17 +0100
Message-ID: <87h5hei5k2.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062127_166656_2EE6444B 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTgvMTEvMjAyNiBhdCAxMzoxMDozOCArMDEsICJNaWNoYWVsIFdhbGxlIiA8bWljaGFlbEB3
YWxsZS5jYz4gd3JvdGU6Cgo+IE9uIEZyaSBPY3QgMjMsIDIwMjYgYXQgOToxMSBBTSBDRVNULCBo
YWliby5jaGVuIHdyb3RlOgo+PiBGcm9tOiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+
Cj4+Cj4+IFRoZSBjb3JlIGRlZmF1bHRzIG9wY29kZXMucmVhZF9zcjIgdG8gdGhlIGxlZ2FjeSBS
RENSIG9wY29kZSAoMHgzNSksIGFuZAo+PiBzcGlfbm9yX2NhY2hlX3NyX2xvY2tfYml0cygpIHJl
YWRzIFNSMiBkdXJpbmcgc3BpX25vcl9pbml0KCksIGkuZS4gYWZ0ZXIKPj4gdGhlIGZsYXNoIGhh
cyBiZWVuIHN3aXRjaGVkIHRvIGl0cyBydW50aW1lIHByb3RvY29sLiBPbiBhbiBvY3RhbCBmbGFz
aAo+PiBydW5uaW5nIGluIDhELThELThEIG1vZGUgdGhlIG9wY29kZSBpcyBleHRlbmRlZCBwZXIg
Y21kX2V4dF90eXBlIChlLmcuCj4+IDB4MzUzNSksIGJ1dCBSRENSIGlzIG5vdCBhIHZhbGlkIHJl
Z2lzdGVyIHJlYWQgdGhlcmU6IHRoZXNlIHBhcnRzIGFjY2Vzcwo+PiB0aGVpciBzdGF0dXMvY29u
ZmlndXJhdGlvbiByZWdpc3RlcnMgdGhyb3VnaCBhIHZlbmRvci1zcGVjaWZpYyBpbmRpcmVjdAo+
PiBzcGFjZSwgaWYgYXQgYWxsLiBUaGUgZmxhc2ggZG9lcyBub3QgYW5zd2VyLCB0aGUgcmVnaXN0
ZXIgcmVhZCB0aW1lcyBvdXQKPj4gYW5kIHByb2JlIChvciByZXN1bWUpIGZhaWxzIChvbiBpLk1Y
IEZsZXhTUEk6IC1FVElNRURPVVQgYW5kIGEgY29udHJvbGxlcgo+PiBXQVJOKCksIHNlZW4gd2l0
aCBhIE1pY3JvbiBNVDM1WFUwMUcgYW5kIGEgTWFjcm9uaXggTVgyNVVXNTEzNDVHKS4KPj4KPj4g
Q2xlYXIgcmVhZF9zcjIgb24gZXZlcnkgcGF0aCB0aGF0IGVuYWJsZXMgOEQtOEQtOEQsIHNvIHRo
YXQKPj4gc3BpX25vcl9yZWFkX3NyMV9hbmRfc3IyKCkgZGVncmFkZXMgdG8gYW4gU1IxLW9ubHkg
cmVhZCBhbmQgbm8KPj4gdW5zdXBwb3J0ZWQgY29tbWFuZCBpcyBpc3N1ZWQuIEEgbWFudWZhY3R1
cmVyIGRyaXZlciB0aGF0IGdlbnVpbmVseQo+PiBuZWVkcyBhbiBTUjIgcmVhZCBpbiB0aGlzIG1v
ZGUgY2FuIHN0aWxsIGluc3RhbGwgaXRzIG93biBvcGNvZGUgaW4gYQo+PiBsYXRlciBmaXh1cC4K
Pj4KPj4gLSBzcGlfbm9yX3BhcnNlX3Byb2ZpbGUxKCk6IHRoZSBjb21tb24gY2FzZS4gVGhlIHhT
UEkgUHJvZmlsZSAxLjAgdGFibGUKPj4gICBkb2VzIG5vdCBkZXNjcmliZSBhbnkgU1IyL1JEQ1Ig
cmVhZCwgYW5kIGl0IHJ1bnMgYmVmb3JlIHRoZQo+PiAgIG1hbnVmYWN0dXJlciBsYXRlX2luaXQu
Cj4+IC0gbXQzNXh1NTEyYWJhX3Bvc3Rfc2ZkcF9maXh1cCgpOiBzb21lIG10MzV4dTUxMmFiYSBi
YXRjaGVzIGxhY2sgdGhlCj4+ICAgUHJvZmlsZSAxLjAgdGFibGUgYW5kIGVuYWJsZSA4RCBoZXJl
IGluc3RlYWQsIHdpdGggdGhlIEJGUFQgUUVSIGZpZWxkCj4+ICAgbGVmdCBhdCBhIHJlc2VydmVk
IHZhbHVlIHNvIHJlYWRfc3IyIGtlZXBzIGl0cyBSRENSIGRlZmF1bHQuCj4+IC0gc3BpX25vcl9u
b19zZmRwX2luaXRfcGFyYW1zKCk6IG5vbi1TRkRQIHBhcnRzIHRoYXQgZW5hYmxlIDhEIHZpYQo+
PiAgIFNQSV9OT1JfT0NUQUxfRFRSX1JFQUQga2VlcCB0aGUgUkRDUiBkZWZhdWx0IHRvby4KPj4K
Pj4gQ01QICh0aGUgb25seSB1c2VyIG9mIFNSMiBiZXlvbmQgcXVhZC1lbmFibGUgaW4gdGhlIGxv
Y2tpbmcgY29kZSkgaXMKPj4gV2luYm9uZC1zcGVjaWZpYyBhbmQgaXMgbm90IHBsYWNlZCBpbiBT
UjIgb24gdGhlaXIgOEQtY2FwYWJsZSBwYXJ0cywgc28KPj4gbm8gb2N0YWwgZmxhc2ggbG9zZXMg
YSB1c2FibGUgU1IyIHJlYWQgYmVjYXVzZSBvZiB0aGlzIGNoYW5nZS4KPj4KPj4gRml4ZXM6IDYz
NDg5MDAyZDM5NyAoIm10ZDogc3BpLW5vcjogUmVmYWN0b3IgUmVhZCBTdGF0dXMvV3JpdGUgU3Rh
dHVzIHN1cHBvcnQiKQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2Zm
LWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+Cj4+IFJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Cj4KPiBNaXF1ZWwsIGlmIHlv
dSB3YW50IHRvIHBpY2sgaXQgeW91cnNlbGYgZm9yIGZpeGVzLCBvdGhlcndpc2UgSSBjYW4KPiBh
bHNvIHB1c2ggaXQgdGhlcmUuCj4KPiBJbiBhbnkgY2FzZSwKPgo+IEFja2VkLWJ5OiBNaWNoYWVs
IFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KClNvcnJ5LCBJJ20gdXNlZCB0byBiZSB0aGUgb25s
eSBvbmUgZG9pbmcgdGhhdCBqb2IuIFBsZWFzZSBkbyBpdC4KCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
