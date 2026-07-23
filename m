Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3063C531C7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YkP4uxpasJdog0Q1EwT+dBTmzJ/SqCKKmBr3B0/5LAc=; b=uEGYa5XM3CeZh8pMaB9dPgL4YN
	zUJ8pzJBzueESWewYoifF/6CGvxJu8M7V4mdM95yuU2oALTAQnEq/YUuxM3kBhoeVtD51T9jDG1Vk
	AK0j5sGJ247l+jjoLxzqga8XmQFjZn9lpUtfIeJnIyFfi8m+ANjIhg6rTs0QnIcK24UUwr656KpfQ
	VRdXzl9StOcS0ot4uHhwqVeIg4JRESpIpoJCUv/jVNNCbeLVgW1gi6oN0KudWeOSyyNW/3Hyqp7m3
	2I+O6PdFlPpjRPKlJb1t1kEMvMmDvgI3woJjBpqVUMAc1cFQ69zR1H8d3T+PNtnVPEFJjnW3t1A2H
	IH6sQNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmop4-0000000DjgB-2Er5;
	Thu, 23 Jul 2026 08:30:30 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmop0-0000000Djew-4A2F
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 08:30:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 08EFF2ABFA3;
	Thu, 23 Jul 2026 10:30:24 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id RJd0bD4mgOSD; Thu, 23 Jul 2026 10:30:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4AA522A3C71;
	Thu, 23 Jul 2026 10:30:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MweoLfcWDj-A; Thu, 23 Jul 2026 10:30:23 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1AC35298569;
	Thu, 23 Jul 2026 10:30:23 +0200 (CEST)
Date: Thu, 23 Jul 2026 10:30:22 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Ran Hongyun <ranhongyun1@huawei.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	vapier <vapier@gentoo.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <1232942703.6876.1784795422933.JavaMail.zimbra@nod.at>
In-Reply-To: <20260723081639.3651721-1-ranhongyun1@huawei.com>
References: <20260723020233.3079997-3-ranhongyun1@huawei.com> <20260723081639.3651721-1-ranhongyun1@huawei.com>
Subject: Re: [PATCH 2/2] UBI: support per-device wear-leveling threshold
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF152 (Linux)/8.8.12_GA_3809)
Thread-Topic: support per-device wear-leveling threshold
Thread-Index: k5R/VO/ADEbyvvoapeIHuOvka4q0Uw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_013027_188797_9469C063 
X-CRM114-Status: UNSURE (   3.93  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJhbiBIb25neXVuIiA8cmFu
aG9uZ3l1bjFAaHVhd2VpLmNvbT4KPiBBbjogIlJhbiBIb25neXVuIiA8cmFuaG9uZ3l1bjFAaHVh
d2VpLmNvbT4KPiBDQzogIkFydGVtIEJpdHl1dHNraXkiIDxhcnRlbS5iaXR5dXRza2l5QGxpbnV4
LmludGVsLmNvbT4sICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJs
aW51eC1rZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgtbXRk
IiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiTWlxdWVsIFJheW5hbCIKPiA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAidmFw
aWVyIiA8dmFwaWVyQGdlbnRvby5vcmc+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIKPiA8dmlnbmVz
aHJAdGkuY29tPiwgInlhbmdlcmt1biIgPHlhbmdlcmt1bkBodWF3ZWkuY29tPiwgInlpIHpoYW5n
IiA8eWkuemhhbmdAaHVhd2VpLmNvbT4KPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMjMuIEp1bGkg
MjAyNiAxMDoxNjozOQo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggMi8yXSBVQkk6IHN1cHBvcnQgcGVy
LWRldmljZSB3ZWFyLWxldmVsaW5nIHRocmVzaG9sZAoKPiBIZXJlIGlzIHRoZSBsaW5rIHRvIFNh
c2hpa28ncyBjb21tZW50cwo+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9tZXNzYWdlLzIwMjYwNzIz
MDIwMjMzLjMwNzk5OTctMy1yYW5ob25neXVuMSU0MGh1YXdlaS5jb20KCkkgc2F3IHRoYXQgYnV0
IEkgZXhwZWN0ZWQgaXQgdG8gc2VuZCBhIG1haWwgOi0pCgpUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
