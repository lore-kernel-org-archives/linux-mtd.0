Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412A1C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 07:50:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A862D20829
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 07:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="04GWGuK2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A862D20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=no+fFZbgHIIdtQpD3uK3O520Ya3wwRpvutpybiRxL74=; b=04GWGuK2lzHb+m/OwwPIvSU7Je
	IxgrS1Mew0RJtybGJSiu3VIaiHAyc6Hj+CGkxW8+K1DTif+hqV3jvwKdWGGRr5JOjSwwnjvYzP9zP
	pqzuVVk8ynCz2plBOOgJnOHYtjCncXNxB2DRtztkKoeV8hw3zqxq2LdMG5Uh9nXUHIEzigD8vwJce
	rTSfewnyeIYw3/PoAgoG9bqa+74MTwSUm7834WqLKWW8EBNyhL0jWvtw8CUhRzHrzsB8vIkFLOMB7
	Mr5d3xaaSD2NIa+86XcANimBZSKix6IyJDHRSFX8WTupa2G5TQBo9SrQNrJUDUpfzFVoOre+yCFEX
	bMjXuMkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTKUq-0007ca-Sl; Fri, 16 Oct 2020 07:49:52 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTKUm-0007cB-V1
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 07:49:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BA868FF80B;
 Fri, 16 Oct 2020 07:49:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to the
 right place
Date: Fri, 16 Oct 2020 09:49:42 +0200
Message-Id: <20201016074942.29650-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_034949_111263_64AEC144 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <xhnjupt@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tm8gRUNDIGluaXRpYWxpemF0aW9uIHNob3VsZCBoYXBwZW4gZHVyaW5nIHRoZSBob3N0IGNvbnRy
b2xsZXIgcHJvYmUuCgpJbmRlZWQsIHdlIG5lZWQgdGhlIHByb2JlIHRvIGNhbGwgbmFuZF9zY2Fu
KCkgaW4gb3JkZXIgdG86Ci0gaWRlbnRpZnkgdGhlIGRldmljZSwgaXRzIGNhcGFiaWxpdGllcyBh
bmQgY29uc3RyYWludHMgKG5hbmRfc2Nhbl9pZGVudCgpKQotIGNvbmZpZ3VyZSB0aGUgRUNDIGVu
Z2luZSBhY2NvcmRpbmdseSAoLT5hdHRhY2hfY2hpcCgpKQotIHNjYW4gaXRzIGNvbnRlbnQgYW5k
IHByZXBhcmUgdGhlIGNvcmUgKG5hbmRfc2Nhbl90YWlsKCkpCgpNb3ZpbmcgdGhlc2UgbGluZXMg
dG8gbXhjbmRfYXR0YWNoX2NoaXAoKSBmaXhlcyBhIHJlZ3Jlc3Npb24gY2F1c2VkIGJ5CmEgcHJl
dmlvdXMgY29tbWl0IHN1cHBvc2VkIHRvIGNsYXJpZnkgdGhlc2Ugc3RlcHMuCgpGaXhlczogVE9E
TwpTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PgotLS0KCkhpIEhhbiwKCkNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSB0aGlzIHBhdGNoIGEgc2hvdD8g
SXQgaXMgc3VwcG9zZWQgdG8gZml4CnRoZSBMUzEwNDNBIGlzc3VlIHdlIGhhdmUgc2VlbiBpbiBy
b2JvdHMgcmVwb3J0cyB0aGUgbGFzdCB3ZWVrcy4KCkkga2VwdCB0aGUgRml4ZXM6IHRhZyBlbXB0
eSBiZWNhdXNlIEkgbmVlZCB0aGUgb3JpZ2luYWwgcGF0Y2ggdG8gYmUKbWVyZ2VkIGluIExpbnVz
JyB0cmVlIGZpcnN0IGJ1dCBpZiBpdCBmaXhlcyB0aGUgaXNzdWUgSSB3aWxsIG1lcmdlIGl0CmF0
IC1yYzEgb3IgLXJjMi4KClRoYW5rcywKTWlxdcOobAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L214
Y19uYW5kLmMgfCAyNCArKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9teGNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhjX25hbmQuYwpp
bmRleCBkNDIwMGViMmFkMzIuLjZiYTk2ZjM0M2EzZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbXhjX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5j
CkBAIC0xNjgxLDYgKzE2ODEsMTggQEAgc3RhdGljIGludCBteGNuZF9hdHRhY2hfY2hpcChzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwKQogCXN0cnVjdCBteGNfbmFuZF9ob3N0ICpob3N0ID0gbmFuZF9n
ZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IG10ZC0+ZGV2
LnBhcmVudDsKIAorCWNoaXAtPmVjYy5ieXRlcyA9IGhvc3QtPmRldnR5cGVfZGF0YS0+ZWNjYnl0
ZXM7CisJaG9zdC0+ZWNjc2l6ZSA9IGhvc3QtPmRldnR5cGVfZGF0YS0+ZWNjc2l6ZTsKKwljaGlw
LT5lY2Muc2l6ZSA9IDUxMjsKKwltdGRfc2V0X29vYmxheW91dChtdGQsIGhvc3QtPmRldnR5cGVf
ZGF0YS0+b29ibGF5b3V0KTsKKworCWlmIChob3N0LT5wZGF0YS5od19lY2MpIHsKKwkJY2hpcC0+
ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVDsKKwl9IGVsc2Ug
eworCQljaGlwLT5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUOwor
CQljaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKKwl9CisKIAlzd2l0Y2gg
KGNoaXAtPmVjYy5lbmdpbmVfdHlwZSkgewogCWNhc2UgTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05f
SE9TVDoKIAkJY2hpcC0+ZWNjLnJlYWRfcGFnZSA9IG14Y19uYW5kX3JlYWRfcGFnZTsKQEAgLTE4
MzYsMTkgKzE4NDgsNyBAQCBzdGF0aWMgaW50IG14Y25kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJaWYgKGhvc3QtPmRldnR5cGVfZGF0YS0+YXhpX29mZnNldCkKIAkJaG9z
dC0+cmVnc19heGkgPSBob3N0LT5iYXNlICsgaG9zdC0+ZGV2dHlwZV9kYXRhLT5heGlfb2Zmc2V0
OwogCi0JdGhpcy0+ZWNjLmJ5dGVzID0gaG9zdC0+ZGV2dHlwZV9kYXRhLT5lY2NieXRlczsKLQlo
b3N0LT5lY2NzaXplID0gaG9zdC0+ZGV2dHlwZV9kYXRhLT5lY2NzaXplOwotCiAJdGhpcy0+bGVn
YWN5LnNlbGVjdF9jaGlwID0gaG9zdC0+ZGV2dHlwZV9kYXRhLT5zZWxlY3RfY2hpcDsKLQl0aGlz
LT5lY2Muc2l6ZSA9IDUxMjsKLQltdGRfc2V0X29vYmxheW91dChtdGQsIGhvc3QtPmRldnR5cGVf
ZGF0YS0+b29ibGF5b3V0KTsKLQotCWlmIChob3N0LT5wZGF0YS5od19lY2MpIHsKLQkJdGhpcy0+
ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVDsKLQl9IGVsc2Ug
ewotCQl0aGlzLT5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUOwot
CQl0aGlzLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKLQl9CiAKIAkvKiBOQU5E
IGJ1cyB3aWR0aCBkZXRlcm1pbmVzIGFjY2VzcyBmdW5jdGlvbnMgdXNlZCBieSB1cHBlciBsYXll
ciAqLwogCWlmIChob3N0LT5wZGF0YS53aWR0aCA9PSAyKQotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
