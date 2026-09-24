Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5995C98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2dHxVZ6OYemDzel6669B2skUC2XVheQewrRWeYCCeQ=; b=bl6aqkBjD6oKUO
	jxp63r06waG9410mgB4nbBO0D5jVVIdsf0b8PYSsGn2RNwskwdu0G93kstk2v0778WRqzhpRNXpOj
	iSSBjniRxq4F3SXT2Njgr6VW1KYW8RwejeklAeha1YXiADHmGpaoizlRyHY5i+9ZnIEZ2I9KAs9xh
	3zew/+CviLuKyjgvwuBg6C1iFdvbxzBRDWmys6pLxzgPXYfchCoFoof2Q3wIKnq8hkOnj2Wrx9FJo
	az2UDDZ8J3Htl1JoMu4VEaau4Qj7F1HiTLGWv+oQw0efMGtlCJbk/DcyQZ10cFa6/Evmlfs0dxeYr
	ycNZkOrvx9L5Hw1WM20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pl7-0000000C6xj-2trI;
	Thu, 24 Sep 2026 20:09:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pl6-0000000C6xN-2AMe
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:09:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 061FC4163C;
	Thu, 24 Sep 2026 20:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED351F00893;
	Thu, 24 Sep 2026 20:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280571;
	bh=CfT0IA0fjDQQ8vfTtzX8JPsthxmsdMYwTsZjiz8d5m4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxk3tB9PNAaPyWcQdnbt4q6+gO2YTkBKNyo237uh/6O6D/gdVCKL1PEx8eiyPLaP2
	 fHxbP8vJLGhJoxgLkOsrtoibuvkSg7C+uzq96nppHmo/+1s8Vn6rHYQVugUAND5Gfg
	 s9zEsjjgfvt3jHzghwXXjoc8Uv40SePyVeUpYeUR40YHx8T38l+jiOlJ+Wo7W/iCHo
	 l6xwDSDFvZ2jzqCzoNXGU40KOuzNIv+9Bu+05Cceit0juKEFbjx4RgSSyZgdIdLZIn
	 3WsyjnvzLaVjWVEb00bGdiWmUpmInbUa48pd9pF44K+aOqXyuDIV09Wfe9xp6QeZ6y
	 XWpC7W54Uxsvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Gabor
 Juhos" <j4g8y7@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, "Md Sadre Alam" <md.alam@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
Date: Thu, 24 Sep 2026 20:09:31 +0000
Message-Id: <20260924200931.6ED351F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5k
OiBxY29tOiBtaXNtYXRjaCBiZXR3ZWVuIGNvbW1pdCBtZXNzYWdlIGFuZCBmdW5jdGlvbiBwcmVm
aXgKLS0KCmNvbW1pdCBhODM2MDdlNjNlYzUzNDI5ZGM0MjUyNjIwOTNlZWY5ZGVlM2JmZDRlCkF1
dGhvcjogR2Fib3IgSnVob3MgPGo0Zzh5N0BnbWFpbC5jb20+CgptdGQ6IHJhd25hbmQ6IHFjb206
IG1ha2UgY2hlY2tfZmxhc2hfZXJyb3JzKCkgbW9yZSBnZW5lcmljCgpUaGUgZnVuY3Rpb24gZ2V0
cyBhIHFjb21fbmFuZF9ob3N0IHBvaW50ZXIgYXMgYSBwYXJhbWV0ZXIgYnV0IGl0IGlzCm9ubHkg
dXNlZCB0byBleHRyYWN0IHRoZSBuYW5kIGNvbnRyb2xsZXIncyBwcml2YXRlIHN0cnVjdHVyZSBm
cm9tIHRoYXQuCkluIG9yZGVyIHRvIG1ha2UgdGhlIGZ1bmN0aW9uIG1vcmUgZ2VuZXJpYywgY2hh
bmdlIHRoZSBkZWNsYXJhdGlvbiB0bwpnZXQgYSBxY29tX25hbmRjX2NvbnRyb2xsZXIgcG9pbnRl
ciBkaXJlY3RseSwgYW5kIHVwZGF0ZSB0aGUgY2FsbGVycwphY2NvcmRpbmdseS4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IGQ3NjQyZGIyZTJkZjEuLjEyYmZiMTRjZDlhMzcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTQ0OSwxMCArNDQ5LDkgQEAg
c3RydWN0IHJlYWRfc3RhdHMgewo+ICB9Owo+ICAKPiAgLyogcmVhZHMgYmFjayBGTEFTSF9TVEFU
VVMgcmVnaXN0ZXIgc2V0IGJ5IHRoZSBjb250cm9sbGVyICovCj4gLXN0YXRpYyBpbnQgY2hlY2tf
Zmxhc2hfZXJyb3JzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IGN3X2NudCkKPiAr
c3RhdGljIGludCBxY29tX25hbmRjX2NoZWNrX2ZsYXNoX2Vycm9ycyhzdHJ1Y3QgcWNvbV9uYW5k
X2NvbnRyb2xsZXIgKm5hbmRjLAo+ICsJCQkJCSBpbnQgY3dfY250KQo+ICB7CgpbU2V2ZXJpdHk6
IE1lZGl1bV0KVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRoZXJlIGlzIGEgbWlzbWF0Y2ggYmV0d2Vl
biB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kCnRoZSBhY3R1YWwgZnVuY3Rpb24gcmVuYW1pbmcuCgpU
aGUgY29tbWl0IG1lc3NhZ2Ugc3RhdGVzIHRoZSBmdW5jdGlvbiB3aWxsIHVzZSB0aGUgInFwaWNf
bmFuZGMiIHByZWZpeDoKIldoaWxlIGF0IGl0LCBhbHNvIGNoYW5nZSB0aGUgZnVuY3Rpb24gbmFt
ZSB0byB1c2UgYSAncXBpY19uYW5kYycgcHJlZml4LiIKCkhvd2V2ZXIsIHRoZSBjb2RlIGNoYW5n
ZXMgdGhlIG5hbWUgdG8gcWNvbV9uYW5kY19jaGVja19mbGFzaF9lcnJvcnMsIHVzaW5nCnRoZSAi
cWNvbV9uYW5kYyIgcHJlZml4IGluc3RlYWQuCgpDb3VsZCB0aGUgY29tbWl0IG1lc3NhZ2UgYmUg
dXBkYXRlZCB0byBtYXRjaCB0aGUgY29kZSwgb3Igc2hvdWxkIHRoZQpmdW5jdGlvbiBiZSBuYW1l
ZCBxcGljX25hbmRjX2NoZWNrX2ZsYXNoX2Vycm9ycz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjQtcWNvbV9uYW5kYy1zaGFy
ZS1tb3JlLWNvZGUtdjEtMC1mMzAxMjE5OWIxNjFAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
