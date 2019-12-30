Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB061C2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC71206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ygwe6AdY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uLN/ft+v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC71206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=baPGQMZK2lWpi5RhkuZiiR/OWp7S8zqSH7ZPsib5gZw=; b=Ygwe6AdYsoourF
	xQv6KZxb0lx5k6zmHH0tEl3CR+SJKbYWkgwmOriWXT9MCtrYUPpCOlMXEA7nD3BqQ7H6BRKLNZhgf
	7biwQjqbr4aan6WpLqz1ZQwozN5L2wDlro54lWw88WtRjJyXLVsv54g8XjouS0YRgxkYBV9geEx0F
	PAZAKUogn5ejxa0reIv8v+CUjARk2Gwo+2S0AqcRTbwVV3xhz0UC5vuMtMyp6tODqSD4awlmtc9Bf
	ESivPWQO/dyy3Zhv32VikgCQypHHcslXgTSZbrJAAbtTYDY/lP/+yRlfhjGsui5bSq3DFN+/fiSeM
	RmDrVVDPeWRwDgm0Jmlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyIY-0005DC-Dw; Mon, 30 Dec 2019 16:53:42 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyHB-0003sC-67
 for linux-mtd@bombadil.infradead.org; Mon, 30 Dec 2019 16:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Jih4qQ9A5oDp59to2utgAc/6bZwD/Gn92WdoGBFDHs=; b=uLN/ft+vK61Zo5NQs4XN8YUEsA
 P8YzCi1bfwUBNbfHn5TaU0e/A5SCyXZZrxoRzeecT3wLPOs62ADSc1NvZ+DUua/5N0E0v7AtypDhx
 7UuK0ZXrVYbM7MgYDjiqmfA30KYku3wBq36oXvA1UUaxtPO6iUo7Le3E5t0u/qunMONf+Lr4IW95t
 XkLd4RAt3YvdFgQnDwwK9aJ6BJjsOKcE/o8pru/kc8ANXyNzQwSi0Gv8/UafrotQsFT/2cAuhnWu7
 yKGSIDkrTMbWhLe2fpZdI6WdX2QnJbQF9m95FOpFu5/SrAIz7hzKvgcr8Yqk68uUvtCLXwpsh5xbZ
 HCaqGftA==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyH8-000502-Lw
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 16:52:15 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 100CAC0007;
 Mon, 30 Dec 2019 16:51:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/8] MLC in SLC mode
Date: Mon, 30 Dec 2019 17:51:21 +0100
Message-Id: <20191230165129.11925-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIHNlcmllcyBoYXMgYmVlbiBseWluZyBzaW5jZSBhIGxvbmcgdGltZSBpbiBC
b3JpcyB0cmVlLCBpdCBpcwpjbGVhbiBlbm91Z2ggdG8gYmUgdXBzdHJlYW1lZCBub3cuIFRoaXMg
d29yayBpcyBiYXNlZCBvbiB0aGUgIk1URApwYXJ0aXRpb24gaGFuZGxpbmcgcmV3b3JrIiBwYXRj
aC4KCkl0IGJhc2ljYWxseSBhbGxvd3MgdG8gd29yayAic2FmZWx5IiB3aXRoIE1MQyBOQU5Ecywg
ZGV0YWlscyBpbnNpZGUuCgpDaGVlcnMsCk1pcXXDqGwKCkJvcmlzIEJyZXppbGxvbiAoOCk6CiAg
bXRkOiByYXduYW5kOiB0b3NoaWJhOiBBZGQgYSBzcGVjaWZpYyBpbml0IGZvciBUQzU4VEVHNURD
TFRBMDAKICBtdGQ6IHJhd25hbmQ6IERlZmluZSB0aGUgImRpc3RhbmNlIDMiIE1MQyBwYWlyaW5n
IHNjaGVtZQogIG10ZDogcmF3bmFuZDogdG9zaGliYTogU2V0IHRoZSBwYWlyaW5nIHNjaGVtZSBm
b3IgVEM1OFRFRzVEQ0xUQTAwCiAgbXRkOiBBZGQgc3VwcG9ydCBmb3IgZW11bGF0ZWQgU0xDIG1v
ZGUgb24gTUxDIE5BTkRzCiAgZHQtYmluZGluZ3M6IG10ZDogcGFydGl0aW9uOiBEb2N1bWVudCB0
aGUgc2xjLW1vZGUgcHJvcGVydHkKICBtdGQ6IHBhcnRpdGlvbnM6IG9mcGFydDogUGFyc2UgdGhl
IHNsYy1tb2RlIHByb3BlcnR5CiAgbXRkOiBjbWRsaW5lcGFydDogQWRkIGFuIHNsYyBvcHRpb24g
dG8gdXNlIFNMQyBtb2RlIG9uIGEgcGFydAogIHViaTogUmVsYXggdGhlICdubyBNTEMnIHJ1bGUg
YW5kIGFsbG93IE1MQ3Mgb3BlcmF0aW5nIGluIFNMQyBtb2RlCgogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbi50eHQgICAgIHwgICAzICsKIGRyaXZlcnMvbXRkL210ZGNvcmUu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8IDE4OSArKysrKysrKysrKysrKysrLS0KIGRyaXZl
cnMvbXRkL210ZHBhcnQuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1NCArKy0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmggICAgICAgICAgICAgIHwgICAzICsKIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICB8ICA1MCArKysrKwogZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF90b3NoaWJhLmMgICAgICAgICAgIHwgIDE0ICsrCiBkcml2
ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMgICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZl
cnMvbXRkL3BhcnNlcnMvb2ZwYXJ0LmMgICAgICAgICAgICAgICAgICB8ICAgMyArCiBkcml2ZXJz
L210ZC91YmkvYnVpbGQuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIGluY2x1ZGUv
bGludXgvbXRkL210ZC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogaW5jbHVkZS9s
aW51eC9tdGQvcGFydGl0aW9ucy5oICAgICAgICAgICAgICAgIHwgICAyICsKIGluY2x1ZGUvdWFw
aS9tdGQvbXRkLWFiaS5oICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBzY3JpcHRzL3BubXRv
bG9nbyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBCaW4gMCAtPiAyMjQxNiBieXRlcwog
MTMgZmlsZXMgY2hhbmdlZCwgMzAwIGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNzU1IHNjcmlwdHMvcG5tdG9sb2dvCgotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
