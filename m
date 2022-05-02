Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FBBC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 08:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JS+QuSRQOiBmnxT0yywVERlnAQ8T3QUhI5i2KIZLcB8=; b=ghBw97zdN9+80w
	tmNDTdr/74/mpsUXckOH+XqigncgHkOHFIahM4rkFMmODpeEKfTNsBe9JuGFmuijYO/JCx0VqIp9c
	c5hCx4X3cl4mWBBJG+kdbyp51TTzS8PXlwcpuSpABeDnW24eJiUtro8eWSnkF+QByeuzYfZrid6y6
	c+32t+OTrUUa///HKzG7O6Y1x4ZYSPkdNd3NyOypk7vOdaHNSiIo+TilU7s0ziqw/HhoHdv/p0Vgn
	VJDsx4xHP1RHTD/sLvswUygGhkUFkaebKgYKzLxtoaE/S/utOtKvxvgxFCogxeC+ZsAohn1J6pSsj
	YzaYsw7lgPoH0U4QQswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRFL-000HlJ-Nc; Mon, 02 May 2022 08:17:31 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRCQ-000FzD-MB; Mon, 02 May 2022 08:14:32 +0000
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsG8j2ZGYz4xXk;
 Mon,  2 May 2022 18:14:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsG8c0FS5z4x7Y;
 Mon,  2 May 2022 18:14:23 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Tao Ren <rentao.bupt@gmail.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v5 06/11] spi: aspeed: Workaround AST2500 limitations
Date: Mon,  2 May 2022 10:13:36 +0200
Message-Id: <20220502081341.203369-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_011431_021575_B56C6599 
X-CRM114-Status: GOOD (  13.02  )
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

SXQgaXMgbm90IHBvc3NpYmxlIHRvIGNvbmZpZ3VyZSBhIGZ1bGwgMTI4TUIgd2luZG93IGZvciBh
IGNoaXAgb2YgdGhlCnNhbWUgc2l6ZSBvbiB0aGUgQVNUMjUwMCBTUEkgY29udHJvbGxlci4gRm9y
IHRoaXMgY2FzZSwgdGhlIG1heGltdW0Kd2luZG93IHNpemUgaXMgcmVzdHJpY3RlZCB0byAxMjBN
QiBmb3IgQ0UwLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRl
c3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVkLWJ5OiBUYW8gUmVu
IDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClRlc3RlZC1ieTogSmFlIEh5dW4gWW9vIDxxdWljX2ph
ZWh5b29AcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8IDEyICsrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwpp
bmRleCAwYWZmNDJlMjBiOGQuLmQyYjMzNDJjMTMzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkv
c3BpLWFzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCkBAIC00
NTEsNiArNDUxLDggQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX3NldF93aW5kb3coc3RydWN0IGFz
cGVlZF9zcGkgKmFzcGksCiAgKiAtIGlvcmVtYXAgZWFjaCB3aW5kb3csIG5vdCBzdHJpY3RseSBu
ZWNlc3Nhcnkgc2luY2UgdGhlIG92ZXJhbGwgd2luZG93CiAgKiAgIGlzIGNvcnJlY3QuCiAgKi8K
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI1MDBfc3BpX2RhdGE7CisK
IHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coc3RydWN0IGFzcGVlZF9z
cGlfY2hpcCAqY2hpcCwKIAkJCQkJIHUzMiBsb2NhbF9vZmZzZXQsIHUzMiBzaXplKQogewpAQCAt
NDU5LDYgKzQ2MSwxNiBAQCBzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2luZG93
KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCiAJc3RydWN0IGFzcGVlZF9zcGlfd2luZG93
ICp3aW4gPSAmd2luZG93c1tjaGlwLT5jc107CiAJaW50IHJldDsKIAorCS8qCisJICogRHVlIHRv
IGFuIEhXIGlzc3VlIG9uIHRoZSBBU1QyNTAwIFNQSSBjb250cm9sbGVyLCB0aGUgQ0UwCisJICog
d2luZG93IHNpemUgc2hvdWxkIGJlIHNtYWxsZXIgdGhhbiB0aGUgbWF4aW11bSAxMjhNQi4KKwkg
Ki8KKwlpZiAoYXNwaS0+ZGF0YSA9PSAmYXN0MjUwMF9zcGlfZGF0YSAmJiBjaGlwLT5jcyA9PSAw
ICYmIHNpemUgPT0gU1pfMTI4TSkgeworCQlzaXplID0gMTIwIDw8IDIwOworCQlkZXZfaW5mbyhh
c3BpLT5kZXYsICJDRSVkIHdpbmRvdyByZXNpemVkIHRvICVkTUIgKEFTVDI1MDAgSFcgcXVpcmsp
IiwKKwkJCSBjaGlwLT5jcywgc2l6ZSA+PiAyMCk7CisJfQorCiAJYXNwZWVkX3NwaV9nZXRfd2lu
ZG93cyhhc3BpLCB3aW5kb3dzKTsKIAogCS8qIEFkanVzdCB0aGlzIGNoaXAgd2luZG93ICovCi0t
IAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
