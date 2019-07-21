Return-Path: <SRS0=p36e=VS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F3CC76191
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jul 2019 20:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F70E208E4
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jul 2019 20:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KF1XvGvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F70E208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHlU0RWCd1YvsCNeoLikf+j/thau1yW6bjCjI9xMImk=; b=KF1XvGvS1lLTpM
	nI0mm8EADQNojTwPEozy5NwNLmxPuw/R6C6mgl/ysrNMY37odSS1J8KgT8kY3ltc0vS2j3fP9zRnB
	Wayzvo5EJWz07BoG4QThVQwiyiPtcxR5jFC5eooz5yrqzwKvhc5iKcWHy5f4j46B2/k0smbHpuZjb
	wVo1VXw2RFkLFrnthvp52wosZpdVFT5uAnKcfXbXiDyKEzaZ70/rAXSf+bMQeAPdYdpT+8ZEfzy5s
	82CYdK9hvqyf/K8fBJIV58JUKi7HVGCmOC3LsLjhv+uHcThAe5oKSyEKJYVCAN2oYipICXJPqzBJH
	FLw9N6DRDk6LRZIu85YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpI40-000876-KE; Sun, 21 Jul 2019 20:04:08 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpI3u-00086Z-3H
 for linux-mtd@lists.infradead.org; Sun, 21 Jul 2019 20:04:03 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6E8C46089339;
 Sun, 21 Jul 2019 22:03:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id d7vTj-bnI9DH; Sun, 21 Jul 2019 22:03:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2CBD16089354;
 Sun, 21 Jul 2019 22:03:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dep62mM5VnVN; Sun, 21 Jul 2019 22:03:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id F2AB26089339;
 Sun, 21 Jul 2019 22:03:50 +0200 (CEST)
Date: Sun, 21 Jul 2019 22:03:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <1088672879.45101.1563739430883.JavaMail.zimbra@nod.at>
In-Reply-To: <20190718141351.ya7bnhhwgnc2qz56@pengutronix.de>
References: <20190718141351.ya7bnhhwgnc2qz56@pengutronix.de>
Subject: Re: ubiupdatevol breaks ubi?
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubiupdatevol breaks ubi?
Thread-Index: wh0R8Ihj2wIskR+J3zwSWREyioaQuw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_130402_290389_DF3CA195 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VXdlLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+CVsgICA1Ny44MDc5NzhdIFVC
SUZTIGVycm9yICh1YmkwOjAgcGlkIDI2Mik6IHViaWZzX2Fzc2VydF9mYWlsZWQ6IFVCSUZTIGFz
c2VydAo+CWZhaWxlZDogYy0+bGhlYWRfbG51bSAhPSBjLT5sdGFpbF9sbnVtLCBpbiBmcy91Ymlm
cy9sb2cuYzo0MTIKCkl0IHRvb2sgbWUgYSB3aGlsZSB0byB1bmRlcnN0YW5kIHdoYXQgaXMgZ29p
bmcgb24gYW5kIHdoeSB5b3UgYXJlIGZhY2luZyB0aGlzLgpUaGUgYXNzZXJ0IHNlZW1zIHRvIHRy
aWdnZXIgb25seSBpZiB5b3UgbW91bnQgYSBmaWxlc3lzdGVtIHdoZXJlIGJvdGggbG9nIGhlYWRz
CnBvaW50IHRvIFVCSUZTX0xPR19MTlVNLCBoZW5jZSBlbXB0eSBsb2cgYXJlYSBpbiBpbml0aWFs
IHN0YXRlLCBhbmQgeW91IGNoYW5nZQptb3JlIGZpbGVzeXN0ZW0gY29udGVudHMgdGhhbiB0aGUg
bG9nIGNhbiBob2xkIGF0IG9uY2UuCgpBZnRlciByZXZpZXdpbmcgVUJJRlMgbG9nIGNvZGUgSSBm
b3VuZCBzb21ldGhpbmcgb2RkLgpVQklGUyBkb2VzIG5vdCBpbml0aWFsaXplIGMtPm1pbl9sb2df
Ynl0ZXMsIGl0IGlzIGJ5IGRlZmF1bHQgMC4KCmMtPm1pbl9sb2dfYnl0ZXMgY2FuIGhhdmUgdHdv
IHZhbHVlczoKLSAwOiBjb21taXQgaW4gcHJvZ3Jlc3MsIHJlbWFpbmluZyBsb2cgYXJlYSBtYXkg
YmUgdXNlZAotIGxlYl9zaXplOiBubyBjb21taXQgaW4gcHJvZ3Jlc3MsIGtlZXAgbGViX3NpemUg
Ynl0ZXMgcmVzZXJ2ZWQKICBmb3IgYSBmdXR1cmUgY29tbWl0LgoKU28gaGF2aW5nIGl0IDAgYWZ0
ZXIgYSBtb3VudCBzZWVtcyB3cm9uZyB0byBtZSBiZWNhdXNlIGFmdGVyIG1vdW50aW5nClVCSUZT
IHRoZXJlIGlzIG5vIGNvbW1pdCBpbiBwcm9ncmVzcy4KCkNhbiB5b3UgcGxlYXNlIGdpdmUgdGhp
cyBjaGFuZ2UgYSB0cnk/CldpdGggdGhpcyBhcHBsaWVkIEkgY2FuIG5vIGxvbmdlciB0cmlnZ2Vy
IHRoZSBhc3NlcnQuCgpJJ20gc3RpbGwgbm90IGVudGlyZWx5IHN1cmUgd2hldGhlciB0aGUgYXNz
ZXJ0IGlzIGNvcnJlY3QgYXQgYWxsLApyZXZpZXcgaW4gcHJvZ3Jlc3MuLi4gOi0pIAoKZGlmZiAt
LWdpdCBhL2ZzL3ViaWZzL3N1cGVyLmMgYi9mcy91Ymlmcy9zdXBlci5jCmluZGV4IDZjZmM0OTQw
NTBiZS4uYjQ5ODRkYTQ0MjUxIDEwMDY0NAotLS0gYS9mcy91Ymlmcy9zdXBlci5jCisrKyBiL2Zz
L3ViaWZzL3N1cGVyLmMKQEAgLTYwNyw2ICs2MDcsOSBAQCBzdGF0aWMgaW50IGluaXRfY29uc3Rh
bnRzX2Vhcmx5KHN0cnVjdCB1Ymlmc19pbmZvICpjKQogCWMtPm1heF9idV9idWZfbGVuID0gVUJJ
RlNfTUFYX0JVTEtfUkVBRCAqIFVCSUZTX01BWF9EQVRBX05PREVfU1o7CiAJaWYgKGMtPm1heF9i
dV9idWZfbGVuID4gYy0+bGViX3NpemUpCiAJCWMtPm1heF9idV9idWZfbGVuID0gYy0+bGViX3Np
emU7CisKKwljLT5taW5fbG9nX2J5dGVzID0gYy0+bGViX3NpemU7CisKIAlyZXR1cm4gMDsKIH0K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
