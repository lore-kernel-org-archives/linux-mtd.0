Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAFFCCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GI6oYp7S5iiUUB9B4Oeha+2nNhWb3UT9XhBHma767DM=; b=Q1mlWTOoMR8qvV
	L8fpp+yb9wv/qAI8pnuOIFqRYpsAb+uc9d9djMJr2kUw3vOCILfvgzIhJorUgeS86kgsh5F8PFpQP
	gyvZbu6Ko+zFYjg8hc1dStpRBhSXHeun6FHM7W0m/h+3MjTQYSx+PNpdR53o2UguONMBqB9/qYy05
	6qm810sTpAJik4IlvUfnESqDGdBA8imK34YdGuAyRr24KnVPIF5PZJWU85vpFPhbW+zD21h9Oyi5l
	5TN6zcXC6YKBulkV+VpTDK7MyPGHIDBWGRiqtY6JyvUZCo+C3AqXmAxgfBQPuyfT/mlR6lRVv2Wwy
	fv92fq84lLjNYwKVaXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVkj-00000002PCp-1nkA;
	Wed, 22 Oct 2025 10:07:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVkg-00000002PBl-3e4B
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:07:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 76D021A15CE;
	Wed, 22 Oct 2025 10:07:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44C59606DC;
	Wed, 22 Oct 2025 10:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11C60102F2393;
	Wed, 22 Oct 2025 12:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iFjjzRCUrFEqnFFuf8dtrADntolucnbypUul4hlI83E=;
	b=Dx1tBiyqF0HvcOXwH/oDh9QgXjdUyAjD5CG6wdkoHHp9duLQx6526AU5IsWJ7SHkuFx23r
	VcY62jBSz6etYxQvTc1kacbaL2+CHOtMzTuBjgRQoD61VfroK6ytrnUPJEffcpZz9VZtoE
	1pQgVNJQem5FQewPJZXa/dqBUxaQq3+5f7orZjC6Kj7Bs44V1aOM/3stV7mafxExABBcUP
	ana+cc9LZ2YQihtmSPFkloCOuIGGan6iZ0iGH45or8eXunorRy1CUo+KebGoK3MGK4t4OP
	DE1JxoGOC1SzcGQkLnFJGgK5JCZSEka2u7kix1st2QXLwA8hyyq9Q6I+wufaAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] mtd: intel-dg: wake card on operations
In-Reply-To: <20251021123246.3629282-1-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Tue, 21 Oct 2025 15:32:46 +0300")
References: <20251021123246.3629282-1-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 12:07:24 +0200
Message-ID: <87wm4ns10j.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030731_037886_861D05B1 
X-CRM114-Status: UNSURE (   8.20  )
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

SGkgQWxleGFuZGVyLAoKT24gMjEvMTAvMjAyNSBhdCAxNTozMjo0NiArMDMsIEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBUaGUgSW50ZWwg
REcgY2FyZHMgZG8gbm90IGhhdmUgc2VwYXJhdGUgcG93ZXIgY29udHJvbCBmb3IKPiBwZXJzaXN0
ZW50IG1lbW9yeS4KPiBUaGUgbWVtb3J5IGlzIGF2YWlsYWJsZSB3aGVuIHRoZSB3aG9sZSBjYXJk
IGlzIGF3YWtlLgo+Cj4gRW5hYmxlIHJ1bnRpbWUgUE0gaW4gbXRkIGRyaXZlciB0byBub3RpZnkg
cGFyZW50IGdyYXBoaWNzIGRyaXZlcgo+IHRoYXQgd2hvbGUgY2FyZCBzaG91bGQgYmUga2VwdCBh
d2FrZSB3aGlsZSBudm0gb3BlcmF0aW9ucyBhcmUKPiBwZXJmb3JtZWQgdGhyb3VnaCB0aGlzIGRy
aXZlci4KPgo+IENDOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50
ZWwuY29tPgo+IC0tLQoKSSBhbSBjdXJpb3VzIHRvIGtub3cgd2h5IHRoaXMgbm93IHdvcmtzLCB3
aGVyZWFzIGluIHlvdXIgcHJldmlvdXMKYXR0ZW1wdCAod2hpY2ggaGFkIHRvIGJlIHJldmVydGVk
KSB3ZSBoYWQgdG8gZG8gYSBsb3QgbW9yZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
