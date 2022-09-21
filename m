Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45098C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoGMZGFfE1eAZoEm+9yDTdFKxjSoxNU7HumLs9roG60=; b=RKZwQ0iqv1XYYs
	yK6j4KTB1dDVbEP/aHQ4XNzUWAyJsIrjLmWnJLe/xI7jSF1HJH5MAiQkMYhhgiiS4DT7XXQ95sURY
	bCdV2l3bZw0Fw82rERxdBTmnI6aL5CE/E7u+e9/3tBGoqsiNPk+zJlD5tdfGHWlVK8JTFM2sZI7vK
	TAQQEWEQMjFk0bJhfyrU/BPIW/3Z9VwxcFWuPfvzOqxluxlpb5hi4Zbx+ECa2K5NWPkMz/Nbwuh1h
	3gSH4E+ABv4NTTObFBXTKUMPRxTPhhYAvTsMwvpNbkTjGQjTmAoL55kzeGHoC9bpYcTXDt+lCSTWJ
	a6bt1kWOH4GALM0QMV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavLW-00A4WS-Ek; Wed, 21 Sep 2022 08:44:42 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavHj-00A2XK-Ij
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2022 08:40:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8D635C000F;
	Wed, 21 Sep 2022 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663749644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+rS/AKkAYbBzzWbOJ5NVDxMpAQb84AdS+LGtfvMNDM=;
	b=DZjZVqe8vEXOSmL6KkF0P90xqGXYCLDnpC7PDHEwfCPFoX0wE7wzqjeISmBAeUyjXIzmQj
	UI5BLLWKxMDSlViDw/Mj7n5mg7mPIgdAkOzGu16Pzwbt6WeDs806Ssjl6gmeF3gvC5ikP3
	cZs0oyYDlcc4+YHKz+0ELfDQNRw/qlhLN+BFc36V3VzItuQG5/Nu4kZRpRTTggB4864QX5
	trO1E4dnG7WllY6Tlpf+yct+hBWHJ8dEKxUl6YWp/cVqtqZR7K2D77YMHRkgxzpsQJm4GO
	MLWAyP7CyBSP1Vf5l8XI13MJltPhtVoIRqlXbPvRzbnSV6/zwRHj+TnB+c3s/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mtdchar: add MEMREAD ioctl
Date: Wed, 21 Sep 2022 10:40:38 +0200
Message-Id: <20220921084038.733213-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629125737.14418-5-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'095bb6e44eb17da2cf95dbde9c83b44664a493f5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_014047_960317_1D242405 
X-CRM114-Status: GOOD (  24.57  )
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

T24gV2VkLCAyMDIyLTA2LTI5IGF0IDEyOjU3OjM3IFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IFVzZXItc3BhY2UgYXBwbGljYXRpb25zIG1ha2luZyB1
c2Ugb2YgTVREIGRldmljZXMgdmlhIC9kZXYvbXRkKgo+IGNoYXJhY3RlciBkZXZpY2VzIGN1cnJl
bnRseSBoYXZlIGxpbWl0ZWQgY2FwYWJpbGl0aWVzIGZvciByZWFkaW5nIGRhdGE6Cj4gCj4gICAt
IG9ubHkgZGVwcmVjYXRlZCBtZXRob2RzIG9mIGFjY2Vzc2luZyBPT0IgbGF5b3V0IGluZm9ybWF0
aW9uIGV4aXN0LAo+IAo+ICAgLSB0aGVyZSBpcyBubyB3YXkgdG8gZXhwbGljaXRseSBzcGVjaWZ5
IE1URCBvcGVyYXRpb24gbW9kZSB0byB1c2U7IGl0Cj4gICAgIGlzIGF1dG8tc2VsZWN0ZWQgYmFz
ZWQgb24gdGhlIE1URCBmaWxlIG1vZGUgKE1URF9GSUxFX01PREVfKikgc2V0Cj4gICAgIGZvciB0
aGUgY2hhcmFjdGVyIGRldmljZTsgaW4gcGFydGljdWxhciwgdGhpcyBwcmV2ZW50cyB1c2luZwo+
ICAgICBNVERfT1BTX0FVVE9fT09CIGZvciByZWFkcywKPiAKPiAgIC0gYWxsIGV4aXN0aW5nIHVz
ZXItc3BhY2UgaW50ZXJmYWNlcyB3aGljaCBjYXVzZSBtdGRfcmVhZCgpIG9yCj4gICAgIG10ZF9y
ZWFkX29vYigpIHRvIGJlIGNhbGxlZCAodmlhIG10ZGNoYXJfcmVhZCgpIGFuZAo+ICAgICBtdGRj
aGFyX3JlYWRfb29iKCksIHJlc3BlY3RpdmVseSkgcmV0dXJuIHN1Y2Nlc3MgZXZlbiB3aGVuIHRo
b3NlCj4gICAgIGZ1bmN0aW9ucyByZXR1cm4gLUVVQ0xFQU4gb3IgLUVCQURNU0c7IHRoaXMgcmVu
ZGVycyB1c2VyLXNwYWNlCj4gICAgIGFwcGxpY2F0aW9ucyB1c2luZyB0aGVzZSBpbnRlcmZhY2Vz
IHVuYXdhcmUgb2YgYW55IGNvcnJlY3RlZAo+ICAgICBiaXRmbGlwcyBvciB1bmNvcnJlY3RhYmxl
IEVDQyBlcnJvcnMgZGV0ZWN0ZWQgZHVyaW5nIHJlYWRzLgo+IAo+IE5vdGUgdGhhdCB0aGUgZXhp
c3RpbmcgTUVNV1JJVEUgaW9jdGwgYWxsb3dzIHRoZSBNVEQgb3BlcmF0aW9uIG1vZGUgdG8KPiBi
ZSBleHBsaWNpdGx5IHNldCwgYWxsb3dpbmcgdXNlci1zcGFjZSBhcHBsaWNhdGlvbnMgdG8gd3Jp
dGUgcGFnZSBkYXRhCj4gYW5kIE9PQiBkYXRhIHdpdGhvdXQgcmVxdWlyaW5nIHRoZW0gdG8ga25v
dyBhbnl0aGluZyBhYm91dCB0aGUgT09CCj4gbGF5b3V0IG9mIHRoZSBNVEQgZGV2aWNlIHRoZXkg
YXJlIHdyaXRpbmcgdG8gKE1URF9PUFNfQVVUT19PT0IpLiAgQWxzbywKPiB0aGUgTUVNV1JJVEUg
aW9jdGwgZG9lcyBub3QgbWFuZ2xlIHRoZSByZXR1cm4gdmFsdWUgb2YgbXRkX3dyaXRlX29vYigp
Lgo+IAo+IEFkZCBhIG5ldyBpb2N0bCwgTUVNUkVBRCwgd2hpY2ggYWRkcmVzc2VzIHRoZSBhYm92
ZSBpc3N1ZXMuICBJdCBpcwo+IGludGVuZGVkIHRvIGJlIGEgcmVhZC1zaWRlIGNvdW50ZXJwYXJ0
IG9mIHRoZSBleGlzdGluZyBNRU1XUklURSBpb2N0bC4KPiBTaW1pbGFybHkgdG8gdGhlIGxhdHRl
ciwgdGhlIHJlYWQgb3BlcmF0aW9uIGlzIHBlcmZvcm1lZCBpbiBhIGxvb3Agd2hpY2gKPiBwcm9j
ZXNzZXMgYXQgbW9zdCBtdGQtPmVyYXNlc2l6ZSBieXRlcyBpbiBlYWNoIGl0ZXJhdGlvbi4gIFRo
aXMgaXMgZG9uZQo+IHRvIHByZXZlbnQgdW5ib3VuZGVkIG1lbW9yeSBhbGxvY2F0aW9ucyBjYXVz
ZWQgYnkgY2FsbGluZyBrbWFsbG9jKCkgd2l0aAo+IHRoZSAnc2l6ZScgYXJndW1lbnQgdGFrZW4g
ZGlyZWN0bHkgZnJvbSB0aGUgc3RydWN0IG10ZF9yZWFkX3JlcSBwcm92aWRlZAo+IGJ5IHVzZXIg
c3BhY2UuICBIb3dldmVyLCB0aGUgbmV3IGlvY3RsIGlzIGltcGxlbWVudGVkIHNvIHRoYXQgdGhl
IHZhbHVlcwo+IGl0IHJldHVybnMgbWF0Y2ggdGhvc2UgdGhhdCB3b3VsZCBoYXZlIGJlZW4gcmV0
dXJuZWQgaWYganVzdCBhIHNpbmdsZQo+IG10ZF9yZWFkX29vYigpIGNhbGwgd2FzIGlzc3VlZCB0
byBoYW5kbGUgdGhlIGVudGlyZSByZWFkIG9wZXJhdGlvbiBpbgo+IG9uZSBnby4KPiAKPiBOb3Rl
IHRoYXQgd2hpbGUganVzdCByZXR1cm5pbmcgLUVVQ0xFQU4gb3IgLUVCQURNU0cgdG8gdXNlciBz
cGFjZSB3b3VsZAo+IGFscmVhZHkgYmUgYSB2YWxpZCBhbmQgdXNlZnVsIGluZGljYXRpb24gb2Yg
dGhlIEVDQyBhbGdvcml0aG0gZGV0ZWN0aW5nCj4gZXJyb3JzIGR1cmluZyBhIHJlYWQgb3BlcmF0
aW9uLCB0aGF0IHNpZ25hbCB3b3VsZCBub3QgYmUgZ3JhbnVsYXIgZW5vdWdoCj4gdG8gY292ZXIg
YWxsIHVzZSBjYXNlcy4gIEZvciBleGFtcGxlLCBrbm93aW5nIHRoZSBtYXhpbXVtIG51bWJlciBv
Zgo+IGJpdGZsaXBzIGRldGVjdGVkIGluIGEgc2luZ2xlIEVDQyBzdGVwIGR1cmluZyBhIHJlYWQg
b3BlcmF0aW9uIHBlcmZvcm1lZAo+IG9uIGEgZ2l2ZW4gcGFnZSBtYXkgYmUgdXNlZnVsIHdoZW4g
ZGVhbGluZyB3aXRoIGFuIE1URCBwYXJ0aXRpb24gd2hvc2UKPiBFQ0MgbGF5b3V0IHZhcmllcyBh
Y3Jvc3MgcGFnZXMgKGUuZy4gYSBwYXJ0aXRpb24gY29uc2lzdGluZyBvZiBhCj4gYm9vdGxvYWRl
ciBhcmVhIHVzaW5nIGEgImN1c3RvbSIgRUNDIGxheW91dCBmb2xsb3dlZCBieSBkYXRhIHBhZ2Vz
IHVzaW5nCj4gYSAic3RhbmRhcmQiIEVDQyBsYXlvdXQpLiAgVG8gYWRkcmVzcyB0aGF0LCBpbmNs
dWRlIEVDQyBzdGF0aXN0aWNzIGluCj4gdGhlIHN0cnVjdHVyZSByZXR1cm5lZCB0byB1c2VyIHNw
YWNlIGJ5IHRoZSBuZXcgTUVNUkVBRCBpb2N0bC4KPiAKPiBMaW5rOiBodHRwczovL3d3dy5pbmZy
YWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxNi1BcHJpbC8wNjcwODUuaHRtbAo+IAo+
IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3Jh
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5w
bD4KPiBBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KCkFwcGxp
ZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
