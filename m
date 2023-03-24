Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C245EC6FD20
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkiWgj2qd7eVIU1Rj/lJJBVmjZjao/a2nNr4tVhECYw=; b=zQRe+c08emrbNP
	umRsq/IPJ2fLhpli8Z7KlaRPVQjncCLkYvqI8uKl+B6rD/9ZizOIvORiQGiQQsepHRx9HL4KUhl9p
	XuxDWcGhQFG1V3gLJ35hP1/5q1Bf2GsCUwbHC+00ZChraQ2pWXBnvu63OP/eh8BrjjzmhnHxMk3nC
	CZKSgBU9OF0+5AVkG5xTgkzaHH3yy9e2LYJK5YTcQN4kE0no+XpupTzqCSmH4UyG2JwiF/i4G6WOj
	ctt7eACPXdUjLigH9Uy5Vb++XyTqEv8u/0gg7iolTygPS9ZXOFPYir5W/9k6yHjX5CLhkpdi9Muhb
	I3RtoZ3Htch/n+rsGP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjL1-004r1B-0u;
	Fri, 24 Mar 2023 15:28:19 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjKx-004qzn-0A;
	Fri, 24 Mar 2023 15:28:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 65C78240003;
	Fri, 24 Mar 2023 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679671690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mARXfwIpf7ZAMCd0ELn/Vnpscd1lyFKGWYROoI8jh0=;
	b=LSg1YdPGMOxa4BJpJm97Tt3DkwYIAK0pfyk5FVixxrb9dHIZBmkKE8uibuffYFL7gqNmkw
	G0AQLhmCdPEREItZHoNU2k+schy9xR3q2FQx5BrWslcAWmIX/GkXicg4WEXppUupT33ejN
	7PVV16QFy8G9/y32RTXyOkdyWWIZHKGTCoBqKakl4uxAVhpLd+xQCwpkewH3RdrDtjCv6S
	w8AKgZMubG5d1GixDmyCTtN08ojTGQJG9j2iMF45G9KhacJt0OXLule6p13G88Sd+bwrkL
	PCme0KGHNgRJ3uQcTTaOMsTuPVr0wDZ440HBgdo4hYdsCwsdFWxaQy2lC9Boaw==
Date: Fri, 24 Mar 2023 16:28:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Jaime Liao
 <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/8] mtd: spi-nor: Reorder the preparation vs locking
 steps
Message-ID: <20230324162802.28338739@xps-13>
In-Reply-To: <57a59ac4-56bf-9aa4-540a-9d72455951d3@linaro.org>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
	<20230201113603.293758-4-miquel.raynal@bootlin.com>
	<2e2050ee-69eb-9c8a-6a4b-3d9b1b8e9286@linaro.org>
	<57a59ac4-56bf-9aa4-540a-9d72455951d3@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_082815_221431_834CEE5C 
X-CRM114-Status: GOOD (  14.03  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAxNyBNYXIg
MjAyMyAwMzo1MTozNyArMDAwMDoKCj4gT24gMy8xNy8yMyAwMzozOSwgVHVkb3IgQW1iYXJ1cyB3
cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAyLzEvMjMgMTE6MzUsIE1pcXVlbCBSYXluYWwgd3JvdGU6
ICAKPiA+PiBUaGUgLT5wcmVwYXJlKCkvLT51bnByZXBhcmUoKSBob29rcyBhcmUgbm93IGxlZ2Fj
eSwgd2Ugbm8gbG9uZ2VyIGFjY2VwdAo+ID4+IG5ldyBkcml2ZXJzIHN1cHBvcnRpbmcgdGhlbS4g
VGhlIG9ubHkgcmVtYWluaW5nIGNvbnRyb2xsZXJzIHVzaW5nIHRoZW0KPiA+PiBhY3F1aXJlcyBh
IHBlci1jaGlwIG11dGV4LCB3aGljaCBzaG91bGQgbm90IGludGVyZmVyZSB3aXRoIHRoZSByZXN0
IG9mCj4gPj4gdGhlIG9wZXJhdGlvbiBkb25lIGluIHRoZSBjb3JlLiBBcyBhIHJlc3VsdCwgd2Ug
c2hvdWxkIGJlIHNhZmUgdG8KPiA+PiByZW9yZ2FuaXplIHRoZXNlIGhlbHBlcnMgdG8gZmlyc3Qg
cGVyZm9ybSB0aGUgcHJlcGFyYXRpb24sIGJlZm9yZQo+ID4+IGFjcXVpcmluZyB0aGUgY29yZSBs
b2Nrcy4gVGhpcyBpcyBuZWNlc3NhcnkgaW4gb3JkZXIgdG8gYmUgYWJsZSB0bwo+ID4+IGltcHJv
dmUgdGhlIGxvY2tpbmcgbWVjaGFuaXNtIGluIHRoZSBjb3JlIChjb21pbmcgbmV4dCkuIE5vIHNp
ZGUgZWZmZWN0cwo+ID4+IGFyZSBleHBlY3RlZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+ICAKPiA+IAo+ID4gUmV2aWV3
ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4gIAo+IAo+IE5v
LCBJIHRha2UgYmFjayBteSBSLWIuIFRoZSByZW9yZGVyIGlzIGZpbmUsIGJ1dCB5b3UgbWlzc2Vk
IHRvIHVwZGF0ZQo+IG90cC5jIGFuZCBzd3AuYywgc2VlIGJlbG93LgoKL21lIGd1aWx0eQoKTm90
IHN1cmUgaG93IHRoYXQgc2xpcHBlZCBpbi4gQW55aG93LCBJJ2xsIGdvIHRocm91Z2ggdGhlIG1p
c3NpbmcgZmlsZXMKb2ZjLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
