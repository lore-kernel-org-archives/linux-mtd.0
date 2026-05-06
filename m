Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1337CD3424
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O704CZoZKUGDmEZOAEeKjgHvkKmXYddHGVg7J8WuChE=; b=LskP5LtVWjeUvJ
	9R0OaRsA3XhO0Xzof79dqfZojOpQKUK4jVyy4p64ROvp1imiSRCJAKZUZwx+XrHHs3nYblAaUqsfx
	EwkMyTRTGJh8p8O1AxhexawB5CvMGJpOC13Anj/HNvxc+29CJxdlQsx1ffd+CaGj/JiWd0jORs78+
	JotlGCSTEMKRCQlBtj9lzmHB3gnkNfmZIsIiM9ZGa3RotvMAaRru6LoDn3ZicBjgyHn7zzDVl7q1a
	jRi3oUGeHz7m9oUzbonMLDKTYaSX7kQ6FYQwLs7hfMJHfKx1i+gSNU6lf5GrLwzOUlYls4MPfLNY7
	KnuTC7iSBkBLmdQNyETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKY6f-00000000Gnd-3Ssz;
	Wed, 06 May 2026 08:59:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKY6e-00000000Gml-0QbX
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 08:59:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A85D31A3550;
	Wed,  6 May 2026 08:59:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E16B6053C;
	Wed,  6 May 2026 08:59:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22115102F225A;
	Wed,  6 May 2026 10:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778057985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzSc2B+pvsAFlgPTcA86xIYUW5pnwYqBlDVEl3YjGLI=;
	b=qD3dfdhnBnhmEeUzlbUmYK+F37PHB9DPbRnq+Z64mQsrHNR+DCLGh95FG+tx8h4It+CHZd
	qKhe0XUSS84e5dPIFl6IHPmCLCLweexa+q0nxIJ3RXtME3Hs2dJftwntfN4fNJc/THBnaQ
	LhVqR41k8iBoby7on90yB3wq+/9kRlYgvgSmcLiadStp90PEgj0W0ZzFgeYi2aTFoATlji
	eps/wAf1lqTez/lT1M/fN8ysVB9S467nNWzptPxYLbi+2KqIJPXCJbH9J5vae52szb9vur
	pMDeOi7jLmRFu2jvJ6VNQHAu95hAFGXoNWFStrbbLGU+ldKLq/IXRz8p+ihmbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet"
 <corbet@lwn.net>,  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,  "Steam Lin"
 <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 16/27] mtd: spi-nor: Create a local SR cache
In-Reply-To: <DIBGRTZ3BUEE.1GIAWVBNNXUY5@kernel.org> (Michael Walle's message
	of "Wed, 06 May 2026 10:51:20 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com>
	<2vxz7bph25qx.fsf@kernel.org> <DIBGRTZ3BUEE.1GIAWVBNNXUY5@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 10:59:43 +0200
Message-ID: <87o6isncao.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015948_269289_70B846AB 
X-CRM114-Status: GOOD (  10.16  )
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

Cj4+PiBJbiBvcmRlciB0byBiZSBhYmxlIHRvIGdlbmVyYXRlIGRlYnVnZnMgb3V0cHV0IHdpdGhv
dXQgaGF2aW5nIHRvCj4+PiBhY3R1YWxseSByZWFjaCB0aGUgZmxhc2gsIGNyZWF0ZSBhIFNQSSBO
T1IgbG9jYWwgY2FjaGUgb2YgdGhlIHN0YXR1cwo+Pj4gcmVnaXN0ZXJzLiBXaGF0IG1hdHRlcnMg
aW4gb3VyIGNhc2UgYXJlIGFsbCB0aGUgYml0cyByZWxhdGVkIHRvIHNlY3Rvcgo+Pj4gbG9ja2lu
Zy4gQXMgc3VjaCwgaW4gb3JkZXIgdG8gbWFrZSBpdCBjbGVhciB0aGF0IHRoaXMgY2FjaGUgaXMg
bm90Cj4+PiBpbnRlbmRlZCB0byBiZSB1c2VkIGFueXdoZXJlIGVsc2UsIHdlIHplcm8gdGhlIGly
cmVsZXZhbnQgYml0cy4KPj4+Cj4+PiBUaGUgY2FjaGUgaXMgaW5pdGlhbGl6ZWQgb25jZSBkdXJp
bmcgdGhlIGVhcmx5IGluaXQsIGFuZCB0aGVuIG1haW50YWluZWQKPj4+IGV2ZXJ5IHRpbWUgdGhl
IHdyaXRlIHByb3RlY3Rpb24gc2NoZW1lIGlzIHVwZGF0ZWQuCj4+Cj4+IFdoYXQgaXMgdGhlIHJl
YXNvbiBmb3IgZG9pbmcgc28/IERvIHRoZSByZWFkcyBoYXZlIHNpZGUgZWZmZWN0cz8KPgo+IEkg
ZG9uJ3QgbGlrZSB0aGF0IGEgZGVidWdmcyByZWFkIHdpbGwgaXNzdWUgYSBTUEkgdHJhbnNhY3Rp
b24sIGF0Cj4gbGVhc3Qgbm90IHRoZXNlIGluZm9ybWF0aW9uYWwgZmlsZXMuCj4KPiBJZiB3ZSBl
dmVyIHdhbnQgdG8gYWNjZXNzIHRoZSByZWdpc3RlcnMgaW4gdGhlIGZsYXNoLCB3ZSBzaG91bGQg
aGF2ZQo+IGEgc2VwYXJhdGUgZGVidWdmcyBmaWxlL2ludGVyZmFjZS4KCkluZGVlZCwgdGhlIGlu
dGVudCB3YXMgdG8gYmUgYWJsZSB0byBnZW5lcmF0ZSBjb21wbGV0ZSBkZWJ1Z2ZzIG91dHB1dAp3
aXRob3V0IGFueSBwaHlzaWNhbCBhY2Nlc3MuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
