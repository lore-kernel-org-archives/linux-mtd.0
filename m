Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FCAC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 16:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316B0206BA
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 16:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y8Dpr62Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316B0206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Razb2hhJaIdfUheQAOW2nfaA+EZL17zD1EraLUl2oko=; b=Y8Dpr62QoIm35F
	WqEbKjx9y9FcXaQUgJdy1Cp/ehPlH3SsAe/3lG2Eju4NEP2BrlY+xFzzCsAJOymI4s1lkVEvwrvSM
	ofwqjQbiJnDubtVLOugalPH1Qg/o9YkC0dFCyUFh7mn3zSqLqjYwFmHybGFKXfEVbo7i63F+mAcDB
	8xxLOgHMoJlEnkXtii55TF16W64RYAjXCnTZS+QM4IttS+NhaHEIhSfszjOL93jPBJQNUU9Y6XS3i
	SGILG2Xk3ve0OJNjAO5GF4fWPHMjFDiYB2NGeECZELwYTvqUfVOmNhU921ag9E6R6DMasLF20MUfU
	YcFebTkrIfD43TpoWMdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC57c-0004XL-Jp; Thu, 04 Apr 2019 16:21:48 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC57J-00047U-0B; Thu, 04 Apr 2019 16:21:30 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C05451C006D;
 Thu,  4 Apr 2019 16:21:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/3] Sun8i NAND DMA support
Date: Thu,  4 Apr 2019 18:21:08 +0200
Message-Id: <20190404162111.22618-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_092129_194112_893093A9 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIHNlcmllcyBpbXByb3ZlcyB0aGUgTkFORCB0aHJvdWdocHV0IG9uIHN1bjhp
IHBsYXRmb3JtcyBieSBhZGRpbmcKRE1BIHN1cHBvcnQuIFRoaXMgaW5jcmVhc2UgY29tZXMgZnJv
bSB0aGUgRUNDIHBpcGVsaW5pbmcgZmVhdHVyZS4KCkJlY2F1c2UgTkFORCBETUEgaGFuZGxpbmcg
aGFzIGNoYW5nZWQgYmV0d2VlbiBBMTArIGFuZCBBMzMgU29Dcywgd2UKbXVzdCBpbnRyb2R1Y2Ug
YSBuZXcgY29tcGF0aWJsZS4gRFQgaXMgdXBkYXRlZCB3aXRoIHRoaXMgbmV3CmNvbXBhdGlibGUg
aW4gYWRkaXRpb24gd2l0aCB0aGUgdXN1YWwgRE1BIHByb3BlcnRpZXMuCgpUZXN0ZWQgb24gYW4g
QTMzLU9saW51eGluby4KClRoYW5rcywKTWlxdcOobAoKCk1pcXVlbCBSYXluYWwgKDMpOgogIGR0
LWJpbmRpbmdzOiBtdGQ6IHN1bnhpOiBBZGQgbmV3IGNvbXBhdGlibGUKICBtdGQ6IHJhd25hbmQ6
IHN1bnhpOiBBZGQgRE1BIHN1cHBvcnQgZm9yIHN1bjhpCiAgQVJNOiBkdHM6IHN1bnhpOiBJbXBy
b3ZlIHN1bjhpIE5BTkQgdHJhbnNmZXJzIGJ5IHVzaW5nIERNQQoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zdW54aS1uYW5kLnR4dCAgICB8ICA3ICstCiBhcmNoL2FybS9ib290L2R0cy9z
dW44aS1hMjMtYTMzLmR0c2kgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jICAgICAgICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKystLQogMyBmaWxl
cyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
