Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C3C76195
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZAulO1Mp0ryErjztx1tACEq6myEnwI3nL6ns2WlXs3k=; b=BAWSlN6Rs+Nxe8
	ffKJOvJWRw+78/tps/74tg8b2k4JW3zmAUO+HEZJMc/MLi4vN2LJLHAsdGfPR5rNRQW4iqa3nZAi4
	UcKYdvRcG761yMmMYzsMcyqvzpCMOVgZXwbTt41Q1VrvSXOKUmWs4I6/gGdGWTCXXTWTIIVo/X09d
	6/y2nvzp/eWq+M1GZ8jWdCCscv0UQb9r/aGFFbZiGMRH0EHQDgWelMZdEwSRZjBzej1HKkOk7gVIr
	sw0g5uLAF/b7qVY/rjlDlIjiQebFD2Mb1QuBNZFE2oF/V0XVE87DKpDhfV/61qRVh5awyLta66vTC
	0abirVqI6bt+OShHPG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi1b-00ACBP-0Z;
	Mon, 27 Mar 2023 08:16:19 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi1X-00AC9L-1H
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 08:16:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 17172C0007;
	Mon, 27 Mar 2023 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679904968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AhGcTxV5p11uOzrMrZoPGhijjb2UBKpN1RgomDHQwK8=;
	b=RKdSJvsO6r8SSdawuu2X02LK6fBfTqZbPN+rhzLPNQ+pgZih4BMdYiF8aE5HAolXFeJKJG
	zcN9qSUAcnu65BlflxFhGRdvVBSAMPIW3nOyqqktcG2wvblKB387UWJJsUQZ99AyVy1Ys3
	FyX+aa7bA0QTpV7XklYQuCe+5c4Fjh9lrqoX+pZ3WFso7coUJ9+2augZBLKeIebbRBrJP0
	ydWX1y699tTCna4i7wWsZVPiUNgcp7y3uyiazBMXZA0lh9pDHFrSGl3FEd2f7uY2+vHZJY
	RYNPpykUY60uoJ/QG2yBStKCPUPaDB9jTlC7RDvX7jn6s0X147SvT2ASKXpo7w==
Date: Mon, 27 Mar 2023 10:16:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 6.3-rc5
Message-ID: <20230327101605.5cfd4f66@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_011615_564241_F6A77644 
X-CRM114-Status: UNSURE (   7.42  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgLXJjLgoK
VGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGZlMTVj
MjZlZTI2ZWZhMTE3NDFhN2I2MzJlOWYyM2IwMWFjYTRjYzY6CgogIExpbnV4IDYuMy1yYzEgKDIw
MjMtMDMtMDUgMTQ6NTI6MDMgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTYuMy1yYzUKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byBlNzMyZTM5ZWQ5OTI5YzA1ZmQyMTkwMzViYzk2NTNiYTQxMDBkNGZh
OgoKICBtdGQ6IHJhd25hbmQ6IG1lc29uOiBpbnZhbGlkYXRlIGNhY2hlIG9uIHBvbGxpbmcgRUND
IGJpdCAoMjAyMy0wMy0yMiAxNjo1OToyOSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmF3IE5BTkQgY29udHJv
bGxlciBkcml2ZXIgZml4ZXM6CiogbWVzb246CiAgLSBJbnZhbGlkYXRlIGNhY2hlIG9uIHBvbGxp
bmcgRUNDIGJpdAogIC0gSW5pdGlhbGl6ZSBzdHJ1Y3Qgd2l0aCB6ZXJvZXMKKiBuYW5kc2ltOiBB
cnRpZmljaWFsbHkgcHJldmVudCBzZXF1ZW50aWFsIHBhZ2UgcmVhZHMKCkVDQyBlbmdpbmUgZHJp
dmVyIGZpeGVzOgoqIG14aWMtZWNjOiBGaXggbXhpY19lY2NfZGF0YV94ZmVyX3dhaXRfZm9yX2Nv
bXBsZXRpb24oKSB3aGVuIGlycSBpcyB1c2VkCgpCaW5naW5nIGZpeGVzOgoqIGplZGVjLHNwaS1u
b3I6IERvY3VtZW50IENQT0wvQ1BIQSBzdXBwb3J0CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFyc2VuaXkgS3Jhc25vdiAo
Mik6CiAgICAgIG10ZDogcmF3bmFuZDogbWVzb246IGluaXRpYWxpemUgc3RydWN0IHdpdGggemVy
b2VzCiAgICAgIG10ZDogcmF3bmFuZDogbWVzb246IGludmFsaWRhdGUgY2FjaGUgb24gcG9sbGlu
ZyBFQ0MgYml0CgpDaHJpc3RvcGhlIEpBSUxMRVQgKDEpOgogICAgICBtdGQ6IG5hbmQ6IG14aWMt
ZWNjOiBGaXggbXhpY19lY2NfZGF0YV94ZmVyX3dhaXRfZm9yX2NvbXBsZXRpb24oKSB3aGVuIGly
cSBpcyB1c2VkCgpHZWVydCBVeXR0ZXJob2V2ZW4gKDEpOgogICAgICBkdC1iaW5kaW5nczogbXRk
OiBqZWRlYyxzcGktbm9yOiBEb2N1bWVudCBDUE9ML0NQSEEgc3VwcG9ydAoKTWlxdWVsIFJheW5h
bCAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogbmFuZHNpbTogQXJ0aWZpY2lhbGx5IHByZXZlbnQg
c2VxdWVudGlhbCBwYWdlIHJlYWRzCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9qZWRlYyxzcGktbm9yLnlhbWwgfCAgNyArKysrKysrCiBkcml2ZXJzL210ZC9uYW5kL2Vj
Yy1teGljLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysr
KystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxNyArKysrKysrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
