Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C7FC87FCC
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=XUoZdC4JSPooHk
	jwjUB9Tuchuua6wS2SmFXY/pzu7IN7P//wL+7K4jICbz5ZrXOtPRueETnZ66QgwMjo6OVvgbtfkEp
	zvqJIJ0xVbXFpESakVV72Ve6ljB8c0I5wQl1y2uhuOKZl73SGUWIiHRmjGcBiZijeNnH/AUOThMhI
	CRsy7CC1kiIFYTzukIt/oIy7F+GhteECjMOqCqmL7PMLTybNTdYl5W1/9Mf+dt6kUN6MHrmzB/xmj
	3z8XgY6tX5jdYfEKucoiuUFbbL1IiCiSAQPTOHZs/glP8/FcFXzFPER1U6NFAcwvdUU6j9rwdOe5W
	uRQbgv1Tn9MiLSKBEUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1hV-00000000vuL-3JzV;
	Wed, 30 Jul 2025 07:58:13 +0000
Received: from mail.commalix.pl ([141.95.18.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1hN-00000000vqc-1x6N
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 07:58:06 +0000
Received: by mail.commalix.pl (Postfix, from userid 1002)
	id 5565CA58A0; Wed, 30 Jul 2025 09:57:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commalix.pl; s=mail;
	t=1753862281; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=uhL/y1zblhbQVSbRdrY2HA8nuRIx+4XEma0pJTmDe3NvHcpeewsTPps0XeTGx4NOt
	 JQW68h1I0Rq1bBFzhQgQ0s4lzVp0UzmivrwAUOSbr6zfonBuC9vwc/U8iSvMmx2EMK
	 24NpxRyE0HCTDGUAcNwFg2fsS6PgNLCQNrv/42N6do371gVXYosECfn/LNytDnBSIY
	 cyqb4tFythuHt+oJjt0LvvtIRYOamCM2NRxoEqNRbe5/j8XLPvaa2RfjQygJ1bRqcn
	 azPli4q5Dc/zciPGvIUka4lLvCFJu40tg6u11efJMrmySkgOhZD5tLxxKBHmwCWGOw
	 PmMlJu6hW7d+w==
Received: by mail.commalix.pl for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2025 07:56:15 GMT
Message-ID: <20250730084500-0.1.lb.2v0kg.0.n60gz1glqp@commalix.pl>
Date: Wed, 30 Jul 2025 07:56:15 GMT
From: "Piotr Toczek" <piotr.toczek@commalix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.commalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_005805_777219_F572CD4F 
X-CRM114-Status: UNSURE (   1.57  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGlvdHIgVG9jemVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
