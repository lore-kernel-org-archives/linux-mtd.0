Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5679BCAC582
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Sep 2025 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zBskgLE+1CPsBxORngTobdk7R7s2yjTUJbc5o5YuQ9A=; b=xqSdIipIaRxuhvovk8CP50DGwt
	StNZ72ZGfTZ4HdQpiBmHWJDYMbKj9SWCwfQxzzhDA4Bg0i9p3fD4tXF/9M6B+byyD61L7qESGA0CD
	Hfuo1q2tppnlKlEcJkdGZasAPqAVOozROcz1o3cLm8eqiqvWVzJNrJoL6NRGuK6GBVizlyavxic6O
	VVde+1ZaD4NqhuwqEavQdDHhZg1vtIQvbAF/N4xyGbfwSlnf5oIIYCW4axSsszF59g7fYkTaZZOJm
	uPucQf11eFP2Ktisyvm4c4CTL5bpy9SjB7qWVBtDC2IxIHRAF5oY/8LUO5RyuP9fSWXoMw8pW+9GJ
	kWpD6f1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYH2-0000000G4OM-0eCF;
	Mon, 08 Sep 2025 09:34:56 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXnc-0000000FtRP-1xgn
	for linux-mtd@lists.infradead.org;
	Mon, 08 Sep 2025 09:04:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2FEEE2E52E1;
	Mon,  8 Sep 2025 11:04:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wCoe0__baTRa; Mon,  8 Sep 2025 11:04:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C41712E52E3;
	Mon,  8 Sep 2025 11:04:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PWcVxOwn-xIb; Mon,  8 Sep 2025 11:04:20 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 936312CE379;
	Mon,  8 Sep 2025 11:04:20 +0200 (CEST)
Date: Mon, 8 Sep 2025 11:04:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rahul Kumar <rk0006818@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-kernel-mentees@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	pratyush <pratyush@kernel.org>
Message-ID: <93578759.11447.1757322260340.JavaMail.zimbra@nod.at>
In-Reply-To: <87tt1djtot.fsf@bootlin.com>
References: <20250908070124.2647038-1-rk0006818@gmail.com> <87tt1djtot.fsf@bootlin.com>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: sm_ftl: replace strncpy with memcpy
Thread-Index: hoN3+Lz+G6z5Lodbq+9CIhidly68CQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_020432_644392_5C53D0A7 
X-CRM114-Status: UNSURE (   4.29  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAiUmFodWwgS3VtYXIiIDxyazAwMDY4MThA
Z21haWwuY29tPgo+PiAtCXN0cm5jcHkoYnVmLCBzbV9hdHRyLT5kYXRhLCBzbV9hdHRyLT5sZW4p
Owo+PiAtCXJldHVybiBzbV9hdHRyLT5sZW47Cj4+ICsJbWVtY3B5KGJ1Ziwgc21fYXR0ci0+ZGF0
YSwgc21fYXR0ci0+bGVuKTsKPj4gKwlidWZbc21fYXR0ci0+bGVuXSA9ICdcMCc7Cj4+ICsJcmV0
dXJuIHNtX2F0dHItPmxlbiArIDE7Cj4gCj4gQXJlIHdlIHN1cmUgdGhlIGJ1ZmZlciBpcyBhbHdh
eXMgc21fYXR0ci0+bGVuICsgMSBsb25nPwoKQ2FuIHdlIHBsZWFzZSBqdXN0IHN0b3AgbWVzc2lu
ZyB3aXRoIHBlcmZlY3RseSBmaW5lIGNvZGU/CkknbSBzaWNrIG9mIHRoZSB3YXIgb24gc3RyaW5n
IGZ1bmN0aW9ucy4KRmlyc3Qgd2UgaGFkIHRvIHJlcGxhY2UgZXZlcnl0aGluZyB3aXRoIHN0cm5j
cHkoKSwgdGhlbiBzdHJsY3B5KCksCnRoZW4gc3Ryc2NweSgpLCAuLi4KCkRvbid0IGdldCBtZSB3
cm9uZywgSSdtIGFsbCBmb3IgaGFyZGVuaW5nIGNvZGUgcGF0aHMgd2hlcmUKc3RyaW5ncyBhcmUg
YXJiaXRyYXJ5IGlucHV0LCBidXQgaW4gbWFueSBvZiB0aGVzZSBjYXNlcyBhbGwgc3RyaW5ncwph
cmUgbm8gaW5wdXQgb3IgYWxyZWFkeSBzYW5pdGl6ZWQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
