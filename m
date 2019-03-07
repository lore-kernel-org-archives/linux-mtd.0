Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6E6C43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0AB32081B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EicwAaXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0AB32081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uggiwdWaSJgK+ywOT4bveB6nnt9E1o9Vo2TQkg28qg=; b=EicwAaXdYOVgKr
	IE6wlVHaG02U6sU+oYR9jJ0sy5mD12/tzOJGz+jbyXM88ACTXwki4nXDR20wlL/MwJqtl4ei+yocz
	PM/vdb8gA6O2u37G5/oXYm9Z3dCwF8qbmliDYak4OjqdRQ9sFUMk4F9x3vMcGv1/g40IvWCpquCAc
	gnrDV1veD2wvO+Mx2gS+dbmq//Xl28L9YxjSVcsJ51ZnQNO8QprezEDGXKpLy6iznrYiWEupY93m3
	oQlPoYq2zQB5W6uFe04VBlP4/8I9wEApH/psQjLhKOsZqdcaXuTUoL7ybsEM8xn/1Y63GnR4JFST1
	QgdCTNHOkF2s6uuDLVxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1sxu-0004Mw-4y; Thu, 07 Mar 2019 13:21:38 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1sxq-0004Lj-Ln
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2019 13:21:36 +0000
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3AF70240008;
 Thu,  7 Mar 2019 13:21:23 +0000 (UTC)
Date: Thu, 7 Mar 2019 14:21:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Danzberger <daniel@dd-wrt.com>
Subject: Re: [PATCH] mtdram: Add module parameter name.
Message-ID: <20190307142049.3162e9d5@xps13>
In-Reply-To: <20190222123205.20015-1-daniel@dd-wrt.com>
References: <20190222123205.20015-1-daniel@dd-wrt.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_052134_857954_3DB24F91 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKUGxlYXNlIENjOiB0aGUgTVREIG1haW50YWluZXJzIGFzIGFkdmlzZWQgYnkg
Z2V0X21haW50YWluZXJzLnBsLgoKRGFuaWVsIERhbnpiZXJnZXIgPGRhbmllbEBkZC13cnQuY29t
PiB3cm90ZSBvbiBGcmksIDIyIEZlYiAyMDE5CjEzOjMyOjA1ICswMTAwOgoKPiBUaGlzIHBhcmFt
ZXRlciB3aWxsIG92ZXJ3cml0ZSB0aGUgZGVmYXVsdCBuYW1lICJtdGRyYW0gdGVzdCBkZXZpY2Ui
LCB3aGVuIHNldC4KCkRvIHlvdSBoYXZlIGEgdXNlIGNhc2U/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBEYW56YmVyZ2VyIDxkYW5pZWxAZGQtd3J0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9t
dGQvZGV2aWNlcy9tdGRyYW0uYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZp
Y2VzL210ZHJhbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRyYW0uYwo+IGluZGV4IDQ2MjM4
Nzk2MTQ1Zi4uMWE4ZWMzNzU2YTFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMv
bXRkcmFtLmMKPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZHJhbS5jCj4gQEAgLTE4LDYg
KzE4LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L210ZC9tdGRyYW0uaD4KPiAgCj4gK3N0YXRpYyBjaGFyIG5hbWVbMzJdID0gIm10ZHJhbSB0ZXN0
IGRldmljZSI7Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIHRvdGFsX3NpemUgPSBDT05GSUdfTVRE
UkFNX1RPVEFMX1NJWkU7Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGVyYXNlX3NpemUgPSBDT05G
SUdfTVREUkFNX0VSQVNFX1NJWkU7Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIHdyaXRlYnVmX3Np
emUgPSA2NDsKPiBAQCAtMzEsNiArMzIsOCBAQCBtb2R1bGVfcGFyYW0oZXJhc2Vfc2l6ZSwgdWxv
bmcsIDApOwo+ICBNT0RVTEVfUEFSTV9ERVNDKGVyYXNlX3NpemUsICJEZXZpY2UgZXJhc2UgYmxv
Y2sgc2l6ZSBpbiBLaUIiKTsKPiAgbW9kdWxlX3BhcmFtKHdyaXRlYnVmX3NpemUsIHVsb25nLCAw
KTsKPiAgTU9EVUxFX1BBUk1fREVTQyh3cml0ZWJ1Zl9zaXplLCAiRGV2aWNlIHdyaXRlIGJ1ZiBz
aXplIGluIEJ5dGVzIChEZWZhdWx0OiA2NCkiKTsKPiArbW9kdWxlX3BhcmFtX3N0cmluZyhuYW1l
LCBuYW1lLCBzaXplb2YobmFtZSkgLSAxLCAwKTsKClRoZSBtb2R1bGVfcGFyYW1fc3RyaW5nIGtl
cm5lbCBkb2Mgc2F5cwoKICAgICAgICAiQGxlbjogdGhlIG1heGltdW0gbGVuZ3RoIG9mIHRoZSBz
dHJpbmcsIGluY2wuIHRlcm1pbmF0b3IiCgphbmQgbGF0ZXIKCiAgICAgICAgIkBsZW4gaXMgdXN1
YWxseSBqdXN0IHNpemVvZihzdHJpbmcpLiIKClNvIEkgc3VwcG9zZSBzaXplb2YobmFtZSkgd2ls
bCBiZSBlbm91Z2guCgo+ICtNT0RVTEVfUEFSTV9ERVNDKG5hbWUsICJEZXZpY2UgbmFtZSIpOwo+
ICAjZW5kaWYKPiAgCj4gIC8vIFdlIGNvdWxkIHN0b3JlIHRoZXNlIGluIHRoZSBtdGQgc3RydWN0
dXJlLCBidXQgd2Ugb25seSBzdXBwb3J0IDEgZGV2aWNlLi4KPiBAQCAtMTcwLDcgKzE3Myw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IGluaXRfbXRkcmFtKHZvaWQpCj4gIAkJbXRkX2luZm8gPSBOVUxM
Owo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAJfQo+IC0JZXJyID0gbXRkcmFtX2luaXRfZGV2aWNl
KG10ZF9pbmZvLCBhZGRyLCBNVERSQU1fVE9UQUxfU0laRSwgIm10ZHJhbSB0ZXN0IGRldmljZSIp
Owo+ICsJZXJyID0gbXRkcmFtX2luaXRfZGV2aWNlKG10ZF9pbmZvLCBhZGRyLCBNVERSQU1fVE9U
QUxfU0laRSwgbmFtZSk7Cj4gIAlpZiAoZXJyKSB7Cj4gIAkJdmZyZWUoYWRkcik7Cj4gIAkJa2Zy
ZWUobXRkX2luZm8pOwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
