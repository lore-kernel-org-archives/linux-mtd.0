Return-Path: <SRS0=RTUQ=EB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60CAC388F9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 08:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284D721BE5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 08:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obJ8D1s3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284D721BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/XCcI/hVvOJ0SHzhog3idwPXeAo9aLPIHX3/kqeY+6o=; b=obJ8D1s3oq0ENuDcThmEcD9+N
	bDnO3V9vb6MWpX8B9o9gyxMVCpspCh5bgSm96tJOCJg2WYXSXJESF8y7LF02A78ZPiO78h0qKeJ8u
	6xUmwOecyt/K2DGrChx7ESfI2AVkNiB10kx/IbjlEyMIKNAc4o1sd6hj6dAw1KMRmwWRsbfWJgYVa
	kiZajQfhR56ZwMsDW1Q/EZt9s+koS6mgB3P9VYPJn/07Mhr32gT5v25f1tS6/mUMQqdubEjPDgC/y
	E3KRfP+dJEWQ/y7Zd+8WZHBMT7ImMsJ7y6t8ZAqMwUw9LbY3TCqDsPJEU/QHpx0cBL70BtmdANPs3
	rf5C7L/Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxoQ-00089H-VY; Mon, 26 Oct 2020 08:25:07 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxoN-00087J-W6
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2020 08:25:04 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3DE53C001A;
 Mon, 26 Oct 2020 08:24:58 +0000 (UTC)
Date: Mon, 26 Oct 2020 09:24:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH] mtd-utils: Add nandflipbits tool
Message-ID: <20201026092455.463abfba@xps13>
In-Reply-To: <69a77fd7-4eb2-5b88-acee-d74e9248b602@sigma-star.at>
References: <20200424163209.26359-1-miquel.raynal@bootlin.com>
 <69a77fd7-4eb2-5b88-acee-d74e9248b602@sigma-star.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_042504_129680_5FFCB77B 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGF2aWQsCgpEYXZpZCBPYmVyaG9sbGVuemVyIDxkYXZpZC5vYmVyaG9sbGVuemVyQHNpZ21h
LXN0YXIuYXQ+IHdyb3RlIG9uIFN1biwKMTggT2N0IDIwMjAgMjI6MzI6NTcgKzAyMDA6Cgo+IEhp
LAo+IAo+IHNvcnJ5IGZvciB0aGUgZGVsYXkuIEkgbXVzdCBoYXZlIG1pc3NlZCB0aGlzIG9uZSBv
biB0aGUgTUwgYnV0IHN0dW1ibGVkCj4gb3ZlciBpdCB0b2RheSB3aGVuIGdvaW5nIHRocm91Z2gg
dGhlIHBhdGNod29yayBiYWNrbG9nLgo+IAo+IEFwbGllZCB0byBtdGQtdXRpbHMuZ2l0IG1hc3Rl
ci4KCk5vIHByb2JsZW0sIHRoYW5rcyBmb3IgYXBwbHlpbmcgaXQhCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
