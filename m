Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F5DC47082
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A301610C7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A301610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2MXsvayU6Sv7a4lcBmmZMXAq/chENkwyVXdXL+HjcQ=; b=p4Uk/b4sRwC5bm
	ettC+Smi0p8OsPuxiapJVWSD7JMIbWG/sQNZ+g/X/UyHU8Yi5C0XoGkDl1YJE6z5t2kHBIJWg/PlM
	f++yDFmbH7TaSJcVP85RNsrXYyi4wkwQVu60tMXG1m5gCzgCIPWN8yQnYPSfIoFpWYUAjlpFePlEB
	xa8mupuPT73hjX8Xjw/oSen+6G9Et0fYvgC0Xf4c8vb1Jl81ELjyNq9e4/hUIRRU4q9qwq/HOgF1Y
	9wrLc0BikrOySx/cNbA8PCPrU52yElkv1P12Cap4o0+LN3ZzvDQKFACgSiR3IrJnPpERzZqrc3xas
	zMyWX3lM8gknb8jd2lQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llwz5-00FyNB-Ow; Wed, 26 May 2021 17:06:20 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llvwQ-00FZB7-E2
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 15:59:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9A06860007;
 Wed, 26 May 2021 15:59:25 +0000 (UTC)
Date: Wed, 26 May 2021 17:59:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Changes for v5.13-rc4
Message-ID: <20210526175924.4f9ab124@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_085930_666211_8305B421 
X-CRM114-Status: UNSURE (   6.63  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgcmVsZWFz
ZSBjeWNsZS4KClRoYW5rcywKTWlxdcOobAoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgNmVmYjk0M2I4NjE2ZWM1M2E1ZTQ0NDE5M2RjY2YxYWY5YWQ2MjdiNToKCiAgTGludXgg
NS4xMy1yYzEgKDIwMjEtMDUtMDkgMTQ6MTc6NDQgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTUuMTMtcmM0Cgpm
b3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNTYyYjRlOTFkM2IyMjFmNzM3Zjg0ZmY3OGVl
N2QzNDhjOGE2ODkxZjoKCiAgbXRkOiBwYXJzZXJzOiBvZnBhcnQ6IGZpeCBwYXJzaW5nIHN1YnBh
cnRpdGlvbnMgKDIwMjEtMDUtMTAgMTg6MzQ6MzAgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1URCBwYXJzZXJz
OgoqIG9mcGFydDoKICAtIEZpeCBzdWJwYXJ0aXRpb25zIHBhcnNpbmcKClJhdyBOQU5EOgoqIHR4
eDluZGZtYywgdG1pbywgc2hhcnBzbCwgbmRmYywgbHBjMzJ4eF9zbGMsIGZzbWMsIGNzNTUzeDoK
ICAtIEZpeCBleHRlcm5hbCB1c2Ugb2YgU1cgSGFtbWluZyBFQ0MgaGVscGVyCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1p
cXVlbCBSYXluYWwgKDcpOgogICAgICBtdGQ6IHJhd25hbmQ6IGNzNTUzeDogRml4IGV4dGVybmFs
IHVzZSBvZiBTVyBIYW1taW5nIEVDQyBoZWxwZXIKICAgICAgbXRkOiByYXduYW5kOiBmc21jOiBG
aXggZXh0ZXJuYWwgdXNlIG9mIFNXIEhhbW1pbmcgRUNDIGhlbHBlcgogICAgICBtdGQ6IHJhd25h
bmQ6IGxwYzMyeHhfc2xjOiBGaXggZXh0ZXJuYWwgdXNlIG9mIFNXIEhhbW1pbmcgRUNDIGhlbHBl
cgogICAgICBtdGQ6IHJhd25hbmQ6IG5kZmM6IEZpeCBleHRlcm5hbCB1c2Ugb2YgU1cgSGFtbWlu
ZyBFQ0MgaGVscGVyCiAgICAgIG10ZDogcmF3bmFuZDogc2hhcnBzbDogRml4IGV4dGVybmFsIHVz
ZSBvZiBTVyBIYW1taW5nIEVDQyBoZWxwZXIKICAgICAgbXRkOiByYXduYW5kOiB0bWlvOiBGaXgg
ZXh0ZXJuYWwgdXNlIG9mIFNXIEhhbW1pbmcgRUNDIGhlbHBlcgogICAgICBtdGQ6IHJhd25hbmQ6
IHR4eDluZGZtYzogRml4IGV4dGVybmFsIHVzZSBvZiBTVyBIYW1taW5nIEVDQyBoZWxwZXIKClJh
ZmHFgiBNacWCZWNraSAoMSk6CiAgICAgIG10ZDogcGFyc2Vyczogb2ZwYXJ0OiBmaXggcGFyc2lu
ZyBzdWJwYXJ0aXRpb25zCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvY3M1NTN4X25hbmQuYyB8IDEy
ICsrKysrKysrKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMgICB8IDEyICsr
KysrKysrKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYyB8IDE1ICsrKysr
KysrKysrKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmRmYy5jICAgICAgICB8IDEyICsrKysr
KysrKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hhcnBzbC5jICAgICB8IDEyICsrKysrKysr
KysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvdG1pb19uYW5kLmMgICB8ICA4ICsrKysrLS0tCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy90eHg5bmRmbWMuYyAgIHwgIDUgKysrLS0KIGRyaXZlcnMvbXRk
L3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYyAgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
OCBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
