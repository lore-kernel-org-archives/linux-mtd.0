Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C0AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihvvf4B8oYIMt0EqI6N0efRkZnydOFVgMPpUNta8G3A=; b=CfyDdaDynZsutU
	pIEAG0Q9XIKkR8lGmS1dmMeCs38iaaMgWbsSQ3uiYMNjy/u8o9gXSVNZpMCJlQ4LWs/Jv4B1XLA5Z
	/rwLcwukABPM1fLUtuNA9IGZnY+J8vFMOLrVxqcmxbVD4B4x3ixrjzB4smBDO7M3+N2bq1DvV9rR6
	x22cyOinWVH03GSiOPYyPJLw/ovvkv+V06ChoJcgDSYjgVkt5u4ObaluXLTnKEc8w7ffNm3+9WNEs
	wmVUCqQtGzV8GTHg+yV8spvHT4PVplgh8EHZdmNqgT/BJ7S64cGJYforNrOQ4i2roUiBj8uZPQWCA
	LcwQBIJpAX8Zbnu8Zmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRJA-000K1l-F6; Mon, 02 May 2022 08:21:28 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRCt-000GJ9-Pu; Mon, 02 May 2022 08:15:02 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsG985j7Sz4yT0;
 Mon,  2 May 2022 18:14:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsG933GHKz4x7Y;
 Mon,  2 May 2022 18:14:47 +1000 (AEST)
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
 linux-kernel@vger.kernel.org, Tao Ren <rentao.bupt@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v5 10/11] ARM: dts: aspeed-g4: Set spi-max-frequency for all
 flashes
Date: Mon,  2 May 2022 10:13:40 +0200
Message-Id: <20220502081341.203369-11-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_011500_049259_416B8F88 
X-CRM114-Status: UNSURE (   9.47  )
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

RnJvbTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgoKU2V0ICJzcGktbWF4LWZyZXF1
ZW5jeSIgdG8gNTAgTUh6IGZvciBhbGwgdGhlIGZsYXNoZXMgdW5kZXIgdGhlIEZNQwpjb250cm9s
bGVyIHRvIGVuc3VyZSB0aGUgY2xvY2sgZnJlcXVlbmN5IGlzIGNhbGN1bGF0ZWQgY29ycmVjdGx5
LgoKU3VnZ2VzdGVkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgpUZXN0ZWQt
Ynk6IEphZSBIeXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29tPgpTaWduZWQtb2ZmLWJ5
OiBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0
LmR0c2kgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1nNC5kdHNpCmluZGV4IDFjNjM1NGNlYzlmMi4uNTMwNDkxYWU1ZWIyIDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAtNzIsMjQgKzcyLDI4IEBAIGZsYXNoQDEgewogCQkJCXJl
ZyA9IDwgMSA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLXJ4
LWJ1cy13aWR0aCA9IDwyPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CiAJ
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAyIHsKIAkJCQlyZWcgPSA8
IDIgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1yeC1idXMt
d2lkdGggPSA8Mj47CisJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OwogCQkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMyB7CiAJCQkJcmVnID0gPCAzID47
CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktcngtYnVzLXdpZHRo
ID0gPDI+OworCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKIAkJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDQgewogCQkJCXJlZyA9IDwgNCA+OwogCQkJ
CWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwy
PjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CiAJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAkJCX07CiAJCX07Ci0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
