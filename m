Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00726C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwjSmO1jTcxYxg2bk3hF/IMxD7UDK6Hoa2ismt4zSXE=; b=jxlbHWC2A4M+OE
	ib5tZZWsdXO8QWILjqrVS2IWaMA9U+TOTVBq+AzBYxmCunrQbR6Te4WPDcXAYbIfwSymhnaAUTlUy
	E6fmbPTqHtlyEXOmtdmIqAJ4wN0BR52nIHt8L5pg5s4y8ouoUs6LameInmp5MHwKEoFSaW6W7Fv/R
	BuXnuf4JNJSLqTjZYH2pkQMvuIm7GIDqCfBg34BDf+0MWHYGzvcyzOS8IeU+d3BgA+gYFhURY0Oom
	YTEUbqbm5dOul2hWUPA6fvQu/kt/GPnDvxdhYjWYSFl8kgJ7AwxCG4cG3zcz37AyIhRfVGu3pndkc
	WJBew8qVRRU1AegOrP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7V-00000008DNq-40qG;
	Fri, 07 Aug 2026 14:00:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7R-00000008DLN-3qRm
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:00:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 706EB4E4113A;
	Fri,  7 Aug 2026 14:00:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40E85603F0;
	Fri,  7 Aug 2026 14:00:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10F3211C37965;
	Fri,  7 Aug 2026 16:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C1oNEWoCvhuqR1zgrzy/BsEFkhQJQXIeKnt2pRb+ABQ=;
	b=KjLpGExNJZ8Nq39nRGJmXC9XjTfOcz6BqwGlZAXqeSOVHBnhDNpsr25bsbcK8GQE6+zI/3
	hDcMwszv/2Is3XBBRH+8H/8yRyhERh/1P07oePjcRv8xl0bWWpOKuCc2achlwJRd1/HoI4
	pkDA+qWpgHUslw4OS2z8R6BfvRQZeW83fbGLGKr+vPUzPygO3dsboJRzVFpwTVD9p/5J9S
	Aee0CBM/q6A11PFKr4ZNOol4ZjNxkQCfRPdmO0OMHXeoIbhjIAd5sc1g/YveuRxX+9MVA8
	Jy1jAZtp9U63OV7D77qHYYzg/o4Kz/7E5Nb0ybIKj0C5JvVW3t3HuONDsTexlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Huang Shijie <b32955@freescale.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260720115725.10096-1-pengpeng@iscas.ac.cn>
References: <20260720115725.10096-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: rawnand: validate ONFI extended parameter page
 sections
Message-Id: <178611120597.758547.13517822399489917781.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:00:05 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070018_091142_7F5DE1EE 
X-CRM114-Status: UNSURE (   6.72  )
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

T24gTW9uLCAyMCBKdWwgMjAyNiAxOTo1NzoyNSArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IG5hbmRfZmxhc2hfZGV0ZWN0X2V4dF9wYXJhbV9wYWdlKCkgYWxsb2NhdGVzIHRoZSBsZW5ndGgg
ZGVjbGFyZWQgYnkgdGhlCj4gT05GSSBwYXJhbWV0ZXIgcGFnZSwgdGhlbiB0cmVhdHMgdGhlIGRh
dGEgYXMgYSBmaXhlZCBoZWFkZXIgZm9sbG93ZWQgYnkKPiB2YXJpYWJsZS1sZW5ndGggc2VjdGlv
bnMuIEl0IHJlYWRzIHRoYXQgaGVhZGVyIGFuZCBhZHZhbmNlcyBvdmVyIHNlY3Rpb25zCj4gd2l0
aG91dCBmaXJzdCBwcm92aW5nIHRoYXQgdGhlIGZpeGVkIHBhZ2UgYW5kIGVhY2ggY3VycmVudCBz
ZWN0aW9uIGZpdCBpbgo+IHRoZSBhbGxvY2F0aW9uLgo+IAo+IFJlamVjdCBwYWdlcyBzaG9ydGVy
IHRoYW4gdGhlIGZpeGVkIGhlYWRlciwgdHJhY2sgdGhlIHJlbWFpbmluZyB2YXJpYWJsZQo+IGFy
ZWEgd2hpbGUgd2Fsa2luZyBzZWN0aW9ucywgYW5kIHJlcXVpcmUgdGhlIEVDQyBzZWN0aW9uIHRv
IGNvbnRhaW4gZXZlcnkKPiBmaWVsZCByZWFkIGZyb20gc3RydWN0IG9uZmlfZXh0X2VjY19pbmZv
LiBVc2UgZGV2aWNlLXNjb3BlZCBkaWFnbm9zdGljcwo+IHRoYXQgaWRlbnRpZnkgdGhlIG1hbGZv
cm1lZCBPTkZJIHNlY3Rpb24uCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHZhbGlkYXRlIE9ORkkgZXh0ZW5kZWQgcGFyYW1ldGVy
IHBhZ2Ugc2VjdGlvbnMKICAgICAgY29tbWl0OiBlNWU0MTUyNjIzMzBiZDcwZjk4M2UwOTFkODkx
OWQ5ZGNkOTllNDc1CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
