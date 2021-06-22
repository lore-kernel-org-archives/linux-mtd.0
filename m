Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9C1C2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 10:44:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3B6D60231
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 10:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3B6D60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8bORt0QXcj8YqN47yvhVAg5CC8cpAahMa9yKppGkfg=; b=14dah/LDe0ghy8
	mbEfDOD8+aNxVJGQdqCP64acjJQ7ZPiHpufA57+WPCylkoUZ6jLW/dG7+fD5d4Vl48uwNX9SzM7JT
	Eu33Pb65h3wHhWcnT6VH++DOBKsOlOc8uebPleBIOK4JPGDLFOs3SOtVr7Y0Zf6p77gUV6J4msvha
	1zHZW99j5/WTIzuB6IXyyWtIpFOLRipManPcC2Eqpue7IF2vKb7jHvxS1TyRCrrq0DEGVdA5EtEus
	/p8dxri9oo5yXGhy2Y57i86b36Yvfp0+XEFw7/1RPQwzjch4UtTMJ2OGEUp+QY7SP/wZ05vqAeyT1
	1zNlenmiB47+HAd8bLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvdt8-006kLM-Cs; Tue, 22 Jun 2021 10:44:14 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvdt5-006kJA-Kv
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 10:44:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 861B940012;
 Tue, 22 Jun 2021 10:44:06 +0000 (UTC)
Date: Tue, 22 Jun 2021 12:44:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH V5 RESEND] mtd: rawnand: Add Loongson1 NAND driver
Message-ID: <20210622124405.43bb5461@xps13>
In-Reply-To: <20210520224213.7907-1-keguang.zhang@gmail.com>
References: <20210520224213.7907-1-keguang.zhang@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_034411_863826_EA718471 
X-CRM114-Status: UNSURE (   8.34  )
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

SGkgS2VndWFuZywKCktlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPiB3cm90
ZSBvbiBGcmksIDIxIE1heSAyMDIxCjA2OjQyOjEzICswODAwOgoKPiBGcm9tOiBLZWx2aW4gQ2hl
dW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgTkFORCBk
cml2ZXIgZm9yIExvb25nc29uMUIuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2VsdmluIENoZXVuZyA8
a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+CgpTb3JyeSBmb3IgdGhlIGRlbGF5LCBJIHJlYWxseSBu
ZWVkIHRvIGZvY3VzIGFuIGhvdXIgb24gdGhpcyBkcml2ZXIsIEkKZGlkbid0IHRha2UgdGhlIHRp
bWUgdG8gZG8gc28sIHRoaXMgaXMgc3RpbGwgaW4gbXkgdG9kby1saXN0LgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
