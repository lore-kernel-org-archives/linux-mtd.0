Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40066CCD1BC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 06:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG/F4kz9oEOv+DlsZwvAEVokIP8SZ7drkvr4rf58KBY=; b=YeN99IvA0f2PEg
	yn/7Uuw8/xvYWO545G0+fOC4z3w3Ugyg1yXpswFrJO9+wr3CDzR7RZg/tkyx5x0zGmRq7wExUHFok
	li3KSCVv7ss8C6gHeDimARWwySYOfMU87g8BLVO344Z896C4wqfKvqWqVyaW+RWzrk5nYrzafHCE3
	WcNNjm1dg1CMJCcRAzz7xyK4JLk8j/kJecFLqM607curYF6MpFi+Ans9Bic5baJck8s2M6VpSuAAr
	KyKR5sVkI1pn/B3qo6OhnLWsc1NyciJ5iD3RiwY9ngLmKxsYIer+YgNG5y9/DN6mFuLL1Qiu/qoa8
	Ovj7lqOQQE3dnUUUpxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpDr-00000005GKt-3EdQ;
	Thu, 23 Oct 2025 06:54:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpDn-00000005GKW-3Fuv
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 06:54:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B42271A15F8;
	Thu, 23 Oct 2025 06:54:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76C9D6062C;
	Thu, 23 Oct 2025 06:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72ED2102F2408;
	Thu, 23 Oct 2025 08:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761202487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GS0cqy3g8XoZ9muADSAiYyE0/Ek9+J4x0l2wKijcgtA=;
	b=LajRDVY0S65NQ81Ea8F94oP4KJOPMDu1SEEZi9hPC1F6ox7Dh1sCVe5esRWrY24hclUAyh
	cp6qOoDQlwjJOInt3iolbOGexU6J5CTO7TCdX0bJv0omu6s7+c9V7IwRDVnXctvasVISgd
	kcSy5CRf9Fku619uLxjLXf6L721U1Wnf68AdWzsFshWLBHkqwK6mX7jyaT5J49uzkKsx9G
	QZ2nCtIzmZep3QFFzZRDcpJ3HMyeNewp7/NBfFTDOYtIkv7HsfnxiaAeUrlW1Jkw9PdVRD
	NsAAA5fAxRK6WRAsBolngqtwRSR5njZIv3SoXdWsegg8TwYy/kNkGUFQH/p17A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jay Xu <jayxu1990@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  avnerkhan@utexas.edu,
  rdlee.upstream@gmail.com,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mtd: core: Add nand_id sysfs attribute for NAND devices
In-Reply-To: <CABcGJDxxGSDVc9TPcTMR_7abreBchHEKHsqtfZVQ5m+0nFhJ1A@mail.gmail.com>
	(Jay Xu's message of "Wed, 22 Oct 2025 11:53:41 -0500")
References: <20251007224049.2798233-1-jayxu1990@gmail.com>
	<20251014192455.4007534-1-jayxu1990@gmail.com>
	<874irrrpbp.fsf@bootlin.com>
	<CABcGJDxxGSDVc9TPcTMR_7abreBchHEKHsqtfZVQ5m+0nFhJ1A@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 23 Oct 2025 08:54:39 +0200
Message-ID: <87sefaqf9s.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_235451_948666_703F46BB 
X-CRM114-Status: GOOD (  11.34  )
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

SGkgSmF5LAoKT24gMjIvMTAvMjAyNSBhdCAxMTo1Mzo0MSAtMDUsIEpheSBYdSA8amF5eHUxOTkw
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIE1pcXXDqGw6Cj4gVGhhbmsgeW91IGZvciB0aGUgZmVl
ZGJhY2sgYW5kIHN1Z2dlc3Rpb25zIQo+Cj4gWW91J3JlIHJpZ2h0IHRoYXQgdGhlIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24gaXMgcmF3IE5BTkQgc3BlY2lmaWMuIEkgY2FuIGxvb2sgaW50byBleHRl
bmRpbmcgdGhpcyB0byBzdXBwb3J0IG90aGVyIE5BTkQKPiB0eXBlcyBieSBtb3ZpbmcgdGhlIGZ1
bmN0aW9uYWxpdHkgdG8gdGhlIE5BTkQgY29yZSAKPiBsYXllciBhbmQgZW5zdXJlIHRoZSBJRCBp
cyBwb3B1bGF0ZWQgYXQgcHJvYmUgdGltZS4KPgo+IExldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFu
eSBvdGhlciBzdWdnZXN0aW9ucy9xdWVzdGlvbnMsCgpOb3QgYXQgdGhlIG1vbWVudCwgSSdkIGxp
a2UgdG8gZ2F0aGVyIGZlZWRiYWNrIGZyb20gb3RoZXIgTVREIGZvbGtzCmJlZm9yZSB3ZSBnbyBm
b3J3YXJkLiBTeXNmcyBpcyBwYXJ0IG9mIHRoZSBzdGFibGUgQVBJLCB3ZSBtdXN0IGJlCmNhcmVm
dWwuCgo+ICA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
PiAgPiBDbG9zZXM6Cj4gID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8y
MDI1MTAxMjAzNTYuU1RHS0RrQTUtbGtwQGludGVsLmNvbS8KCkp1c3QgYXMgYW4gRllJLCB0aGVz
ZSBkbyBub3QgbWFrZSBhbnkgc2Vuc2UgaW4gYSBjb250cmlidXRpb24gbGlrZQp5b3Vycy4gSW5j
bHVkZSB0aGVzZSB0YWdzIGlmIHlvdSBhcmUgZml4aW5nIHNvbWV0aGluZyB0aGF0IGlzIGFscmVh
ZHkgaW4KdGhlIHRyZWUuIFRoaXMgaXMgYSBuZXcgc3VibWlzc2lvbiBhbmQgaXQgaXMgbm90IGEg
Zml4IHNvICJyZXBvcnRlZC1ieSIKc2hhbGwgbm90IGJlIHVzZWQuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
