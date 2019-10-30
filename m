Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EDECA9EAF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090A120717
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSCaU10l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 090A120717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3z5RCmAVRGQuX5gULuuu4lbq3i+0ycyDaG91PcIwU8=; b=QSCaU10liEOjch
	fTX8kkdjNKfrHDqv6ai83dPFsAFmrdQTahAFh7p7Nr3KKSywz8JrFKrzrNHxzFFwpYfKlJtAkJwq1
	sZkCGdMvnbab5EZV9HbLcnJhbpuU915bJO5WVmWTxdm5oPhu1o7iAYCW1KfZZ5OnqO3+5og9DAxjR
	3MyYbmN8z0CZ9WJo3ahHfQhUa1mnrOQO34OLFkGmfIJ4TR1ulEbx5ll9cEQ8hMH+sJ6sYKNkDye0n
	T1kchMJG4DXWl9v8hs0Xp2i/uuQ4frPTnzFiLkSPfmLbyxOzLgfPgXm6daccb0vO4jUmrE5IpxZn1
	KH0H7Q13J2+7dXIf+QSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPjDu-0001oB-QZ; Wed, 30 Oct 2019 08:20:58 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPjDr-0001nX-Ir
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 08:20:57 +0000
Received: from xps13 (67.173.185.81.rev.sfr.net [81.185.173.67])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0599F200011;
 Wed, 30 Oct 2019 08:20:35 +0000 (UTC)
Date: Wed, 30 Oct 2019 09:20:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Subject: Re: [PATCH v1] mtd: devices: phram.c: Fix multiple kfree statement
 from phram_setup
Message-ID: <20191030092036.38cf4f11@xps13>
In-Reply-To: <20191029170849.GA6279@saurav>
References: <20191029170849.GA6279@saurav>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_012055_759625_D17A0470 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: vigneshr@ti.com, richard@nod.at, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, saurav.girepunje@hotmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2F1cmF2LAoKU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2LmdpcmVwdW5qZUBnbWFpbC5jb20+IHdy
b3RlIG9uIFR1ZSwgMjkgT2N0IDIwMTkKMjI6Mzg6NDkgKzA1MzA6CgpBcmUgeW91IGEgcm9ib3Q/
Cgo+IFJlbW92ZSBtdWx0aXBsZSBrZnJlZSBzdGF0ZW1lbnQgZnJvbSBwaHJhbV9zZXR1cCgpIGlu
IHBocmFtLmMKClRoaXMgZG9lcyBub3QgZGVzY3JpYmUgd2hhdCB5b3UgYXJlIGRvaW5nLCB5b3Ug
ZG9uJ3QgcmVtb3ZlIHRoZW0geW91CmZhY3Rvcml6ZSB0aGVtLiBBbmQgaG9uZXN0bHkgSSBhbSBu
b3QgY29udmluY2VkIHRoaXMgY2hhbmdlIGlzIHVzZWZ1bAppbiBvbGQgY29kZS4KCj4gCj4gU2ln
bmVkLW9mZi1ieTogU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2LmdpcmVwdW5qZUBnbWFpbC5jb20+
Cj4gLS0tCj4gCj4gQ2hhbmdlIGluIHYxOgoKWW91ciBmaXJzdCB2ZXJzaW9uIGlzIHYxLCBob3cg
Y2FuIHlvdSBiZSBhdCB2MT8gSXQgaXMgYWxtb3N0IHYzIGFscmVhZHkhCgo+IAo+IC0gQWRkIGNo
YW5nZSBzdWdnZXN0ZWQgYnkgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KPiAgICJUaGUgZ290byBzdGF0ZW1lbnQgc2hvdWxkIG5vdCBkZXNjcmliZSBmcm9tIHdoZXJl
IGl0IGlzIGNhbGxlZCBidXQgdGhlCj4gICAgYWN0aW9uIGl0IGlzIHN1cHBvc2VkIHRvIHRha2Uu
ICdnb3RvIGZyZWVfbmFtOycgd291bGQgYmUgYmV0dGVyLiIKClRoaXMgaXMgYSBjb3B5L3Bhc3Rl
IG9mIHdoYXQgSSBoYXZlIHNhaWQuIFdoYXQgSSB3YW50IHlvdSB0byB3cml0ZSBpczoKCiIKLSBS
ZW5hbWUgdGhlIGdvdG8gc3RhdGVtZW50IHRvIGRlc2NyaWJlIGJsYSBibGEgYmxhLgotIEZpeCB0
aGUgdHlwbyBpbiB0aGUgZ290byBsYWJlbC4KIgoKPiAKPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9w
aHJhbS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFt
LmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKPiBpbmRleCBjNDY3Mjg2Y2EwMDcuLjM4
Zjk1YTE1MTdhYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKPiBAQCAtMjQzLDIyICsyNDMsMjIgQEAg
c3RhdGljIGludCBwaHJhbV9zZXR1cChjb25zdCBjaGFyICp2YWwpCj4gIAo+ICAJcmV0ID0gcGFy
c2VfbnVtNjQoJnN0YXJ0LCB0b2tlblsxXSk7Cj4gIAlpZiAocmV0KSB7Cj4gLQkJa2ZyZWUobmFt
ZSk7Cj4gIAkJcGFyc2VfZXJyKCJpbGxlZ2FsIHN0YXJ0IGFkZHJlc3NcbiIpOwo+ICsJCWdvdG8g
ZnJlZV9uYW07CgpDb21lIG9uZS4uLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
