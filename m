Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35056C5474A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bcmnKWpkWBD/W3tjEuO+7LPqLVFQGnBDm1cRyFl7R9Y=; b=RNbj61qpRcRjjE
	UphOzUlfVIwyBowV4i8ZHC+2CaOFD8GtkMBNwUXSEFXcGuePzWZ2qBK38TT1mBraoYivOXTKNDJxj
	wis1Soq+k+oPXJy5Dvk9NOD9MslCz20oiYo4/ap6R98WGO25BHL622JOoQGjXEzxzPks8JohqW95o
	esOvCDmwQm2crhvVwkjprSze9SH6SEldRqvEHzrp78sViTv+w4GhA3ljVg+k2LDBJKYQzqAtrH4aC
	C+pVkF7ow5TPtn6yDPic9JrMGEL1QLNyCGBAe8/ZMpje9+DiefwG1uBr9Q00n14+xtAH3Mn0cAnXU
	WEQffQfr0UtYxFGzV3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCJo-0000000E7Q5-3N6A;
	Wed, 28 Aug 2024 06:38:12 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCIy-0000000E7Gc-2ZFZ;
	Wed, 28 Aug 2024 06:37:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A33ED14832EF;
	Wed, 28 Aug 2024 08:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1724827035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pwGPCTW5GTwNDQJjy9zJrdb9wJJS09zfm0iMot8uEVY=;
	b=ZPU3OfuhyYGnT0zIEHewtPdHoUXHVR7EcmNyZZZ1DNFSeteFXlfNFywVFjy3NQswHYS6Sw
	I3RAr94B+uYAEGhGdKoETeyXbOHHrLiswQUZUYJznuoS9o8au9TGv5lepZIF12IcMmVtC2
	wD1U0UrVXQlBlMa7ihwtUcDJoPaIKHeBEdYvElEj14KxG3gm1dZgvKyv3GZhKzufCL0N0A
	aEzWIjVog4Wl4syAe2ThOai0vigb314cwpTpb51L9nUq8U5hOqTGEloc5RFBcLgC3dAd9Y
	K2eNJsL53A4oYxzBFncjefwZCibeSSQBI9PGsB+s3A5gblbt4EJ8yCvkusfKGw==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] mtd: rawnand: atmel: Add message on DMA usage
Date: Wed, 28 Aug 2024 08:37:06 +0200
Message-Id: <20240828063707.73869-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_233720_922304_F2DDABC1 
X-CRM114-Status: UNSURE (   9.27  )
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

TGlrZSBmb3Igb3RoZXIgYXRtZWwgZHJpdmVycyAoc2VyaWFsLCBjcnlwdG8sIG1tYywg4oCmKSwg
dG9vLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4KQWNr
ZWQtYnk6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4KLS0tCgpO
b3RlczoKICAgIHYzOgogICAgLSBhZGFwdGVkIGNvbW1pdCBtZXNzYWdlIHByZWZpeAogICAgLSBj
b2xsZWN0ZWQgdGFncwogICAgCiAgICB2MjoKICAgIC0gbWFrZSBpbmZvIG1lc3NhZ2UgY29uZGl0
aW9uYWwgKHRoYW5rcyBNaXF1ZWwpCiAgICAtIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW10ZC8yMDI0MDgyMTE0MjAwNi42NDUzMDYtMS1hZGFAdGhvcnNpcy5jb20vCiAgICAK
ICAgIHYxOgogICAgLSBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAy
NDA4MjExMjA1MTcuMzMwODY4LTEtYWRhQHRob3JzaXMuY29tLwoKIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRt
ZWwvbmFuZC1jb250cm9sbGVyLmMKaW5kZXggZGM3NWQ1MGQ1MmU4Li5mOWNjZmQwMmU4MDQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCisr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCkBAIC0yMDQ5
LDcgKzIwNDksMTAgQEAgc3RhdGljIGludCBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfaW5pdChzdHJ1
Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpuYywKIAkJZG1hX2NhcF9zZXQoRE1BX01FTUNQWSwg
bWFzayk7CiAKIAkJbmMtPmRtYWMgPSBkbWFfcmVxdWVzdF9jaGFubmVsKG1hc2ssIE5VTEwsIE5V
TEwpOwotCQlpZiAoIW5jLT5kbWFjKQorCQlpZiAobmMtPmRtYWMpCisJCQlkZXZfaW5mbyhuYy0+
ZGV2LCAidXNpbmcgJXMgZm9yIERNQSB0cmFuc2ZlcnNcbiIsCisJCQkJIGRtYV9jaGFuX25hbWUo
bmMtPmRtYWMpKTsKKwkJZWxzZQogCQkJZGV2X2VycihuYy0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVl
c3QgRE1BIGNoYW5uZWxcbiIpOwogCX0KIAoKYmFzZS1jb21taXQ6IDQ3YWMwOWI5MWJlZmJiNmEy
MzVhYjYyMGMzMmFmNzE5ZjgyMDgzOTkKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
