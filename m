Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880E9C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hXpl/XUf2yTNLPTbxbt2qadqIYqiV+FRhdYkXiyvGdQ=; b=p1Ixq4k6vBRuy3
	7YAAk4J0iabq6pmGVQkHK+0orKvL1HRZOKoRHy/5mo1EVFNfp8NnG5YapEKnU3Ss7OObF7UOvPadY
	Wm2la+aTxaHiMyfT9bRxf3eG96EH7K2LxMFX9BGDl4dNDdLm6fPhoSzm2K2Gj6x8vkh02OBh2vtx5
	paGmaRTG96pPPJOXxsXt1xUZ6shKFxWSWvT8hnuMnUKPBqF0p5EyiyeHs1zieDZBryIWgXWOPwxpZ
	LrqlGlPqaQo6C5jA9NzIP7KMqvWuPtHn9+zRlPETYZjW9CssBxrpjz7cPsotxsUZDCqO4GrHidc/8
	xX5yojQF9LiAGtVp7aYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qttnk-002oZT-2A;
	Fri, 20 Oct 2023 18:00:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qttnh-002oYo-2G
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 18:00:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20ACEC0005;
	Fri, 20 Oct 2023 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697824842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W3OOOWAmN8Ll41vLduGQ5zOvtpZilXlonF/UUtX3oS0=;
	b=lJswlx/366St25SOuRqY0hGsopmMN4RRNIykJfN0SXXtG792xL2Q9i3rz1bXnyzJYB2e31
	8qAFxpNUlq1pOBobzt1fZ1kZFIUt83ljipnP+80CzLvQoaSeQ+LmjgxSfESYGXbrwob/+E
	zryUV4fsOp2IXw1uVWv/7hnzefcR6kOsZlU90p6L7L54eVA4U5rt9bP8eH3ejR3BNtk1lN
	g43H683Safk5tiILDPhhzPuoHO/dL5VVOoL5x/0l7cOTHCwky9I4flCNL6S2+m2N8/Dan7
	tfhyS0ZThdqMmylnFUErTsBgw9S952dOkcI0ttiS2YDYWWEM7Ss8Stsuzgp3rg==
Date: Fri, 20 Oct 2023 20:00:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 6.6-rc7
Message-ID: <20231020200039.09ff7f18@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_110046_017018_0E6EA3EE 
X-CRM114-Status: GOOD (  10.53  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgLXJjLiBB
cyBkaXNjdXNzZWQgZHVyaW5nIHRoZQpwcmV2aW91cyBjeWNsZXMsIEkndmUgY2hhbmdlZCBteSB3
YXkgb2Ygd3JpdGluZyB0aGUgUFIgdGV4dC4gTGV0IG1lCmtub3cgaWYgeW91IHdhbnQgc29tZXRo
aW5nIGRpZmZlcmVudC4KClRoYW5rcywKTWlxdcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCAwYmI4MGVjYzMzYThmYjVhNjgyMjM2NDQzYzFlNzQwZDVjOTE3ZDFkOgoKICBM
aW51eCA2LjYtcmMxICgyMDIzLTA5LTEwIDE2OjI4OjQxIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci02LjYtcmM3
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjZjYTNmYjY5NzhmOTRkOTVlZTc5Zjk1
MDg1ZmMyMmU3MWNhMTdjYzoKCiAgbXRkOiByYXduYW5kOiBFbnN1cmUgdGhlIG5hbmQgY2hpcCBz
dXBwb3J0cyBjYWNoZWQgcmVhZHMgKDIwMjMtMTAtMTYgMTA6NDc6MjIgKzAyMDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkluIHRoZSByYXcgTkFORCBzdWJzeXN0ZW0sIHRoZSBtYWpvciBmaXggcHJldmVudHMgdXNpbmcg
Y2FjaGVkIHJlYWRzCndpdGggZGV2aWNlcyBub3Qgc3VwcG9ydGluZyBpdC4gVGhlcmUgd2FzIHR3
byBidWcgcmVwb3J0cyBhYm91dAp0aGlzLiBBc2lkZSwgMyBkcml2ZXJzIChwbDM1MywgYXJhc2Fu
IGFuZCBtYXJ2ZWxsKSBjb3VsZCBzb21ldGltZXMgaGlkZQpwYWdlIHByb2dyYW0gZmFpbHVyZXMg
ZHVlIHRvIHRoZWlyIHRoZWlyIG93biBwcm9ncmFtIHBhZ2UgaGVscGVyIG5vdApiZWluZyBmdWxs
eSBjb21wbGlhbnQgd2l0aCB0aGUgc3BlY2lmaWNhdGlvbiAobWFueSBkcml2ZXJzIHVzZSB0aGUK
ZGVmYXVsdCBoZWxwZXJzIHNoYXJlZCBieSB0aGUgY29yZSkuIEFkZGluZyBhIG1pc3NpbmcgY2hl
Y2sgcHJldmVudHMKdGhlc2Ugc2l0dWF0aW9uLiBGaW5hbGx5LCB0aGUgUXVhbGNvbW0gZHJpdmVy
IGhhZCBhIGJyb2tlbiBlcnJvciBwYXRoLgoKSW4gdGhlIFNQSS1OQU5EIHN1YnN5c3RlbSBvbmUg
TWljcm9uIGRldmljZSB1c2VkIGEgd3JvbmcgYml0bWFrCnJlcG9ydGluZyBwb3NzaWJseSBjb3Jy
dXB0ZWQgRUNDIHN0YXR1cy4KCkZpbmFsbHksIHRoZSBwaHlzbWFwLWNvcmUgZ290IHN0cmlwcGVk
IGZyb20gaXRzIG1hcF9yb20gZmFsbGJhY2sgYnkKbWlzdGFrZSwgdGhpcyBmZWF0dXJlIGlzIGFk
ZGVkIGJhY2suCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkJpYmVrIEt1bWFyIFBhdHJvICgxKToKICAgICAgbXRkOiByYXdu
YW5kOiBxY29tOiBVbm1hcCB0aGUgcmlnaHQgcmVzb3VyY2UgdXBvbiBwcm9iZSBmYWlsdXJlCgpH
ZWVydCBVeXR0ZXJob2V2ZW4gKDEpOgogICAgICBtdGQ6IHBoeXNtYXAtY29yZTogUmVzdG9yZSBt
YXBfcm9tIGZhbGxiYWNrCgpNYXJ0aW4gS3VyYmFub3YgKDEpOgogICAgICBtdGQ6IHNwaW5hbmQ6
IG1pY3JvbjogY29ycmVjdCBiaXRtYXNrIGZvciBlY2Mgc3RhdHVzCgpNaXF1ZWwgUmF5bmFsICgz
KToKICAgICAgbXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBFbnN1cmUgcHJvZ3JhbSBwYWdlIG9wZXJh
dGlvbnMgYXJlIHN1Y2Nlc3NmdWwKICAgICAgbXRkOiByYXduYW5kOiBhcmFzYW46IEVuc3VyZSBw
cm9ncmFtIHBhZ2Ugb3BlcmF0aW9ucyBhcmUgc3VjY2Vzc2Z1bAogICAgICBtdGQ6IHJhd25hbmQ6
IHBsMzUzOiBFbnN1cmUgcHJvZ3JhbSBwYWdlIG9wZXJhdGlvbnMgYXJlIHN1Y2Nlc3NmdWwKClJv
dXZlbiBDemVyd2luc2tpICgxKToKICAgICAgbXRkOiByYXduYW5kOiBFbnN1cmUgdGhlIG5hbmQg
Y2hpcCBzdXBwb3J0cyBjYWNoZWQgcmVhZHMKCiBkcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29y
ZS5jICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcv
YXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgMTYgKysrKysrKysrKysrKystLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysr
KysrKysrKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICB8
ICAzICsrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9qZWRlYy5jICAgICAgICAgICAgIHwg
IDMgKysrCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyAgICAgICAgICAgICAgfCAg
MyArKysKIGRyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jICB8ICA5
ICsrKysrKysrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAg
IHwgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jICAgICAgICAgICAgICAgICB8
ICAyICstCiBpbmNsdWRlL2xpbnV4L210ZC9qZWRlYy5oICAgICAgICAgICAgICAgICAgICAgfCAg
MyArKysKIGluY2x1ZGUvbGludXgvbXRkL29uZmkuaCAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgICAgICAgICAgICAgICB8ICAyICsr
CiAxMiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
