Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BF1C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 09:05:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C989207C4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 09:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uy4iVFPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C989207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0sYJE/4bFs2fwvijfII3rT3Fchr61EYTAmIkCle9Vk=; b=uy4iVFPv6D5rKA
	K1bLB54nl1XWJWrOcdTmhZ+i75FqoZjx+NO0KPJ8SIeS0VI0Xsca1RlgV71C2OS2M+/6TiTPLXWVn
	uNh4e0MzFmdhsAGObo9Tw7sB8jAJNgxt4sXwG6p+Yghc/4N1zErCZQ39L6IZSn/PZlcyPRLgRrIMF
	4CFVCU93M97rTwn+e505rHo8aGXKdTwb0XeObaEhhF6Q/0VLaVBv5339bg8O3pTCVlqOloCPC/cr6
	7vg+mpaSHTvmW3ZXC4udn6CevgH7SGK0Q+O6sEUn+jFtWvE0bEU0HY8wZoS38NuooLgK2zlLcDpxv
	g6DwCLhhYjwoW2+7M+Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jayBH-0003YL-Qc; Tue, 19 May 2020 09:04:59 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jayBC-0003WU-Lw
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 09:04:57 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 20D5220016;
 Tue, 19 May 2020 09:04:47 +0000 (UTC)
Date: Tue, 19 May 2020 11:04:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard Andersson <rickaran@axis.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: Use the ->init_data_interface() hook
Message-ID: <20200519110446.76945463@xps13>
In-Reply-To: <20200514091342.16924-1-rickaran@axis.com>
References: <richard@nod.at;>
	<20200514091342.16924-1-rickaran@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_020454_849748_20584DEB 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmlja2FyZCwKClJpY2thcmQgQW5kZXJzc29uIDxyaWNrYXJhbkBheGlzLmNvbT4gd3JvdGUg
b24gVGh1LCAxNCBNYXkgMjAyMAoxMToxMzo0MSArMDIwMDoKCj4gRnJvbTogUmlja2FyZCB4IEFu
ZGVyc3NvbiA8cmlja2FyYW5AYXhpcy5jb20+Cj4gCj4gQ2hlY2sgaWYgdGhlIE5BTkQgdmVuZG9y
IHByb3ZpZGVkIGhvb2sgd29ya3MgYW5kIGNoZWNrIHRoYXQKPiB0aGUgTkFORCBjb250cm9sbGVy
IGNhbiBoYW5kbGUgdGhlIHRpbWluZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCB4IEFu
ZGVyc3NvbiA8cmlja2FyYW5AYXhpcy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfYmFzZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IDg3NDRmMDAzM2Y3OC4uOTc0MDUwYTA0ZjIzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtOTU1LDYgKzk1NSwzMCBAQCBzdGF0aWMg
aW50IG5hbmRfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50
IGNoaXBucikKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgbmFuZF90cnlf
aW5pdF9kYXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICt7Cj4gKwlpbnQg
cmV0ID0gY2hpcC0+b3BzLmluaXRfZGF0YV9pbnRlcmZhY2UoY2hpcCk7Cj4gKwo+ICsJaWYgKCFy
ZXQpIHsKPiArCQkvKgo+ICsJCSAqIFBhc3MgTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkgdG8g
b25seSBjaGVjayBpZiB0aGUKPiArCQkgKiBjb250cm9sbGVyIHN1cHBvcnRzIHRoZSByZXF1ZXN0
ZWQgdGltaW5ncy4KPiArCQkgKi8KPiArCQlyZXQgPSBjaGlwLT5jb250cm9sbGVyLT5vcHMtPnNl
dHVwX2RhdGFfaW50ZXJmYWNlKGNoaXAsCj4gKwkJCQkJCSBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tf
T05MWSwKPiArCQkJCQkJICZjaGlwLT5kYXRhX2ludGVyZmFjZSk7CgpJIHdvdWxkIGxpa2UgdGhp
cyB0byBoYXBwZW4gaW4gVG9zaGliYSdzIGNvZGUuIEltYWdpbmUgeW91IGNhbiB0cnkKc2V2ZXJh
bCB0aW1pbmdzLCB0aGUgdmVuZG9yIGNvZGUgc2hvdWxkIGJlIGFibGUgdG8gY2hlY2sgYnkgaXRz
ZWxmIHRoZQpjb250cm9sbGVyIHN1cHBvcnRzIHRoZSB0aW1pbmdzLgoKSSB0aGluayB5b3UgY2Fu
IGRyb3AgdGhpcyAidHJ5IGluaXQgZGF0YSBpbnRlcmZhY2UiIGFuZCBtb3ZlIHRoZQpjb250ZW50
IHRvIFRvc2hpYmEncyBkcml2ZXIuCgo+ICsJfQo+ICsKPiArCWlmIChyZXQpIHsKPiArCQkvKiBU
aGUgcHJvdmlkZWQgZGF0YSBpbnRlcmZhY2UgdGltaW5ncyBkaWQgbm90IHdvcmsgKi8KPiArCQlj
aGlwLT5vcHMuaW5pdF9kYXRhX2ludGVyZmFjZSA9IE5VTEw7Cj4gKwkJbWVtc2V0KCZjaGlwLT5k
YXRhX2ludGVyZmFjZSwgMCwKPiArCQkgICAgICAgc2l6ZW9mKHN0cnVjdCBuYW5kX2RhdGFfaW50
ZXJmYWNlKSk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiAgLyoqCj4gICAq
IG5hbmRfY2hvb3NlX2RhdGFfaW50ZXJmYWNlIC0gZmluZCB0aGUgYmVzdCBkYXRhIGludGVyZmFj
ZSBhbmQgdGltaW5ncwo+ICAgKiBAY2hpcDogVGhlIE5BTkQgY2hpcAo+IEBAIC05ODAsOCArMTAw
NCwxMSBAQCBzdGF0aWMgaW50IG5hbmRfY2hvb3NlX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXApCj4gIAkgKiAtPmluaXRfZGF0YV9pbnRlcmZhY2UoKSBpcyBleHBlY3RlZCB0
byB1cGRhdGUgdGhlIGVudGlyZSBjaGlwJ3MKPiAgCSAqIG5hbmRfZGF0YV9pbnRlcmZhY2Ugc3Ry
dWN0dXJlLgo+ICAJICovCj4gLQlpZiAobmFuZF9oYXNfaW5pdF9kYXRhX2ludGVyZmFjZShjaGlw
KSkKPiAtCQlyZXR1cm4gY2hpcC0+b3BzLmluaXRfZGF0YV9pbnRlcmZhY2UoY2hpcCk7CgpJIHJl
bmFtZWQgaXQgImNob29zZV9kYXRhX2ludGVyZmFjZSIgbm93LCB5b3UgY2FuIHB1bGwgY2hhbmdl
cyBmcm9tCkdpdGh1Yi4KCj4gKwlpZiAobmFuZF9oYXNfaW5pdF9kYXRhX2ludGVyZmFjZShjaGlw
KSkgewo+ICsJCXJldCA9IG5hbmRfdHJ5X2luaXRfZGF0YV9pbnRlcmZhY2UoY2hpcCk7Cj4gKwkJ
aWYgKCFyZXQpCj4gKwkJCXJldHVybiAwOwoKSSdtIGZpbmUgd2l0aCBhIGZhbGxiYWNrIG9uIHRo
ZSByZWd1bGFyIE9ORkkgcmVzZWFyY2ggdGhvdWdoLCB3aGljaCBpbgp0aGlzIGNhc2Ugd291bGQg
Y2hvb3NlIHRpbWluZ3MgbW9kZSAwIEkgZ3Vlc3MuIENhbiB5b3UgdmFsaWRhdGU/CgpPbiBteSBz
aWRlIEkgY2hhbmdlZCB0aGUgY29kZSBvbiBHaXRodWIgYW5kIG5vdyBhIG5lZ2F0aXZlIHJldHVy
biBjb2RlCmp1c3Qgc2lsZW50bHkgZmFpbHMgc28gdGhhdCB3ZSBmYWxsYmFjayBvbiBtb2RlIDAu
Cgo+ICsJfQo+ICAKPiAgCS8qCj4gIAkgKiBGaXJzdCB0cnkgdG8gaWRlbnRpZnkgdGhlIGJlc3Qg
dGltaW5ncyBmcm9tIE9ORkkgcGFyYW1ldGVycyBhbmQKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
