Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA7BCC6B01
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiSK14d2q84JkCMWwaLmAoj+DaK+wmmXYrInQ89FOVM=; b=jD3spL6lTvroQi
	9m0d/5wL/uiChZH6W6fuVeEutSpesCqTJ6bBeavrv0/VN8RFIXxzSv3kRm/Kd0orhnghJsJlZlCZT
	e0BWdwdKDvVlxlTvCuYBl6ftgHX8kXe6PpqhbIBViyQwYvJcGETtxiWLxOFTTkeh4PmOTHm9NNBS+
	QHLSW5YUuA/qoBTpWoyFyGbLKb/ldH4QCr2GbHdK8+QXU6GqiAcM8vEaxuJE7wTOh1QZ3rchqaqML
	s7nluIBUd9FJE1MySi+saFPW3BbXJLfqwN0qYQQHfYfqGrQnQkCHGuBequKeXBbfV3AHUEE92QYUU
	QU5M7/pJU8h1bzGsqEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKk3-0000000BEV6-11La;
	Mon, 12 Oct 2026 18:27:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKjz-0000000BETo-22ET
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:27:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1106F1A11E9
	for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 18:27:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8629601A6;
	Mon, 12 Oct 2026 18:27:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C4FC11D70089;
	Mon, 12 Oct 2026 20:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Mw5a9VrVDkCVt4gd2XCCNT0RRexgNMCUW4LwicTpc0=;
	b=SgPA456wP54NA6XbiWQLMIwqjo+DKCGUoeM1meJu59I6Ju3cZE6YgiPqbXjbyGzvIXSkeD
	9wqpDVkMrODSnUwbDpqm2KJ1ZI78qvsyX4fL1aJoZ/6jbLIuAyaqDxvbgDHwWYeX/R3vMB
	LuOkQv5Z6J6qwp7ngJVppGvZ6Gqu1Cp2U+xe3ZQHVTMOd0IYYrNg4/kBNdpRMaGSB0ngZL
	6IP2eb22Y9tL1RGeAkhDQzdpDUJgSgFoPgCrpKwLVGWP4e4ZkKWfQKQ84uotxJDQOutDWP
	ozhVrzxQ1FglBHQKMYn9uWTJSC6lSVhkYfx1nEGQx6cCFDQJfPt+8/QLNimFBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: qcom: drop setting of partition's mask_flags
In-Reply-To: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
	(Gabor Juhos's message of "Tue, 06 Oct 2026 22:00:41 +0200")
References: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 20:27:09 +0200
Message-ID: <87qzhuzsea.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112715_661770_B237E87B 
X-CRM114-Status: UNSURE (   9.64  )
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

SGkgR2Fib3IsCgpPbiAwNi8xMC8yMDI2IGF0IDIyOjAwOjQxICswMiwgR2Fib3IgSnVob3MgPGo0
Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgJ2F0dHInIG1lbWJlciBvZiBzdHJ1Y3QgJ3Nt
ZW1fZmxhc2hfcGVudHJ5JyBpcyA4IGJpdHMgd2lkZSwKPiBzbyBpdCBpcyBvbmx5IHVzYWJsZSB0
byBtYXNrIHRoZSBsb3dlciA4IGJpdHMgaW4gdGhlIE1URCBmbGFncy4KPiBIb3dldmVyIHRoZSBN
VEQgbGF5ZXIgZG9lcyBub3QgZGVmaW5lIGFueSBtYXNrYWJsZSBmbGFncyBpbgo+IHRoZXNlIGJp
dHMgYXQgYWxsLiBBZGRpdGlvbmFsbHksIHRoZSBtZWFuaW5nIG9mIHRoZSBiaXRzIGluIHRoZQo+
ICdhdHRyJyBmaWVsZCBpcyBub3QgZG9jdW1lbnRlZCwgc28gaXQgaXMgbm90IGV2ZW4gcG9zc2li
bGUgdG8gbWFwCj4gdGhvc2UgdG8gdGhlIGRlZmluZWQgTVREIGZsYWdzLgo+Cj4gRHVlIHRvIHRo
ZSByZWFzb25zIGFib3ZlLCByZW1vdmUgdGhlICdtYXNrX2ZsYWdzJyBhc3NpZ25tZW50IGNvZGUK
PiBzaW5jZSBpdCBoYXMgbm8gZWZmZWN0IGFueXdheS4KPgo+IFNpZ25lZC1vZmYtYnk6IEdhYm9y
IEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgoKU29ycnkgYnV0IGl0IG5vIGxvbmdlciBhcHBsaWVz
IGFmdGVyIFdlaWdhbmcgSGUnczoKW1BBVENIXSBtdGQ6IHBhcnNlcnM6IHFjb206IGZpeCBvZmZz
ZXQvc2l6ZSBvdmVyZmxvdyBvbiBsYXJnZSBwYXJ0aXRpb25zCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
