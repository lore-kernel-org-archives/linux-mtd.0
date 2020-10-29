Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C78C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 21:20:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A608320791
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 21:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDzLQSCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A608320791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DF4uqpvWY5GocESsq+VP6gqN6RWfHBubXyzSaemH0nM=; b=BDzLQSCGT/4QtHFzOXsRQfTY7
	5Ar7rSaT/VBjkoXO9iCdrlL0fzWg+9eNEw4WOn8FMN00k6kUWkniTn/E8Fy6ZPwOlZIssitvYHrvI
	PW0NJp6nlRaFEQdNv/QutfLnA7SOu8V3EA+zAR7jB724UTTFI/G54wShbBzA/wrpWVs6ALjqIx1fM
	t9EN4LiCVG1whBF2inoyL5DOyM33Q97gI/GL5pTf3737TPksuJv2FQkfFDAot+TXWTkWa93sqTNxL
	MAN0xwGaZ4j9OKciFg7CRWgIdwhMj2tDuG+KAW7pOKHZs5Okb8PAaMupi9ZU/9LB3Nd+R8dPXStAY
	AAIM+yT7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYFKg-0004u6-BA; Thu, 29 Oct 2020 21:19:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYFKd-0004t5-N8
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 21:19:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F3FBB6125F2E;
 Thu, 29 Oct 2020 22:19:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kWbuyRum225f; Thu, 29 Oct 2020 22:19:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9CE986125F34;
 Thu, 29 Oct 2020 22:19:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LKUY7TMWiTsD; Thu, 29 Oct 2020 22:19:29 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6905D6125F2E;
 Thu, 29 Oct 2020 22:19:29 +0100 (CET)
Date: Thu, 29 Oct 2020 22:19:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Barak Adam <BAdam@adva.com>
Message-ID: <1907654217.241602.1604006369174.JavaMail.zimbra@nod.at>
In-Reply-To: <1ffeedca15604810936ebb032b9af57c@adva.com>
References: <a60546366eb049698c7a0b5426361833@adva.com>
 <CAFLxGvyZUBgXyNkj0EO5pWntjfn7jObqU7XKZXxvjsQ=RN9WKw@mail.gmail.com>
 <1ffeedca15604810936ebb032b9af57c@adva.com>
Subject: Re: UBIFS corruption in empty space during mount
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS corruption in empty space during mount
Thread-Index: AdatrnVGUyizTmJwTt+/2sPCJIuVRgAKHUMAAApdQvCEM+l7Gg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_171939_866511_D326568F 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QmFyYWssCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiQmFyYWsgQWRh
bSIgPEJBZGFtQGFkdmEuY29tPgo+IFRoYW5rcyBSaWNoYXJkLgo+IAo+IEkgYWxyZWFkeSBhcHBs
aWVkIHRob3NlIHBhdGNoZXMsIGJ1dCB0aGUgaXNzdWUgaXMgbm90IHlldCBjb3ZlcmVkIC8gcmVz
b2x2ZWQuCj4gCj4gV2hhdCBraW5kIG9mIGEgZml4IHNob3VsZCBJIGFwcGx5IHRvIHRoZSBkcml2
ZXIgbGF5ZXIgLSByYWlzZSBFQ0MgZXJyb3JzIGZvciB0aGUKPiB1cHBlciBsYXllcnMgZXZlbiB3
aGVuIHJlYWR5IGVtcHR5IC8gZXJhc2VkIGFyZWEgPwoKTWF5YmUgeW91J3JlIGZhY2luZyBzb21l
dGhpbmcgZWxzZS4gRGlkIHlvdSB2ZXJpZnkgdGhhdCBpdCBpcyByZWFsbHkgZmxpcHBlZCBiaXRz
CmluIGVtcHR5IHNwYWNlPwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
