Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC51C54798
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIfMzTdS+bEw4iI+8K7VfXDkSvn2PCHf/3ta60GkXDs=; b=rGgfiyUQmpQ9L1
	oaZ2bdUjIBtuPclzBkVIQJVeC1NAPEUwxTWydz2XQXmHzgxjktjL8g6NAoJHph15jGp/S+LoHatlx
	Iwg3LMwDPi2ykpgfyI+4jxGb7dc7EGsp5VXnItIRocMCsLXj2ROiYsJlOg6XFO2VYjUORGzI+RSSA
	je8fk27AGqIrRHYmdEY+HvtJ6p8HLC8f9NTz7/FHNDsrSxKsPM3IQ9t1PLZ6aZv3g6oUIIiYlhlya
	ojWh5NkyEy6e6dxu/URqvDMbPb/KggPWrKeQxkmXj0J0egxyBA60ynI+pn92cWch5FrFK1af23yL5
	pPvzVneoDpyNp+/HbRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdeO-0000000D9ln-13jq;
	Thu, 29 Feb 2024 10:28:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdeK-0000000D9kT-0J6e;
	Thu, 29 Feb 2024 10:28:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A52D4FF802;
	Thu, 29 Feb 2024 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709202501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeDD+DeKPSDr1WtjESPvm1w22Z1MROiKdpETcntfyV4=;
	b=WMmPu6AeTOOvO9e3UT4x19t9GFPYH0LGFFUQsBwx8l0vP+1L/K+2sdLQapD0182T0lZcyu
	TK+O2BbD4jkaRTBhkMci3nnL1OVZHJi46rMfi+t8LFBMKd2nA3r7aUas6xauxSp3H4bNoQ
	PcTh289wCQF6ZUEMVywtncbBCbUUPPRK3e19n4KnK+PeKIB6g7zn3WehLmVLMoG/T14Qgf
	PFvpZu1w01J93H7xcXRnc8MaJq/8WoLFJns7t9NW7Fk94+U+jUCg5DG+Vr7ArK8N7hpMXI
	fhkiJS4mXzaNhrkSDlYAICLzgrL+xpSuUiNc0M+XuTxeFwGNBQdtMiep3143ZQ==
Date: Thu, 29 Feb 2024 11:28:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v7] mtd: rawnand: brcmnand: Add support for getting ecc
 setting from strap
Message-ID: <20240229112818.2e54d0f6@xps-13>
In-Reply-To: <20240227201253.31978-1-william.zhang@broadcom.com>
References: <20240227201253.31978-1-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_022824_267489_1E3B3C5C 
X-CRM114-Status: GOOD (  14.45  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjcg
RmViIDIwMjQgMTI6MTI6NTIgLTA4MDA6Cgo+IFRoaXMgaXMgdGhlIHVwZGF0ZSB0byB0aGUgcGF0
Y2ggMTIgaW4gdGhlIG9yaWdpbmFsIHNlcmllcyBbMV0gdGhhdCB3YXMKPiBhcHBsaWVkIHRvIG5h
bmQtbmV4dCBleGNlcHQgdGhpcyBwYXRjaC4KClRoaXMgaXMgY29udGV4dC4gV2hpbGUgaW50ZXJl
c3RpbmcsIGl0IHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGUgY29tbWl0CmxvZyBidXQgaW5zdGVh
ZCBsb2NhdGVkLi4uCgo+IAo+IEJDTUJDQSBicm9hZGJhbmQgU29DIGJhc2VkIGJvYXJkIGRlc2ln
biBkb2VzIG5vdCBzcGVjaWZ5IGVjYyBzZXR0aW5nIGluCj4gZHRzIGJ1dCByYXRoZXIgdXNlIHRo
ZSBTb0MgTkFORCBzdHJhcCBpbmZvIHRvIG9idGFpbiB0aGUgZWNjIHN0cmVuZ3RoCj4gYW5kIHNw
YXJlIGFyZWEgc2l6ZSBzZXR0aW5nLiBBZGQgYnJjbSxuYW5kLWVjYy11c2Utc3RyYXAgZHRzIHBy
b3BldHkgZm9yCj4gdGhpcyBwdXJwb3NlIGFuZCB1cGRhdGUgZHJpdmVyIHRvIHN1cHBvcnQgdGhp
cyBvcHRpb24uIEhvd2V2ZXIgdGhlc2UgdHdvCj4gb3B0aW9ucyBjYW4gbm90IGJlIHVzZWQgYXQg
dGhlIHNhbWUgdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFt
LnpoYW5nQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBi
cm9hZGNvbS5jb20+Cj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAy
MjMwMzQ3NTguMTM3NTMtMS13aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbS8KClRoaXMgYXMgd2Vs
bCBzaG91bGQgYmUgYmVsb3cuCj4gCj4gLS0tCgouLi5oZXJlLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
