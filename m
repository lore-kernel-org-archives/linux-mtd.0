Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21481C3DA70
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jul 2024 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dE6dolf760tvOwDeCb/MBgO58sHqPsuzqINmD51bu8=; b=FZaB26UGR83Hrw
	CwvvGcxxsF03o3DMGY1ODHW++m0R/7IaailUaw+Yy7YoQbaifgk5f0WrfxRKZYh0f9cUVr6/yZdsM
	dKmyBZc7ZxoLnwHKhJmE/ZUsI2D17NmU4EGNXxJLwmwtzGJAwZ4qfHI+9OZ0Cv3ySnLegi8frOZUV
	j4HcpPygd2eaOJ+kyecc06PQfWPNUnJlbT8OaFYkU1bmx58smMmjpEPlPeUPCfE7S+Sxgs5ucnwRU
	nt4FX+0XKELoPhL6qADz5yHzERKjsBN93CePt5136cx1gRzFIPHHbkBy7TjDAXOHgEp1nx1VpcrgP
	mph0FFcsgvVVspRkR6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9JX-000000056Dn-47xq;
	Sat, 20 Jul 2024 12:35:51 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9JU-000000056CL-1Ywv
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jul 2024 12:35:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9D1B20007;
	Sat, 20 Jul 2024 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721478945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YFU4GtXMBwOC7a+x9p6dGyshfI24H/JKBDiclDZaWs=;
	b=cQbaEH/OHsMEqUI6QcJQUmjy9F3Ia7rBDK2D39iy4vmBaCRJtCxU3SPXvgBLRA2pYwUPF7
	KvHTlBHXhXpUPvH7N8QPzHqw18oXFnQa/Ovs59j79xg9xblwBmuZ3OATvr0PpkOXCZ2Z5L
	Xq4OT54z4i5v4oMMGwy1sUosopnK8oA/4oOj7DtssZbqAc1jCu+NeomXgFFWr+QntN92fh
	Yvr6Ps+G+CYxslUA22T5u5FYn4LL1oF2fb9FFdkzbAdgOmrJq3Ip2zNPC4I/Ql46ElVA8b
	Wa2qTmJvqe503BPYAs8MUFMePQfrxh3oDi4c3ZAh33EG9QHBrq35xCfZnhVfOg==
Date: Sat, 20 Jul 2024 14:35:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.11
Message-ID: <20240720143541.48e44aed@xps-13>
In-Reply-To: <20240717104519.6175541d@xps-13>
References: <20240717104519.6175541d@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_053548_573810_8235C5BA 
X-CRM114-Status: UNSURE (   7.74  )
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

SGksCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFdlZCwgMTcgSnVsIDIwMjQg
MTA6NDU6MTkgKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9yIDYu
MTEuCj4gCj4gSSBqdXN0IHB1c2hlZCAtZiB0aGUgbmFuZC9uZXh0IGJyYW5jaCB0byBkcm9wIGEg
RE1BIHJlbGF0ZWQgcGF0Y2ggZm9yCj4gd2hpY2ggSSByZWNlaXZlZCBubyBhbnN3ZXIgZnJvbSBW
aW5vZC4gSSBhcHBsaWVkIGl0IGJ5IG1pc3Rha2UgYW5kIGp1c3QKPiBmaWd1cmVkIHRoYXQgb3V0
IGxhc3Qgd2Vlay4KCkFwcGxpZWQgdG8gbXRkL25leHQuCgpNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
