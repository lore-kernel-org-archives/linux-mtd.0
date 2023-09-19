Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2676FEE6441
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9SsujZ6GuyltcSZDVgMUAbgYt/Dl9HCQHYVZR8WkhvA=; b=w/mkiwxdtjNjZc
	qq6g8fxm4zUhJfjFENN2edo/aFcBeprqduefFgPFKzsQVcn+5Em1ICoPmYPaiXmmRJYWRoZUQjHYy
	5byR5JuFaAsyZ0RPnX2pwSogkcGu0NzTC40PWnT8W86GOG7NWGwL1nuzi4C4dBKNcwcwI/gD0YkeS
	GxjtOM7C78/1tGKtm/xAc2DmN+RB77727K++ZI2f5VHNQ7fxfQCja70hdoV3UQQX227RMQrAtO5Pk
	QYND5xAI5n+LyAAEcjnLczZIAKyHacJGARsFnjWvnO+197i2Jy6HcSWqqeF7Y9Ygw7u41kKgBI6N0
	8/qBamJyIzaBmg/YfGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCl-00HF4X-2I;
	Tue, 19 Sep 2023 07:31:31 +0000
Received: from mail.leeswilly.pl ([89.116.26.225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCi-00HF2J-07
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 07:31:29 +0000
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
	id C63317611EB; Tue, 19 Sep 2023 09:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
	t=1695108683; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
	h=Date:From:To:Subject:From;
	b=Zx4K2KHxau33lOkhQJFkp6YYOPUV1eTzyMlwElDkC/AhOzc3u/Ck4yKMPc4UmsLRC
	 v4ZzBnyCvAMdQSm+uGVNnOUEwYsbvCpuv1CDmlbMeJRi0M9xVpbqgXhIshH+MDWfTc
	 vTZhUv+Epyvbgr9C2lYD50IV/qHmu9cO6NdlgP2Nja9q/zG66Fk5r1iNo6Z3mfKGHh
	 ICh91Dnyl3oyGcHdhRfIyqtQb2JsnPBHHf48514lpSI9u/ounqRSuGNvQ7BQtgSNT8
	 aONI6VdyJ2BdExbDaN+JnWogjSB0X8moftbbBTuoINewPVzkyXi5uMhb+tRN/BYu5X
	 TymkFyZYnUUTw==
Received: by mail.leeswilly.pl for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 07:30:18 GMT
Message-ID: <20230919084500-0.1.3z.bbvt.0.fz6n66wjx0@leeswilly.pl>
Date: Tue, 19 Sep 2023 07:30:18 GMT
From: "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_003128_257540_DC02E8B8 
X-CRM114-Status: UNSURE (   2.03  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkpha3ViIExl
bWN6YWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
