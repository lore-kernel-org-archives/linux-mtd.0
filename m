Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930FBE77172
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwjXq+tWEU2Tl/1fIDBzEgsHHBmYc6LsCjJTeOGZZm0=; b=k836fv6YnOFQWw
	Dmc/brYOt7coXK8ePxIQDbKUtLNDpEXh9K4xUuyM7CNlOcJzUe6ch5wrI8oz1qQjLO+Lp+6+J3zlv
	suWP/VDCL4MQ66OixP9+lPdaDz/PM4LzgfcmqQO7CVCUVUiL3fJT8WFQJKEYBu1aWKGzabp8ANvmP
	9dPGxhIIcPeNSoNip1eCU0GXOYSBzvhzfwUNLIVGW2igmYf1R/RLfrXEpTna1aOO/2KN+nHKuw5jW
	ATbXYF6IWBf4XY0DUpslKg08H08uqPPrp8hwULxuGltDKYuz33JU45n7T1kThoHISN/qVJDv5p6UR
	umY8+1kAAKcIry3k3lqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVo-0000000Fpm8-22vd;
	Thu, 05 Dec 2024 11:59:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Kb-0000000FZwn-2Rv7
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50B80FF80D;
	Thu,  5 Dec 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhvvChap9ZOF4+7oCzotq/RCUZEJw7jw4NJIfwhkUzo=;
	b=PM3PNEOg4sXiuUueXBwTcZpDn7Kd4SK3eld/tb9Ibzg30kaDHjCa+UffCbpBpNyd6x9SkY
	sile5ymQwabW0ApN91TxuL1BZil3W88aIBPEJfGqBsiqhyXj5kwM5dgGX20/BK2ZNU/f7R
	lMpVh05dMcjRh9RkcipXptXDwMdliLeAJ6IyLza7BHjMYzeCUobEAr0lXvPyVVFV76AuSd
	o/+9mLCOPHFNG49t46sdunsm+HmrDDNyQGwh8AO+c+A3khJMzZrgDunXgQYfqCoYKy0Wk4
	mQAMGBY8cVo341KAFDd1VvknJJ8RqauKYm7dHJaCtZ7t4ImOGoYWAkqaMtfXIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: rawnand: omap2: Fix build warnings with W=1
Date: Thu,  5 Dec 2024 11:43:28 +0100
Message-ID: <173339519121.766262.11889443513973056861.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203-omap2-doc-fix-v1-1-f46cd2a5c055@kernel.org>
References: <20241203-omap2-doc-fix-v1-1-f46cd2a5c055@kernel.org>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024337_963157_7CA07D4C 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAwMyBEZWMgMjAyNCAxNTozMzoxNyArMDIwMCwgUm9nZXIgUXVhZHJvcyB3cm90ZToK
PiBBZGQga2VybmVsLWRvYyBmb3IgZnVuY3Rpb25zIHRvIGdldCByaWQgb2YgYmVsb3cgd2Fybmlu
Z3MKPiB3aGVuIGJ1aWx0IHdpdGggVz0xLgo+IAo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAy
LmM6MjYwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnY2hp
cCcgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9uYW5kX2RhdGFfaW5fcHJlZicKPiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9vbWFwMi5jOjI2MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIHN0
cnVjdCBtZW1iZXIgJ2J1Zicgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9uYW5kX2RhdGFfaW5fcHJl
ZicKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jOjI2MDogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2xlbicgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9u
YW5kX2RhdGFfaW5fcHJlZicKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jOjI2MDogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2ZvcmNlXzhiaXQnIG5v
dCBkZXNjcmliZWQgaW4gJ29tYXBfbmFuZF9kYXRhX2luX3ByZWYnCj4gZHJpdmVycy9tdGQvbmFu
ZC9yYXcvb21hcDIuYzozMDQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1Y3Qg
bWVtYmVyICdjaGlwJyBub3QgZGVzY3JpYmVkIGluICdvbWFwX25hbmRfZGF0YV9vdXRfcHJlZicK
PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jOjMwNDogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2J1Zicgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9uYW5k
X2RhdGFfb3V0X3ByZWYnCj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYzozMDQ6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVtYmVyICdsZW4nIG5vdCBkZXNjcmli
ZWQgaW4gJ29tYXBfbmFuZF9kYXRhX291dF9wcmVmJwo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L29t
YXAyLmM6MzA0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAn
Zm9yY2VfOGJpdCcgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9uYW5kX2RhdGFfb3V0X3ByZWYnCj4g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYzo0NDY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBzdHJ1Y3QgbWVtYmVyICdjaGlwJyBub3QgZGVzY3JpYmVkIGluICdvbWFwX25hbmRf
ZGF0YV9pbl9kbWFfcHJlZicKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jOjQ0Njogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2J1Zicgbm90IGRlc2Ny
aWJlZCBpbiAnb21hcF9uYW5kX2RhdGFfaW5fZG1hX3ByZWYnCj4gZHJpdmVycy9tdGQvbmFuZC9y
YXcvb21hcDIuYzo0NDY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVt
YmVyICdsZW4nIG5vdCBkZXNjcmliZWQgaW4gJ29tYXBfbmFuZF9kYXRhX2luX2RtYV9wcmVmJwo+
IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmM6NDQ2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnZm9yY2VfOGJpdCcgbm90IGRlc2NyaWJlZCBpbiAnb21h
cF9uYW5kX2RhdGFfaW5fZG1hX3ByZWYnCj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYzo0
Njc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVtYmVyICdjaGlwJyBu
b3QgZGVzY3JpYmVkIGluICdvbWFwX25hbmRfZGF0YV9vdXRfZG1hX3ByZWYnCj4gZHJpdmVycy9t
dGQvbmFuZC9yYXcvb21hcDIuYzo0Njc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBz
dHJ1Y3QgbWVtYmVyICdidWYnIG5vdCBkZXNjcmliZWQgaW4gJ29tYXBfbmFuZF9kYXRhX291dF9k
bWFfcHJlZicKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jOjQ2Nzogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2xlbicgbm90IGRlc2NyaWJlZCBpbiAn
b21hcF9uYW5kX2RhdGFfb3V0X2RtYV9wcmVmJwo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAy
LmM6NDY3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnZm9y
Y2VfOGJpdCcgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9uYW5kX2RhdGFfb3V0X2RtYV9wcmVmJwo+
IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXdu
YW5kOiBvbWFwMjogRml4IGJ1aWxkIHdhcm5pbmdzIHdpdGggVz0xCgpQYXRjaGUocykgd2lsbCBi
ZSBhdmFpbGFibGUgd2l0aGluIGhvdXJzIG9uOgptdGQvbGludXguZ2l0CgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
