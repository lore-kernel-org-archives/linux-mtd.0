Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DAEC54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRLajgZzu9xfCItLplXgNuQRQ7gpdZBgGJNEdVZz15c=; b=U3ecWCmZhmaJYC
	y0z47z2P+pMX2SV7cxHb2WxN7Eb+kC3/MhlMcRsF2gI7YLofV+pwiWo+yUQjTiqSAexwoPJxShRVh
	PRb4W87XfgpQA8ZISaMtU3ZjAa0hSQ/WnvckuN2JsOrIAwsSoXX55Z+BASvdopE4Cy5OXpDj7OerE
	frW4tCZe/LGMOI+h7wsZGo9kqJPmYRAByahVvcXe1iZ79ZWhdENL7HaO68OSw/FKrpSvFGvBTTgeM
	aEMc7gDA87x62QYUV+tOHYYsXULwZzHeY8Vfe5Jhd/eRrSPvXs3wI/CrDrrSm/FBBdeMAojJTcF5c
	tDohZIxlT2rXUAAuOtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWfj-0049hE-Re; Mon, 30 Jan 2023 16:06:19 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWf0-0049fy-4f
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 16:05:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DA5B24000D;
	Mon, 30 Jan 2023 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675094730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1R+fAE3Pu9NbZG02p0c3zf0wEpQnvVjmM8iudp0VAMA=;
	b=MncjFSFozf2iV4vprkc87ZkYmgKIo+PLEjMVnSszBpIRt8xCBHPTQR44cEwK26SZL3DAgL
	k5Llmz/G0SQ/uqP1pbymMtH6uschkMtFXZAIKiQn2kov2V4Aa9O2aemYlLWHWeISsNiZwE
	8nN4encaf8u7oZv2ItKryf5Z8xJjF0K1UVeOrG3sxOhxcSooasPb5oYDlHQrKAuj6gAPqG
	alm8CGVuX9O5umoLwHvzM47Z1wNAR7IAkxvELC7p5j2Hcmz5LFCLRVSi1QRzDXKop36s84
	CHPoma+82PGqbx9/4YdFYaE+fbXE6mxxVn2awfMmRjlYN9UY2ZhaNxrCotnWMQ==
Date: Mon, 30 Jan 2023 17:05:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mason
 Yang <masonccyang@mxic.com.tw>, Jianhui Zhao <zhaojh329@gmail.com>
Subject: Re: [PATCH] mtd: spinand: macronix: use scratch buffer for DMA
 operation
Message-ID: <20230130170524.295c27af@xps-13>
In-Reply-To: <Y8i85zM0u4XdM46z@makrotopia.org>
References: <Y8i85zM0u4XdM46z@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_080534_333708_C9FE30F4 
X-CRM114-Status: GOOD (  19.18  )
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

SGkgRGFuaWVsLAoKZGFuaWVsQG1ha3JvdG9waWEub3JnIHdyb3RlIG9uIFRodSwgMTkgSmFuIDIw
MjMgMDM6NDU6NDMgKzAwMDA6Cgo+IFRoZSBteDM1bGYxZ2U0YWJfZ2V0X2VjY3NyKCkgZnVuY3Rp
b24gdXNlcyBhbiBTUEkgRE1BIG9wZXJhdGlvbiB0bwo+IHJlYWQgdGhlIGVjY3NyLCBoZW5jZSB0
aGUgYnVmZmVyIHNob3VsZCBub3QgYmUgb24gc3RhY2suIFNpbmNlIGNvbW1pdAo+IDM4MDU4MzIy
N2MwYzdmICgic3BpOiBzcGktbWVtOiBBZGQgZXh0cmEgc2FuaXR5IGNoZWNrcyBvbiB0aGUgb3Ag
cGFyYW0iKQo+IHRoZSBrZXJuZWwgZW1taXRzIGEgd2FybmluZyBhbmQgYmxvY2tzIHN1Y2ggb3Bl
cmF0aW9ucy4KPiAKPiBVc2UgdGhlIHNjcmF0Y2ggYnVmZmVyIHRvIGdldCBlY2NzciBpbnN0ZWFk
IG9mIHRyeWluZyB0byBkaXJlY3RseSByZWFkCj4gaW50byBhIHN0YWNrLWFsbG9jYXRlZCB2YXJp
YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlh
Lm9yZz4KPiAtLS0KCkxvb2tzIGxpa2UgbXkgc2NyaXB0cyBkaWQgbm90IHByb3Blcmx5IHNlbnQg
dGhlICJhcHBsaWVkIiBlLW1haWwsIHNvCmhlcmUgaXQgaXMsIEkgYXBwbGllZCB0aGlzIHBhdGNo
IHRvIG5hbmQvbmV4dC4KCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgfCAzICsr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4gaW5kZXggZGNlODM1MTMyYTFlMi4uNzIyYTk3MzhiYTM3
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYwo+IEBAIC04Myw5ICs4MywxMCBAQCBzdGF0
aWMgaW50IG14MzVsZjFnZTRhYl9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQsCj4gIAkJICogaW4gb3JkZXIgdG8gYXZvaWQgZm9yY2luZyB0aGUgd2Vhci1sZXZl
bGluZyBsYXllciB0byBtb3ZlCj4gIAkJICogZGF0YSBhcm91bmQgaWYgaXQncyBub3QgbmVjZXNz
YXJ5Lgo+ICAJCSAqLwo+IC0JCWlmIChteDM1bGYxZ2U0YWJfZ2V0X2VjY3NyKHNwaW5hbmQsICZl
Y2NzcikpCj4gKwkJaWYgKG14MzVsZjFnZTRhYl9nZXRfZWNjc3Ioc3BpbmFuZCwgc3BpbmFuZC0+
c2NyYXRjaGJ1ZikpCj4gIAkJCXJldHVybiBuYW5kZGV2X2dldF9lY2NfY29uZihuYW5kKS0+c3Ry
ZW5ndGg7Cj4gIAo+ICsJCWVjY3NyID0gKnNwaW5hbmQtPnNjcmF0Y2hidWY7Cj4gIAkJaWYgKFdB
Uk5fT04oZWNjc3IgPiBuYW5kZGV2X2dldF9lY2NfY29uZihuYW5kKS0+c3RyZW5ndGggfHwKPiAg
CQkJICAgICFlY2NzcikpCj4gIAkJCXJldHVybiBuYW5kZGV2X2dldF9lY2NfY29uZihuYW5kKS0+
c3RyZW5ndGg7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
