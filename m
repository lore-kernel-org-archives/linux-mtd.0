Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518A606A881
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePK2F84M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=f4QlBeub
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DAGEdupsaVNZnne8ET43nWr3mNAInfGwTuzNPTa3iCM=; b=ePK2F84MV5E3Ixjn7CEgALU4Eh
	o5i/FwgkPBToFl904CGP3cw5o5iiGKU1jetB+AMtVfk0nc+MhpFFvw8ntKp0pnY18AmVfYtRIRO36
	DRbaMSiFZpdKRI0wykrJC229GPuku8dozuWfJYoF1W78azUIXxphwN3EebHspMuB6IzWr6rL9Oy/c
	I6r9ZW+yRmUoyfiSeAchQkgiQik+sGB5fj8AHFNlhhmIDjQt44Hxib9Sdk58v7dQPrEEz9HCnSLHC
	A+zkkT6VByAqmsmDqSHwkSnO4A5IU5nawFDtBCXETZee0NEuiVsLMCwX38OrP/p2crfyxvakI1pRc
	YdEWAYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJXg-000000060xF-15Dn;
	Tue, 17 Nov 2026 13:48:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJXd-000000060vV-1pTu
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:48:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B62AB1A162D;
	Tue, 17 Nov 2026 13:48:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B5925FC81;
	Tue, 17 Nov 2026 13:48:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB29811BC0035;
	Tue, 17 Nov 2026 14:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7/No6nm3VqZ9ub4pTP4Vx+ggz6ddHlidtsXKbQn9Ewg=;
	b=f4QlBeubnp8VPMHsOVjX7Q/rNIf1MSd8ACw7ZHi5A19vl0WJQJRqHQgD40zUVcQfwaehrx
	dpQEpm2RPnGDFxlw1iHouNUNwcCJuKSB+4mbgvSJz7OfSw1ZYqnPMTrfkEtiK99qFtI3JJ
	QRMtwLNZGb6Vt016szGxhZ5jt1y289kIHQK1ZXGKYkq71ZXlhXS5Sdcl5ty0HE4x0waPGH
	aUPsra6Tg+Sqo+QQmpIeL5TlhxoECfQy0K2xUndU367RAUtx41aFgLAjH/P7I9y2TipAJW
	7SzTE9PcojspodMn4yKzIgB6NxeVhEJlpe4hayTGr1HCqx7JwLDdxSrpxcTI0Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Shuai Liu <847807867@qq.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org, 
 kevinshq@163.com
In-Reply-To: <tencent_90082E9C18DB04917B9F74368BBAFC695306@qq.com>
References: <tencent_90082E9C18DB04917B9F74368BBAFC695306@qq.com>
Subject: Re: [PATCH] mtd: rawnand: samsung: fix pages_per_eraseblock
 calculation
Message-Id: <179492327884.2243972.14920457693822487919.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:47:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_054809_613218_2568E8EF 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMyBPY3QgMjAyNiAxNjoxNjowNyArMDgwMCwgU2h1YWkgTGl1IHdyb3RlOgo+IElu
IHNhbXN1bmdfbmFuZF9kZWNvZGVfaWQoKSwgdGhlIGRpdmlzaW9uIGJ5IG1lbW9yZy0+cGFnZXNp
emUgYmluZHMKPiB0aWdodGVyIHRoYW4gdGhlIGxlZnQgc2hpZnQgZHVlIHRvIEMgb3BlcmF0b3Ig
cHJlY2VkZW5jZSwgc28gdGhlCj4gZXhwcmVzc2lvbiBpcyBldmFsdWF0ZWQgYXM6Cj4gCj4gICAg
ICgxMjggKiAxMDI0KSA8PCAoc2hpZnQgLyBwYWdlc2l6ZSkKPiAKPiBUaGUgc2hpZnQgYW1vdW50
IGlzIGF0IG1vc3QgNyB3aGlsZSBwYWdlc2l6ZSBpcyBhdCBsZWFzdCAyMDQ4LCBzbyB0aGUKPiBp
bnRlZ2VyIGRpdmlzaW9uIGFsd2F5cyB5aWVsZHMgMCBhbmQgcGFnZXNfcGVyX2VyYXNlYmxvY2sg
ZW5kcyB1cAo+IGJlaW5nIDEzMTA3MiByZWdhcmRsZXNzIG9mIHRoZSBhY3R1YWwgY2hpcCBnZW9t
ZXRyeS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10
ZDogcmF3bmFuZDogc2Ftc3VuZzogZml4IHBhZ2VzX3Blcl9lcmFzZWJsb2NrIGNhbGN1bGF0aW9u
CiAgICAgIGNvbW1pdDogOWFlYzRjM2IxODUzMGJjOTM2ZWIzMzljOTZlYTIyNThjNGFhNTBhYwoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
