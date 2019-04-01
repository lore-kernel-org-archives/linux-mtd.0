Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC493C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 08:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B00B220828
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 08:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRUTqYLq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L8axwwQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B00B220828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLy1osqQWhs072lvmjrypYTRRFczA+e5Dret4xuw4so=; b=rRUTqYLqXTCtJQ
	LypQEVVMxpZtK3VbNZttPzu9IuMJv/jMVwBjhbTT8gcw+PFdamsgIwCDOII1a+sP4/XnRakzC+qF9
	XL/dPGaWQ/M2ZpCtrdsVBpgDbGMJmxrvFM9nNC+wEPrIymn8+dOA9eLgOG+nr8fGX/b939u4UNLUJ
	O8Zq1E3GW54JfMyRIYf3GlCC6x/EY9+Vra54jsk2llIcHmpS/6ciowUgHQYNOKgpDrlZIPXazHhK6
	+zbDrCAmKhkJ9EPoGfERnMIOrdxxF/tQ4QuaGt5JZtHch2owtIZmjefXOfD/9cU9JAF7e/q992CUR
	5PUuj/Ak34COD0AymwAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsXN-0004rF-U6; Mon, 01 Apr 2019 08:43:25 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsXK-0004qt-SJ
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 08:43:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id q1so10837590wrp.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2019 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iYC23eJNf8znV8lrd+cxlv8V9XSm9Hjxq8NPseEbn7A=;
 b=L8axwwQPU6KPGt8SsbBClnH+pt2IbBEKLpwDasI366vravBn5hex65OYu9m/j5Hdru
 8++fnTeoDVAdZBw1n3yS+VrGQE3G1e4VgbLlmDDOTnpTUWw53AnQmQ6BqW6qJlcN7rtN
 erp4ktRPKTmsmvELMwfllsqW8pRvo9wqEXfGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iYC23eJNf8znV8lrd+cxlv8V9XSm9Hjxq8NPseEbn7A=;
 b=E0K8IOgUyWZlOAIio8ekvM47Lb6VD1RRPgD6ZmmHbWy5h2ZtB80+0EO45r/V/X0UT5
 QIkXxxAAm//GuUJ9qugBZBsR8VOd5uWESlJIpwqSTDKVc84oSUhSj0O4CkGRZu2xmKY9
 VAeUuLJuviEdhbGWh+59LFhrBSlnB5MRgHPs8hQVMqnnDG/PDOi25GUF5St2OsxvUoe5
 s9VtrKa5JXmZShsRxZL9e8AS+B9XYaMuOfudiSesvq0axEXDCZRC0Q7jqWYYOyUNzaDj
 mIECA+yLJp2oaVmGErawdWQV/Uhx5WDVR/+xyUJajDRHjdtch/kqT/LqITPO34lsfZGT
 wing==
X-Gm-Message-State: APjAAAU7kVdKS5gfObto/zQKWAGX/BM4hrdyvMxzEyNWbkZGDNEKJkAR
 QvlylT5Ptrm1H7UnbtJe/VSMZHNQwCSBevbcXgZGmyeCLQPt3Q==
X-Google-Smtp-Source: APXvYqyPLqUrMHfuIWZJ9WHx7UH/C/BJVgU3KR5nClKnpMZgS0NXXa1+bguHungaatZoomhhrkmDH5NRUmzaPk5YIuI=
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr36529400wrm.124.1554108201408; 
 Mon, 01 Apr 2019 01:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190328045910.98250-1-zhuohao@chromium.org>
In-Reply-To: <20190328045910.98250-1-zhuohao@chromium.org>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Mon, 1 Apr 2019 16:43:10 +0800
Message-ID: <CABD5ybnKgNOfXaFiST9xp3hUn32f-X8D+1OfQ0BvQX0Q_pdTDg@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash name
 and id
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_014322_947147_252D8142 
X-CRM114-Status: GOOD (  23.13  )
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
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RGVhciByZXZpZXdlcnMsCgpNYXkgaSBoYXZlIHlvdXIgcHJvZmVzc2lvbmFsIGZlZWRiYWNrIGZv
ciB0aGlzIHBhdGNoPyBDb3VsZCB3ZSBsYW5kCnRoaXMgcGF0Y2g/IERvIHlvdSBoYXZlIGFueSBj
b25jZXJuPwpQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuIFRoYW5rIHlvdS4KCgpP
biBUaHUsIE1hciAyOCwgMjAxOSBhdCAxMjo1OSBQTSBaaHVvaGFvIExlZSA8emh1b2hhb0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCB3ZSBkb24ndCBoYXZlIHN5c2ZzIG5vZGVz
IGZvciBxdWVyeWluZyB0aGUgdW5kZXJseWluZyBmbGFzaAo+IG5hbWUgYW5kIGZsYXNoIGlkLiBU
aGlzIGluZm9ybWF0aW9uIGlzIGltcG9ydGFudCBlc3BlY2lhbGx5IHdoZW4gd2UKPiB3YW50IHRv
IGtub3cgdGhlIGZsYXNoIGRldGFpbCBvZiB0aGUgZGVmZWN0aXZlIHN5c3RlbS4gSW4gb3JkZXIg
dG8KPiBzdXBwb3J0IHRoZSBxdWVyeSwgd2UgYWRkIHR3byBwb2ludGVycyAoKmZsYXNobmFtZSwg
KmlkKSBpbnRvIHRoZQo+IG10ZF9pbmZvIHN0cnVjdHVyZSBhbmQgY3JlYXRlIHR3byBzeXNmcyBu
b2RlcyAoZmxhc2huYW1lLCBpZCkuIFRoaXMKPiBwYXRjaCBpcyBtb2RpZmllZCBiYXNlZCBvbiB0
aGUgU1BJLU5PUiBmbGFzaCBzeXN0ZW0gYXMgd2Ugb25seSBoYXZlCj4gdGhhdCBzeXN0ZW0gbm93
LiBCdXQgdGhlIGlkZWEgc2hvdWxkIGJlIGFwcGxpZWQgdG8gdGhlIG90aGVyIGZsYXNoCj4gZHJp
dmVyIGxpa2UgTkFORCBmbGFzaC4KPgo+IFRoZSBvdXRwdXQgb2YgbmV3IHN5c2ZzIG5vZGVzIG9u
IG15IGRldmljZSBhcmU6Cj4gY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTEwMTAwMDAu
c3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvbXRkL210ZDAvZmxhc2huYW1lCj4gdzI1cTY0ZHcK
PiBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMTAxMDAwMC5zcGkvc3BpX21hc3Rlci9z
cGkxL3NwaTEuMC9tdGQvbXRkMC9pZAo+IGVmNjAxNwo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1b2hh
byBMZWUgPHpodW9oYW9AY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRjb3Jl
LmMgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL210ZC9z
cGktbm9yL3NwaS1ub3IuYyB8ICAzICsrKwo+ICBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCAgICAg
ICB8ICAzICsrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBp
bmRleCAzZWYwMWJhZWY5YjYuLmRjYmU2NzE5YWQ2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtMjQxLDYgKzI0
MSwyOCBAQCBzdGF0aWMgc3NpemVfdCBtdGRfbmFtZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwK
PiAgfQo+ICBzdGF0aWMgREVWSUNFX0FUVFIobmFtZSwgU19JUlVHTywgbXRkX25hbWVfc2hvdywg
TlVMTCk7Cj4KPiArc3RhdGljIHNzaXplX3QgbXRkX2ZsYXNobmFtZV9zaG93KHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiArICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIs
IGNoYXIgKmJ1ZikKPiArewo+ICsgICAgICAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiArCj4gKyAgICAgICBpZiAoIW10ZC0+Zmxhc2huYW1lKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgIHJldHVybiBzbnByaW50ZihidWYsIFBBR0Vf
U0laRSwgIiVzXG4iLCBtdGQtPmZsYXNobmFtZSk7Cj4gK30KPiArc3RhdGljIERFVklDRV9BVFRS
KGZsYXNobmFtZSwgU19JUlVHTywgbXRkX2ZsYXNobmFtZV9zaG93LCBOVUxMKTsKPiArCj4gK3N0
YXRpYyBzc2l6ZV90IG10ZF9pZF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiArICAgICAgICAg
ICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKPiArewo+ICsg
ICAgICAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4g
KyAgICAgICBpZiAoIW10ZC0+aWQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAg
ICAgcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJSpwaE5cbiIsIG10ZC0+aWRfc2l6
ZSwgbXRkLT5pZCk7Cj4gK30KPiArc3RhdGljIERFVklDRV9BVFRSKGlkLCBTX0lSVUdPLCBtdGRf
aWRfc2hvdywgTlVMTCk7Cj4gKwo+ICBzdGF0aWMgc3NpemVfdCBtdGRfZWNjX3N0cmVuZ3RoX3No
b3coc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+ICB7Cj4gQEAg
LTM0MCw2ICszNjIsOCBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqbXRkX2F0dHJzW10gPSB7
Cj4gICAgICAgICAmZGV2X2F0dHJfb29iYXZhaWwuYXR0ciwKPiAgICAgICAgICZkZXZfYXR0cl9u
dW1lcmFzZXJlZ2lvbnMuYXR0ciwKPiAgICAgICAgICZkZXZfYXR0cl9uYW1lLmF0dHIsCj4gKyAg
ICAgICAmZGV2X2F0dHJfZmxhc2huYW1lLmF0dHIsCj4gKyAgICAgICAmZGV2X2F0dHJfaWQuYXR0
ciwKPiAgICAgICAgICZkZXZfYXR0cl9lY2Nfc3RyZW5ndGguYXR0ciwKPiAgICAgICAgICZkZXZf
YXR0cl9lY2Nfc3RlcF9zaXplLmF0dHIsCj4gICAgICAgICAmZGV2X2F0dHJfY29ycmVjdGVkX2Jp
dHMuYXR0ciwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgYi9k
cml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+IGluZGV4IDZlMTNiYmQxYWFhNS4uMGUxMDg1
OGU1MzJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPiBAQCAtNDAyNyw2ICs0MDI3LDkgQEAg
aW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25zdCBjaGFyICpuYW1lLAo+
Cj4gICAgICAgICBpZiAoIW10ZC0+bmFtZSkKPiAgICAgICAgICAgICAgICAgbXRkLT5uYW1lID0g
ZGV2X25hbWUoZGV2KTsKPiArICAgICAgIG10ZC0+Zmxhc2huYW1lID0gaW5mby0+bmFtZTsKPiAr
ICAgICAgIG10ZC0+aWQgPSBpbmZvLT5pZDsKPiArICAgICAgIG10ZC0+aWRfc2l6ZSA9IGluZm8t
PmlkX2xlbjsKPiAgICAgICAgIG10ZC0+cHJpdiA9IG5vcjsKPiAgICAgICAgIG10ZC0+dHlwZSA9
IE1URF9OT1JGTEFTSDsKPiAgICAgICAgIG10ZC0+d3JpdGVzaXplID0gMTsKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+IGlu
ZGV4IDY3Nzc2OGIyMWExZC4uMGE4MTU2OWZhNGY2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvbXRkL210ZC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiBAQCAtMjEwLDYg
KzIxMCw5IEBAIHN0cnVjdCBtdGRfaW5mbyB7Cj4gICAgICAgICB1aW50MzJfdCBmbGFnczsKPiAg
ICAgICAgIHVpbnQzMl90IG9yaWdfZmxhZ3M7IC8qIEZsYWdzIGFzIGJlZm9yZSBydW5uaW5nIG10
ZCBjaGVja3MgKi8KPiAgICAgICAgIHVpbnQ2NF90IHNpemU7ICAgLy8gVG90YWwgc2l6ZSBvZiB0
aGUgTVRECj4gKyAgICAgICBjb25zdCBjaGFyICpmbGFzaG5hbWU7IC8qIFRoZSB1bmRlcmx5aW5n
IGZsYXNoIG5hbWUgKi8KPiArICAgICAgIGNvbnN0IGNoYXIgKmlkOyAvKiBUaGUgSUQgb2YgdGhl
IGZsYXNoICovCj4gKyAgICAgICBpbnQgaWRfc2l6ZTsgLyogTnVtYmVyIG9mIGJ5dGVzIG9mIGlk
IGFycmF5ICovCj4KPiAgICAgICAgIC8qICJNYWpvciIgZXJhc2Ugc2l6ZSBmb3IgdGhlIGRldmlj
ZS4gTmHDr3ZlIHVzZXJzIG1heSB0YWtlIHRoaXMKPiAgICAgICAgICAqIHRvIGJlIHRoZSBvbmx5
IGVyYXNlIHNpemUgYXZhaWxhYmxlLCBvciBtYXkgdXNlIHRoZSBtb3JlIGRldGFpbGVkCj4gLS0K
PiAyLjIxLjAuMzkyLmdmOGY2Nzg3MTU5ZS1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
