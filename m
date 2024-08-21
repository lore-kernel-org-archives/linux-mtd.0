Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75532C52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x/RDaa0Dpkq2+r5UBOc1yDVIggC7q8mpIrrVKEDB2Uc=; b=rOBXRDWztOgLre
	VeWrfQEMCoy8e5rlZx3d20Q2dkyxlN4H8ge93bUNRX16eZCJ9Iy6qUAmPBfaiwccBTZlge7p/Uy4J
	blAUqODedxOz18mcWdGyKt5E1LJd33ECQLenOLID6qBMKr4XGAuPQRvip/qwzIBA5efVl7tFqsBK5
	sKWRNtUOlNiTb4TzYEWyrMPgXOysFrdWHPrQPu7rhyYWMYtPi/JVkz4HBa58LRLX4sv+k+mkpypA1
	sAIN5ErHj9t89qPgnFrs2N804QbR5YAOvUZ1ETtCgJixhDEGy7Wddvuq/KYLJROblPhAhkLdnwcxP
	fjL+izkY0Kh76QuHezcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgk6P-00000008qJ3-0hEB;
	Wed, 21 Aug 2024 12:06:13 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgk5f-00000008qCV-3pGh;
	Wed, 21 Aug 2024 12:05:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43CE11483DED;
	Wed, 21 Aug 2024 14:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1724241925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Yd9f/abI0GPcRIqot7aIukn3A28N94HWzjWiU6z6HyE=;
	b=bO0SA43tlbA4YxhM/DGIJwpIOxdL6BjKB4NyYp10pzrBySjKTTIg5WubVeb5rFwLADXfLy
	t2lU8WT39x3w/T+twzAj5jQqSQMPrEEKoLDp3nFMnX5iCJmf425JAxJk9j9i2bdDIDhR51
	9YFrtz1fLR/z3VgEgbTWCpVLc0Pt8aEHnMU+7XCpX5oZS3veIn3u7PzoW76CP12qggehiW
	7fWA5Unb1K114xTGozac8axiE82Jfie5Vv0qtIdCHQyXewibxYQYaLA1ltxJSYjNzUdtVk
	YvQhjIXLvxpQ0cXJ+Bv5YteqOpOnUe4oCdHqfJyUSufFj9ScyoKK0dRl6JZleQ==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: raw: atmel: Add message on DMA usage
Date: Wed, 21 Aug 2024 14:05:16 +0200
Message-Id: <20240821120517.330868-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_050528_396589_E444A1CC 
X-CRM114-Status: UNSURE (   7.96  )
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
dG9vLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4KLS0t
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyB8IDIgKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0
bWVsL25hbmQtY29udHJvbGxlci5jCmluZGV4IGRjNzVkNTBkNTJlOC4uOWU2ZGVhMmNmMTQwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwor
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwpAQCAtMjA1
MSw2ICsyMDUxLDggQEAgc3RhdGljIGludCBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfaW5pdChzdHJ1
Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpuYywKIAkJbmMtPmRtYWMgPSBkbWFfcmVxdWVzdF9j
aGFubmVsKG1hc2ssIE5VTEwsIE5VTEwpOwogCQlpZiAoIW5jLT5kbWFjKQogCQkJZGV2X2Vycihu
Yy0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgRE1BIGNoYW5uZWxcbiIpOworCQlkZXZfaW5mbyhu
Yy0+ZGV2LCAidXNpbmcgJXMgZm9yIERNQSB0cmFuc2ZlcnNcbiIsCisJCQkgZG1hX2NoYW5fbmFt
ZShuYy0+ZG1hYykpOwogCX0KIAogCS8qIFdlIGRvIG5vdCByZXRyaWV2ZSB0aGUgU01DIHN5c2Nv
biB3aGVuIHBhcnNpbmcgb2xkIERUcy4gKi8KCmJhc2UtY29tbWl0OiA0N2FjMDliOTFiZWZiYjZh
MjM1YWI2MjBjMzJhZjcxOWY4MjA4Mzk5Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
