Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18A2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:17:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422B060BD3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 422B060BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gYP0R1l0uveEgQud9k29QkdpgEFztkFFIU0U14AJLZU=; b=a+0dPsAp6el55E
	BGXDZhWLyI/ZL3CXn8yirMXJ8eHr/DnVuxNjpTYlMlBfznBFG72o9NbjT5W/zKrRB3bHin20alpBV
	IWJFZUMd3XfXWlj3K8aPWw/CbcF1kM7q1lXAgmiATdDsdfQQjz8gr53Vy1tz4pHRnCx+zpxgpLbts
	1TB+d0P9COM4r2ZjF0YdMAuUQStXpazhUPXnX4uA5lvicnoonPGfR0hxjQ/RKPj7IBBKdRHHrr8Bo
	d3iLoCdpnFsKU7pCiGvkC9oe7UsqwIdiFvQw3L175SR5592CwLTk9uMKePCZJYOKYZMvqSkKF5Bwo
	8/I9gD7Z6F+SenVD7xGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKGW-006SnP-N8; Fri, 15 Oct 2021 10:16:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKGT-006Sl3-1Y
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:16:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 714B260012;
 Fri, 15 Oct 2021 10:16:32 +0000 (UTC)
Date: Fri, 15 Oct 2021 12:16:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 5.15-rc6
Message-ID: <20211015121631.2d9fa93c@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_031637_243881_E33BA916 
X-CRM114-Status: UNSURE (   6.74  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgdmVyeSBzbWFsbCBNVEQgZml4ZXMgUFIgZm9yIHRoZSBu
ZXh0IC1yYy4KClRoYW5rcywKTWlxdcOobAoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgNjg4MGZhNmM1NjYwMWJiOGVkNTlkZjZjMzBmZDM5MGNjNWY2ZGQ4ZjoKCiAgTGludXgg
NS4xNS1yYzEgKDIwMjEtMDktMTIgMTY6Mjg6MzcgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTUuMTUtcmM2Cgpm
b3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjYwZjU3NDEwMDJiOWZkZTc0OGNmZjY1ZmQw
OWJkNjIyMmM1ZGIwYzoKCiAgbXRkOiByYXduYW5kOiBxY29tOiBVcGRhdGUgY29kZSB3b3JkIHZh
bHVlIGZvciByYXcgcmVhZCAoMjAyMS0wOS0xNCAxOTozNjowMCArMDIwMCkKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmF3
IE5BTkQgY29udHJvbGxlciBkcml2ZXIgY2hhbmdlOgoqIFFjb206IFVwZGF0ZSBjb2RlIHdvcmQg
dmFsdWUgZm9yIHJhdyByZWFkcyAoUVBJQyB2MispCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1kIFNhZHJlIEFsYW0gKDEp
OgogICAgICBtdGQ6IHJhd25hbmQ6IHFjb206IFVwZGF0ZSBjb2RlIHdvcmQgdmFsdWUgZm9yIHJh
dyByZWFkCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgOCArKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
