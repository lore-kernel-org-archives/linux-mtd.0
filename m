Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E27C432BE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:02:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A3860EAF
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72A3860EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWXSX4cw3aVUpJgroIKcSMOgoy5MATsvFExhKeAdscQ=; b=VqgYFx9tftLN5Y
	E96OsoxYmS/3vceYXn8Gs9m08gSKAAZp/O6zx8x628uAnxxxdPfyYR1rIZn0ruXN5/Kd+8+FFt8VY
	7EOCclhpu8JmJLjnKmEMjxVEEI/axXtl0CSpWgqUPkVIQHTHFUlZuDadaO4I74qpihE+UJFfUzJI/
	9ND6wzpcyMsrmF5N4rM0Ix2LMwZhIuFq37bUqjjY0e0gjqyDiziZTmAawmvDUwAb2wv3ikvFg2TqE
	kt9dM7XMxIA1pI0MvH9+EnunDbrwLE7xh35lPe4yEpKRh2HCo+M8pv1qex6pOgOV1n/qtw49Er3C7
	Al9GWfreiPdz88w8wgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC56P-00DEbF-7w; Fri, 06 Aug 2021 19:01:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC56L-00DEaI-Tm
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:01:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6F22E40008;
 Fri,  6 Aug 2021 19:01:47 +0000 (UTC)
Date: Fri, 6 Aug 2021 21:01:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 08/13] mtd: spinand: Reject 8D-8D-8D op_templates if
 octal_dtr_enale() is missing in manufacturer_op
Message-ID: <20210806210146.3358a85b@xps13>
In-Reply-To: <20210713130538.646-9-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-9-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_120150_139013_E1EB4816 
X-CRM114-Status: GOOD (  20.63  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjMzCiswMDAwOgoKPiBUaGUgU1BJIE5BTkQgY29yZSBkb2Vzbid0
IGtub3cgaG93IHRvIHN3aXRjaCB0aGUgZmxhc2ggdG8gT2N0YWwgRFRSCj4gbW9kZSAoaS5lLiB3
aGljaCBvcGVyYXRpb25zIHRvIHBlcmZvcm0pLiBJZiB0aGUgbWFudWZhY3R1cmVyIGhhc24ndAo+
IGltcGxlbWVudGVkIHRoZSBvY3RhbF9kdHJfZW5hYmxlKCkgbWFudWZhY3R1cmVyX29wLCB0aGUg
U1BJIE5BTkQgY29yZQo+IHdvdWxkbid0IGJlIGFibGUgdG8gc3dpdGNoIHRvIDhELThELThEIG1v
ZGUgYW5kIHdpbGwgYWxzbyBub3QgYmUgYWJsZQo+IHRvIHJ1biBpbiAxUy0xUy0xUyBtb2RlIGR1
ZSB0byBhbHJlYWR5IHNlbGVjdGVkIDhELThELThEIHJlYWQvd3JpdGUKPiBjYWNoZSBvcF90ZW1w
bGF0ZXMuCj4gCj4gU28sIGF2b2lkIGNob29zaW5nIGEgT2N0YWwgRFRSIFNQSSBvcF90ZW1wbGF0
ZSBmb3IgcmVhZF9jYWNoZSwKPiB3cml0ZV9jYWNoZSBhbmQgdXBkYXRlX2NhY2hlIG9wZXJhdGlv
bnMsIGlmIHRoZSBtYW51ZmFjdHVyZXJfb3AKPiBvY3RhbF9kdHJfZW5hYmxlKCkgaXMgbWlzc2lu
Zy4KCkFmdGVyIGxvb2tpbmcgYXQgeW91ciBwcmV2aW91cyBjb21taXQgSSBkb24ndCBzZWUgd2h5
IHRoaXMgcGF0Y2ggd291bGQKYmUgbmVlZGVkLiBvY3RhbF9kdHJfZW5hYmxlKCkgb25seSB1cGRh
dGVzIHRoZSBtb2RlIHdoZW4gaXQgc3VjY2VlZHMgc28KSSBkb24ndCB0aGluayB0aGlzIHBhdGNo
IGlzIHJlYWxseSBuZWVkZWQuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEt
bmFuZGFuQHRpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgNyAr
KysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gaW5kZXggMTlkOGFmZmFjMDU4Li44NzExZTg4N2I3OTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gQEAgLTEwMjgsNiArMTAyOCw4IEBAIHN0YXRpYyBpbnQgc3Bp
bmFuZF9tYW51ZmFjdHVyZXJfbWF0Y2goc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+
ICAJCWlmIChpZFswXSAhPSBtYW51ZmFjdHVyZXItPmlkKQo+ICAJCQljb250aW51ZTsKPiAgCj4g
KwkJc3BpbmFuZC0+bWFudWZhY3R1cmVyID0gbWFudWZhY3R1cmVyOwo+ICsKPiAgCQlyZXQgPSBz
cGluYW5kX21hdGNoX2FuZF9pbml0KHNwaW5hbmQsCj4gIAkJCQkJICAgICBtYW51ZmFjdHVyZXIt
PmNoaXBzLAo+ICAJCQkJCSAgICAgbWFudWZhY3R1cmVyLT5uY2hpcHMsCj4gQEAgLTEwMzUsNyAr
MTAzNyw2IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9tYW51ZmFjdHVyZXJfbWF0Y2goc3RydWN0IHNw
aW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQljb250aW51ZTsK
PiAgCj4gLQkJc3BpbmFuZC0+bWFudWZhY3R1cmVyID0gbWFudWZhY3R1cmVyOwo+ICAJCXJldHVy
biAwOwo+ICAJfQo+ICAJcmV0dXJuIC1FTk9UU1VQUDsKPiBAQCAtMTA5Nyw2ICsxMDk4LDEwIEBA
IHNwaW5hbmRfc2VsZWN0X29wX3ZhcmlhbnQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
LAo+ICAJCXVuc2lnbmVkIGludCBuYnl0ZXM7Cj4gIAkJaW50IHJldDsKPiAgCj4gKwkJaWYgKHNw
aW5hbmRfb3BfaXNfb2N0YWxfZHRyKCZvcCkgJiYKPiArCQkgICAgIXNwaW5hbmQtPm1hbnVmYWN0
dXJlci0+b3BzLT5vY3RhbF9kdHJfZW5hYmxlKQo+ICsJCQljb250aW51ZTsKPiArCj4gIAkJbmJ5
dGVzID0gbmFuZGRldl9wZXJfcGFnZV9vb2JzaXplKG5hbmQpICsKPiAgCQkJIG5hbmRkZXZfcGFn
ZV9zaXplKG5hbmQpOwo+ICAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
