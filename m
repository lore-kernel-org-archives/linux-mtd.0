Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C446C88E70
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 12:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEfOxpQgfheriNnNhy94vBAC8Rx9bzL8Souswu1gQwI=; b=WSh76jun3wsLkU
	1sAbDZOUFE6NlNT1+WwTZHKczdGEOd+HsbS73wH9Ur5MyWLcko5HEDQpgJvX8ID7eqfyT51/FwQI8
	3uqh/6+uAGyCsmZ8arVVYARqdWLVVpXhw35Zg1SO8NvuqBGr2mHfVEpbJPXGBgIGQry3oH6HEQeTj
	5UpnilcOzAxyZJdMmuvZm3IAFqypgf2r6rNjY9+4WKkTfc7OwUcuPz6OP8cpiqtweXTfd1UwM3L8V
	6KKRzTMjembx1zMhO0GhLe4mjvqnPk6y30fBJ5jXBpQinQHkr2QdWiwhuZB2rmjEvNKwxUKgdUNFM
	Yf6m3Zn2O9LNUR9oRpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65ee-00000003VpO-359A;
	Mon, 14 Sep 2026 12:19:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65eW-00000003Vi6-2T9S
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 12:19:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5762A1A0635;
	Mon, 14 Sep 2026 12:19:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1D560323;
	Mon, 14 Sep 2026 12:19:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55AEE11C7AFEC;
	Mon, 14 Sep 2026 14:19:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789388347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=okg6YUvbJfQyTjw8b4yIFAJ6zweKF8RLdit5ouRtvwA=;
	b=mvPXp8oUQwSYwYrF7tDalA1c1hawfCbb6Bc4VFavuPRIvyk//HB4djgkNcY4VRLlY9oShr
	Tf1FO2vGjSkiEP8p7X6YhLFWEdnMDbCSH1V3zlVbWDxpcC564UDnw1XHn1XRQ4oTnII8sE
	oPdtINBYYBiB8wjxdBFbckGZm85igt8Sg83v5FmnBBpdnIEAG+BCbkw+i7PA8JZVkbUGO+
	a3BKusMG4mw5rGZvgKXCIOBbJwo6dZ2yebHlqbWIfcD0eMg/hqaHim89ib4sz+VvO9h6S+
	pD4p4f4nuAdEuefQboPtcUyUOIc1hzsdtkKkxsOStzV77fLOTESLAVSIyDzrzg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Itai Handler <itai.handler@gmail.com>
Cc: mwalle@kernel.org,  pratyush@kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  takahiro.kuwano@infineon.com
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: take the flash lock in
 spi_nor_remove()
In-Reply-To: <20260914081149.1916589-4-itai.handler@gmail.com> (Itai Handler's
	message of "Mon, 14 Sep 2026 11:11:49 +0300")
References: <20260914081149.1916589-1-itai.handler@gmail.com>
	<20260914081149.1916589-4-itai.handler@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 14:19:04 +0200
Message-ID: <87a4pkowjr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_051916_812630_28AA08D8 
X-CRM114-Status: GOOD (  22.88  )
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

T24gMTQvMDkvMjAyNiBhdCAxMToxMTo0OSArMDMsIEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IHNwaV9ub3JfcmVtb3ZlKCkgcmVzdG9yZXMgdGhlIGFkZHJl
c3NpbmcgbW9kZSB3aXRoIHRoZSBzYW1lIHVubG9ja2VkCj4gY2FsbCB0byBzcGlfbm9yX3Jlc3Rv
cmUoKSB0aGF0IHNwaV9ub3Jfc2h1dGRvd24oKSB1c2VkIGJlZm9yZSB0aGUKPiBwcmV2aW91cyBw
YXRjaCwgYW5kIGl0IGlzIGV4cG9zZWQgdGhlIHNhbWUgd2F5OiB0aGUgTVREIGRldmljZSBpcyBz
dGlsbAo+IHJlZ2lzdGVyZWQgYXQgdGhhdCBwb2ludCwgc28gYW4gdW5iaW5kIGNhbiBydW4gdGhl
IHJlc3RvcmUgd2hpbGUgYW5vdGhlcgo+IHRocmVhZCBpcyBpbiB0aGUgbWlkZGxlIG9mIGFuIG9w
ZXJhdGlvbi4gQSBidXN5IGZsYXNoIHNpbGVudGx5IGlnbm9yZXMKPiB0aGUgcmVzdG9yZSwgYW5k
IGEgcmVzdG9yZSB0aGF0IGxhbmRzIGJldHdlZW4gdHdvIGNodW5rcyBvZiBhIHJlYWQKPiBzd2l0
Y2hlcyB0aGUgY2hpcCB0byAzLWJ5dGUgYWRkcmVzc2luZyB3aGlsZSB0aGUgZHJpdmVyIGtlZXBz
IHNlbmRpbmcKPiA0IGFkZHJlc3MgYnl0ZXMuCj4KPiBNb3ZpbmcgdGhlIHJlc3RvcmUgYWZ0ZXIg
bXRkX2RldmljZV91bnJlZ2lzdGVyKCkgd291bGQgbm90IGZpeCB0aGlzLgo+IFNpbmNlIGNvbW1p
dCAxOWJmYTllYmViYjUgKCJtdGQ6IHVzZSByZWZjb3VudCB0byBwcmV2ZW50IGNvcnJ1cHRpb24i
KQo+IGRlbF9tdGRfZGV2aWNlKCkgZHJvcHMgYSByZWZlcmVuY2UgaW5zdGVhZCBvZiByZWZ1c2lu
ZyB3aXRoIC1FQlVTWSB3aGVuCj4gdGhlIGRldmljZSBpcyBpbiB1c2UsIHNvIHVucmVnaXN0ZXJp
bmcgcmV0dXJucyByaWdodCBhd2F5IGFuZCBkb2VzIG5vdAo+IHdhaXQgZm9yIGFuIG9wZXJhdGlv
biB0aGF0IGlzIGFscmVhZHkgcnVubmluZy4KPgo+IFRha2Ugbm9yLT5sb2NrIGZvciB0aGUgcmVz
dG9yZSwgYXMgc3BpX25vcl9zaHV0ZG93bigpIG5vdyBkb2VzLiBUaGUKPiB1bnJlZ2lzdGVyIHN0
YXlzIHVuY29uZGl0aW9uYWwsIHNvIGEgZmxhc2ggd2hvc2UgcmVzdG9yZSBoYWQgdG8gYmUKPiBz
a2lwcGVkIGlzIHN0aWxsIHRvcm4gZG93bi4KPgo+IEZpeGVzOiA1OWIzNTZmZmQwYjAgKCJtdGQ6
IG0yNXA4MDogcmVzdG9yZSB0aGUgc3RhdHVzIG9mIFNQSSBmbGFzaCB3aGVuIGV4aXRpbmciKQo+
IFNpZ25lZC1vZmYtYnk6IEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVyQGdtYWlsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4g
aW5kZXggNjQ3YmY4ZGNlNzE5Li44ZDAzMDI1NjU0NDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBA
IC0zODUyLDggKzM4NTIsMTQgQEAgc3RhdGljIGludCBzcGlfbm9yX3Byb2JlKHN0cnVjdCBzcGlf
bWVtICpzcGltZW0pCj4gIHN0YXRpYyBpbnQgc3BpX25vcl9yZW1vdmUoc3RydWN0IHNwaV9tZW0g
KnNwaW1lbSkKPiAgewo+ICAJc3RydWN0IHNwaV9ub3IgKm5vciA9IHNwaV9tZW1fZ2V0X2RydmRh
dGEoc3BpbWVtKTsKPiArCWludCByZXQ7Cj4gIAo+IC0Jc3BpX25vcl9yZXN0b3JlKG5vcik7Cj4g
KwkvKiBBcyBpbiBzcGlfbm9yX3NodXRkb3duKCksIGRvIG5vdCByZXN0b3JlIHVuZGVyIGFuIG9w
ZXJhdGlvbi4gKi8KPiArCXJldCA9IHNwaV9ub3JfcHJlcF9hbmRfbG9jayhub3IpOwo+ICsJaWYg
KCFyZXQpIHsKPiArCQlzcGlfbm9yX3Jlc3RvcmUobm9yKTsKPiArCQlzcGlfbm9yX3VubG9ja19h
bmRfdW5wcmVwKG5vcik7Cj4gKwl9CgpXaHkgaXNuJ3QgdGhpcyBmb2xkZWQgaW50byBwYXRjaCAy
PyBZb3UgYXJlIGZpeGluZyB0aGUgc2FtZSByYWNlLCBidXQKeW91IGRvIGl0IGluIHR3byBzdGVw
cyB3aGljaCBtYWtlcyBzdGVwIDEgaW5jb21wbGV0ZS4gSSBkb24ndCBnZXQgaXQuCgpZb3UgYXJl
IG1ha2luZyB0aGluZ3Mgb3Zlcmx5IGNvbXBsaWNhdGVkIGZvciBubyByZWFzb24uIFlvdSBjb21t
aXQgbG9ncwphcmUgb3Zlcmx5IHZlcmJvc2UgYW5kIHRoZSBjb21tZW50cyBhcmUgYWxzbyBzdXBl
cmZsdW91cy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
