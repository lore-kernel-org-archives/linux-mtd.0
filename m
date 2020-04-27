Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BC9C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:09:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC40206E2
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bL967huY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BC40206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryaasbAV58AFTzHTSVfxhIbOGLkGUFSPiGR8sYPu0Sk=; b=bL967huYq17PSf
	/zi29uxNPCgLc4xzrBLscyY3DcpFKbnspsaJWbQIC2uqXWy8NQp0NPK2QJ7tR043z69HqTZgzWtNu
	8GXR9IHnKq22MeU+U3xOBXVZIy0S2owQl71X7qUT81MbiUoKUOo0SUMhGIkGUHNEKDrhVXlWAPrp1
	ZLUiw2umn7P7+B2B4EBTRx8fjScyBROQIwglk3kEbPKmdCpyq58yBngz9ptli2NDwtXGRBsqNl+90
	n2QFg4VQ63vmslCHc3+JtOWmyureBzbRmz0Y8GolZBUTgBfsRYhJ5n1Kwn49TmmfS7KKhv1pGPTpy
	cjAn8OUsQPmM0+SmU5gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTA4a-0002JT-RX; Mon, 27 Apr 2020 20:09:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTA4Y-0002It-7B
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 20:09:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 31D4620003;
 Mon, 27 Apr 2020 20:09:44 +0000 (UTC)
Date: Mon, 27 Apr 2020 22:09:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2 3/3] mtd: lpddr: Move function print_drs_error to
 lpddr_cmds.c
Message-ID: <20200427220942.0bf6b851@xps13>
In-Reply-To: <e0063cbd65f3b47be1db34efc494ea3047634d88.1588016644.git.gustavo@embeddedor.com>
References: <cover.1588016644.git.gustavo@embeddedor.com>
 <e0063cbd65f3b47be1db34efc494ea3047634d88.1588016644.git.gustavo@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_130946_392383_B16E2A16 
X-CRM114-Status: UNSURE (   9.70  )
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
Cc: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gTW9uLCAyNyBBcHIKMjAyMCAxNDo1NjowOCAtMDUwMDoKCj4gRnVuY3Rpb24g
cHJpbnRfZHJzX2Vycm9yIGlzIG9ubHkgdXNlZCBpbiBkcml2ZXJzL210ZC9scGRkci9scGRkcl9j
bWRzLmMKPiBzbywgYmV0dGVyIHRvIG1vdmUgaXQgdGhlcmUuCj4gCj4gQWxzbywgbm90aWNlIHRo
YXQgdGhlcmUncyBubyBuZWVkIGZvciBpbmxpbmUgYXMgdGhlIGZ1bmN0aW9uIGlzIHVzZWQKPiBv
bmNlLiAgTGFzdGx5LCBmaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdhcm5pbmc6Cj4gCj4g
V0FSTklORzogUHJlZmVyICd1bnNpZ25lZCBpbnQnIHRvIGJhcmUgdXNlIG9mICd1bnNpZ25lZCcK
PiArc3RhdGljIHZvaWQgcHJpbnRfZHJzX2Vycm9yKHVuc2lnbmVkIGRzcikKPiAKPiBTdWdnZXN0
ZWQtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3Vz
dGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPiAtLS0KPiBDaGFuZ2Vz
IGluIHYyOgo+ICAtIFJlbW92ZSBpbmxpbmUgZnJvbSBwcmludF9kcnNfZXJyb3IgYW5kIHVwZGF0
ZSBjaGFuZ2Vsb2cgdGV4dCwKPiAgICBhY2NvcmRpbmdseS4KPiAKClJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
