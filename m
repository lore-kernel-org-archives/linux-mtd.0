Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C5FC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 07:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A792070D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 07:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aAAq4W0A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FEkro20M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3A792070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Jdy/GrGIZCPfcPZs070tGEsyWKUJAdxjjLX1XJWWt0=; b=aAAq4W0ADOIc+V
	CJEieIMfG6qQ9dVcqH5+g9uXR7hhr+WoqYCwDyCDVCZAaFAqiQm+9tRryhyZMJOgkcf471ebhwqyq
	u0+1B3dvcmsjtG4tPfg8ke1cpPBcNJFkpTbT9DNFKlKP79lTS+Grb8kdgbb+Voaj9tdUPvBsSr/D+
	xecUEOA/+teGHgyOTPnmtykPn3pdbkSmCKYrmTsmhStgCfZiTZ6W2zVvP0sdq7a2f7Y6GUMYnc1k4
	0PXOoGefU4RU5ZdClDrwAdEV3AYT5OUDxwzbKsFbXdTeWVwTK8seikTKAHb61GtD80wGafnvQxow7
	WhQUMyuKay6r9AU2lQ0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBE1i-00058m-Fy; Tue, 02 Apr 2019 07:40:10 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBE1f-0004dH-IK
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 07:40:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id z24so2340325wmi.5
 for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2019 00:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BRZhSAL+CrlyoiQ/6Nds0AFRG1/w7P1Hpvd3oqVdQHU=;
 b=FEkro20Mq7OZBQi5iW2lABNfe/8zh1oGyz/xSkVN63lxxkLfgYnAxj0o6RAm5wjVca
 C7iKVjCB1efB0ux1ym+n1oZYqzDK7lULABx+8m4w+QhMmvRaDzLO5W8tSnIbz3S/QtWc
 1vp1UOAsKesmcUiCEGLXbppGhrlKqQbLpOO7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BRZhSAL+CrlyoiQ/6Nds0AFRG1/w7P1Hpvd3oqVdQHU=;
 b=OIVP7X8cJbR5pSLSilbPRBWqmRc7EPvHYk8Pruz62VcIKojvooUa4a5BgM7PJfjTtd
 EMemVEzp5GAGVnQc7W2NpFfanXtuFuT/VE9tWWHEM1PMqSqF9am5+74IIyL5Zs4Tb6BH
 SwufzGTxljpW/6Agf3laeUCuAt9ZMt5tQTe5RAN4DFuvGItUeM7OIVekW8CzeYiMuxQ9
 GhCU+yy4Qne190ctZo09iUncSCMkCJoJhVEntbgNPqHxV5Dpq4QPASY3fViYz4GJhR+V
 bQ0MLDwRPtiG8OkR9ym6IDcUBJeunPay3ZuuZwjQYqfMr0ZSSwLV5bjirx5HHGPEozjt
 4UNQ==
X-Gm-Message-State: APjAAAWAO6pvizVCpbKg33sZs8RyP7UzBFhPPiEad6ukiWu9vw/Ab9x4
 845sh14Hw1dDkaYivjl1QsKzupk+RljmNCHac3Nypg==
X-Google-Smtp-Source: APXvYqxTfKz+861NJLEHqr6V7Bgn97VC+a64P18SVQ0wGmoCyH1AEwuKPZqq9/wOs5R2KFzV48zsmS5GUczFkFyQIvE=
X-Received: by 2002:a1c:2d91:: with SMTP id t139mr2468230wmt.102.1554190805671; 
 Tue, 02 Apr 2019 00:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190328045910.98250-1-zhuohao@chromium.org>
 <20190401112748.4a3d5539@collabora.com>
In-Reply-To: <20190401112748.4a3d5539@collabora.com>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Tue, 2 Apr 2019 15:39:54 +0800
Message-ID: <CABD5ybm_1BjKSsMFGy=LuM0bsCcBnnY7Eid_Ni3OQ5e+aFZ7pg@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash name
 and id
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_004007_631272_43ED7F48 
X-CRM114-Status: GOOD (  28.95  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, bbrezillon@kernel.org,
 richard@nod.at, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmtzIEJvcmlzIGZvciB0aGUgY29tbWVudC4gUGxlYXNlIHRha2UgYSBsb29rIHRoZSByZXBs
eSBhdCBiZWxvdy4KCk9uIE1vbiwgQXByIDEsIDIwMTkgYXQgNToyNyBQTSBCb3JpcyBCcmV6aWxs
b24KPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMjgg
TWFyIDIwMTkgMTI6NTk6MTAgKzA4MDAKPiBaaHVvaGFvIExlZSA8emh1b2hhb0BjaHJvbWl1bS5v
cmc+IHdyb3RlOgo+Cj4gPiBDdXJyZW50bHksIHdlIGRvbid0IGhhdmUgc3lzZnMgbm9kZXMgZm9y
IHF1ZXJ5aW5nIHRoZSB1bmRlcmx5aW5nIGZsYXNoCj4gPiBuYW1lIGFuZCBmbGFzaCBpZC4gVGhp
cyBpbmZvcm1hdGlvbiBpcyBpbXBvcnRhbnQgZXNwZWNpYWxseSB3aGVuIHdlCj4gPiB3YW50IHRv
IGtub3cgdGhlIGZsYXNoIGRldGFpbCBvZiB0aGUgZGVmZWN0aXZlIHN5c3RlbS4gSW4gb3JkZXIg
dG8KPiA+IHN1cHBvcnQgdGhlIHF1ZXJ5LCB3ZSBhZGQgdHdvIHBvaW50ZXJzICgqZmxhc2huYW1l
LCAqaWQpIGludG8gdGhlCj4gPiBtdGRfaW5mbyBzdHJ1Y3R1cmUgYW5kIGNyZWF0ZSB0d28gc3lz
ZnMgbm9kZXMgKGZsYXNobmFtZSwgaWQpLiBUaGlzCj4gPiBwYXRjaCBpcyBtb2RpZmllZCBiYXNl
ZCBvbiB0aGUgU1BJLU5PUiBmbGFzaCBzeXN0ZW0gYXMgd2Ugb25seSBoYXZlCj4gPiB0aGF0IHN5
c3RlbSBub3cuIEJ1dCB0aGUgaWRlYSBzaG91bGQgYmUgYXBwbGllZCB0byB0aGUgb3RoZXIgZmxh
c2gKPiA+IGRyaXZlciBsaWtlIE5BTkQgZmxhc2guCj4gPgo+ID4gVGhlIG91dHB1dCBvZiBuZXcg
c3lzZnMgbm9kZXMgb24gbXkgZGV2aWNlIGFyZToKPiA+IGNhdCAvc3lzL2RldmljZXMvcGxhdGZv
cm0vc29jLzExMDEwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL210ZC9tdGQwL2ZsYXNo
bmFtZQo+ID4gdzI1cTY0ZHcKPiA+IGNhdCAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jLzExMDEw
MDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL210ZC9tdGQwL2lkCj4gPiBlZjYwMTcKPgo+
IEknbSBub3Qgc3VyZSBJIGxpa2UgdGhlIGlkZWEgb2YgZXhwb3NpbmcgdGhpcyBraW5kIG9mIGlu
Zm8gdGhyb3VnaAo+IHN5c2ZzIGFzIGl0IHRoZW4gbWFrZXMgcGFydCBvZiB0aGUgQUJJLiBEaWQg
eW91IGNvbnNpZGVyIGV4cG9zaW5nIHRoYXQKPiB0aHJvdWdoIGRlYnVnZnM/CgpZZXMsIGkgZGlk
IGNvbnNpZGVyIHRoZSBkZWJ1Z2ZzLiBJIHRoaW5rIHRoZSBkZWJ1Z2ZzIGlzIGRlcGVuZGVkIG9u
CkNPTkZJR19ERUJVR19GUy4KSWYgcmVtb3ZpbmcgdGhhdCBjb25maWcsIHRoZSBwYXJ0bmFtZSBh
bmQgcGFydGlkIHdpbGwgYmUgbG9zdC4gU28sIGkKcHJvcG9zZWQgdG8gdXNlCnN5c2ZzLgoKPgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpodW9oYW8gTGVlIDx6aHVvaGFvQGNocm9taXVtLm9yZz4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgICAgICAgIHwgMjQgKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAgMyAr
KysKPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCAgICAgICB8ICAzICsrKwo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+IGluZGV4IDNlZjAxYmFl
ZjliNi4uZGNiZTY3MTlhZDY3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5j
Cj4gPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+IEBAIC0yNDEsNiArMjQxLDI4IEBA
IHN0YXRpYyBzc2l6ZV90IG10ZF9uYW1lX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ID4gIH0K
PiA+ICBzdGF0aWMgREVWSUNFX0FUVFIobmFtZSwgU19JUlVHTywgbXRkX25hbWVfc2hvdywgTlVM
TCk7Cj4gPgo+ID4gK3N0YXRpYyBzc2l6ZV90IG10ZF9mbGFzaG5hbWVfc2hvdyhzdHJ1Y3QgZGV2
aWNlICpkZXYsCj4gPiArICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRy
LCBjaGFyICpidWYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKPiA+ICsKPiA+ICsgICAgIGlmICghbXRkLT5mbGFzaG5hbWUpCj4g
PiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgcmV0dXJuIHNucHJpbnRmKGJ1Ziwg
UEFHRV9TSVpFLCAiJXNcbiIsIG10ZC0+Zmxhc2huYW1lKTsKPiA+ICt9Cj4gPiArc3RhdGljIERF
VklDRV9BVFRSKGZsYXNobmFtZSwgU19JUlVHTywgbXRkX2ZsYXNobmFtZV9zaG93LCBOVUxMKTsK
Pgo+IE1URCBhbHNvIGRlYWxzIHdpdGggdGhpbmdzIHRoYXQgYXJlIG5vdCBmbGFzaGVzIChTUkFN
cywgUk9NLCAuLi4pLiBIb3cKPiBhYm91dCBwYXJ0bmFtZT8KClRoYW5rcywgaSB3aWxsIGNoYW5n
ZSB0aGUgbmFtZSB0byBwYXJ0bmFtZS4KCj4KPiA+ICsKPiA+ICtzdGF0aWMgc3NpemVfdCBtdGRf
aWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiArICAgICAgICAgICAgIHN0cnVjdCBkZXZp
Y2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IG10
ZF9pbmZvICptdGQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+ICsKPiA+ICsgICAgIGlmICgh
bXRkLT5pZCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICByZXR1cm4gc25w
cmludGYoYnVmLCBQQUdFX1NJWkUsICIlKnBoTlxuIiwgbXRkLT5pZF9zaXplLCBtdGQtPmlkKTsK
Pgo+IEknZCByZWNvbW1lbmQgbWFraW5nIG10ZC0+aWQgYSBzdHJpbmcgc28gdGhhdCBlYWNoIGZs
YXNoIHR5cGUgY2FuCj4gZGVjaWRlIG9mIHRoZSBmb3JtYXR0aW5nLCBhbmQgbWF5YmUgaGF2ZSBh
IHByZWZpeCB0aGF0IHRlbGxzIHdoaWNoIGtpbmQKCm9rLCBpIHdpbGwgY3JlYXRlIGFuIGFycmF5
IHRvIHN0b3JlIHRoZSBmb3JtYXR0ZWQgcGFydGlkLgoKPiBvZiBJRCB0aGlzIGlzOiAic3BpLW5v
cjp4eHh4eCIsICJuYW5kOnh4eHgiLCAic3BpLW5hbmQ6eHh4eCIuCgpXZSBoYWQgYSBzeXNmcyBu
b2RlLCBjYWxsZWQgJ3R5cGUnLCB3aGljaCBpbmRpY2F0ZWQgdGhlIHR5cGUgb2YgdGhlCnVuZGVy
bHlpbmcgZGV2aWNlLiBXZSBjYW4gcXVlcnkgdGhlICd0eXBlJyB0byBnZXQgdGhlIGRldmljZSB0
eXBlLgpJIHRoaW5rIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gYWRkIHByZWZpeC4gV2hhdCBkbyB5
b3UgdGhpbms/Cgo+Cj4gPiArfQo+ID4gK3N0YXRpYyBERVZJQ0VfQVRUUihpZCwgU19JUlVHTywg
bXRkX2lkX3Nob3csIE5VTEwpOwo+Cj4gaWQgaXMgYml0IHZhZ3VlLCBob3cgYWJvdXQgcGFydGlk
LgoKQWdyZWUsIGkgd2lsbCBjaGFuZ2UgdGhpcy4KCj4KPiA+ICsKPiA+ICBzdGF0aWMgc3NpemVf
dCBtdGRfZWNjX3N0cmVuZ3RoX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwg
Y2hhciAqYnVmKQo+ID4gIHsKPiA+IEBAIC0zNDAsNiArMzYyLDggQEAgc3RhdGljIHN0cnVjdCBh
dHRyaWJ1dGUgKm10ZF9hdHRyc1tdID0gewo+ID4gICAgICAgJmRldl9hdHRyX29vYmF2YWlsLmF0
dHIsCj4gPiAgICAgICAmZGV2X2F0dHJfbnVtZXJhc2VyZWdpb25zLmF0dHIsCj4gPiAgICAgICAm
ZGV2X2F0dHJfbmFtZS5hdHRyLAo+ID4gKyAgICAgJmRldl9hdHRyX2ZsYXNobmFtZS5hdHRyLAo+
ID4gKyAgICAgJmRldl9hdHRyX2lkLmF0dHIsCj4gPiAgICAgICAmZGV2X2F0dHJfZWNjX3N0cmVu
Z3RoLmF0dHIsCj4gPiAgICAgICAmZGV2X2F0dHJfZWNjX3N0ZXBfc2l6ZS5hdHRyLAo+ID4gICAg
ICAgJmRldl9hdHRyX2NvcnJlY3RlZF9iaXRzLmF0dHIsCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+
ID4gaW5kZXggNmUxM2JiZDFhYWE1Li4wZTEwODU4ZTUzMmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMKPiA+IEBAIC00MDI3LDYgKzQwMjcsOSBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVj
dCBzcGlfbm9yICpub3IsIGNvbnN0IGNoYXIgKm5hbWUsCj4gPgo+ID4gICAgICAgaWYgKCFtdGQt
Pm5hbWUpCj4gPiAgICAgICAgICAgICAgIG10ZC0+bmFtZSA9IGRldl9uYW1lKGRldik7Cj4gPiAr
ICAgICBtdGQtPmZsYXNobmFtZSA9IGluZm8tPm5hbWU7Cj4gPiArICAgICBtdGQtPmlkID0gaW5m
by0+aWQ7Cj4gPiArICAgICBtdGQtPmlkX3NpemUgPSBpbmZvLT5pZF9sZW47Cj4gPiAgICAgICBt
dGQtPnByaXYgPSBub3I7Cj4gPiAgICAgICBtdGQtPnR5cGUgPSBNVERfTk9SRkxBU0g7Cj4gPiAg
ICAgICBtdGQtPndyaXRlc2l6ZSA9IDE7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
dGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+ID4gaW5kZXggNjc3NzY4YjIxYTFk
Li4wYTgxNTY5ZmE0ZjYgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+
ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiA+IEBAIC0yMTAsNiArMjEwLDkgQEAg
c3RydWN0IG10ZF9pbmZvIHsKPiA+ICAgICAgIHVpbnQzMl90IGZsYWdzOwo+ID4gICAgICAgdWlu
dDMyX3Qgb3JpZ19mbGFnczsgLyogRmxhZ3MgYXMgYmVmb3JlIHJ1bm5pbmcgbXRkIGNoZWNrcyAq
Lwo+ID4gICAgICAgdWludDY0X3Qgc2l6ZTsgICAvLyBUb3RhbCBzaXplIG9mIHRoZSBNVEQKPiA+
ICsgICAgIGNvbnN0IGNoYXIgKmZsYXNobmFtZTsgLyogVGhlIHVuZGVybHlpbmcgZmxhc2ggbmFt
ZSAqLwo+ID4gKyAgICAgY29uc3QgY2hhciAqaWQ7IC8qIFRoZSBJRCBvZiB0aGUgZmxhc2ggKi8K
PiA+ICsgICAgIGludCBpZF9zaXplOyAvKiBOdW1iZXIgb2YgYnl0ZXMgb2YgaWQgYXJyYXkgKi8K
PiA+Cj4gPiAgICAgICAvKiAiTWFqb3IiIGVyYXNlIHNpemUgZm9yIHRoZSBkZXZpY2UuIE5hw692
ZSB1c2VycyBtYXkgdGFrZSB0aGlzCj4gPiAgICAgICAgKiB0byBiZSB0aGUgb25seSBlcmFzZSBz
aXplIGF2YWlsYWJsZSwgb3IgbWF5IHVzZSB0aGUgbW9yZSBkZXRhaWxlZAo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
