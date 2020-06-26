Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B3BC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 14:38:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894FA2070A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 14:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNSRE6H6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QBMoSlov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 894FA2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c6k4TwMl60UOMakhrT6pAkxklHTzYVIpPSUNJkdR9uo=; b=UNSRE6H6EcKRaqrmjXSdI/BIy
	m+aTZzANuRMMZEEzk0cTqO5teK7PqgZCz3Co41SnvB62vsQrOdHHsqCnbRaoMdXv3MkWzy4Y/9wxr
	HHgit6lP9HfzWKCiHfd/qVrkn7j2/oNmrutNZal6yfmNF+j5K2p/4bNPS+xgmhggTAvZNVVGmcI2X
	ZF3QpRdI2HY3wI9nX9QgXK/uTxcTRg9KbbkEsDB0Lf96mD8OiZbz6a+iCZsq8lIpIECBQ1giLJ/oq
	GqwqlSTQ8so+QJgIzlrIW1OBVixAUDXGf4ruJtj3sXYSj5kE+YmRsZrCaTSD+DX9Zt7HBoQ+LqJmG
	FZayPjw6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jopTH-0001hs-5F; Fri, 26 Jun 2020 14:36:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jopTF-0001hP-KK
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 14:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cn1zsaS3/AFKEoakkdzDLbwcCfkHB4QRu2mLw1s76QM=; b=QBMoSlovpY7Mxh4xdFYd1BEVLQ
 2J6Jt/+ojcIAWUdZVE2/HW7V7vHaHZOYS1PfOvRVtmJvlWbdx0EU5OaVbBFV/qrJC/9Mv3S1DPOWU
 D109HavhIkT0hCjwYkh6Oi5FpxpVwkltvwqwA4O1baloSNYcipDB2hGrN3KD+y7HsOedyTP26rVNx
 pFgvtfmgdhaFaQkHiLHEeR6Ol4L/8pwLXtAsbRjFj1ysiDvPZiSg8SJRI6Rkk+MuUY3VdzMav3qWN
 kxFu5vfYNvkO6hrsrxJM1tfzX15SJ0os78P/X0ha2MdoIn/9zkui1S/+NwMc8qR+93/7MQqM5blw9
 RZSqG6jg==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jopSv-0001Ni-DW
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 14:36:44 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2BCEE6074002;
 Fri, 26 Jun 2020 16:36:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TcrbC5E7J3UZ; Fri, 26 Jun 2020 16:36:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C4998607400F;
 Fri, 26 Jun 2020 16:36:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p7-90KqAPBDU; Fri, 26 Jun 2020 16:36:26 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A02D36074002;
 Fri, 26 Jun 2020 16:36:26 +0200 (CEST)
Date: Fri, 26 Jun 2020 16:36:26 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <1203806497.62586.1593182186554.JavaMail.zimbra@nod.at>
In-Reply-To: <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: PdmYS94N9shv2Yye8tGprCFti6n6K0ATsyL6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_153632_208277_1BF3409B 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, david <david@sigma-star.at>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEkgZGlkbid0IGRpZyBkZWVwIGludG8g
dGhlIGNvZGUgc28gZmFyLCBJJ20gc3RpbGwgY2hlY2tpbmcgdGhlIGNvbmNlcHQuCj4gCj4gWW91
ciBhcHByb2FjaCB3b3JrcyBvbmx5IG9uIHByaXN0aW5lIG9mZmxpbmUgc2lnbmVkIGltYWdlcyBm
cm9tIG1rZnMudWJpZnMuCj4gU28sIGlmIHNvbWVib2R5IGRvZXMgdGhpcywgaXQgd29uJ3Qgd29y
azoKPiAKPiAkIGtleWN0bCBwYWRkIGxvZ29uIHViaWZzOmF1dGhmcyBAcyA8IHNlY3JldC5rZXkK
PiAkIG1vdW50IC10IHViaWZzIC9kZXYvdWJpMF8wIC9tbnQvIC1vCj4gYXV0aF9oYXNoX25hbWU9
c2hhMjU2LGF1dGhfa2V5PXViaWZzOmF1dGhmcwo+IAo+IC4uLiBjaGFuZ2UgdGhlIGZzIC4uLgo+
IAo+ICQgdW1vdW50IC9tbnQKPiAkIG1vdW50IC10IHViaWZzIC9kZXYvdWJpMF8wIC9tbnQvIC1v
IGF1dGhfaGFzaF9uYW1lPXNoYTI1Nixybwo+IAo+IFRoZSBybyBtb3VudCB3aWxsIGZhaWwgYmVj
YXVzZSBVQklGUyBpcyBubyBsb25nZXIgYWJsZSB0byB2ZXJpZnkgdGhlIHN1cGVyIGJsb2NrCj4g
dXNpbmcgdGhlIHN5c3RlbSBrZXkgcmluZy4gSXQgd2FzIG92ZXJ3cml0dGVuIGJ5IHRoZXkgdWJp
ZnM6YXV0aGZzIGtleS4KPiAKPiBBIHBvc3NpYmxlIHNvbHV0aW9uIGlzIGtlZXBpbmcgYSBjb3B5
IG9mIHRoZSBvZmZsaW5lIHNpZ24ga2V5IGZvcmV2ZXIgaW4gdGhlIGZzLgo+IEJ1dCBJJ20gbm90
IHN1cmUgd2hldGhlciB0aGlzIGlzIHdpc2UuCgpPciB3ZSBjaGFuZ2UgdGhlIGZlYXR1cmUgZnJv
bSAicm8gbW91bnQgd2l0aG91dCBobWFjIiB0byAia2VlcCBvZmZsaW5lIHNpZ24ga2V5IGFuZCBp
bXBseSBybyBtb3VudCIuCklPVyBhZGRpbmcgYSBuZXcgbW91bnQgb3B0aW9uIHN1Y2ggYXMgImF1
dGhfa2VlcF9vZmZsaW5la2V5Ii4gSWYgbW91bnRlZCB3aXRoIHRoaXMgb3B0aW9uClVCSUZTIHdp
bGwgbm90IGxvb2sgZm9yIGEgaG1hYyBhbmQgZW5mb3JjZSByZWFkLW9ubHkgbW9kZS4KCkhtbT8K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
