Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0EECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/Y3i+5i1DKW83Ow9zAcn15Cuy8TKSjc/QNgnP3fUx4=; b=o7bFLhlJgwhdB/
	QBDzv5C3wsMSLQmQt1xXKrA1Yp4Sujr7fLpQm76A9fds7JG0CVV8JK7JPny8jlyuPKWcFJ3ZV1pJ3
	zuk7kX7lMv7fziPwIHrTn5DAFS3Qwa5qNZ/cm0ZckHpfzT1pM3wAhvz8PYlhcsCAaj7q8RPu1ObaY
	H8kw/DWFnXW2cR+22hLVFpC/P5Jwcem6zlNOIABoRlxyEuqpUGZw8xs/aC08UMsc+xE70cnmJltqj
	yxpFnQF1RiEzg3nvzOlB8eWpOep1rgyfuSYzCnVGnfH1QpJJnn/etUh5WGOoywl10GqdGFqzR36eK
	yJ3jFjXge+jvqYtgJgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLhy-00GLK8-G1; Fri, 28 Oct 2022 09:31:22 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLhu-00GLHN-Pr
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2022 09:31:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 916DE24000E;
	Fri, 28 Oct 2022 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666949474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LqqeKR8+utpjuZxM0EHaE9N4OZLTd3lH1Adt1NpIXF8=;
	b=GAzA8O3h0KhXqF33H5+uc0+cxbB4hXn9Q0jnW6whhGEmVSeGytzqQaGChh5kyR1XZi7EJ+
	gygpk7DvnycYc7UdJgPtJEfubCn/4a114m5wJvmqpPNPmM7k+McI8/a4T97+pXRuBnQPYc
	lfmNjL9ZFuGtL7U+kg/eUGMXBVTQN/OkQqomzJ/N3DYCKbMRzoiioNf4DslQQmE8cWiOm7
	xwQwjuJvAJhadRjC6v6NcAX85nn2VWOE+BDoXIqE34L55sqYmYdP4j4JZcb3MBNaWH6JSA
	Hwucosdcs2yr8vev6SgzLzmGLVjq1GRIveWLESU8I3sDWItb5UE07OZAV0LoJQ==
Date: Fri, 28 Oct 2022 11:31:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v6.1-rc3
Message-ID: <20221028113111.20508656@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_023119_003951_37D33B30 
X-CRM114-Status: UNSURE (   7.26  )
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
VGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDlhYmYy
MzEzYWRjMWNhMWI2MTgwYzUwOGMyNWYyMmY5Mzk1Y2M3ODA6CgogIExpbnV4IDYuMS1yYzEgKDIw
MjItMTAtMTYgMTU6MzY6MjQgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTYuMS1yYzMKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byAwNWUyNThjNmVjNjY5ZDZkMThjNDk0ZWEwM2QzNTk2MmQ2ZjViNTQ1
OgoKICBtdGQ6IHBhcnNlcnM6IGJjbTQ3eHhwYXJ0OiBGaXggaGFsZmJsb2NrIHJlYWRzICgyMDIy
LTEwLTE4IDExOjIwOjEyICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNVEQgY29yZToKKiBwYXJ0aXRpb25zOiBB
ZGQgbWlzc2luZyBvZl9ub2RlX2dldCgpIGluIGR5bmFtaWMgcGFydGl0aW9ucyBjb2RlCgpQYXJz
ZXIgZHJpdmVyczoKKiBiY200N3h4cGFydDogRml4IGhhbGZibG9jayByZWFkcwoKUmF3IE5BTkQg
Y29udHJvbGxlciBkcml2ZXJzOgoqIG1hcnZlbGw6IFVzZSBjb3JyZWN0IGxvZ2ljIGZvciBuYW5k
LWtlZXAtY29uZmlnCiogdGVncmE6IEZpeCBQTSBkaXNhYmxlIGRlcHRoIGltYmFsYW5jZSBpbiBw
cm9iZQoqIGludGVsOiBBZGQgbWlzc2luZyBvZl9ub2RlX3B1dCgpIGluIGVidV9uYW5kX3Byb2Jl
KCkKClNQSS1OT1IgY29yZSBjaGFuZ2VzOgoqIElnbm9yZSAtRU5PVFNVUFAgaW4gc3BpX25vcl9p
bml0KCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KTGludXMgV2FsbGVpaiAoMSk6CiAgICAgIG10ZDogcGFyc2VyczogYmNt
NDd4eHBhcnQ6IEZpeCBoYWxmYmxvY2sgcmVhZHMKCk1pa2EgV2VzdGVyYmVyZyAoMSk6CiAgICAg
IG10ZDogc3BpLW5vcjogY29yZTogSWdub3JlIC1FTk9UU1VQUCBpbiBzcGlfbm9yX2luaXQoKQoK
UmFmYcWCIE1pxYJlY2tpICgxKToKICAgICAgbXRkOiBjb3JlOiBhZGQgbWlzc2luZyBvZl9ub2Rl
X2dldCgpIGluIGR5bmFtaWMgcGFydGl0aW9ucyBjb2RlCgpUb255IE8nQnJpZW4gKDEpOgogICAg
ICBtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IFVzZSBjb3JyZWN0IGxvZ2ljIGZvciBuYW5kLWtlZXAt
Y29uZmlnCgpZYW5nIFlpbmdsaWFuZyAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogaW50ZWw6IEFk
ZCBtaXNzaW5nIG9mX25vZGVfcHV0KCkgaW4gZWJ1X25hbmRfcHJvYmUoKQoKWmhhbmcgUWlsb25n
ICgxKToKICAgICAgbXRkOiByYXduYW5kOiB0ZWdyYTogRml4IFBNIGRpc2FibGUgZGVwdGggaW1i
YWxhbmNlIGluIHByb2JlCgogZHJpdmVycy9tdGQvbXRkY29yZS5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVy
LmMgfCAyMyArKysrKysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFy
dmVsbF9uYW5kLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFf
bmFuZC5jICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ3eHhw
YXJ0LmMgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICAg
ICAgICAgICAgICAgICAgIHwgIDQgKysrLQogNiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
