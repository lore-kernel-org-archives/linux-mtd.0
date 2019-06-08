Return-Path: <SRS0=FMIu=UH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE692C468BD
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 08:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E1F214C6
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 08:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOeU2Sbs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E1F214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPLsBN9EC2738uWpYC1G7rVFKuO0PEAy+d+PffRbeBI=; b=BOeU2SbsfedXRf
	cAQAxrEp7ydCUgi85pwG1NbklSKGPviymYKNyZbUYCydzxV0x7cX9Bov8/hB0jNTSdPqnZEpHy4Pr
	4O/O3PnHecmm8ELXWxFe6qxYrYw+Jjjdf7gOTVK4GiEWjOUlaK8c+sI4MiEKjpc7BoxL9eHqGzboX
	XOK1k/QreHPX8zJ3T2rEwLdCkJDqxK0nwGDj+EYwu1UEji80axoEoHXVnroaTxHNJDWaYzYPHm8DI
	cdqkumvmTDDSGNADXIuVlqEmxUayPkAzSWKbZmJDiCRmc5MBQzKm12gZ0mUemilw4O71BGgIAshcw
	peiwMfY2+GKB2ET/TqgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZX06-0001YC-Nz; Sat, 08 Jun 2019 08:46:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZX04-0001Rs-32
 for linux-mtd@lists.infradead.org; Sat, 08 Jun 2019 08:46:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DC296608310F;
 Sat,  8 Jun 2019 10:46:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zvqCvutu62Nr; Sat,  8 Jun 2019 10:46:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A52876083112;
 Sat,  8 Jun 2019 10:46:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lDWzSDzz8har; Sat,  8 Jun 2019 10:46:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 85D98608310F;
 Sat,  8 Jun 2019 10:46:54 +0200 (CEST)
Date: Sat, 8 Jun 2019 10:46:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Emil Lenngren <emil.lenngren@gmail.com>
Message-ID: <2132182687.85021.1559983614464.JavaMail.zimbra@nod.at>
In-Reply-To: <CAO1O6seVp0wBVE6AKmu+EYhoghxbErNuK1F=Y5ewzD=CRro24g@mail.gmail.com>
References: <20190515210202.21169-1-richard@nod.at>
 <CAO1O6sdU=kAYS2sTKwiagxrbg+fMer9nvbwA9C4LoFMgH7e1dQ@mail.gmail.com>
 <1644731533.84685.1559938164477.JavaMail.zimbra@nod.at>
 <CAO1O6scuNXfgtaex_Ty4-5=DmBV43Sg28ntkzNgB5T2KwfXG3g@mail.gmail.com>
 <1342653998.84700.1559940592644.JavaMail.zimbra@nod.at>
 <CAO1O6seVp0wBVE6AKmu+EYhoghxbErNuK1F=Y5ewzD=CRro24g@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add support for zstd compression.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: ubifs: Add support for zstd compression.
Thread-Index: 1TyPXqVJ7NP9H5VZPOir3EfKZv4bww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_014656_332225_30742DD5 
X-CRM114-Status: UNSURE (   6.68  )
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
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Michele Dionisio <michele.dionisio@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEFSTSBDb3J0ZXgtQTcuIFRoZSBrZXJu
ZWwgaXMgY29tcGlsZWQgd2l0aCBnY2MgNy4zLjEuIE5leHQgd2VlayBJJ2xsCj4gdGVzdCBzb21l
IG1vcmUuCgpHb29kIHRvIGtub3chCgo+IEkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IGhvdyB0aGUg
ZGVjb21wcmVzc2lvbiBpcyBkb25lIHdoaWxlIHJlYWRpbmcuCj4gV2hlbiBhIGxhcmdlIGZpbGUg
aXMgcmVhZCBmcm9tIHRoZSBmaWxlc3lzdGVtIChhc3N1bWluZyBub3QgaW4gYW55Cj4gY2FjaGUp
LCBpcyBpdCB0aGUgY2FzZSB0aGF0IGZpcnN0IGEgY2h1bmsgaXMgcmVhZCBmcm9tIGZsYXNoLCB0
aGF0Cj4gY2h1bmsgaXMgdGhlbiBkZWNvbXByZXNzZWQsIGxhdGVyIG5leHQgY2h1bmsgaXMgcmVh
ZCBmcm9tIGZsYXNoLCB0aGF0Cj4gb25lIGlzIHRoZW4gZGVjb21wcmVzc2VkIGFuZCBzbyBvbiwg
b3IgY2FuIHRoZSBkZWNvbXByZXNzaW9uIGJlIGRvbmUKPiBpbiBwYXJhbGxlbCB3aGlsZSByZWFk
aW5nIHRoZSBuZXh0IGNodW5rIGZyb20gZmxhc2g/CgpObywgdGhpcyBpcyBhIHNlcmlhbCBvcGVy
YXRpb24uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
