Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A43C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D4A214D8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtCCnpzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D4A214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AJIAgBKnMWfVHmu5ZVdyVACg5bR4WBbADVaBc4lbFY=; b=rtCCnpzJ2TDHCo
	tE3NS5y9i/jCYiG/l4HLyWxYoU+keXQ5/Pr4Tm8rY105shC8ETBgFQR+NfFW+k5MKmsljX1gaoaoR
	Gsy2LzVOpqJiDwM9PMBwj817FeRc5/9wsNadI69KDkbRb+KUaU0K+erHaskYMJjlz8SVYC1CXmvE4
	6fMmUbWPGvxKy6L3Cywmgdj0az+h7dC327CimhBcWmx/DRm8l1BWWAThjzBiOuR0pB/FMP1OjA93I
	iKLTJjSWid7XpVKPDN9xLwlnSk75Dxpc5dFvNy0KCBMGbyn1Z1EIndWbssRiTmOip9vXjzlZxfYA1
	BOgdBl9vIye6WY9Hvdgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8Y8-0004hc-95; Mon, 27 Apr 2020 18:32:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8Xu-0004XO-Vi
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:32:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 750572A0D29;
 Mon, 27 Apr 2020 19:31:57 +0100 (BST)
Date: Mon, 27 Apr 2020 20:31:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/9] mtd: rawnand: bcm47xx: Demistify a few more things
Message-ID: <20200427203154.136baf7b@collabora.com>
In-Reply-To: <20200427190701.6a54d04b@xps13>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
 <20200419125140.1307309-5-boris.brezillon@collabora.com>
 <20200427190701.6a54d04b@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_113159_156467_5DD6E1A5 
X-CRM114-Status: GOOD (  21.15  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNyBBcHIgMjAyMCAxOTowNzowMSArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgQm9yaXMsCj4gCj4gQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gU3VuLCAxOSBBcHIK
PiAyMDIwIDE0OjUxOjM1ICswMjAwOgo+IAo+ID4gVGhlcmUgd2VyZSBhIGZldyBwbGFjZXMgd2Vy
ZSByYXcgaGV4IHZhbHVlcyB3ZXJlIHVzZWQgaW5zdGVhZCBvZiB0aGUgIAo+IAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgd2hlcmUKPiAKPiA+IG1hY3JvIGRlZi4gIAo+IAo+ICAgICAgICAg
ZGVmPyA6KQoKV2lsbCBmaXggdGhlIGNvbW1pdCBtZXNzYWdlIDotKS4KCj4gCj4gPiAKPiA+IFdl
IGFsc28gYWRkIG1hY3JvcyB0byBoZWxwIGZvcm1pbmcgdGhlIGNvbmYgdmFsdWUgKG5vdGUgdGhh
dCB3ZSBzdGlsbAo+ID4gaGF2ZSBvbmUgbWFnaWMgYml0IHdob3NlIG1lYW5pbmcgSSBjb3VsZG4n
dCBleHRyYWN0IGZyb20gdGhlIGNvZGUpLCBhbmQKPiA+IGFkZCBhbiBleHRyYSBtYWNybyB0byBz
cGVjaWZ5IHRoZSBudW1iZXIgb2YgREFUQSBjeWNsZXMgdG8gaXNzdWUgd2hlbgo+ID4gdGhlIFJF
QUQgb3IgV1JJVEUgZmxhZyBpcyBzZXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4v
bXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxhc2gvb3BzX2JjbTQ3MDYuYyAgfCAzNCArKysrKysrKysr
KysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4
bmZsYXNoL29wc19iY200NzA2LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNo
L29wc19iY200NzA2LmMKPiA+IGluZGV4IDU5MTc3NTE3MzAzNC4uZmJiN2FjZWJjOGY3IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcw
Ni5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200
NzA2LmMKPiA+IEBAIC0yNSwxMiArMjUsMjkgQEAKPiA+ICAjZGVmaW5lIE5DVExfQ01EMVcJCQkw
eDAwMDgwMDAwCj4gPiAgI2RlZmluZSBOQ1RMX1JFQUQJCQkweDAwMTAwMDAwCj4gPiAgI2RlZmlu
ZSBOQ1RMX1dSSVRFCQkJMHgwMDIwMDAwMAo+ID4gKy8qIFdoZW4gdGhlIFNQRUNBRERSIGlzIHNl
dCBDTUQxIGlzIGludGVycHJldGVkIGFzIGEgc2luZ2xlIEFERFIgY3ljbGUgKi8KPiA+ICAjZGVm
aW5lIE5DVExfU1BFQ0FERFIJCQkweDAxMDAwMDAwCj4gPiAgI2RlZmluZSBOQ1RMX1JFQURZCQkJ
MHgwNDAwMDAwMAo+ID4gICNkZWZpbmUgTkNUTF9FUlIJCQkweDA4MDAwMDAwCj4gPiArLyoKPiA+
ICsgKiBOdW1iZXIgb2YgREFUQSBjeWNsZXMgdG8gaXNzdWUgd2hlbiBOQ1RMX3tSRUFELFdSSVRF
fSBpcyBzZXQuIFRoZSBtaW5pbXVtCj4gPiArICogdmFsdWUgaXMgMSBhbmQgdGhlIG1heGltdW0g
dmFsdWUgaXMgNC4gVGhvc2UgYnl0ZXMgYXJlIHRoZW4gc3RvcmVkIGluIHRoZQo+ID4gKyAqIEJD
TUFfQ0NfTkZMQVNIX0RBVEEgcmVnaXN0ZXIuCj4gPiArICovCj4gPiArI2RlZmluZSBOQ1RMX0RB
VEFfQ1lDTEVTKHgpCQkoKCgoeCkgLSAxKSAmIDB4MykgPDwgMjgpCj4gPiArLyoKPiA+ICsgKiBU
aGUgQ1MgcGluIHNlZW1zIHRvIGJlIGFzc2VydGVkIGV2ZW4gaWYgTkNUTF9DU0EgaXMgbm90IHNl
dC4gQWxsIHRoaXMgYml0Cj4gPiArICogc2VlbXMgdG8gZW5jb2RlIGlzIHdoZXRoZXIgdGhlIENT
IGxpbmUgc2hvdWxkIHN0YXkgYXNzZXJ0ZWQgYWZ0ZXIgdGhlCj4gPiArICogb3BlcmF0aW9uIGhh
cyBiZWVuIGV4ZWN1dGVkLiBJbiBvdGhlciB3b3JkcywgeW91IHNob3VsZCBvbmx5IHNldCBpdCBp
ZiBpZiAgCj4gCj4gcy9pdCBpZiBpZi9pdCBpZi8KPiAKCkFuZCBkcm9wIHRoaXMgZHVwbGljYXRl
LgoKPiA+ICsgKiB5b3UgaW50ZW5kIHRvIGRvIG1vcmUgb3BlcmF0aW9ucyBvbiB0aGUgTkFORCBi
dXMuCj4gPiArICovCj4gPiAgI2RlZmluZSBOQ1RMX0NTQQkJCTB4NDAwMDAwMDAKPiA+ICAjZGVm
aW5lIE5DVExfU1RBUlQJCQkweDgwMDAwMDAwCj4gPiAgCj4gPiArI2RlZmluZSBDT05GX01BR0lD
X0JJVAkJCTB4MDAwMDAwMDIKPiA+ICsjZGVmaW5lIENPTkZfQ09MX0JZVEVTKHgpCQkoKCh4KSAt
IDEpIDw8IDQpCj4gPiArI2RlZmluZSBDT05GX1JPV19CWVRFUyh4KQkJKCgoeCkgLSAxKSA8PCA2
KQo+ID4gKyAgCj4gCj4gCj4gV2l0aCB0aGUgYWJvdmUgY29ycmVjdGVkLAo+IAo+IFJldmlld2Vk
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IAo+IAo+IAo+
IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
