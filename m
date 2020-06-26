Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC69C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:22:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510602070A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNt5ZPAx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V1wo7n3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510602070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mkKsmmK5fBWCwcbrAxkNGMoraLpi7dksABgAHiSRghc=; b=oNt5ZPAxHiaw8Mmzx6v3WMs0T
	nYYMk0aqv/UMkneu2wFLg2S3cvrAtyzKwgJlrXGFUj8q34MCjef7OFLqnm5EkFT62BYAft33N2M84
	Mo8ddS6tTom8X5FAxnegkL/uTpD8FWt45u/O/vkBH4IlDQvumEXjYImwgMiiUIsWrrny81RXzy8y2
	XwayCma4bScz9tVyugQUoRm2YKo37cPBgMhK3+gcoyu4pVl08mTZ3CDSi9XeZ8ZF43Ja3N+vooLht
	8OBZ357uNLJGNNUhVfH0XLqrvDigyP6nY1ez3WaepJFZB8zvhwJpzbgpR+mdq1esWe+vS1cqfrOSX
	JuTy21yrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolUM-0000ep-Rg; Fri, 26 Jun 2020 10:21:42 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolQM-0001jR-PD
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=P8EwCVabNdQlXP91SvU3A/OTscrS6AMu98szF4e4ByU=; b=V1wo7n3VRKVpwCspHvOv/4JBNV
 cTUFukaCzUNbhPjkfshEYsOBrK3mBTHKu8P0jLWy1Mv1XnvelRPdFrPaGKa216gq1EZZXxEuqdFkx
 8ZiMHA/g9sEW2E4tArdOcpcLa9WgfBGlSqz+KCvUpLymXaOHtu315eK7H3JmcXhYZVvGXXyjtTWUn
 vlupiQZnXmZ0dxQeY3Na0sGxPqVsV5ynTV12XRiAowqTdzOUPNXDdBePqxOJr+eYEdeaQkgFHreKA
 aGNVHWfuwx+FublHmvuUwQ597yzc/f8CyW0Ay5caAQDe1APOYYT1YOUULwunWcBmcdBXMkNnaX+hb
 ZTocrPeA==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojBZ-0006iL-J7
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 07:54:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F2CD9607402C;
 Fri, 26 Jun 2020 09:53:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id R-WHnR78H6HH; Fri, 26 Jun 2020 09:53:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9C55D607403C;
 Fri, 26 Jun 2020 09:53:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8HG2WKPioK3L; Fri, 26 Jun 2020 09:53:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 723FA607402C;
 Fri, 26 Jun 2020 09:53:59 +0200 (CEST)
Date: Fri, 26 Jun 2020 09:53:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <594083909.61447.1593158039373.JavaMail.zimbra@nod.at>
In-Reply-To: <20200626072714.GH15356@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200625155927.28430-2-torben.hohn@linutronix.de>
 <20200626043120.GA19105@pengutronix.de>
 <20200626072714.GH15356@linutronix.de>
Subject: Re: [PATCH 1/1] ubifs: support authentication, for ro mount, when
 no key is given
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication, for ro mount, when no key is given
Thread-Index: gXyoDg/XFBJY9i1b6pj6FZvYh3n+ag==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_085409_776327_D93538A3 
X-CRM114-Status: UNSURE (   5.59  )
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
 Sascha Hauer <s.hauer@pengutronix.de>, tglx <tglx@linutronix.de>,
 bigeasy@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEFub3RoZXIgdG9waWM6Cj4gCj4gUmlj
aGFyZCByYWlzZWQgdGhlIHBvaW50IG9uIGlyYywgdGhhdCBpbiBhIGRpcnR5IGZpbGVzeXN0ZW0s
IHRoZSBqb3VybmFsCj4gd291bGQgYmUgcmVwbGF5ZWQgZXZlbiBpbiBybyBtb2RlLgo+IAo+IGkg
ZG9udCBzZWUgdGhhdCBoYXBwZW5pbmcuCgpJIHRoaW5rIHRoZXJlIGlzIGEgY29uZnVzaW9uLiBS
ZXBsYXkgaXMgbm90IHRoZSBzYW1lIGFzIHJlY292ZXJ5LgpPZiBjb3Vyc2UgaXQgZG9lcyBub3Qg
cmVjb3ZlciwgdGhpcyBuZWVkcyB3cml0aW5nLgpCdXQgaXQgaGFzIHRvIHJlcGxheSB0aGUgam91
cm5hbCwgb3RoZXJ3aXNlIHRoZSBpbmRleCB0cmVlIGNhbiBwb2ludCB0byBhbHJlYWR5CmdhcmJh
Z2UgY29sbGVjdGVkIExFQnMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
