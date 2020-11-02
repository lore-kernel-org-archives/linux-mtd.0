Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F041CC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 07:45:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B56B2223C
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 07:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w08AyAQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B56B2223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M9NtZJ/kIRv9LbFf37QE72g/Y1btBRY0EWg/P2xuOnw=; b=w08AyAQQDGW16y+QTs4jy3TX5
	VOLPv6qm5WKZMs1rb1BXouxpfjaSNVJQ55j2gGi8hHo8SZrSQirXfFH67E+1+Mrj7v31qYTbd2sVg
	oU8EBHKx+5HnRS8hLAARd/YI1pvdcGoraxRAmoSwoj+FXQbn4pDVbZ5D/R2ip7p7IVvyHwqNpHEdU
	oxgW8dERm5Jcs9qivf8EkuE9aJ4ncMYb/U8mR5KhUJRJxnjRhQ2yt14da9EGlL2k2hkHUOV12hI6x
	GGbdpELiXf4k6MEkzGpMdC85ydTXm9pMhgbg0xN29rm3jHD5t/4AosIRYzDKZlQn9Yi1UW7Vo2LBR
	e2BdNuQZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUWA-0001bH-Me; Mon, 02 Nov 2020 07:44:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUW6-0001ZL-FE
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 07:44:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B99F960D0906;
 Mon,  2 Nov 2020 08:44:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lW0KKpV6zgay; Mon,  2 Nov 2020 08:44:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4A66B6125F24;
 Mon,  2 Nov 2020 08:44:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HEVr99BAbDmt; Mon,  2 Nov 2020 08:44:31 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2351E60D0906;
 Mon,  2 Nov 2020 08:44:31 +0100 (CET)
Date: Mon, 2 Nov 2020 08:44:31 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Barak Adam <BAdam@adva.com>
Message-ID: <809847959.256251.1604303071010.JavaMail.zimbra@nod.at>
In-Reply-To: <75f2f7306c284860beb1769b93d54269@adva.com>
References: <a60546366eb049698c7a0b5426361833@adva.com>
 <CAFLxGvyZUBgXyNkj0EO5pWntjfn7jObqU7XKZXxvjsQ=RN9WKw@mail.gmail.com>
 <1ffeedca15604810936ebb032b9af57c@adva.com>
 <1907654217.241602.1604006369174.JavaMail.zimbra@nod.at>
 <75f2f7306c284860beb1769b93d54269@adva.com>
Subject: Re: UBIFS corruption in empty space during mount
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS corruption in empty space during mount
Thread-Index: AdatrnVGUyizTmJwTt+/2sPCJIuVRgAKHUMAAApdQvCEM+l7GoQuMFZw7dj7v54=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_024439_628822_827D576A 
X-CRM114-Status: UNSURE (   8.08  )
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
bSIgPEJBZGFtQGFkdmEuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+IEND
OiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gR2VzZW5kZXQ6
IE1vbnRhZywgMi4gTm92ZW1iZXIgMjAyMCAwNzowNjoyNQo+IEJldHJlZmY6IFJFOiBVQklGUyBj
b3JydXB0aW9uIGluIGVtcHR5IHNwYWNlIGR1cmluZyBtb3VudAoKPiBIaSBSaWNoYXJkLAo+IAo+
IEl0IGlzIGRldGVjdGVkIGFzIGFuIGVtcHR5IGFyZWEgYnkgVUJJRlMuIFJlZ2FyZGluZyBiaXRm
bGlwcywgSSBhbSBub3Qgc3VyZS4gSQo+IGFtIHJ1bm5pbmcgaXQgd2l0aCBkZWJ1ZyBwcmludG91
dHMsIHRvIGR1bXAgdGhlIGNvcnJ1cHRpb24gYW5kIGFuYWx5emUgaXQuCj4gQW55IG90aGVyIGlk
ZWEgaG93IHRvIGRldGVjdCBpZiB0aGUgdW5kZXJseWluZyBjb3JydXB0aW9uIGlzIGJpdGZsaXBz
IG9yCj4gc29tZXRoaW5nIGVsc2U/CgpJIHRoaW5rIGl0IGlzIHRoZSBvdmVyIHdheSBhcm91bmQu
IFVCSUZTIGV4cGVjdHMgZW1wdHkgc3BhY2UgYnV0IGZpbmRzIHNvbWV0aGluZyBlbHNlLgpGaW5k
IHRoZSBtZXNzYWdlIGluIFVCSUZTIGFuZCBkdW1wIHRoZSBidWZmZXIgdG8gZG1lc2cuIDotKQoK
VGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
