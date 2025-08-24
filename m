Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63CCA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBliPnTcfWvSMbc6VCWGp2UpOHkO9tc7FRu4Al1MjjI=; b=Vkt3CtgkNRQMrG
	FAoQEur2FZxkTdg3+RFE/Dv+1w7xLB4MWec1IP6esJp6VxIX+n1oCAwuHTJCl3HsAvxYVkjJt2vwV
	/XXNMBjbHSENdPtY+y96LLCgG0ZUO+50olOMIqnvYRjhvJf76lu7zaEIT36+Ho9LfJzNVsVtzxGAX
	H544x8UaoWJF2dOh3EMHyYlb9sGnfEN9DO5cpcMcb2jirwlzGINEcWEL8GGBfZKykeY9umh4FR9pk
	ZvJmbRkKQ+nUm4UubkZZyLG82ngyv1V3xJn2rYIDSB1U1BX98NZnvnEORR8KLs8cCokuUoiI7FEpF
	r17QCtJ/OrrngIzU2KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDbA-00000006LXb-3Wxo;
	Sun, 24 Aug 2025 16:29:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDZc-00000006LTb-3WCa
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 16:28:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 986F84E40C0F;
	Sun, 24 Aug 2025 16:28:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 715CA605F1;
	Sun, 24 Aug 2025 16:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A43C31C228BA3;
	Sun, 24 Aug 2025 18:27:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756052882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LK3zJ270+fZwO5dYxJjnZ/1hiPqwVQV1MH/2HKHBrRA=;
	b=0Ohjmpt1C3U7/UItkLrbTjVweRrkgUSsjSTrcRwgwsZsFLmsMRhkfoVf+pNBlIPh+FXCd5
	B5eQdC7qk5ejqT3TtxK5wITgoDu2k5kesf8Eb63mLEz/UW7Q3ABbRNm4b9MebCJwb06lS+
	V3Z5/Ykob6oI+yGNdxZOlFCusRZvRHjkgzozgMA4s6iMykOrpm6J2PEsi/4D8R2RQ64Psn
	seS+EcFNbT16QC3f1QuGNWnpLnYjah3OnvaJLHMGaOTT1CKWW16myVOjS6Aa4j3KBOGEDW
	dsy59YoenI731Kwg4QoErP2+gWsv2+fgqk6Bz+q+/FlDuHPHRyRGiRexv7Ag0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/3] mtd: spinand: fix direct mapping creation sizes.
In-Reply-To: <20250820122100.726451-2-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Wed, 20 Aug 2025 15:20:58 +0300")
References: <20250820122100.726451-1-mikhail.kshevetskiy@iopsys.eu>
	<20250820122100.726451-2-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:27:52 +0200
Message-ID: <87bjo4it13.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_092805_004852_8849A746 
X-CRM114-Status: UNSURE (   4.18  )
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

SGkgTWlraGFpbCwKCk9uIDIwLzA4LzIwMjUgYXQgMTU6MjA6NTggKzAzLCBNaWtoYWlsIEtzaGV2
ZXRza2l5IDxtaWtoYWlsLmtzaGV2ZXRza2l5QGlvcHN5cy5ldT4gd3JvdGU6Cgo+IENvbnRpbnVv
dXMgbW9kZSBpcyBvbmx5IHN1cHBvcnRlZCBmb3IgZGF0YSByZWFkcywgdGh1cyB3cml0aW5nCj4g
cmVxdWlyZXMgb25seSBzaW5nbGUgZmxhc2ggcGFnZSBtYXBwaW5nLgoKUGxlYXNlIHJlbW92ZSB0
aGUgcGVyaW9kICcuJyBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQgdGl0bGUuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
