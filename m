Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA603C47095
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 06:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A14C610A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 06:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A14C610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIgFsyjDQcA36Wf01xbUz8nbgsuefbcOdnPvwQkPcWo=; b=sypsVboCxKJ2Xf
	e/tkygmcG4R9HHNtBmGhFOd7daOfOErvdlDtCdRrhjJRv4VjHjVPsB0dNzvDfV2NFLDgA5ki2loOO
	bi1tK1BMbhOeOYvef8Zr2ZeikeINm2V9O9bbgc5AzY+eWx6PoJiXEpdG6TQMg2wGaVMxyhsTNN/uv
	ctiQZtbUE00CMUJsgGxv151JBqF+0F8UfLaCPK97jbEI9KDsWPybLbrN80XixxEUQA2/ptN6xMdDY
	8lzrWknvySt98PA3mv8RzI+MWhWi8GEhZxu33scsp6AnTJEDUuxB+5LlG9r5vc6S7tYM4P7HDJMXI
	mJpz6sXozX4wGXRvtj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqrgN-00BuWU-2A; Wed, 09 Jun 2021 06:27:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqrgJ-00BuVA-LO
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 06:27:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C7F1E20007;
 Wed,  9 Jun 2021 06:27:10 +0000 (UTC)
Date: Wed, 9 Jun 2021 08:27:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mtd: Convert mtd-physmap to DT schema
Message-ID: <20210609082709.1aad6b81@xps13>
In-Reply-To: <20210607193500.3085920-1-robh@kernel.org>
References: <20210607193500.3085920-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_232715_859328_E408494A 
X-CRM114-Status: UNSURE (   9.63  )
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAgNyBK
dW4gMjAyMSAxNDozNTowMCAtMDUwMDoKCj4gQ29udmVydCB0aGUgbXRkLXBoeXNtYXAgYmluZGlu
ZyB0byBEVCBzY2hlbWEgZm9ybWF0LiBUaGUgYXJtLXZlcnNhdGlsZSwKPiBjeXByZXNzLGh5cGVy
Zmxhc2ggYW5kIGludGVsLGl4cDR4eC1mbGFzaCBhcmUgYWxsIGp1c3QgYW4gYWRkaXRpb25hbAo+
IGNvbXBhdGlibGUgc3RyaW5nLCBzbyB0aGV5IGFyZSBhbGwgbWVyZ2VkIGludG8gdGhlIG1haW4g
c2NoZW1hLgo+IAo+IFRoZXJlIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGFueSB1c2VycyBub3Igc3Vw
cG9ydCBmb3IgJ3ZlbmRvci1pZCcgYW5kCj4gJ2RldmljZS1pZCcsIHNvIHRoZXNlIGhhdmUgYmVl
biBkcm9wcGVkLgo+IAo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6
IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2
ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKUmV2aWV3
ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
