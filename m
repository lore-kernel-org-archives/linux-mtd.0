Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC8BC4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71770214D8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6OZ+ftP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71770214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWq/9xivhqrxPtv0Jne+fU2ZQ7tiWUzaD004C7Qp10E=; b=o6OZ+ftPIE/Vhp
	6Eg6Ge1x74WDA6KtYA5P+yhFk7Ilrnv4DFlF4e3czFKRJ288wqTZZ/NyE0BWGW0JqILGWbe5QGBHH
	QtWtqWxsY96gu/G/0oACHqLB57F3cyG1coXCBET5kYrw7ExRveRF+teMqxKNLYz3XwV6A6f7jGp/B
	YBxDys8vqDeSEV6siXk+oTJsuMqVCHB/KGoDICZUy8mnXB5mGbP6kzSbY/qFX8COhaTXr0a/UnnUU
	q/VhGj/AwQBmJBKY7HQzYNvnV/CwMOgSB+Ea12AhKoIXUJKP2IczpW0gvDa5qSXGHdljCUK0lxzS9
	SBPWp094y6bYI6C+tcBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8vs-0008TJ-Lo; Mon, 27 Apr 2020 18:56:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8vp-0008Rw-5p
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:56:42 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F0F3EFF803;
 Mon, 27 Apr 2020 18:56:37 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:56:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200427205636.14f84490@xps13>
In-Reply-To: <CAP6exYKtHVZrs=v+g+XU0Rx9qvFZ+xj9St7=ZZV+JLHSQy0BaA@mail.gmail.com>
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com>
 <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13>
 <20200427111623.5f93842d@collabora.com>
 <20200427114954.4fc0e8fc@collabora.com>
 <20200427164138.05076f3a@xps13>
 <CAP6exYJbpmxQztCOHum-k_CqmCDrJewZaYWk-Bsxy2dsYibbaQ@mail.gmail.com>
 <CAP6exYKtHVZrs=v+g+XU0Rx9qvFZ+xj9St7=ZZV+JLHSQy0BaA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115641_350961_D7998240 
X-CRM114-Status: UNSURE (   6.85  )
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
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgcm9uLAoKcm9uIG1pbm5pY2ggPHJtaW5uaWNoQGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAy
NyBBcHIgMjAyMCAxMTo1MDo0NgotMDcwMDoKCj4gSSB3aWxsIGFkZCB0aGF0IHRoZSBzeW50YXgg
bG9va3MgbGVzcyBuaWNlIHRvIG1lIHRoYW4gdGhlIFtdIG5vdGF0aW9uCj4gYnV0IHN0aWxsIC4u
LiBpdCBzaG91bGQgd29yay4KCkkgYWdyZWUsIGJ1dCB3ZSBuZWVkIHRvIGtlZXAgY21kbGluZSBw
YXJzaW5nIGluIGxpbmUgd2l0aCBib290bG9hZGVycwphbmQgdGhpcyBpcyBtb3JlIHByb2JsZW1h
dGljIHRvIGRvIHRoYW4gdG8gc2F5LgoKV291bGQgeW91IG1pbmQgdGVzdGluZyBpZiBpdCB3b3Jr
cyBmb3IgeW91LCB0aGVuIHBvc3QgQm9yaXMnIGRpZmYgd2l0aAp5b3VyIFRlc3RlZC1ieT8KCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
