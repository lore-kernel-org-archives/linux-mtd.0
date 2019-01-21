Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB46BC31680
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 18:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B5021726
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 18:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZmnZvZ2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPcX+mKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B5021726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oi04zLmnm3U/oLaBpVYgTSmcxBqYpA5xubKRaxEKyjQ=; b=UZmnZvZ2aHL9Bw
	MhluW8uHKR/YNX2Ncm512WwuxQF29+tNDI6l9lBpeWBs1nw9yDVbi9enm2utKNdOxfKMyTvHRgsRu
	FN2zlH3VmNmLe1+iv/+F0XgJMwomtLa9M6zCXLEXxQHRibXw/0gyCHAMO0KNOIDQE6EA0Z0oPpGLJ
	v3moW9Gaq2nHjDGcLIRXdKWcleAUUYw1LKZCEXjIJjnrpc00AC1zXmBzU+uKSVgcmX8vBOvAOFoVQ
	dgIoiWbIrrzahu7uUwkmr+FMlZ6UtK5z5YEdSQvm4Pa9VzT8CxvMgfDRba5MxVxSMWsMbUlb0SoqW
	0u4+UlWH+IDdWGC8nTLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gleai-0004Fj-1c; Mon, 21 Jan 2019 18:46:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gleae-0004FO-LW
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 18:46:34 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3236621726;
 Mon, 21 Jan 2019 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548096392;
 bh=b+P+DVxBoBnaGL8wRlrKzuyzvDuEbV6KICUMhFqVJa4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QPcX+mKDjoQNTegkxPEqu8wQoIvUAIy+zBWUODY68BzR5GKAlR8P4Sccc9Ky1xBzZ
 mG1TY1dUBaAp/9Pj/Z5sjlYYxqDteK9keBXqYtoPeHprV0LMScpG51RBW35TGEc9Sc
 qWQo8AgDg4rJg+t1BkUSr5JixXmYQjL4xhQbBzQU=
Date: Mon, 21 Jan 2019 19:46:22 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Marcin =?UTF-8?B?S3J6ZW1pxYRza2k=?= <mar.krzeminski@gmail.com>
Subject: Re: VIRTIO iface in mtd
Message-ID: <20190121194622.67648c3a@bbrezillon>
In-Reply-To: <69812b45-6dc4-f11f-f87e-4cf9a099cf50@gmail.com>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
 <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
 <20190118214455.18345232@bbrezillon> <2945987.RD84OsBdxl@blindfold>
 <a978c3ac-83fb-04e7-4143-f16c2e5ca5c3@gmail.com>
 <20190121090743.3b343c2a@bbrezillon>
 <69812b45-6dc4-f11f-f87e-4cf9a099cf50@gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_104632_764659_53D86D39 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMSBKYW4gMjAxOSAxOToxNDozNSArMDEwMApNYXJjaW4gS3J6ZW1pxYRza2kgPG1h
ci5rcnplbWluc2tpQGdtYWlsLmNvbT4gd3JvdGU6Cgo+ID4+IEFzIEJvcmlzIHN1Z2dlc3RlZCBh
bmQgYWRkaXRpb25hbCBjaGFubmVsIHRvIG1vZGlmeSBRZW11cyBiZWhhdmlvciBmcm9tCj4gPj4g
Z3Vlc3QgKGVnLiBpbnNlcnRpbmcgRUNDIGVycm9ycyk/ICAKPiA+IEFjdHVhbGx5LCBJIHdhcyBl
eHBlY3RpbmcgdG8gaW5zZXJ0IGJpdGZsaXBzLCBlcmFzZS9wcm9ncmFtIGVycm9ycywKPiA+IGJh
ZGJsb2NrLCAuLi4gb24gdGhlIGhvc3Qgc2lkZS4gVGhlIHNpZGUgY2hhbm5lbCB3b3VsZCBhbGxv
dyB1cyB0bwo+ID4gaW5mb3JtIHRoZSBndWVzdCBhYm91dCB0aG9zZSBlcnJvcnMuICAKPiBJIGFt
IHByb3Bvc2luZyBndWVzdCB0byBhbGxvdyBpbnNlcnRpbmcgZXJyb3JzIGluIHRoZSBnaXZlbiBt
b21lbnQgb2YgdGltZS4KPiAgRnJvbSB0aGUgb3RoZXIgc2lkZSB0aGlzIGNhbiBiZSBkb25lIGlu
IGEgZGlmZmVyZW50IHdheS4gV2UgY291bGQgc2tpcCB0aGlzCj4gdG9waWMgYXQgdGhlIG1vbWVu
dC8KCkFncmVlZC4KCj4gPiBBbnl3YXksIHRoaXMgaXMgYWxyZWFkeSBhbiBhZHZhbmNlZCBmZWF0
dXJlLCBhbmQgSSB0aGluayB3ZSBzaG91bGQKPiA+IHN0YXJ0IHNtYWxsOiBlbXVsYXRlIE5PUi9O
QU5EIGRldmljZXMgd2l0aG91dCBhbnkgd2F5IHRvIGVtdWxhdGUKPiA+IGJpdGZsaXBzIG9yIGVy
YXNlL3Byb2dyYW0gZXJyb3JzLiBPbmNlIHdlIGhhdmUgdGhhdCBpbiBwbGFjZSwgd2UgY2FuCj4g
PiBzdGFydCBhZGRpbmcgZmFuY3kgZmVhdHVyZXMgb24gdG9wLiAgCj4gVGhhdCBpcyBleGFjdGx5
IHdoYXQgSSB3YW50ZWQgdG8gcHJvcG9zZS4gU2ltcGxlIGtlcm5lbCBkcml2ZXIgYW5kIFFlbXUg
Cj4gaW1wbGVtZW50YXRpb24uCj4gQ2FuIHlvdSB0ZWxsIG1lIHdoaWNoIE1URCBkcml2ZXIgd291
bGQgYmUgdGhlIGJlc3Qgc3RhcnRpbmcgcG9pbnQ/CgpOb3Qgc3VyZSBhbiBNVEQgZHJpdmVyIGNh
biBoZWxwLiBUaGUgTVREIGludGVyZmFjZSBpcyBwcmV0dHkKc3RyYWlnaHRmb3J3YXJkIGFuZCB0
aGUgbW9zdCBjb21wbGljYXRlZCBwYXJ0IGlzIHByb2JhYmx5IHRoZSB2aXJ0aW8KYXNwZWN0LiBG
b3IgYSBOQU5EIGRldmljZSwgeW91J2xsIGhhdmUgdG8gcG9wdWxhdGUgLT5fcmVhZF9vb2IoKSwK
LT5fd3JpdGVfb29iKCksIC0+X2VyYXNlKCksIC0+YmxvY2tfaXNyZXNlcnZlZCgpLCAtPmJsb2Nr
X2lzYmFkKCksCi0+X2Jsb2NrX21hcmtiYWQoKSwgLT5lcmFzZXNpemUsIC0+d3JpdGVzaXplLCAt
PndyaXRlYnVmc2l6ZSwgLT50eXBlLAotPmZsYWdzIChzZWUgWzFdKS4KClsxXWh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjAtcmMzL3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYwoKCgo+IAo+IFRoYW5rcywKPiBNYXJjaW4KPiA+Cj4gPiBSZWdhcmRzLAo+
ID4KPiA+IEJvcmlzICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
