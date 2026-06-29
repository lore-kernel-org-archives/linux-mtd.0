Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1986BC43602
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi+fSd2zkWXc8+DYMQ8L0ua9+wAv210K3cbx2xccyDE=; b=WGjCO9zAEwtlnt
	HLYZ+kRXVnNQ+rkOSW3eqHIOIstKJ14CknU0F42vwTCGcGqPSELNWS4nlV+8QD3a49A6DhWJQRuuc
	6t5nx09G8P+PP4EnUASLT/cCBgN+4M+uZFsRuPHIt1LVax2M1EQOgH7+KC/zjrj5A++92MIZzy+4Y
	1c6j47lPLofzXNf0/CWB9HGcvo4uldnDrpnIZ4dUu/Dk2V+abZsx59NfLZYyXe4GF2V6ckGcYwXln
	Q/ICfn0Z6rI/r1jYBrasjJ5D2AAXRk2jTHNX57HalGzYawUEp6s4AMjfRDQsxgmdtxBJSfC9cVYOC
	8QMjfMrNn9g82m5umS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD7r-0000000Etiy-45zs;
	Mon, 29 Jun 2026 14:38:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD7o-0000000Etgc-1D7W
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:38:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C40B4E407AD;
	Mon, 29 Jun 2026 14:38:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D69345FF96;
	Mon, 29 Jun 2026 14:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5775A106F1820;
	Mon, 29 Jun 2026 16:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=22d5zsb5eHV6X3qH+husMyn9pxJwo2xPNeDyq25QliQ=;
	b=tRcjIY8stI0+2ioQeLBrpNvDcI1GRrR+X9QqG9lxRR/dbfGNQH8fgLN3x3qdyuxUNA0Ifp
	u+nnqPGS0gg0odf/qm0MGbSoIO00bz9IcctdGuLi24Xs4zOFd3vW7XIxK9V0mr1NaQg3YO
	u2kelfEEeXmBV9yDPeKafx7NUrLCZE2mgNzJnTig7WEvnTwBb7qdfH6UKDOVemB2MzP9TU
	9Qcf3tF8oCwsJTOxfDlr4RUR8T5otF7jLbBJSjDyA897DmfWpBIErU5MrUgOrVEVzI8txo
	BJFRc5neY+gdOBj+sYigzDzMekSo9qXnowfP5H8Aq8qixQSrXyY5qqoaoiOkEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Breno Leitao <leitao@debian.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hruben@meta.com, kernel-team@meta.com
In-Reply-To: <20260610-cfi_intelext_suspend-v1-1-05376b7384fe@debian.org>
References: <20260610-cfi_intelext_suspend-v1-1-05376b7384fe@debian.org>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: silence spurious suspend warning
 on shutdown
Message-Id: <178274388605.252933.12655026400915894133.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:38:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_073816_469236_B9A05CED 
X-CRM114-Status: UNSURE (   6.72  )
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

T24gV2VkLCAxMCBKdW4gMjAyNiAwMjowOTo0MCAtMDcwMCwgQnJlbm8gTGVpdGFvIHdyb3RlOgo+
IGNmaV9pbnRlbGV4dF9yZWJvb3QoKSBwdXRzIGVhY2ggY2hpcCBpbnRvIEZMX1NIVVRET1dOIChh
cnJheSBtb2RlKSB2aWEKPiB0aGUgcmVib290IG5vdGlmaWVyIHNvIHRoZSBib290bG9hZGVyIGNh
biByZWFkIHRoZSBmbGFzaCBvbiB0aGUgbmV4dAo+IGJvb3QuIElmIHBtX3N1c3BlbmQgdGhlbiBy
dW5zIG9uIHRoZSBzYW1lIGNoaXAgZHVyaW5nIHRoZSBzaHV0ZG93bgo+IHNlcXVlbmNlLCBjZmlf
aW50ZWxleHRfc3VzcGVuZCgpIGZhbGxzIGludG8gdGhlIGRlZmF1bHQgYnJhbmNoIGFuZAo+IHBy
aW50czoKPiAKPiAgIEZsYXNoIGRldmljZSByZWZ1c2VkIHN1c3BlbmQgZHVlIHRvIGFjdGl2ZSBv
cGVyYXRpb24gKHN0YXRlIDIwKQo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IGNmaV9jbWRzZXRfMDAwMTogc2lsZW5jZSBzcHVyaW91cyBzdXNwZW5k
IHdhcm5pbmcgb24gc2h1dGRvd24KICAgICAgY29tbWl0OiAzNjlhMDkxODg0MDc3MjI1YWU4ZTg3
MzFmZDhlOGM5M2U1NjgzZGNjCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
