Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479FAC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xcEn54lfSVZ4x1eVcRZiEgr60fHnNaJQKtHgH2NKEHI=; b=NKeQgSmQNl5i2/
	LtspUjVAW3X2oK/9xqLFpo0hqbMvjx4gQLRGitcvW2v2xTHmnd4dOMAQwONXvY3lp8dx/tFkMvVLJ
	mItcqrLH7RYC5+OviQD5Ws9h6DmqbL7BzUbY9fJ2Ek+ozc54pRMXrccJLC1L+LP/5A5enZKZ8P3JG
	RpwQLM8rcicjH38TGi8SgPIR/RrfvtJb8u9OzhfmCwZUHkjrXl3g8Mu8tZ9lzWaSBm9y5FiKSw+Jg
	NMFfysqY+M5UWyTE6so+AY7r4K1LFKYj9fRQJnUW05BFMJxy8a8assMwytapQ8XtKEt5EBRee+feh
	z9W7GjuED3vv8P1hywPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmCu-00000009Gxu-2jkU;
	Wed, 21 Aug 2024 14:21:04 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmC8-00000009Gec-2Lji;
	Wed, 21 Aug 2024 14:20:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 813651483E12;
	Wed, 21 Aug 2024 16:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1724250013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rH2IExas7+ysZJfgLcAkGVcyYLA/ZokR5nDbTwdEm4M=;
	b=LrLPFR5yv9whUHwBmYMOdVDdysHaNknn/HtPgv/G24fqLMzQCDGurnNyqfC2PRzkkxQtGr
	LAHkBnx4X/nUah3nIeJWY+9321E+kxiCe/lro/OTr7XRtWH/IofFn6M4iAZFre4li2yA/z
	mBs+UUTwkQTs4TS1nOpczpstpZMQwesp1MauyevjVbTlNirw+DOtjzVCsgTxZBJcimGpxN
	+L4p66fQNPcF2u0KiB2y7WRNIiQxrnZ4qwPmf1cx71zFAcWM9KyTIuBdNrlVY+WxbLfFC7
	jVILzdjy2ncaIShBHB46mTJAKdIc9ufx2TpFzqeILGOAMxuESRty3Ut+k9imtQ==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] mtd: nand: raw: atmel: Add message on DMA usage
Date: Wed, 21 Aug 2024 16:20:05 +0200
Message-Id: <20240821142006.645306-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_072016_789450_D073CDFF 
X-CRM114-Status: GOOD (  10.01  )
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
dG9vLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4KLS0t
CgpOb3RlczoKICAgIHYxIC0+IHYyOgogICAgLSBtYWtlIGluZm8gbWVzc2FnZSBjb25kaXRpb25h
bCAodGhhbmtzIE1pcXVlbCkKCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRy
b2xsZXIuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNv
bnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5j
CmluZGV4IGRjNzVkNTBkNTJlOC4uZjljY2ZkMDJlODA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwpAQCAtMjA0OSw3ICsyMDQ5LDEwIEBAIHN0YXRp
YyBpbnQgYXRtZWxfbmFuZF9jb250cm9sbGVyX2luaXQoc3RydWN0IGF0bWVsX25hbmRfY29udHJv
bGxlciAqbmMsCiAJCWRtYV9jYXBfc2V0KERNQV9NRU1DUFksIG1hc2spOwogCiAJCW5jLT5kbWFj
ID0gZG1hX3JlcXVlc3RfY2hhbm5lbChtYXNrLCBOVUxMLCBOVUxMKTsKLQkJaWYgKCFuYy0+ZG1h
YykKKwkJaWYgKG5jLT5kbWFjKQorCQkJZGV2X2luZm8obmMtPmRldiwgInVzaW5nICVzIGZvciBE
TUEgdHJhbnNmZXJzXG4iLAorCQkJCSBkbWFfY2hhbl9uYW1lKG5jLT5kbWFjKSk7CisJCWVsc2UK
IAkJCWRldl9lcnIobmMtPmRldiwgIkZhaWxlZCB0byByZXF1ZXN0IERNQSBjaGFubmVsXG4iKTsK
IAl9CiAKCmJhc2UtY29tbWl0OiA0N2FjMDliOTFiZWZiYjZhMjM1YWI2MjBjMzJhZjcxOWY4MjA4
Mzk5Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
