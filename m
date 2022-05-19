Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D1C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 19 May 2022 15:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQySQWdRalh0WvMGEjGacMBw6ADPHJpKIruEPAx3PGs=; b=O443Z+seurYmMc
	+gfcEYw7RUOxw5GgyLWMvGzMSQ9lE7x/lMqrIvz5+XX2lJOkA+R4AJUugmxt5yEUhBe/NdgLwet/m
	WshKbxfoVQjta7YMmLOpABHvKErtE9PTQ9qcaMYtT9SRbLeYYdg4sZEvXmEy9pRCpsEhV65kSBmRS
	O7AJ9aX6d34DPm0z7HQsaE/VvYbOCPa6vIkble0A6dEwdByJoC0hSGsZ7VxDsarebgRsj7ECX4/mH
	e8tXvwWAcjJKbZOkP8SqJMIYF/0Tm5nYbeKKcVoobQNmGt4Gexu3i4bZIkYwsuKBdATw831r/ySTE
	YeY6TNdQ/50mNzv6ULwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nri7R-007y74-Gv; Thu, 19 May 2022 15:31:17 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nri1d-007v1h-0T
 for linux-mtd@lists.infradead.org; Thu, 19 May 2022 15:25:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F56E2000A;
 Thu, 19 May 2022 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652973910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwMzpgQWrXEdEURpnR4VPKCE8aiZ8cfHgenGG21Ic8s=;
 b=fhShDjCMPwY0vAfSm/1jYDoLbnlUCWpKXve2Nt8slJ8ZQvnRDWkSjHTyblTTZVGSeN6hvm
 4uLEG3QMQPbA/ScYXhpVo9pCDvx1uti7fKdWcRZ0BbPOplKx/wlEQin9kGkcSIzDY0P/TS
 //KJDJV20lJ5KtmZddt9j5VQyebooDDlGSTvrXnAPZqsKwwGsrGdOP36MJSdxt9l9M18W6
 Y26YbjjKmnlHjzXRYi+wDr51QsEaH5LpjTSyDuy2ERQg+7Vo7sBOsJM8oouMgmEBzgKsB3
 vv0md1cLibwLvQub8w43mBy6c5gcXN7hNOuQ7ShQhuD18PhqLN8kwTB45DvfGQ==
Date: Thu, 19 May 2022 17:25:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Peng Wu <wupeng58@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <christophe.jaillet@wanadoo.fr>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <liwei391@huawei.com>
Subject: Re: [PATCH] mtd: rawnand: fix drivers probe/remove methods
Message-ID: <20220519172507.4d9872c3@xps-13>
In-Reply-To: <20220517060753.26710-1-wupeng58@huawei.com>
References: <20220517060753.26710-1-wupeng58@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_082517_231341_B54AF21E 
X-CRM114-Status: GOOD (  17.27  )
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

SGksCgp3dXBlbmc1OEBodWF3ZWkuY29tIHdyb3RlIG9uIFR1ZSwgMTcgTWF5IDIwMjIgMDY6MDc6
NTMgKzAwMDA6Cgo+IERyaXZlciBzaG91bGQgY2FsbCBwY2lfZGlzYWJsZV9kZXZpY2UoKSBpZiBp
dCByZXR1cm5zIGZyb20KPiBjYWZlX25hbmRfcHJvYmUoKSB3aXRoIGVycm9yLgo+IAo+IE1lYW53
aGlsZSwgdGhlIGRyaXZlciBjYWxscyBwY2lfZW5hYmxlX2RldmljZSgpIGluCj4gY2FmZV9uYW5k
X3Byb2JlKCksIGJ1dCBuZXZlciBjYWxscyBwY2lfZGlzYWJsZV9kZXZpY2UoKQo+IGR1cmluZyBy
ZW1vdmFsLgoKUGxlYXNlIGZpeCB0aGUgc3ViamVjdCBwcmVmaXgsIGl0IHNob3VsZCBiZSAibXRk
OiByYW53bmFuZDogY2FmZToiCgpBbHNvIEZpeGVzL0NjOiBzdGFibGUgdGFncyBtaWdodCBiZSB1
c2VmdWwuCgo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgV3UgPHd1cGVuZzU4QGh1YXdlaS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIHwgOSArKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9jYWZlX25hbmQuYwo+IGluZGV4IDlkYmYwMzE3MTZhNi4uYWYxMTllMzc2MzUyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKPiBAQCAtNjc5LDggKzY3OSwxMCBAQCBzdGF0
aWMgaW50IGNhZmVfbmFuZF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgCXBjaV9zZXRf
bWFzdGVyKHBkZXYpOwo+ICAKPiAgCWNhZmUgPSBremFsbG9jKHNpemVvZigqY2FmZSksIEdGUF9L
RVJORUwpOwo+IC0JaWYgKCFjYWZlKQo+IC0JCXJldHVybiAgLUVOT01FTTsKPiArCWlmICghY2Fm
ZSkgewo+ICsJCWVyciA9IC1FTk9NRU07Cj4gKwkJZ290byBvdXRfZGlzYWJsZV9kZXZpY2U7Cj4g
Kwl9Cj4gIAo+ICAJbXRkID0gbmFuZF90b19tdGQoJmNhZmUtPm5hbmQpOwo+ICAJbXRkLT5kZXYu
cGFyZW50ID0gJnBkZXYtPmRldjsKPiBAQCAtODAxLDYgKzgwMyw4IEBAIHN0YXRpYyBpbnQgY2Fm
ZV9uYW5kX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAJcGNpX2lvdW5tYXAocGRldiwg
Y2FmZS0+bW1pbyk7Cj4gICBvdXRfZnJlZV9tdGQ6Cj4gIAlrZnJlZShjYWZlKTsKPiArIG91dF9k
aXNhYmxlX2RldmljZToKPiArCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiAgIG91dDoKPiAg
CXJldHVybiBlcnI7Cj4gIH0KPiBAQCAtODIyLDYgKzgyNiw3IEBAIHN0YXRpYyB2b2lkIGNhZmVf
bmFuZF9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gIAlwY2lfaW91bm1hcChwZGV2LCBj
YWZlLT5tbWlvKTsKPiAgCWRtYV9mcmVlX2NvaGVyZW50KCZjYWZlLT5wZGV2LT5kZXYsIDIxMTIs
IGNhZmUtPmRtYWJ1ZiwgY2FmZS0+ZG1hYWRkcik7Cj4gIAlrZnJlZShjYWZlKTsKPiArCXBjaV9k
aXNhYmxlX2RldmljZShwZGV2KTsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkIGNhZmVfbmFuZF90YmxbXSA9IHsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
