Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BF1C369D9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Apr 2025 03:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DAVhIuAhRkL1JRg2Q296o8wrVXHPozLvIFpk4urdamQ=; b=pH0xNP/snGz5OX
	0I9ge5F685CgPvb0qQBSKPfxtNClyiH9SGp3I1W4DcvkyRlLbSu/WQviAZpbjYFL6B/uDeUfeMTmZ
	UnoMuShRjf1GMYvRtxcg/OCWBR7scOgYeObVhJ45lWDRi1P+Zf4VIK6nMxMoeYyrKfQQNeG0OrZIu
	0E5vD0JOefKV6tjbd1slVDvKsgXhjeULoR9U1B+dQ2yu3CjDBpY1At9w+ie1HaLR4aLplqvGBpUhQ
	8fQZSuHFw+xjx1lCPkebHBVC0FaBdgFzmQpIBsW/pM1CLUW/lkJzN/AWN20oIEwwbhcZrKI0B9h1g
	mI/QXNvNMspXLJAV8JDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yIH-0000000BbV7-16SA;
	Wed, 30 Apr 2025 03:39:33 +0000
Received: from [23.94.54.125] (helo=airdropuniverse.estate)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yIE-0000000BbUS-30Qm
	for linux-mtd@lists.infradead.org;
	Wed, 30 Apr 2025 03:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=soorchico.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=acc@soorchico.com;
 bh=uEi92ttqaI7sAQiA79WTMTNuTJSLWsGSQgRe84RnVBk=;
 b=N0XCvDO8wZuPyEw0lov1mrcxi05ZAhraUq3Gd09F8Sn4dcw1c/i3q5rbkcjpQ1lz/V24GibHVJBa
   pcKWWgVeL1rtcVMiqgry1JjO6SzTcHqB9n48hzQZzJHzdvOOgm9rxzN89ITaMmnHv2RVGPhuvlFV
   nYn2ffi2zeRFn5LAhMU=
From: =?UTF-8?B?THVrYXMgTcO8bGxlcg==?= <acc@soorchico.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?B?Q29uZmlybSBDb3JyZWN0IEFjY291bnQgZm9yIFRvZGF54oCZcyBQYXltZW50?=
Date: 29 Apr 2025 20:27:50 -0700
Message-ID: <20250429202750.DB1A58593A9E9278@soorchico.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_203930_809188_979332D9 
X-CRM114-Status: UNSURE (   2.34  )
X-CRM114-Notice: Please train this message.
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

RGVhciBsaW51eC1tdGQsCgpJ4oCZbSBMdWthcyBNw7xsbGVyLCBQdXJjaGFzaW5nIE1hbmFnZXIg
YXQgSG9yaXpvblRlY2ggR21iSCwgYSAKdGVjaG5vbG9neSBzb2x1dGlvbnMgcHJvdmlkZXIgYmFz
ZWQgaW4gTXVuaWNoLCBHZXJtYW55LiBXZeKAmXJlIHNldCAKdG8gc2VuZCBhIHBheW1lbnQgdG8g
eW91ciBjb21wYW55IHRvZGF5IHBlciBvdXIgY3VzdG9tZXLigJlzIApkaXJlY3RpdmUsIFNjaG5l
aWRlciBJbmR1c3RyaWVzLiBUaGUgaXNzdWUgaXMsIHdl4oCZdmUgYmVlbiAKcHJvdmlkZWQgd2l0
aCB0d28gZGlmZmVyZW50IGFjY291bnQgZGV0YWlscywgYW5kIG91ciBvdXRyZWFjaCB0byAKU2No
bmVpZGVyIEluZHVzdHJpZXMgZm9yIGNsYXJpZmljYXRpb24gaGFzbuKAmXQgYmVlbiByZXR1cm5l
ZCB5ZXQuCgpBdHRhY2hlZCBhcmUgdGhlIHR3byBhY2NvdW50IGRvY3VtZW50cyB3ZSByZWNlaXZl
ZC4gQ291bGQgeW91IApwbGVhc2UgcmV2aWV3IHRoZW0gYW5kIGNvbmZpcm0gdGhlIGNvcnJlY3Qg
b25lIHNvIHdlIGNhbiBwcm9jZWVkIAp3aXRob3V0IGRlbGF5PyBJZiBpdOKAmXMgZWFzaWVyLCBJ
4oCZbSBhdmFpbGFibGUgYXQgKzQ5IDg5IDEyMzQgNTY3OCAKdG8gc29ydCB0aGlzIG91dCBkaXJl
Y3RseS4KIApUaGFuayB5b3UgaW4gYWR2YW5jZSBmb3IgeW91ciBwcm9tcHQgYXNzaXN0YW5jZSEK
CkJlc3QgcmVnYXJkcywKTHVrYXMgTcO8bGxlcgpQdXJjaGFzaW5nIE1hbmFnZXIKSG9yaXpvblRl
Y2ggR21iSApCYXllcnN0cmHDn2UgMTUKODAzMzUgTXVuaWNoLCBHZXJtYW55Cmx1a2FzLm11ZWxs
ZXJAaG9yaXpvbnRlY2guZGUgCihtYWlsdG86bHVrYXMubXVlbGxlckBob3Jpem9udGVjaC5kZSkg
fCArNDkgODkgMTIzNCA1Njc4Cnd3dy5ob3Jpem9udGVjaC5kZSAgCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
