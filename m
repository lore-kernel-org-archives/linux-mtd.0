Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC24C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uk6onRADelYXYM2w5ywWE43awxNuoI22y0MRjz6goa8=; b=397E1kmN5pIylq
	1Z3rrRdh0cdGfz6m1EdIMGYGRnFmv6JbEX8JFyhg/86uT4IYHw1QgQsFTROEhD4uMzlibRgMEgsrk
	kUTMcyN71FEQ6VN/QytsUIJaD95gcMCPy9SffHI5Rpe/puDreVna7n8AO90klB8n7f3O70zjwwniN
	R0917/vQxx0Fl9/0aFDBTd1ZX88/G7nd6NPZTs6JUZOT0H/HwKqNZVzobhQMQZu1rYu2mJj8EDteg
	SELCP8GdUjnszgCVNokc0ahXspwhgs5IsBSH/tLmC3yMw661z3OfScNQcqsBeZusZaez5yDHik1+F
	S1SbmGYQQPEq4hoJUYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7lb-008f8g-Ht; Wed, 20 Apr 2022 10:40:59 +0000
Received: from mail.aboehler.at ([2a01:4f8:121:5012::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7lX-008f5p-Mm
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:40:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.aboehler.at (Postfix) with ESMTP id 41FB13CC0289
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 12:40:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aboehler.at
Received: from mail.aboehler.at ([127.0.0.1])
 by localhost (aboehler.at [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZE5pFiHcnUxz; Wed, 20 Apr 2022 12:40:48 +0200 (CEST)
Received: from x390y.edu.htl.org (195-70-113-54.stat.salzburg-online.at
 [195.70.113.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: andreas@aboehler.at)
 by mail.aboehler.at (Postfix) with ESMTPSA id 70BC23CC0287;
 Wed, 20 Apr 2022 12:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aboehler.at;
 s=default; t=1650451248;
 bh=icoQ9B8gdEZ9kuw0ELXOY7HFRQEXJJRehHwSCeab3TQ=;
 h=From:To:Cc:Subject:Date:From;
 b=TL/5qnLdomV1+2iVWoObjaLA0dS5eh49g5Q+1Cz7MZhWOZYgdTK9wcYWVnpZ5z+bh
 TR2t/c/9+yquinZW+BLeQ7YDsrc28rPkBNHzNK32x/FYGbzL50hn2npvQsvgd67Da7
 tt97cGRIre1zdX8sac6b1wzGf9NYXJ987PhO1eMY=
From: =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>
To: linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>
Subject: [PATCH] mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00 NAND
 flash
Date: Wed, 20 Apr 2022 12:40:34 +0200
Message-Id: <20220420104034.6333-1-dev@aboehler.at>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_034056_256354_B6385AE5 
X-CRM114-Status: UNSURE (   9.04  )
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

VGhlIFRvc2hpYmEgVEM1OE5WRzBTM0hUQTAwIGlzIGRldGVjdGVkIHdpdGggNjQgYnl0ZSBPT0Ig
d2hpbGUgdGhlIGZsYXNoCmhhcyAxMjggYnl0ZXMgT09CLiBUaGlzIGFkZHMgYSBzdGF0aWMgTkFO
RCBJRCBlbnRyeSB0byBjb3JyZWN0IHRoaXMuCgpUZXN0ZWQgb24gRlJJVFohQm94IDc1MzAgZmxh
c2hlZCB3aXRoIE9wZW5XcnQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIELDtmhsZXIgPGRldkBh
Ym9laGxlci5hdD4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwpp
bmRleCA2ZTQxOTAyYmUzNWYuLmQ2NGFkYmQxY2U2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9pZHMuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5j
CkBAIC0yOSw2ICsyOSw5IEBAIHN0cnVjdCBuYW5kX2ZsYXNoX2RldiBuYW5kX2ZsYXNoX2lkc1td
ID0gewogCXsiVEM1OE5WRzBTM0UgMUcgMy4zViA4LWJpdCIsCiAJCXsgLmlkID0gezB4OTgsIDB4
ZDEsIDB4OTAsIDB4MTUsIDB4NzYsIDB4MTQsIDB4MDEsIDB4MDB9IH0sCiAJCSAgU1pfMkssIFNa
XzEyOCwgU1pfMTI4SywgMCwgOCwgNjQsIE5BTkRfRUNDX0lORk8oMSwgU1pfNTEyKSwgfSwKKwl7
IlRDNThOVkcwUzNIVEEwMCAxRyAzLjNWIDgtYml0IiwKKwkJeyAuaWQgPSB7MHg5OCwgMHhmMSwg
MHg4MCwgMHgxNX0gfSwKKwkJICBTWl8ySywgU1pfMTI4LCBTWl8xMjhLLCAwLCA0LCAxMjgsIE5B
TkRfRUNDX0lORk8oOCwgU1pfNTEyKSwgfSwKIAl7IlRDNThOVkcyUzBGIDRHIDMuM1YgOC1iaXQi
LAogCQl7IC5pZCA9IHsweDk4LCAweGRjLCAweDkwLCAweDI2LCAweDc2LCAweDE1LCAweDAxLCAw
eDA4fSB9LAogCQkgIFNaXzRLLCBTWl81MTIsIFNaXzI1NkssIDAsIDgsIDIyNCwgTkFORF9FQ0Nf
SU5GTyg0LCBTWl81MTIpIH0sCi0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
