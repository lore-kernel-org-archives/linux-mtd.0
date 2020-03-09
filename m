Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5F9C10F29
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228B120873
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KLmSgoyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 228B120873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=569Xa4oRngts8QObNu+ZZn4OufGax67mthR80INL7B4=; b=KLmSgoyFr+TQvp
	i9rVb5KS28vZrstSGWKKxTPnAv86AQkPgf21nAAfeWbjcn6wB1MLIK+jstsfCkEzvOHjPAzUjQafB
	ISXsxi5fTlT5lAX8X2GEt1rBV0ve3rgGnC8cwKKTVdOdGfnggwH/ZLAfRGiKUXtKTFgGsh9VztiSX
	MOaNhP0yQzWsOHbbqNBNzv/6OvwjXdRgYyoSqNecPXzvQqreKL0MFGNF0h+kEpPRXNkUvvZ0fhRa4
	F8LFixJ7Z/MO1+Ko4RysxqDEzuwjfvFy2wOAfHyeBQAinmrS71rQvAYe4ezk2bPBRtnOI166Eu82j
	hsM44YePvvGjijFF0MiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBJIp-0005Uv-BZ; Mon, 09 Mar 2020 14:22:43 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJIm-0005U8-Do
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 14:22:42 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3AA6D60007;
 Mon,  9 Mar 2020 14:22:22 +0000 (UTC)
Date: Mon, 9 Mar 2020 15:22:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200309152221.28dc38ab@xps13>
In-Reply-To: <6125d86fee0c83653cc281b3069e1587@milecki.pl>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_072240_603582_F57674A4 
X-CRM114-Status: GOOD (  21.51  )
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
dGlvbi4KCkNhbiB5b3UgZGV0YWlsIGEgbGl0dGxlIGJpdCB0aGVuPyBCZWNhdXNlIEkgZG9uJ3Qg
c2VlIHRoZSBpc3N1ZSBhbnltb3JlCmV2ZW4gdGhvdWdoIEkgYW0gY29udmluY2VkIHNvbWV0aGlu
ZyBpcyB3cm9uZyBoZXJlIDopCgo+IAo+IAo+ID4gQW55d2F5LCBJIGp1c3QgYXBwbGllZCBvbiBt
eSBsb2NhbCB0cmVlIGEgcGF0Y2ggcmV3cml0aW5nIGEgYml0IHRoZQo+ID4gcGFydGl0aW9uaW5n
IHNjaGVtZSwgY291bGQgeW91IHBsZWFzZSByZWJhc2Ugb24gdG9wIG9mIHRvZGF5J3MKPiA+IG10
ZC9uZXh0IGFuZCByZXNlbmQgdGhpcyBwYXRjaCB1cGRhdGVkPwo+ID4gCj4gPiBIZXJlIGlzIHRo
ZSBjaGFuZ2UgdGhhdCBJJ3ZlIGRvbmUgYXQgdGhpcyBwbGFjZToKPiA+IAktICAgICAgIHRtcCA9
IHBhcnRfYWJzb2x1dGVfb2Zmc2V0KHBhcmVudCkgKyBzbGF2ZS0+bXRkLnNpemU7Cj4gPiAJKyAg
ICAgICB0bXAgPSBtdGRfZ2V0X21hc3Rlcl9vZnMoY2hpbGQsIDApICsgY2hpbGQtPnNpemU7ICAK
PiAKPiBJJ2xsIGdpdmUgaXQgYSB0cnkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
