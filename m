Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74285C10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 21:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458522076F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 21:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oh12eS4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458522076F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YoL+oe+sZIgokuNOnEHy2Oq0mcCVc6qlVNKzu2vn2o=; b=oh12eS4a6BJ7Ku
	SjHghK9+TrVLiwOe17cqH/CajQVq5xZ5GhBLyFu0QgJLO9VRGMHTokbHsWqa8mPkViHSfKo0Do69x
	WGrdoy7mGzFr4Z5xDgkr7fjdqZn0LWCo/sGK45xLh+DrHkVXd60qTrW59ggV9dztEuLjNigBSKH57
	I0+SQqcZsKCyFAPEHhd7JK33GsGVPgltgesYfBOGlSqZjYD/uUcqP2RwvrTK422pzghqdS7B+zZWn
	1JtkZmxcOruOlwyjMMYYIn9Mie+hXLUyWsLJ+T+pAbC5yT+TKjGQGiPEwFRS9ihRVHZ7k9+iF+Nci
	U2JTf5E5iG2El/c8MU5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGrZj-00021r-49; Tue, 24 Mar 2020 21:59:07 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGrZf-00021X-Nz
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 21:59:05 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 31020200002;
 Tue, 24 Mar 2020 21:59:01 +0000 (UTC)
Date: Tue, 24 Mar 2020 22:58:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200324225859.56b2a301@xps13>
In-Reply-To: <6125d86fee0c83653cc281b3069e1587@milecki.pl>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_145903_918012_23CF9074 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiB3cm90ZSBvbiBN
b24sIDA5IE1hciAyMDIwIDE1OjE5OjEwCiswMTAwOgoKPiBPbiAyMDIwLTAzLTA5IDE1OjA0LCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29t
PiB3cm90ZSBvbiBNb24sICA5IE1hciAyMDIwIDA4OjQ0OjQ1Cj4gPiArMDEwMDoKPiA+ICAgCj4g
Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiAgCj4gPj4gPj4gVGhp
cyBmaXhlcyBjaGVjayBmb3IgcGFydGl0aW9ucyB0aGF0IGRvbid0IHN0YXJ0IGF0IGJlZ2lubmlu
ZyBvZiB0aGVpciAgCj4gPj4gcGFyZW50cy4gTWlzc2luZyBwYXJ0aXRpb24ncyBvZmZzZXQgaW4g
Zm9ybXVsYSBjb3VsZCByZXN1bHQgaW4gZm9yY2luZwo+ID4+IHJlYWQtb25seSBpbmNvcnJlY3Rs
eS4gIAo+ID4+ID4+IEZpeGVzOiA2NzUwZjYxYTEzYTAgKCJtdGQ6IGltcHJvdmUgY2FsY3VsYXRp
bmcgcGFydGl0aW9uIGJvdW5kYXJpZXMgPj4gd2hlbiBjaGVja2luZyBmb3IgYWxpZ25tZW50Iikg
IAo+ID4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4K
PiA+PiAtLS0KPiA+PiAgZHJpdmVycy9tdGQvbXRkcGFydC5jIHwgMiArLQo+ID4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkgIAo+ID4+ID4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgIAo+ID4+
IGluZGV4IDczMjhjMDY2YzViYS4uYzY4M2I0MzJjYzVlIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZl
cnMvbXRkL210ZHBhcnQuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4+IEBA
IC01MjQsNyArNTI0LDcgQEAgc3RhdGljIHN0cnVjdCBtdGRfcGFydCAqYWxsb2NhdGVfcGFydGl0
aW9uKHN0cnVjdCA+PiBtdGRfaW5mbyAqcGFyZW50LAo+ID4+ICAJCQlwYXJ0LT5uYW1lKTsKPiA+
PiAgCX0gIAo+ID4+ID4+IC0JdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNs
YXZlLT5tdGQuc2l6ZTsgIAo+ID4+ICsJdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50
KSArIHNsYXZlLT5vZmZzZXQgKyA+PiBzbGF2ZS0+bXRkLnNpemU7ICAKPiA+IAo+ID4gSSB0aGlu
ayB5b3UgYXJlIGRvaW5nIHRoZSBjaGFuZ2UgYXQgdGhlIHdyb25nIHBsYWNlLCBpZiB5b3Ugd2Fu
dCB0bwo+ID4gY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3RhcnRzKiB5b3Ugc2hvdWxkIGRv
IGl0IGEgZmV3IGxpbmVzIGFib3ZlLgo+ID4gQnV0IEkgdGhpbmsgdGhlIGNoZWNrIHNob3VsZCBi
ZSBoZXJlIGFzIHdlbGwsIHByb2JhYmx5LiAgCj4gCj4gVGhlIGNoZWNrIHdoZXJlIHRoZSBwYXJ0
aXRpb24gKnN0YXJ0cyogaXMgT0sgYW5kIEkgZG9uJ3QgbWVhbiB0byBjaGFuZ2UKPiBpdC4gVGhl
IGJ1ZyBpcyBhYm91dCBjYWxjdWxhdGluZyBhYnNvbHV0ZSAqZW5kKiBhZGRyZXNzIG9mIHBhcnRp
dGlvbi4KPiAKPiAKPiA+IEFueXdheSwgSSBqdXN0IGFwcGxpZWQgb24gbXkgbG9jYWwgdHJlZSBh
IHBhdGNoIHJld3JpdGluZyBhIGJpdCB0aGUKPiA+IHBhcnRpdGlvbmluZyBzY2hlbWUsIGNvdWxk
IHlvdSBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiB0b2RheSdzCj4gPiBtdGQvbmV4dCBhbmQgcmVz
ZW5kIHRoaXMgcGF0Y2ggdXBkYXRlZD8KPiA+IAo+ID4gSGVyZSBpcyB0aGUgY2hhbmdlIHRoYXQg
SSd2ZSBkb25lIGF0IHRoaXMgcGxhY2U6Cj4gPiAJLSAgICAgICB0bXAgPSBwYXJ0X2Fic29sdXRl
X29mZnNldChwYXJlbnQpICsgc2xhdmUtPm10ZC5zaXplOwo+ID4gCSsgICAgICAgdG1wID0gbXRk
X2dldF9tYXN0ZXJfb2ZzKGNoaWxkLCAwKSArIGNoaWxkLT5zaXplOyAgCj4gCj4gSSdsbCBnaXZl
IGl0IGEgdHJ5LgoKSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHlvdXIgZml4IHRoaXMgd2VlaywgZG8g
eW91IHRoaW5rIHlvdSBjYW4gcmViYXNlCmFuZCByZXNlbmQgc29vbj8KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
