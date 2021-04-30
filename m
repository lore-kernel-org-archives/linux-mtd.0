Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C5DC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 19:50:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5519E61459
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 19:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5519E61459
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xDoV1g79mzvvfzOfFp/VvvtulOuq5G8f+UhCOL1VMuo=; b=O7h3LYSqjz3VdDo4LoJifbmwZ
	W4ElCh6n2rw2XYtaJ3nJ+oOG/rmQz0hlH3ZAS63hbdEgN3rzjMmc9PdzT7LEkIA6SwwYmHxC3Bu5i
	ABlpTPjiS6LJ8kiCcjaXwcIvQRCyqxN7B/XRVqvTd3pYdMFrgIxuA2MI9aOU1vMJDirZRzyXDlCOD
	JjxssqZSApwHDvr2C8B8RjYgDJgONITOZhSpzCCqebX1xE1Cgl71XQ6cAxv9aEljqlW9phxxaVUo+
	sWst6VKShnLl4ftBGJZtmR08A4ErjC2+8szPr7Jj+C5GZL0IQQfn60z6cra9ibn1mBAYX46zRXuyX
	Y5MttMogg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcZ7B-008S7D-GQ; Fri, 30 Apr 2021 19:47:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcZ42-008Rnw-JN
 for linux-mtd@desiato.infradead.org; Fri, 30 Apr 2021 19:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=0d9JT26JL+oYvTFFjcN1t8r8ZVYIzhjqz63qULyFUTw=; b=OXR/klNgQNUqPLSPXCfOVJQPpC
 MYcQVuw/Mkb4ssvFTEbwAa/GIRZ8S5OPhZNbcpOV1VztJ2lMpsT4+lqLAd0V5m98V9aIEYvejpXTw
 zZMhsLizykGjRlsbndgM0NnQKEe4bkewl/uHTHa4FvUC5J8YEfNmxYfxYgUh0YnKukOBeqOGReHRm
 8w4oDiDB9I1xGqAALUEplA8neNzSaf+Ky+P97LHP0Y7SWwmhn0LIhiVDh7jZofoTV6zuih9aGBqZj
 P9llB0zFENkBkHbkU8TJiVYTkfFdtjBEDLIE/KlePHzIvnLmEypmjKQABfab7lx/Bb53PG8ifqAC0
 WwPWYQTQ==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcZ3z-001cWc-JI
 for linux-mtd@lists.infradead.org; Fri, 30 Apr 2021 19:44:37 +0000
X-Originating-IP: 92.184.110.200
Received: from xps13 (pop.92-184-110-200.mobile.abo.orange.fr [92.184.110.200])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C60AEC0004;
 Fri, 30 Apr 2021 19:44:26 +0000 (UTC)
Date: Fri, 30 Apr 2021 21:44:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Bjorn
 Helgaas <bhelgaas@google.com>, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove unused Sigma Designs Tango bindings
Message-ID: <20210430214424.1987dc0b@xps13>
In-Reply-To: <20210430153225.3366000-1-robh@kernel.org>
References: <20210430153225.3366000-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_124435_797602_AB7660B9 
X-CRM114-Status: UNSURE (   8.46  )
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gRnJpLCAzMCBB
cHIgMjAyMSAxMDozMjoyNSAtMDUwMDoKCj4gVGhlIFNpZ21hIERlc2lnbnMgVGFuZ28gc3VwcG9y
dCBoYXMgYmVlbiByZW1vdmVkLCBidXQgMiBiaW5kaW5nIGRvY3MKPiBmb3IgTkFORCBhbmQgUENJ
ZSB3ZXJlIG1pc3NlZC4gUmVtb3ZlIHRoZW0uCj4gCj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gQ2M6IE1hcmMgR29uemFsZXogPG1hcmMudy5nb256YWxlekBmcmVlLmZyPgo+
IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNo
YXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJh
IDx2aWduZXNockB0aS5jb20+Cj4gQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5j
b20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXBjaUB2
Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+IC0tLQoKRm9yIHRoZSBOQU5EIGJpbmRpbmcgZG9jOgpBY2tlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
