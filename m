Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE800CFD2F6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmBmxSWGvKFiBKnGJRY3SLE06tCotRHJyvXcetVOx3M=; b=dI9ihvpmQKA3pD
	usQ28GL8b9XRCiUxLbvXMHv0nks5xnDhnolt4n8SfgSa8lWX0mirt9iusOciSITlyEs4KpBlbWFtV
	Aab4kSOVBBYIzQRhKu8bhHp37mjdmKcObQX3hewNchm03aB5YjalWkl8QADdaY7Kp00bxAq9e7DEF
	i8XOebM3WykR29auefE/7NqfcQ+ORDRKlJiemlUVk5wqqFqAN8ssXt123tODu+/DdKFDLExqHBbbQ
	HNfFLHfpg2OGxwJ4YARpZvSoNpaL2KeyAhDAh+S7wwCa2eGZ6PdF8KytSlNpHwdeVw4zSPBdnN0Ue
	fX6XAZPwquJPQVaVZWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKIK-00000001X0l-11R9;
	Sat, 29 Nov 2025 12:43:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKIH-00000001X0P-33tL
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:43:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E96CC10190;
	Sat, 29 Nov 2025 12:42:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96D1860706;
	Sat, 29 Nov 2025 12:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98574119105D5;
	Sat, 29 Nov 2025 13:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cF495nBrHIfBkXL9oefmRkF3Pc1dbM6yG5KSpqEMViY=;
	b=Gca1UDQD7TLeq7Qici/VXubYij2/T7ZJQ8kHwuHV87ckdU2QUgNlNdDI+dQkTY74JN+pN4
	Z06KlC/cw+DNA8ZJcyZmUlMLha2KqbjAhBvoruND8CAmP7yCA/26NA3tnfRfZ/Sj5E27qF
	0b/zV/++7loCQQhgvL9MvLH9Vlzgi20hs6a8GYObuNPYXEpqL8RLmpZ/pmh3R6NtuBN9mQ
	RT1c6xUSRcWtXiJ40CGg3PIepV33+1Fz++nG/PKT0T2QkzKhfA/KIKw0Y2eWK61+UhIjBQ
	ltSFuOWMlrQKD9qhbASuHATRzdhZs9aCj8Yvp1HxXVE/sdAhsr0IV360FFK//Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at,
	vigneshr@ti.com,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
Date: Sat, 29 Nov 2025 13:43:07 +0100
Message-ID: <176442014544.45479.15790176921184531760.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251123163551.1781-1-vulab@iscas.ac.cn>
References: <20251123163551.1781-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_044317_927062_9F0E0F58 
X-CRM114-Status: UNSURE (   9.31  )
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

T24gTW9uLCAyNCBOb3YgMjAyNSAwMDozNTo1MSArMDgwMCwgSGFvdGlhbiBaaGFuZyB3cm90ZToK
PiBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkgY2FuIGZhaWwgZHVlIHRvIG1lbW9yeSBhbGxvY2F0
aW9uIGZhaWx1cmVzLgo+IFRoZSBjdXJyZW50IGNvZGUgaWdub3JlcyBpdHMgcmV0dXJuIHZhbHVl
IGFuZCBwcm9jZWVkcyB3aXRoCj4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpLCB3aGljaCBt
YXkgb3BlcmF0ZSBvbiBpbmNvcnJlY3RseQo+IGluaXRpYWxpemVkIHJ1bnRpbWUgUE0gc3RhdGUu
Cj4gCj4gQ2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZiBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkg
YW5kIHJldHVybiB0aGUKPiBlcnJvciBjb2RlIGlmIGl0IGZhaWxzLgo+IAo+IFsuLi5dCgpBcHBs
aWVkIHRvIG5hbmQvbmV4dCBhZnRlciBmaXhpbmcgdGhlIHNwYWNpbmcsIHRoYW5rcyEKClsxLzFd
IG10ZDogcmF3bmFuZDogcmVuZXNhczogSGFuZGxlIGRldm1fcG1fcnVudGltZV9lbmFibGUoKSBl
cnJvcnMKICAgICAgY29tbWl0OiBhMzYyM2UxYWUxZWQ2YmU0ZDQ5YjJjY2I5OTk2YTlkMmI2NWMx
ODI4CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
