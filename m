Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D033C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:35:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E490206B8
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="enaW3DHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E490206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vqlMJYtELiOQoxuonCCV4UsPpKe+LGaSRh+QyK7csU=; b=enaW3DHkX7cXMt
	7jaOO1icj7UvS95qhh34XIhPXic1crcg9UfmGIDNQZuz+h0vhdR7ppUjXk5DtJ3Y9Qn2R+RGjzWcY
	Glv52sPs55rGdonC2jE2ouLNFFu6A/ZyTwV0km7jpEG/Uz5GzT7vO+aKdqiX8S9kQUkX0jM6pV91b
	sjR62s9VZOJ2B/g1Avce/gIt4XZtN0mmCeILuZu2dL8+hUZVDrtg8UyS30HDp0cu8O3Ksc7PZhrDw
	A4p/9q1HXa1olfA9ItNg7SJB1X+jKkgckSKaiX8uEIic2/sTaOUBRc2Lvvd+nI03DGmSGHob6M4/d
	FwYJfA7vhegkRtqMZl1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kwW-0001IE-4I; Mon, 04 Mar 2019 10:35:32 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kwT-0001Fo-5t
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 10:35:30 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E74CC1BF204;
 Mon,  4 Mar 2019 10:35:19 +0000 (UTC)
Date: Mon, 4 Mar 2019 11:35:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
Message-ID: <20190304113519.2e102b25@xps13>
In-Reply-To: <20190209192305.4434-8-paul@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-8-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023529_369282_EE4862CE 
X-CRM114-Status: GOOD (  23.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBT
YXQsICA5IEZlYiAyMDE5IDE2OjIzOjA0Ci0wMzAwOgoKPiBUaGUgYm9vdCBST00gb2YgdGhlIEpa
NDcyNUIgU29DIGV4cGVjdHMgYSBzcGVjaWZpYyBPT0IgbGF5b3V0IG9uIHRoZQo+IE5BTkQsIHNv
IHdlIHVzZSBpdCB1bmNvbmRpdGlvbmFsbHkgaW4gdGhlIGluZ2VuaWMtbmFuZCBkcml2ZXIuCj4g
Cj4gQWxzbyBhZGQgdGhlIGp6NDcyNWItYmNoIGRyaXZlciB0byBzdXBwb3J0IHRoZSBKWjQ3MjVC
LXNwZWNpZmljIEJDSAo+IGhhcmR3YXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3Vl
aWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IC0tLQo+IAo+IENoYW5nZXM6Cj4gCj4gdjI6IElu
c3RlYWQgb2YgZm9yY2luZyB0aGUgT09CIGxheW91dCwgbGVhdmUgaXQgdG8gdGhlIGJvYXJkIGNv
ZGUgb3IKPiAgICAgZGV2aWNldHJlZSB0byBkZWNpZGUgaWYgdGhlIGp6NDcyNWItc3BlY2lmaWMg
bGF5b3V0IHNob3VsZCBiZSB1c2VkCj4gICAgIG9yIG5vdC4KPiAKPiB2MzogLSBSZXZlcnQgdGhl
IGNoYW5nZSBpbiB2MiwgYXMgdGhlIHByZXZpb3VzIGJlaGF2aW91ciB3YXMgY29ycmVjdC4KPiAg
ICAgLSBBbHNvIGFkZCBzdXBwb3J0IGZvciB0aGUgaGFyZHdhcmUgQkNIIG9mIHRoZSBKWjQ3MjVC
IGluIHRoaXMKPiAgICAgICBwYXRjaC4KPiAKPiB2NDogLSBBZGQgTU9EVUxFXyogbWFjcm9zCj4g
ICAgIC0gQWRkIHR3ZWFrcyBzdWdnZXN0ZWQgYnkgdXBzdHJlYW0gZmVlZGJhY2sKPiAKPiAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9LY29uZmlnICAgICAgICB8ICAxMCArCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvTWFrZWZpbGUgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZC5jIHwgIDQ4ICsrKystCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYyAgfCAyOTIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDM1MCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9p
bmdlbmljL2p6NDcyNWJfYmNoLmMKPiAKClsuLi5dCgo+ICtzdGF0aWMgaW50IGp6NDcyNWJfY2Fs
Y3VsYXRlKHN0cnVjdCBpbmdlbmljX2VjYyAqYmNoLAo+ICsJCQkgICAgIHN0cnVjdCBpbmdlbmlj
X2VjY19wYXJhbXMgKnBhcmFtcywKPiArCQkJICAgICBjb25zdCB1OCAqYnVmLCB1OCAqZWNjX2Nv
ZGUpCj4gK3sKPiArCWludCByZXQ7Cj4gKwo+ICsJbXV0ZXhfbG9jaygmYmNoLT5sb2NrKTsKPiAr
CXJldCA9IGp6NDcyNWJfYmNoX2luaXQoYmNoLCBwYXJhbXMsIHRydWUpOwoKSSByZWFsbHkgZG9u
J3QgbGlrZSB0aGlzIGJjaF9pbml0IG5hbWUuIEEgQkNIIGluaXRpYWxpemF0aW9uIGlzIHdoYXQg
aXMKc3VwcG9zZWQgdG8gYmUgZG9uZSBvbmx5IG9uY2UgKHByb2JhYmx5IGF0IGJvb3QgdGltZSks
IGNhbiB5b3UgZmluZCBhCmJldHRlciBuYW1lIG9yIGEgYmV0dGVyIG9yZ2FuaXphdGlvbiBvZiB0
aGUgY29ycmVjdC9jYWxjdWxhdGUgcGF0aD8KCj4gKwlpZiAocmV0KSB7Cj4gKwkJZGV2X2Vycihi
Y2gtPmRldiwgIlVuYWJsZSB0byBpbml0IEJDSCB3aXRoIGdpdmVuIHBhcmFtZXRlcnNcbiIpOwo+
ICsJCWdvdG8gb3V0X2Rpc2FibGU7Cj4gKwl9Cj4gKwo+ICsJano0NzI1Yl9iY2hfd3JpdGVfZGF0
YShiY2gsIGJ1ZiwgcGFyYW1zLT5zaXplKTsKPiArCj4gKwlyZXQgPSBqejQ3MjViX2JjaF93YWl0
X2NvbXBsZXRlKGJjaCwgQkNIX0JISU5UX0VOQ0YsIE5VTEwpOwo+ICsJaWYgKHJldCkgewo+ICsJ
CWRldl9lcnIoYmNoLT5kZXYsICJ0aW1lZCBvdXQgd2hpbGUgY2FsY3VsYXRpbmcgRUNDXG4iKTsK
PiArCQlnb3RvIG91dF9kaXNhYmxlOwo+ICsJfQo+ICsKPiArCWp6NDcyNWJfYmNoX3JlYWRfcGFy
aXR5KGJjaCwgZWNjX2NvZGUsIHBhcmFtcy0+Ynl0ZXMpOwo+ICsKPiArb3V0X2Rpc2FibGU6Cj4g
KwlqejQ3MjViX2JjaF9kaXNhYmxlKGJjaCk7Cj4gKwltdXRleF91bmxvY2soJmJjaC0+bG9jayk7
Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKClsuLi5dCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
