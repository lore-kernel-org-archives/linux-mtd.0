Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40779EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vILMiTQkmZv4ZykP/gaxO2LLLeu2WpT/dMwXokF0rok=; b=zCB85dQnK9RwWv
	Xzrwj6B1LyfrxfWtzwtElfZfegwBvZY0W1NNQgHlS8uwq0vwqYX+9lhGhwtHftP2B0Ic1WoipBVlz
	tl2hsufbNSKmRNG8c5OFF18M3KNyhueKU+vJv8Oh8BJr9Sq8fsR5ZL+X2Z+iAsrtiPwsAlfVu0q6r
	YtxHIXhAE5pdT3Re3h9jueEh6Kzs91gjIBT8RFHGaGfJ5G4sk3LvP1bnldnxrP3kLoK7gpfKpPDGG
	kUyUFXyo7HRFmstdFl1CV0X3ga5HvAtINmWsp+L+c7MKJdUBG62AfToSNIt50DbArPBlkMATVq/Ap
	Dp9b71pOrrQF3zusupzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYR1-00HSkG-3B;
	Wed, 12 Jul 2023 11:55:08 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYQy-00HSiY-0C;
	Wed, 12 Jul 2023 11:55:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A21881C000B;
	Wed, 12 Jul 2023 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689162898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UII/wsuuzjNZbpiAVeF6yDZcHsS9cuVB0V5RDHl93hA=;
	b=jwaWI0SF7ZVsRx+L0joo3eYJtnmAqCUL2W8brhepKTSZTXHTvzeDDGoWe9ZiQsiMDUwf7t
	hkFkCd5CO0qV7DbICAuhmh0+Uf08FN7I5YFKiEvtvnquH7CtW2B2KnKOBeP1Hq7jzhvmzA
	316H3iefNRuN+nCWQY2l2T5BtUVu7Z6Smpt69xG9Z/yN2irBcGatyWeBzXLo1bqrlALgH6
	s4tOCgd8K3mDSeojM7Ja/l/IcnCbxb39aVAxn366LEqokJ0Uea6mvUXij+l/n4uKeuFHM4
	kyqMGliKSaKvuYYq2U+w16qkX7QNyEMYFsLBaK8GNLvj3QelxNM5d/FJGPwMOg==
Date: Wed, 12 Jul 2023 13:54:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712135455.71fbeb5f@xps-13>
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_045504_426674_A19BFF42 
X-CRM114-Status: GOOD (  15.89  )
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

SGkgWWFuZ3RhbywKCmZyYW5rLmxpQHZpdm8uY29tIHdyb3RlIG9uIEZyaSwgIDcgSnVsIDIwMjMg
MTI6MDY6MDUgKzA4MDA6Cgo+IENvbnZlcnQgcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCksIGRldm1f
aW9yZW1hcF9yZXNvdXJjZSgpIHRvIGEgc2luZ2xlCj4gY2FsbCB0byBkZXZtX3BsYXRmb3JtX2dl
dF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgpLCBhcyB0aGlzIGlzIGV4YWN0bHkKPiB3aGF0IHRoaXMg
ZnVuY3Rpb24gZG9lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2
aXZvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIHwgMyAr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBpbmRleCA5ODg0MzA0NjM0ZjYuLmRiMzZiZDc1
NWI4ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBAQCAtMjA4Nyw4ICsyMDg3
LDcgQEAgc3RhdGljIGludCBzdW54aV9uZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgCW5hbmRfY29udHJvbGxlcl9pbml0KCZuZmMtPmNvbnRyb2xsZXIpOwo+ICAJSU5J
VF9MSVNUX0hFQUQoJm5mYy0+Y2hpcHMpOwo+ICAKPiAtCXIgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+IC0JbmZjLT5yZWdzID0gZGV2bV9pb3JlbWFw
X3Jlc291cmNlKGRldiwgcik7Cj4gKwluZmMtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2dldF9hbmRf
aW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwLCAmcik7CgpXaHkgZG8geW91IGtlZXAgYSByZWZlcmVu
Y2Ugb3ZlciB0aGUgcmVzb3VyY2U/IFdoeSBub3QganVzdApkZXZtX3BsYXRmb3JtX2lvcmVtYXBf
cmVzb3VyY2UocGRldiwgMCkgPwoKVGhpcyBjb21tZW50IGlzIHZhbGlkIGZvciBhbG1vc3QgYWxs
IHRoZSBjYXNlcyBpbiB0aGlzIHNlcmllcy4KCldoZW4gdGhlIHJlc291cmNlIGlzIG9ubHkgbmVl
ZGVkIGluIGFuIGVycm9yIHByaW50aywgSSBhbSBhbHNvIGluIGZhdm9yCm9mIG1vZGlmeWluZyB0
aGUgZXJyb3IgbWVzc2FnZSB0byBhdm9pZCBoYXZpbmcgdG8gZ3JhYiB0aGUgcmVzb3VyY2UuCgo+
ICAJaWYgKElTX0VSUihuZmMtPnJlZ3MpKQo+ICAJCXJldHVybiBQVFJfRVJSKG5mYy0+cmVncyk7
Cj4gIAoKVGhlc2UgY29tbWVudHMgYXBwbHkgdG8gdGhlIDE4IHBhdGNoZXMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
