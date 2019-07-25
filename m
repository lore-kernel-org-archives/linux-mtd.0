Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE66C76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 20:56:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F89218D4
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 20:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6KFhxZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F89218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2mtSOyXAtD090BmPlcdgar88pxn1n8llElWN6lht1ls=; b=C6KFhxZW3wZ5t3
	d1G9TDtTqrNE19t8bBO+29fNdToTo9sbnbzT75zlimVhHyyptjw0R7pW5oNtlOXi7jAn3AoPXbK9h
	vPreuPQpbhWCx7vsw9r5h0vt1gITx+NjCXIMCoywPcS3KFAe9yQGKlGKrgUAGJoAjROjZdm+ZJnlu
	MHByCdymi5ZfUxIsYMxTtXQRWtw68g6EW+jk6fIVYaViFwPDWYydjdc2orhPtW9Q50kikygLNjGjd
	VJhKytjM/vP0auMIMB7Kh4A4jSrqJRjcmrRAPjyCoPNOwhTG8HY9IFOoIVlKTWpS/YqvHp88WExb+
	8STcIraE0QqZXyXuxMjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqkn0-0006MM-4p; Thu, 25 Jul 2019 20:56:38 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqkmx-0006Lw-Dw
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 20:56:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 29299181821E2;
 Thu, 25 Jul 2019 22:56:34 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XXS71RVJWrln; Thu, 25 Jul 2019 22:56:32 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id j5Pe0l-OsbEP; Thu, 25 Jul 2019 22:56:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Correctly initialize c->min_log_bytes
Date: Thu, 25 Jul 2019 22:56:27 +0200
Message-Id: <20190725205627.31313-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_135635_607019_C48A161F 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Richard Weinberger <richard@nod.at>, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q3VycmVudGx5IG9uIGEgZnJlc2hseSBtb3VudGVkIFVCSUZTLCBjLT5taW5fbG9nX2J5dGVzIGlz
IDAuClRoaXMgY2FuIGxlYWQgdG8gYSBsb2cgb3ZlcnJ1biBhbmQgbWFrZSBjb21taXRzIGZhaWwu
CgpSZWNlbnQga2VybmVscyB3aWxsIHJlcG9ydCB0aGUgZm9sbG93aW5nIGFzc2VydDoKVUJJRlMg
YXNzZXJ0IGZhaWxlZDogYy0+bGhlYWRfbG51bSAhPSBjLT5sdGFpbF9sbnVtLCBpbiBmcy91Ymlm
cy9sb2cuYzo0MTIKCmMtPm1pbl9sb2dfYnl0ZXMgY2FuIGhhdmUgdHdvIHN0YXRlcywgMCBhbmQg
Yy0+bGViX3NpemUuCkl0IGNvbnRyb2xzIGhvdyBtdWNoIGJ5dGVzIG9mIHRoZSBsb2cgYXJlYSBh
cmUgcmVzZXJ2ZWQgZm9yIG5vbi1idWQKbm9kZXMgc3VjaCBhcyBjb21taXQgbm9kZXMuCgpBZnRl
ciBhIGNvbW1pdCBpdCBoYXMgdG8gYmUgc2V0IHRvIGMtPmxlYl9zaXplIHN1Y2ggdGhhdCB3ZSBo
YXZlIGFsd2F5cwplbm91Z2h0IHNwYWNlIGZvciBhIGNvbW1pdC4gV2hpbGUgYSBjb21taXQgcnVu
cyBpdCBjYW4gYmUgMCB0byBtYWtlIHRoZQpyZW1haW5pbmcgYnl0ZXMgb2YgdGhlIGxvZyBhdmFp
bGFibGUgdG8gd3JpdGVycy4KCkhhdmluZyBpdCBzZXQgdG8gMCByaWdodCBhZnRlciBtb3VudCBp
cyB3cm9uZyBzaW5jZSBubyBzcGFjZSBmb3IgY29tbWl0cwppcyByZXNlcnZlZC4KClJlcG9ydGVk
LWFuZC10ZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+Ci0tLQogZnMvdWJpZnMvc3VwZXIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3N1cGVyLmMgYi9mcy91Ymlmcy9zdXBl
ci5jCmluZGV4IDJjMDgwM2IwYWMzYS4uOGMxZDU3MTMzNGJjIDEwMDY0NAotLS0gYS9mcy91Ymlm
cy9zdXBlci5jCisrKyBiL2ZzL3ViaWZzL3N1cGVyLmMKQEAgLTYwOSw2ICs2MDksMTAgQEAgc3Rh
dGljIGludCBpbml0X2NvbnN0YW50c19lYXJseShzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKIAljLT5t
YXhfYnVfYnVmX2xlbiA9IFVCSUZTX01BWF9CVUxLX1JFQUQgKiBVQklGU19NQVhfREFUQV9OT0RF
X1NaOwogCWlmIChjLT5tYXhfYnVfYnVmX2xlbiA+IGMtPmxlYl9zaXplKQogCQljLT5tYXhfYnVf
YnVmX2xlbiA9IGMtPmxlYl9zaXplOworCisJLyogTG9nIGlzIHJlYWR5LCBwcmVzZXJ2ZSBvbmUg
TEVCIGZvciBjb21taXRzLiAqLworCWMtPm1pbl9sb2dfYnl0ZXMgPSBjLT5sZWJfc2l6ZTsKKwog
CXJldHVybiAwOwogfQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
