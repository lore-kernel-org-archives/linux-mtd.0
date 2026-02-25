Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CADDFD3774
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU5OMI7J5DcDHJxEOM/c5NCbZNF2NP1AZUxliMPoYog=; b=fT7Y+JG0ZnREM1
	3KKkVt/cpaRcHkipxppukBYPjgm3M1B4RDejZK5VQVqzuI713QtJl6WufUTOLhmOmFHKghJi5OaPC
	lMNxLatU09b4UwNfR8AKRRRAxdFLqYJTraf55yB2FIfFOdRqOPr/2iQ7nbSDoOCKQjfxckv9M2284
	36giKDOFNdjw5F0v8Nfog0AEhOMd0aLAC9QtnMimkTU+4T8D85gRTekPe50S0Xhx9Wd6zoI3fHudl
	Cn6Ba5V0Qx92kHTt0IF8yz7rmL9kKRlmNdLHxkBsbew0wRsZfn7ksD0VqMfFHUf8xNelaK0XysKT7
	8QYr281JepNVBj36udog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI5C-00000004Z9y-3LQq;
	Wed, 25 Feb 2026 16:49:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI59-00000004Z9X-3gO3
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:49:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 75BE21A1315;
	Wed, 25 Feb 2026 16:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F1BA5FDE6;
	Wed, 25 Feb 2026 16:49:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09B1010368C53;
	Wed, 25 Feb 2026 17:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vnlHTw1jpJ7y/IagyfDJhS5F+PIUOtK6DIED1cOc3Rw=;
	b=PlWQJmgfErQnZfaLbvak6rXaJSVWitrl9TTwjyixqnMq8ecms3Xe/ib4+zl4t5iKn+e0it
	3D+uEdXlY1Gl/sHyMjBJUoGGPkuOXGZb0b/0R1QslWCm45f1udnGSjVzU5oAA+VY5V+oiu
	iHeQeHoeOH6obaE9I1FA1BGYhxiziMa7OOy7HPFJtmpkLiMYpEli+jUGosIFMIb5jRpT72
	Jjoe3GrkZjYwd+Mlx4ONXGgOANCb5XmDh48ZDeXauW86bxTNETj/vEKAfpJn2jbENOujgD
	JLgEdFnXRE/SeK3lozvEerw06vgRUQssqaHQSgLiiXGhlSWhMP5xXyJP/69F9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Finn Thain <fthain@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>, stable@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <e11761ba31af4fd1d310f40f9b6a1753a0227025.1771225290.git.fthain@linux-m68k.org>
References: <e11761ba31af4fd1d310f40f9b6a1753a0227025.1771225290.git.fthain@linux-m68k.org>
Subject: Re: [PATCH v2] mtd: Avoid boot crash in RedBoot partition table
 parser
Message-Id: <177203818789.1988281.623199213497482365.b4-ty@bootlin.com>
Date: Wed, 25 Feb 2026 17:49:47 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_084952_070670_21D822F0 
X-CRM114-Status: UNSURE (   7.39  )
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

T24gTW9uLCAxNiBGZWIgMjAyNiAxODowMTozMCArMTEwMCwgRmlubiBUaGFpbiB3cm90ZToKPiBH
aXZlbiBDT05GSUdfRk9SVElGWV9TT1VSQ0U9eSBhbmQgYSByZWNlbnQgY29tcGlsZXIsCj4gY29t
bWl0IDQzOWExYmNhYzY0OCAoImZvcnRpZnk6IFVzZSBfX2J1aWx0aW5fZHluYW1pY19vYmplY3Rf
c2l6ZSgpIHdoZW4KPiBhdmFpbGFibGUiKSBwcm9kdWNlcyB0aGUgd2FybmluZyBiZWxvdyBhbmQg
YW4gb29wcy4KPiAKPiAgICAgU2VhcmNoaW5nIGZvciBSZWRCb290IHBhcnRpdGlvbiB0YWJsZSBp
biA1MDAwMDAwMC5mbGFzaCBhdCBvZmZzZXQgMHg3ZTAwMDAKPiAgICAgLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gICAgIFdBUk5JTkc6IGxpYi9zdHJpbmdfaGVscGVycy5j
OjEwMzUgYXQgMHhjMDI5ZTA0YywgQ1BVIzA6IHN3YXBwZXIvMC8xCj4gICAgIG1lbWNtcDogZGV0
ZWN0ZWQgYnVmZmVyIG92ZXJmbG93OiAxNSBieXRlIHJlYWQgb2YgYnVmZmVyIHNpemUgMTQKPiAg
ICAgTW9kdWxlcyBsaW5rZWQgaW46Cj4gICAgIENQVTogMCBVSUQ6IDAgUElEOiAxIENvbW06IHN3
YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjE5LjAgIzEgTk9ORQo+IAo+IFsuLi5dCgpBcHBsaWVkIHRv
IG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBBdm9pZCBib290IGNyYXNoIGluIFJlZEJv
b3QgcGFydGl0aW9uIHRhYmxlIHBhcnNlcgogICAgICBjb21taXQ6IDhlMmY4MDIwMjcwYWY3Nzc3
ZDQ5YzJlNzEzMjI2MDk4M2U0ZmM1NjYKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
