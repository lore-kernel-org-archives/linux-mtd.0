Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E0CC388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 08:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CD122447
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 08:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XvksvtYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CD122447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rpLLhqQ3Mcugo+Kta8sKqwVg8cAuEmIXHhQIlQyu0Mc=; b=XvksvtYzdn/9wfPiOoQ/vp0ll
	9O47md+wTbfiURYC3J7IEwERhieO+L21dilkz6xCXbI2KQrrw1Ri2G7l3e7Ubvt1E+qShWl6OUO+a
	I0CmitpJ7G0Lxz2gyIOHim7GIyQFjet7B+pnR3S8ujTIyr4SUVx35MsW2SF0wHYCAUGAQzo+KIr4g
	bzkmyWcqgjOljrfwG+6z6XywchKXfZfvi+jnoJbeHq5Eo3V6G0AsyNIS1bEqJDx1MkqVX5G2oi3hD
	HWS6qA9lheiFTNOaq6G5QzSvitv2r1hkjXFIt+Gfbk3YyRuACHkQqfWsO/N3YKweTXx6Iev6OQlIS
	sCNUYzkhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXgZI-0007GB-VE; Wed, 28 Oct 2020 08:12:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXgZG-0007Fi-Il
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 08:12:27 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 705451BF204;
 Wed, 28 Oct 2020 08:12:22 +0000 (UTC)
Date: Wed, 28 Oct 2020 09:12:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sa <saproj@gmail.com>
Subject: Re: [PATCH] mtd: meson: fix meson_nfc_dma_buffer_release() arguments
Message-ID: <20201028091221.4d91241c@xps13>
In-Reply-To: <20201027222015.17508-1-sa@sas-MacBook-Pro.lan>
References: <20201027222015.17508-1-sa@sas-MacBook-Pro.lan>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_041226_716830_A2E489EE 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Yixun Lan <yixun.lan@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 linux-mtd@lists.infradead.org, Jianxin Pan <jianxin.pan@amlogic.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gU2VyZ2VpLAoKc2EgPHNhcHJvakBnbWFpbC5jb20+IHdyb3RlIG9uIFdlZCwgMjggT2N0
IDIwMjAgMDE6MjA6MTUgKzAzMDA6Cgo+IEZyb206IFNlcmdlaSBBbnRvbm92IDxzYXByb2pAZ21h
aWwuY29tPgo+IAo+IEFyZ3VtZW50cyAnaW5mb2xlbicgYW5kICdkYXRhbGVuJyB0byBtZXNvbl9u
ZmNfZG1hX2J1ZmZlcl9yZWxlYXNlKCkgd2VyZSBtaXhlZCB1cC4KPiBBbHNvIGV4dHJhIHNwYWNl
cyByZW1vdmVkLgoKSWYgdGhpcyBpcyB0cnVlLCB0aGVuIHRoaXMgaXMgZGVmaW5pdGVseSBhIGJp
ZyBmaXggdGhhdCBuZWVkcyBhIEZpeGVzOgp0YWcgYXMgd2VsbCBhcyBhIENjOiBzdGFibGUgdGFn
LiBUaGUgb3RoZXIgQ2M6IGFyZSBub3QgcmVhbGx5IG5lZWRlZCBpbgp0aGUgcGF0Y2ggdGhvdWdo
LCB5b3UganVzdCBuZWVkIHRvIGFkZCB0aGVzZSBwZW9wbGUgd2hlbiBzZW5kaW5nIHRoZQpwYXRj
aC4KCkFsc28sIHBsZWFzZSBzcGxpdCB0aGlzIGludG8gdHdvIGNodW5rcy4gQmFja3BvcnRpbmcg
YSBmaXggd2l0aCBzbyBtdWNoCmV4dHJhIGNoYW5nZXMgaXMgYSBwYWluOgotIDEvMjogZml4IHRo
ZSBhcmd1bWVudHMKLSAyLzI6IGZpeCB0aGUgZXh0cmEgc3BhY2VzIChubyBuZWVkIGZvciBhIEZp
eGVzL1N0YWJsZSB0YWcgaGVyZSkuCgpUaGFua3MhCk1pcXXDqGwKCj4gU2lnbmVkLW9mZi1ieTog
U2VyZ2VpIEFudG9ub3YgPHNhcHJvakBnbWFpbC5jb20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1s
b2dpYy5jb20+Cj4gQ2M6IFlpeHVuIExhbiA8eWl4dW4ubGFuQGFtbG9naWMuY29tPgo+IENjOiBK
aWFueGluIFBhbiA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
