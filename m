Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC392C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 17:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578096112D
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 17:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 578096112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9od+A9H73t9D0g2jmDLjob42VpYfhBcivzGJX5Ciggo=; b=23d+NHt/IBZwN2MQFLuuTbb4+8
	gNV6HAljWiv6jLMNu15W44TqdqIKmGqKRy/3aE07YN153AP8RifeTRvdBTENcDJO5N0RrRBMLKwN1
	YZ5PStYz2TrrFyZFVjmgvrsy1NAHqgFznFc/UAuMzhCSL3o8gJABMyGZdmAsRoSheHHyk033VkQSu
	xMsc7LBbA4B++rd0GLMnorBOFYSxyJUQ4OR79HlUmYv6LaC5RiGPiedYEuieE9sKXLEbHOz2G4DVc
	pcoqLP8WyQGFAteyMdwsnxI4+6FNVt3qoa50toW5Oujvv07LqdldUai5TcmJUWUv/MQ/vlkJ4XSb5
	VUU2kgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc7K-008Xan-CE; Thu, 21 Oct 2021 17:44:38 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc7F-008XVF-Sh
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 17:44:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5A4CC6283ED6;
 Thu, 21 Oct 2021 19:44:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QrwtfVvqVqnY; Thu, 21 Oct 2021 19:44:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CC7D06283EE3;
 Thu, 21 Oct 2021 19:44:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZbMDASlajDAc; Thu, 21 Oct 2021 19:44:26 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A015F6283ED6;
 Thu, 21 Oct 2021 19:44:26 +0200 (CEST)
Date: Thu, 21 Oct 2021 19:44:26 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Kristof Havasi <havasiefr@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1035601262.21954.1634838266590.JavaMail.zimbra@nod.at>
In-Reply-To: <CADBnMviZDXD4p6U4fPDsMFsY1OJYEcjkNGTXDRbbM0mKDVpaAQ@mail.gmail.com>
References: <CADBnMviweAwc1oFz2-4KtGBAQb3hii1ZkJpZDELXY_CASpd53w@mail.gmail.com>
 <1041553131.62488.1633978966122.JavaMail.zimbra@nod.at>
 <CADBnMvibQS+PZW-fJY2E+mVw4C48BuBF4PoB704L6PRfG4Absw@mail.gmail.com>
 <1040411488.65265.1634045778705.JavaMail.zimbra@nod.at>
 <CADBnMvidNZEiJfSTLe-rj+V0N=EtW8jTrYXzc2KRJKNS-zkCjg@mail.gmail.com>
 <CADBnMvhCmNQsYRVAveuf=Ri820bLyLdcrA71Nywh0mVL+X8Fng@mail.gmail.com>
 <CADBnMviZDXD4p6U4fPDsMFsY1OJYEcjkNGTXDRbbM0mKDVpaAQ@mail.gmail.com>
Subject: Re: UBIFS panic during brown-out
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS panic during brown-out
Thread-Index: cZne944wybpIvicJSuMTLXkmi7EztQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104434_113314_4C69EA4F 
X-CRM114-Status: UNSURE (   7.33  )
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

S3Jpc3RvZiwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJLcmlzdG9m
IEhhdmFzaSIgPGhhdmFzaWVmckBnbWFpbC5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBu
b2QuYXQ+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4K
PiBHZXNlbmRldDogRG9ubmVyc3RhZywgMjEuIE9rdG9iZXIgMjAyMSAxNzozMzoxNQo+IEJldHJl
ZmY6IFJlOiBVQklGUyBwYW5pYyBkdXJpbmcgYnJvd24tb3V0Cgo+IERlYXIgUmljaGFyZCwKPiAK
PiBJIG5vdGljZWQgdGhhdCBJIGZvcmdvdCB0byBDYyBsaW51eC1tdGQgZnJvbSB0aGUgcHJldmlv
dXMgZW1haWxzLgo+IAo+IExhdGVzdCB1cGRhdGU6IHdlIGNvdWxkIHJlcHJvZHVjZSB0aGUgYnVn
IHdpdGggYSB2NS4xMCBwb3J0Lgo+IFRoZSBzYW1lIEVQRVJNIGVycm9yIGlzIGhpdC4KPiAKPiBI
YXBweSB0byBoZWFyIGFueSBoaW50cyBvbiBob3cgSSBjYW4gc3VwcG9ydCBpbiBmaXhpbmcgdGhp
cyBpc3N1ZS4KCnNvIEkgZmVhciB5b3UgZm91bmQgYSBidWcgaW4gdGhlIFVCSUZTIGF1dGggY29k
ZS4KSXMgaXQgcG9zc2libGUgdG8gc2hhcmUgdGhlIGZpbGVzeXN0ZW0gYW5kIHRoZXkga2V5bWF0
ZXJpYWwgd2l0aCBtZT8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
