Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B652C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AslBJU5aZRqa7eiWxqYz1kTgz9xRvWhnQVlyjbfJbM=; b=3DgFlUC5CP0Oar
	B23Aojb/yIcY0/+yquWLsBNSAJZaeiWbJI5IIF8TyUsQEyBxHaRJvQQ7ouAGndOPr33FUr9kh7AX3
	cmYLZEDv6fhMBACbOlfwFLtOnTqpl4l8/3U1EckRxXFvOw54D4bK3zVYT1M90sAAJPwkQhmgr9vle
	7sg+03mn/jkcBwGbLtF8GYv5CPSES9C+heoSNdQXc1mRkp9cucfITLzrtseiyroRkSLChDk0YsusM
	jtaueaOG5ei5hwZwqzutGb8kxvnWzYQ8nN6KvzFE38iS9iRvMq+kxwXFOHkz5BabdriyBS4YSpdyp
	Gg4zdK7Zfxu81snANSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptowU-001LcH-04;
	Tue, 02 May 2023 12:17:14 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptowP-001LZC-0Q;
	Tue, 02 May 2023 12:17:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2ED8540014;
	Tue,  2 May 2023 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683029826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4WtAk/oO17QNSG+MVFQT+biwAhXZn5Gzxzievf+xDyU=;
	b=TxUhuHagSMChb0MUZjPqcqj1NgRhBR1NzWL1NTGB9ytH+m8Rvb9B5G5q+dJRYBCVUPJn7H
	XKmvBjcrNYMXC+oBhR8GMwca+u4UX7DRSoOy1fLlhyxuq+7sILdjiENtGdUIByXWqEY37l
	NhWBK9rhuaEFgDwk2LGmFJ0noK9KQ4y0oJWlnn/UaSx7ag/b5/POIO1MmIJhOx07ymeIsO
	Qv6Oi4EjLMuWgqitdeu8dfL2XqCLEiKUQQMZDXZesdjs6/9qc1yKhXL20XRZJTFdscA4iC
	CrLpV2X2ywqfKWLJkmS4TNfPqeKuoyfLiX+hFb6i/Nodnn3xyZIjAALORMbFGQ==
Date: Tue, 2 May 2023 14:17:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "yonghui.yu" <yonghui.yu@amlogic.com>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230502141703.29f0bc30@xps-13>
In-Reply-To: <2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230413102200.309fbe9c@xps-13>
	<b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
	<20230413122252.0a8efcd8@xps-13>
	<569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
	<60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
	<780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
	<e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
	<20230418152505.72fc16da@xps-13>
	<15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
	<ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
	<5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru>
	<fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
	<a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com>
	<cf27b6b4-a75b-c5a6-32ea-ac20a2984192@sberdevices.ru>
	<20230502115913.78012d98@xps-13>
	<2274b432-d1a9-b3cf-4f7b-08c4a4c580b5@sberdevices.ru>
	<20230502132745.14349770@xps-13>
	<2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_051709_452073_EB68D951 
X-CRM114-Status: GOOD (  26.82  )
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

SGkgQXJzZW5peSwKClJpY2hhcmQsIHlvdXIgaW5wdXQgaXMgd2VsY29tZSBiZWxvdyA6LSkKCj4g
Pj4+Pj4+PiBJIGp1c3QgY2hlY2tlZCBKRkZTMiBtb3VudC91bW91bnQgYWdhaW4sIGhlcmUgaXMg
d2hhdCBpIHNlZToKPiA+Pj4+Pj4+IDApIEZpcnN0IGF0dGVtcHQgdG8gbW91bnQgSkZGUzIuCj4g
Pj4+Pj4+PiAxKSBJdCB3cml0ZXMgT09CIHRvIHBhZ2UgTiAoaSdtIHVzaW5nIHJhdyB3cml0ZSku
IEl0IGlzIGNsZWFubWFya2VyIHZhbHVlIDB4ODUgMHgxOSAweDAzIDB4MjAuIE1vdW50IGlzIGRv
bmUuCj4gPj4+Pj4+PiAyKSBVbW91bnQgSkZGUzIuIERvbmUuCj4gPj4+Pj4+PiAzKSBTZWNvbmQg
YXR0ZW1wdCB0byBtb3VudCBKRkZTMi4KPiA+Pj4+Pj4+IDQpIEl0IHJlYWRzIE9PQiBmcm9tIHBh
Z2UgTiAoaSdtIHVzaW5nIHJhdyByZWFkKS4gVmFsdWUgaXMgMHg4NSAweDE5IDB4MDMgMHgyMC4g
RG9uZS4KPiA+Pj4+Pj4+IDUpIEl0IHJlYWRzIHBhZ2UgTiBpbiBFQ0MgbW9kZSwgYW5kIGkgZ2V0
Ogo+ID4+Pj4+Pj4gwqDCoMKgwqAgamZmczI6IG10ZC0+cmVhZCgweDEwMCBieXRlcyBmcm9tIE4p
IHJldHVybmVkIEVDQyBlcnJvcgo+ID4+Pj4+Pj4gNikgTW91bnQgZmFpbGVkLgo+ID4+Pj4+Pj4K
PiA+Pj4+Pj4+IFdlIGFscmVhZHkgaGFkIHByb2JsZW0gd2hpY2ggbG9va3MgbGlrZSB0aGlzIG9u
IGFub3RoZXIgZGV2aWNlLiBTb2x1dGlvbiB3YXMgdG8gdXNlIE9PQiBhcmVhIHdoaWNoIGlzCj4g
Pj4+Pj4+PiBub3QgY292ZXJlZCBieSBFQ0MgZm9yIEpGRlMyIGNsZWFubWFya2Vycy4gICAgICAK
PiA+Pj4+Pgo+ID4+Pj4+IG9rLCBzbyB0aGVyZSBpcyBub3QgRUNDIHBhcml0eSBieXRlcyBhbmQg
bXRkLT5yZWFkKCkgcmV0dXJucyBFQ0MgZXJyb3IuCj4gPj4+Pj4gZG9lcyBpdCBoYXZlIHRvIHVz
ZSByYXcgd3JpdGUvcmVhZCBvbiBzdGVwIDEpIGFuZCA0KT8KPiA+Pj4+PiAgICAgICAKPiA+Pj4+
Cj4gPj4+PiBJZiBpJ20gdXNpbmcgbm9uIHJhdyBhY2Nlc3MgdG8gT09CLCBmb3IgZXhhbXBsZSB3
cml0ZSBPT0IgKHVzZXIgYnl0ZXMpIGluIEVDQyBtb2RlLCB0aGVuCj4gPj4+PiBzdGVwcyAxKSBh
bmQgNCkgYW5kIDUpIHBhc3NlcyBvaywgYnV0IHdyaXRlIHRvIHRoaXMgcGFnZSB3aWxsIGJlIGlt
cG9zc2libGUgKGZvciBleGFtcGxlIEpGRlMyCj4gPj4+PiB3cml0ZXMgdG8gc3VjaCBwYWdlcyBs
YXRlcikgLSB3ZSBjYW4ndCB1cGRhdGUgRUNDIGNvZGVzIHByb3Blcmx5IHdpdGhvdXQgZXJhc2lu
ZyB3aG9sZSBwYWdlLgo+ID4+Pj4gV3JpdGUgb3BlcmF0aW9uIHdpbGwgYmUgZG9uZSB3aXRob3V0
IHByb2JsZW0sIGJ1dCByZWFkIHdpbGwgdHJpZ2dlciBFQ0MgZXJyb3JzIGR1ZSB0byBicm9rZW4K
PiA+Pj4+IEVDQyBjb2Rlcy4KPiA+Pj4+Cj4gPj4+PiBJbiBnZW5lcmFsIHByb2JsZW0gdGhhdCB3
ZSBkaXNjdXNzIGlzIHRoYXQgaW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbiBkYXRhIGFuZCBPT0Ig
Y29uZmxpY3RzCj4gPj4+PiB3aXRoIGVhY2ggb3RoZXIgYnkgc2hhcmluZyBzYW1lIEVDQyBjb2Rl
cywgdGhlc2UgRUNDIGNvZGVzIGNvdWxkIGJlIHdyaXR0ZW4gb25seSBvbmNlICh3aXRob3V0Cj4g
Pj4+PiBlcmFzaW5nKSwgd2hpbGUgZGF0YSBhbmQgT09CIGhhcyBkaWZmZXJlbnQgY2FsbGJhY2tz
IHRvIGFjY2VzcyBhbmQgdGh1cyBzdXBwb3NlZCB0byB3b3JrCj4gPj4+PiBzZXBhcmF0ZWx5LiAg
ICAKPiA+Pj4KPiA+Pj4gVGhlIGZhY3QgdGhhdCB0aGVyZSBtaWdodCBiZSBoZWxwZXJzIGp1c3Qg
Zm9yIHdyaXRpbmcgT09CIGFyZWFzIG9yIGp1c3QKPiA+Pj4gaW4tYmFuZCBhcmVhcyBhcmUgb3B0
aW1pemF0aW9ucy4gTkFORCBwYWdlcyBhcmUgbWVhbnQgdG8gYmUgd3JpdHRlbiBhCj4gPj4+IHNp
bmdsZSB0aW1lLCBubyBtYXR0ZXIgd2hhdCBwb3J0aW9uIHlvdSB3cml0ZS4gSW4gc29tZSBjYXNl
cywgaXQgaXMKPiA+Pj4gcG9zc2libGUgdG8gcGVyZm9ybSBzdWJwYWdlIHdyaXRlcyBpZiB0aGUg
Y2hpcCBzdXBwb3J0cyBpdC4gUGFnZXMgbWF5Cj4gPj4+IGJlIHNwbGl0IGludG8gc2V2ZXJhbCBh
cmVhcyB3aGljaCBjb3ZlciBhIHBhcnRpYWwgaW4tYmFuZCBhcmVhICphbmQqIGEKPiA+Pj4gcGFy
dGlhbCBPT0IgYXJlYS4gSWYgeW91IHdyaXRlIGludG8gdGhlIGluLWJhbmQgKm9yKiBvdXQtb2Yt
YmFuZCBhcmVhcwo+ID4+PiBvZiBhIGdpdmVuIHN1YnBhZ2UsIHlvdSAqY2Fubm90KiB3cml0ZSB0
aGUgb3RoZXIgcGFydCBsYXRlciB3aXRob3V0ICAgIAo+ID4+Cj4gPj4gVGhhbmtzIGZvciBkZXRh
aWxzISBTbyBpbiBjYXNlIG9mIEpGRlMyIGl0IGxvb2tzIGxpa2Ugc3RyYW5nZSwgdGhhdCBpdCB0
cmllcwo+ID4+IHRvIHdyaXRlIHBhZ2UgYWZ0ZXIgd3JpdGluZyBjbGVhbiBtYXJrZXJzIHRvIGl0
IGJlZm9yZT8gSW4gdGhlIG9sZCB2ZW5kb3Incwo+ID4+IGRyaXZlciBPT0Igd3JpdGUgY2FsbGJh
Y2sgaXMgc3VwcHJlc3NlZCBieSByZXR1cm4gMCBhbHdheXMgYW5kIEpGRlMyIHdvcmtzCj4gPj4g
Y29ycmVjdGx5LiAgCj4gPiAKPiA+IENhbiB5b3UgcG9pbnQgdGhlIGNvZGUgeW91J3JlIG1lbnRp
b25pbmc/IChib3RoIHdoYXQgSkZGUzIgd2hpY2ggbG9va3MKPiA+IHN0cmFuZ2UgdG8geW91IGFu
ZCB0aGUgb2xkIHZlbmRvciBoYWNrKSAgCj4gCj4gSGVyZSBpcyB2ZXJzaW9uIG9mIHRoZSBvbGQg
dmVuZG9yJ3MgZHJpdmVyOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9rc3phcS9saW51eC1hbWxv
Z2ljL2Jsb2IvbWFzdGVyX25ld19hbXBvcnRzL2RyaXZlcnMvYW1sb2dpYy9uYW5kL25hbmQvYW1s
X25hbmQuYyNMMzI2MAo+IAo+IEluIG15IHZlcnNpb24gdGhlcmUgaXMgbm8gQlVHKCkgdGhlcmUs
IGJ1dCBpdCBpcyBzYW1lIGRyaXZlciBmb3IgdGhlIHNhbWUgY2hpcC4KPiAKPiBBYm91dCBKRkZT
MiAtIGkgZGlkbid0IGNoZWNrIGl0cyBzb3VyY2UgY29kZSwgYnV0IHdoYXQgSSBjYW4gc2VlIHVz
aW5nIHByaW50aygpLCBpcyB0aGF0IGl0IGZpcnN0Cj4gdHJpZXMgdG8gd3JpdGUgY2xlYW5tYXJr
ZXIgdXNpbmcgT09CIHdyaXRlIGNhbGxiYWNrLiBUaGVuIGxhdGVyIGl0IHRyaWVzIHRvIHdyaXRl
IHRvIHRoaXMgcGFnZSwgc28KPiBtYXkgYmUgaXQgaXMgdW5leHBlY3RlZCBiZWhhdmlvdXIgb2Yg
SkZGUzI/CgpUQkggSSBhbSBub3Qga25vd2xlZGdlYWJsZSBhYm91dCBKRkZTMiwgbWF5YmUgUmlj
aGFyZCBjYW4gaGVscCBoZXJlLgoKQXJlIHlvdSBzdXJlIHlvdSBmbGFzaCBpcyByZWNvZ25pemVk
IGJ5IEpGRlMyIGFzIGJlaW5nIGEgTkFORCBkZXZpY2U/CkRpZCB5b3UgZW5hYmxlIENPTkZJR19K
RkZTMl9GU19XUklURUJVRkZFUiBjb3JyZWN0bHk/IEJlY2F1c2UKY2xlYW5tYXJrZXIgc2VlbSB0
byBiZSBkaXNjYXJkZWQgd2hlbiB1c2luZyBhIE5BTkQgZGV2aWNlLCBhbmQKcmVjb2duaXppbmcg
dGhlIGRldmljZSBhcyBhIE5BTkQgZGV2aWNlIHJlcXVpcmVzIHRoZSBhYm92ZSBvcHRpb24gdG8g
YmUKc2V0IGFwcGFyZW50bHkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
