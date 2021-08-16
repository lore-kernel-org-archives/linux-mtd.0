Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD5DC4320A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FB661AAA
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4FB661AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFi5+Wssx+leJtWcQZuURRCDxN/oMSw5zrz+xFwf/bE=; b=NZFRZN0D6C+Pzz
	W8eHPZvVxcZiCanJ3Is0n71xHMyjzeaBNsrFgzzEeaZdfVFFU1YQ9QSu8t/TPQaBw6z7zFYit3+lg
	26BVmCJlobHyeGphzpOyybeJqeaLiwN90JEJDJzL+n2VHOQrPIPEQ97wZrsN9Ow5wb5m0hVzr2vpt
	X4AquBXmYlXVRBq2wvv5FOro+68IfounpWrJSCSel8ZVPtV+SJNOW6i0elWhd/K5XUC8n3EEHUNAT
	GC7T8/wnUtwUubR6AGJONqPqKgqB6g2/l3KVicZuMf0Kn06LPFEDbgLlzDo7WnWZrELvCONN432Yr
	VwLIHAojjjxVCrXeF/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFXMV-00GRTW-3Q; Mon, 16 Aug 2021 07:48:47 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFXMS-00GRS8-B8
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 07:48:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5374F1BF207;
 Mon, 16 Aug 2021 07:48:39 +0000 (UTC)
Date: Mon, 16 Aug 2021 09:48:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Evgeny Novikov <novikov@ispras.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Ramuthevar Vadivel Murugan
 <vadivel.muruganx.ramuthevar@linux.intel.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Kirill Shilimanov
 <kirill.shilimanov@huawei.com>, Anton Vasilyev <vasilyev@ispras.ru>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: intel: Fix error handling in probe
Message-ID: <20210816094838.78c8e248@xps13>
In-Reply-To: <20210812110100.1279-1-novikov@ispras.ru>
References: <20210812110100.1279-1-novikov@ispras.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_004844_696800_72C9D612 
X-CRM114-Status: GOOD (  15.76  )
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

SGkgRXZnZW55LAoKRXZnZW55IE5vdmlrb3YgPG5vdmlrb3ZAaXNwcmFzLnJ1PiB3cm90ZSBvbiBU
aHUsIDEyIEF1ZyAyMDIxIDE0OjAxOjAwCiswMzAwOgoKPiBlYnVfbmFuZF9wcm9iZSgpIGRpZCBu
b3QgaW52b2tlIGVidV9kbWFfY2xlYW51cCgpIGFuZAo+IGNsa19kaXNhYmxlX3VucHJlcGFyZSgp
IG9uIHNvbWUgZXJyb3IgaGFuZGxpbmcgcGF0aHMuIFRoZSBwYXRjaCBmaXhlcwo+IHRoYXQuCj4g
Cj4gRm91bmQgYnkgTGludXggRHJpdmVyIFZlcmlmaWNhdGlvbiBwcm9qZWN0IChsaW51eHRlc3Rp
bmcub3JnKS4KCkxHVE0KCkNhbiB5b3UgYWRkIGEgRml4ZXM6IHRhZyBhbmQgcG9zc2libHkgYSBD
Yzogc3RhYmxlIHRhZyBhcyB3ZWxsPwooc2FtZSBmb3IgIm10ZDogcmF3bmFuZDogbXhpYzogRW5h
YmxlIGFuZCBwcmVwYXJlIGNsb2NrcyBpbiBwcm9iZSIpCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEV2
Z2VueSBOb3Zpa292IDxub3Zpa292QGlzcHJhcy5ydT4KPiBDby1kZXZlbG9wZWQtYnk6IEtpcmls
bCBTaGlsaW1hbm92IDxraXJpbGwuc2hpbGltYW5vdkBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEtpcmlsbCBTaGlsaW1hbm92IDxraXJpbGwuc2hpbGltYW5vdkBodWF3ZWkuY29tPgo+IENv
LWRldmVsb3BlZC1ieTogQW50b24gVmFzaWx5ZXYgPHZhc2lseWV2QGlzcHJhcy5ydT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbiBWYXNpbHlldiA8dmFzaWx5ZXZAaXNwcmFzLnJ1Pgo+IC0tLQo+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRyb2xsZXIuYyB8IDI3ICsrKysrKysr
KysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5k
LWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxl
ci5jCj4gaW5kZXggOGI0OWZkNTZjZjk2Li4yOWU4YTU0NmRjZDYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC02MzEsMTkgKzYzMSwy
NiBAQCBzdGF0aWMgaW50IGVidV9uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIAllYnVfaG9zdC0+Y2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoZWJ1X2hvc3QtPmNsayk7
Cj4gIAo+ICAJZWJ1X2hvc3QtPmRtYV90eCA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAidHgiKTsK
PiAtCWlmIChJU19FUlIoZWJ1X2hvc3QtPmRtYV90eCkpCj4gLQkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCBQVFJfRVJSKGVidV9ob3N0LT5kbWFfdHgpLAo+IC0JCQkJICAgICAiZmFpbGVkIHRv
IHJlcXVlc3QgRE1BIHR4IGNoYW4hLlxuIik7Cj4gKwlpZiAoSVNfRVJSKGVidV9ob3N0LT5kbWFf
dHgpKSB7Cj4gKwkJcmV0ID0gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoZWJ1X2hvc3QtPmRt
YV90eCksCj4gKwkJCQkgICAgImZhaWxlZCB0byByZXF1ZXN0IERNQSB0eCBjaGFuIS5cbiIpOwo+
ICsJCWdvdG8gZXJyX2Rpc2FibGVfdW5wcmVwYXJlX2NsazsKPiArCX0KPiAgCj4gIAllYnVfaG9z
dC0+ZG1hX3J4ID0gZG1hX3JlcXVlc3RfY2hhbihkZXYsICJyeCIpOwo+IC0JaWYgKElTX0VSUihl
YnVfaG9zdC0+ZG1hX3J4KSkKPiAtCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIo
ZWJ1X2hvc3QtPmRtYV9yeCksCj4gLQkJCQkgICAgICJmYWlsZWQgdG8gcmVxdWVzdCBETUEgcngg
Y2hhbiEuXG4iKTsKPiArCWlmIChJU19FUlIoZWJ1X2hvc3QtPmRtYV9yeCkpIHsKPiArCQlyZXQg
PSBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihlYnVfaG9zdC0+ZG1hX3J4KSwKPiArCQkJCSAg
ICAiZmFpbGVkIHRvIHJlcXVlc3QgRE1BIHJ4IGNoYW4hLlxuIik7Cj4gKwkJZWJ1X2hvc3QtPmRt
YV9yeCA9IE5VTEw7Cj4gKwkJZ290byBlcnJfY2xlYW51cF9kbWE7Cj4gKwl9Cj4gIAo+ICAJcmVz
bmFtZSA9IGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgImFkZHJfc2VsJWQiLCBjcyk7
Cj4gIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0Vf
TUVNLCByZXNuYW1lKTsKPiAtCWlmICghcmVzKQo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJaWYg
KCFyZXMpIHsKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWdvdG8gZXJyX2NsZWFudXBfZG1hOwo+
ICsJfQo+ICAJZWJ1X2hvc3QtPmNzW2NzXS5hZGRyX3NlbCA9IHJlcy0+c3RhcnQ7Cj4gIAl3cml0
ZWwoZWJ1X2hvc3QtPmNzW2NzXS5hZGRyX3NlbCB8IEVCVV9BRERSX01BU0soNSkgfCBFQlVfQURE
Ul9TRUxfUkVHRU4sCj4gIAkgICAgICAgZWJ1X2hvc3QtPmVidSArIEVCVV9BRERSX1NFTChjcykp
Owo+IEBAIC02NTMsNyArNjYwLDggQEAgc3RhdGljIGludCBlYnVfbmFuZF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJbXRkID0gbmFuZF90b19tdGQoJmVidV9ob3N0LT5j
aGlwKTsKPiAgCWlmICghbXRkLT5uYW1lKSB7Cj4gIAkJZGV2X2VycihlYnVfaG9zdC0+ZGV2LCAi
TkFORCBsYWJlbCBwcm9wZXJ0eSBpcyBtYW5kYXRvcnlcbiIpOwo+IC0JCXJldHVybiAtRUlOVkFM
Owo+ICsJCXJldCA9IC1FSU5WQUw7Cj4gKwkJZ290byBlcnJfY2xlYW51cF9kbWE7Cj4gIAl9Cj4g
IAo+ICAJbXRkLT5kZXYucGFyZW50ID0gZGV2Owo+IEBAIC02ODEsNiArNjg5LDcgQEAgc3RhdGlj
IGludCBlYnVfbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJbmFu
ZF9jbGVhbnVwKCZlYnVfaG9zdC0+Y2hpcCk7Cj4gIGVycl9jbGVhbnVwX2RtYToKPiAgCWVidV9k
bWFfY2xlYW51cChlYnVfaG9zdCk7Cj4gK2Vycl9kaXNhYmxlX3VucHJlcGFyZV9jbGs6Cj4gIAlj
bGtfZGlzYWJsZV91bnByZXBhcmUoZWJ1X2hvc3QtPmNsayk7Cj4gIAo+ICAJcmV0dXJuIHJldDsK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
