Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33993C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SeWBckmGumOIHLtsQRNDI1hRmMwxmQ4HBJVt0qFuTGQ=; b=jtblvVkvDyC7KECON2+CD2yOgB
	pVVnWmTthl75nIvi67pYvoH8uqrGuIsEt4tYI4FdYI7Z0Dj6qYZojuy/sH+uS5zLvvrllTSCv6SlY
	j+iuwy5IycGp2mPseAUjOOVQ7wQqfoJIVtjUgFpLPC9T754k3LkGjQTzl/+2hw+ruRzNsiTheFlNw
	0xGRHZrbnUHee8GVWLEv+rQkbhgh/7sSn+8jc1RLK9VTweaZ3UZ12JtbEJ+T26EHmSerimJRWhI2w
	9ok4HnhgVcYDKtLXtJSH1gdWBNLyjYsRIE6qcN0C3YaQDb18Qn91DXmW5jyohRqK8MbXoCUkPynZL
	PRR1SkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7BZU-00F6Qy-8w; Tue, 11 Jan 2022 07:27:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7BZQ-00F6Ov-1m
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 07:27:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 59D8E614E2C4;
 Tue, 11 Jan 2022 08:27:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uuSnmgFaZ1C8; Tue, 11 Jan 2022 08:27:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 46CB0614E2CB;
 Tue, 11 Jan 2022 08:27:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YYWVwdluUz5c; Tue, 11 Jan 2022 08:27:46 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 201D2614E2C4;
 Tue, 11 Jan 2022 08:27:46 +0100 (CET)
Date: Tue, 11 Jan 2022 08:27:46 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
In-Reply-To: <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-13-chengzhihao1@huawei.com>
 <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Add all fastmap pebs into 'ai->fastmap' when
 fm->used_blocks>=2
Thread-Index: CDXmZfwm9pTEbBCtB4asuKSA+LK6HQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_232752_422001_763A1A76 
X-CRM114-Status: GOOD (  10.36  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+
IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJtY29xdWVsaW4gc3RtMzIiCj4gPG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+LCAia2lyaWxsIHNodXRlbW92IiA8a2lyaWxsLnNodXRl
bW92QGxpbnV4LmludGVsLmNvbT4sICJTYXNjaGEgSGF1ZXIiCj4gPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRGll
bnN0YWcsIDExLiBKYW51YXIgMjAyMiAwMzo0ODoyNAo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjYg
MTIvMTVdIHViaTogZmFzdG1hcDogQWRkIGFsbCBmYXN0bWFwIHBlYnMgaW50byAnYWktPmZhc3Rt
YXAnIHdoZW4gZm0tPnVzZWRfYmxvY2tzPj0yCgo+IEhpIFJpY2hhcmQsCj4+IHNjYW5fYWktPmZh
c3RtYXAgbWF5IGNvbnRhaW4gYWxzbyBvbGQgZmFzdG1hcCBQRUJzLgo+PiBJbiB0aGUgYXJlYSA8
IFVCSV9GTV9NQVhfU1RBUlQgeW91IGNhbiBmaW5kIG91dGRhdGVkIGZhc3RtYXAgUEVCcy4KPj4g
ZS5nLiBhZnRlciBwb3dlci1jdXQuCj4+IFRoYXQncyB3aHkgc2Nhbl9haS0+ZmFzdG1hcCBpcyBj
b3BpZWQgaW50byBhaS0+ZmFzdG1hcC4KPj4gTGF0ZXIgaW4gdWJpX3dsX2luaXQoKSB0aGVzZSBv
dXRkYXRlZCBQRUJzIHdpbGwgZ2V0IGVyYXNlZC4KPj4gU28sIHlvdSBjYW5ub3QgcmVtb3ZlIHRo
aXMgY29kZS4KPiBJIHRob3VnaHQgb2xkIGZhc3RtYXAgUEVCcyhhc3luYyBlcmFzZSB3b3JrcyBp
biB1YmlfdXBkYXRlX2Zhc3RtYXAoKSkKPiB3aWxsIGJlIGNvdW50ZWQgaW50byBlcmFzZSBQRUJz
IGluIHRoZSBuZXh0IGF0dGFjaGluZyBwcm9jZXNzLCBiZWNhdXNlIEkKPiBzYXcgZm9sbG93aW5n
IGNvZGUgc25pcHBldCBpbiB1Ymlfd3JpdGVfZmFzdG1hcCgpOgo+IDEyNjAgICAgICAgICBsaXN0
X2Zvcl9lYWNoX2VudHJ5KHViaV93cmssICZ1YmktPndvcmtzLCBsaXN0KSB7Cj4gCj4gMTI2MSAg
ICAgICAgICAgICAgICAgaWYgKHViaV9pc19lcmFzZV93b3JrKHViaV93cmspKSB7Cj4gCj4gMTI2
MiAgICAgICAgICAgICAgICAgICAgICAgICB3bF9lID0gdWJpX3dyay0+ZTsKPiAKPiAxMjYzICAg
ICAgICAgICAgICAgICAgICAgICAgIHViaV9hc3NlcnQod2xfZSk7Cj4gCj4gMTI2NAo+IAo+IDEy
NjUgICAgICAgICAgICAgICAgICAgICAgICAgZmVjID0gKHN0cnVjdCB1YmlfZm1fZWMgKikoZm1f
cmF3ICsKPiBmbV9wb3MpOwo+IDEyNjYKPiAKPiAxMjY3ICAgICAgICAgICAgICAgICAgICAgICAg
IGZlYy0+cG51bSA9IGNwdV90b19iZTMyKHdsX2UtPnBudW0pOwo+IAo+IDEyNjggICAgICAgICAg
ICAgICAgICAgICAgICAgc2V0X3NlZW4odWJpLCB3bF9lLT5wbnVtLCBzZWVuX3BlYnMpOwo+IAo+
IDEyNjkgICAgICAgICAgICAgICAgICAgICAgICAgZmVjLT5lYyA9IGNwdV90b19iZTMyKHdsX2Ut
PmVjKTsKPiAKPiAxMjcwCj4gCj4gMTI3MSAgICAgICAgICAgICAgICAgICAgICAgICBlcmFzZV9w
ZWJfY291bnQrKzsKPiAKPiAxMjcyICAgICAgICAgICAgICAgICAgICAgICAgIGZtX3BvcyArPSBz
aXplb2YoKmZlYyk7Cj4gCj4gMTI3MyAgICAgICAgICAgICAgICAgICAgICAgICB1YmlfYXNzZXJ0
KGZtX3BvcyA8PSB1YmktPmZtX3NpemUpOwo+IAo+IDEyNzQgICAgICAgICAgICAgICAgIH0KPiAK
PiAxMjc1ICAgICAgICAgfQo+IAo+IDEyNzYgICAgICAgICBmbWgtPmVyYXNlX3BlYl9jb3VudCA9
IGNwdV90b19iZTMyKGVyYXNlX3BlYl9jb3VudCk7Cj4gSGFsZi13cml0aW5nIG9uIGZhc3RtYXAg
d2lsbCBiZSByZWNvZ25pemVkIGluIHNjYW5uaW5nLCBhbmQgVUJJCj4gZmFsbGJhY2tzIGZ1bGwg
c2Nhbm5pbmcsIFNvLCBJIGNvbWUgdXAgd2l0aCB0d28gc2l0dWF0aW9uczoKPiAxLiBwb3dlci1j
dXQgYmVmb3JlIG5ldyBmYXN0bWFwIHdyaXR0ZW4sIHRoZSBvbGQgZmFzdG1hcCBpcyBjb21wbGV0
ZWx5Cj4gc2F2ZWQgdW50aWwgbmV4dCBhdHRhY2hpbmcsIGFuZCBzb21lIGZyZWUgUEVCcyBhcmUg
d3JpdHRlbiB3aXRoIG5ldwo+IGZhc3RtYXAgZGF0YS4gTHVja2x5LCBmYXN0bWFwIGFuY2hvciBQ
RUIncyB2aWQgaGVhZGVyIGlzIHdyaXR0ZW4gZmlyc3QKPiBvZiBhbGwsIGJhZCBmYXN0bWFwIHdp
bGwgYmUgcmV0dXJuZWQgYnkgdWJpX2F0dGFjaF9mYXN0bWFwKCkgaW4gbmV4dAo+IGF0dGFjaGlu
Zy4KPiAyLiBwb3dlci1jdXQgYWZ0ZXIgbmV3IGZhc3RtYXAgd3JpdHRlbiwgdGhlIG9sZCBmYXN0
bWFwIFBFQnMgd2lsbCBiZQo+IGFkZGVkIGludG8gJ2FpLT5lcmFzZScgbGlzdCBpbiBuZXh0IGF0
dGFjaGluZy4KPiBEaWQgSSBtaXNzIG90aGVyIHBvc3NpYmxlIGNpcmN1bXN0YW5jZXM/CgpJbiB1
Ymlfd2xfaW5pdCgpIHRoZXJlIGlzIGFub3RoZXIgY29ybmVyIGNhc2UgZG9jdW1lbnRlZDoKICAg
ICAgICAgICAgICAgICAgICAgICAgLyoKICAgICAgICAgICAgICAgICAgICAgICAgICogVGhlIGZh
c3RtYXAgdXBkYXRlIGNvZGUgbWlnaHQgbm90IGZpbmQgYSBmcmVlIFBFQiBmb3IKICAgICAgICAg
ICAgICAgICAgICAgICAgICogd3JpdGluZyB0aGUgZmFzdG1hcCBhbmNob3IgdG8gYW5kIHRoZW4g
cmV1c2VzIHRoZQogICAgICAgICAgICAgICAgICAgICAgICAgKiBjdXJyZW50IGZhc3RtYXAgYW5j
aG9yIFBFQi4gV2hlbiB0aGlzIFBFQiBnZXRzIGVyYXNlZAogICAgICAgICAgICAgICAgICAgICAg
ICAgKiBhbmQgYSBwb3dlciBjdXQgaGFwcGVucyBiZWZvcmUgaXQgaXMgd3JpdHRlbiBhZ2FpbiB3
ZQogICAgICAgICAgICAgICAgICAgICAgICAgKiBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZSBmYXN0
bWFwIGF0dGFjaCBjb2RlIGRvZXNuJ3QKICAgICAgICAgICAgICAgICAgICAgICAgICogZmluZCBh
bnkgb3V0ZGF0ZWQgZmFzdG1hcCBhbmNob3JzLCBoZW5jZSB3ZSBlcmFzZSB0aGUKICAgICAgICAg
ICAgICAgICAgICAgICAgICogb3V0ZGF0ZWQgZmFzdG1hcCBhbmNob3IgUEVCcyBzeW5jaHJvbm91
c2x5IGhlcmUuCiAgICAgICAgICAgICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoYWViLT52b2xfaWQgPT0gVUJJX0ZNX1NCX1ZPTFVNRV9JRCkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzeW5jID0gdHJ1ZTsKClNvIHViaV93bF9pbml0KCkgbWFrZXMg
c3VyZSB0aGF0IGFsbCBvbGQgZmFzdG1hcCBhbmNob3JzIGdldCBlcmFzZWQgYmVmb3JlIFVCSQpz
dGFydHMgdG8gb3BlcmF0ZS4gV2l0aCB5b3VyIGNoYW5nZSB0aGlzIGlzIG5vIGxvbmdlciBzYXRp
c2ZpZWQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
