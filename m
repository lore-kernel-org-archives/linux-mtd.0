Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E907BC61D97
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=npnIKPxZ8JQG3Y
	YYwOupoxhQqj8sg/Fv+V880xSx3h+q5oPvh9aLmiqi3SvcJV1QvPvjQbZx7BoV3IEcayaYyAiZ6nj
	7SvpsI50nZFcnXv2lTYDjPpw/snYyQDrq5OoLFq6khucuo0WL3hL36HIZh0PJKZ/1mQWm0Ealjejy
	xgV09q7/vQtua1gKXCQ5TycJ/bi9AnCFfrYST2OZb1kuEVudI2+LGETKJdX+7XRpz6HTHc6Ul1lqf
	1pnJxQLadmWAQW9r3NJwGeWKSGcoKc3Z/bOyCOAMeJ6KEtNfLz9Nap9CdAgnkk7Fvj/6Wcb/Gf0Gq
	Ys55pkCgA9E2iMTNVtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rzx-006ao1-2k;
	Fri, 24 Nov 2023 08:57:17 +0000
Received: from mail.raportygospodarcze.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rzt-006alw-23
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 08:57:16 +0000
Received: by mail.raportygospodarcze.pl (Postfix, from userid 1002)
	id 6CA3BA3CC7; Fri, 24 Nov 2023 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=raportygospodarcze.pl; s=mail; t=1700816218;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=ktY+a25U9sxSNUJgznd1raLj1Y8d0OmgxxDipqJjc/whqCh38y4w+y31BIY9ciRAw
	 qSHUIJtgJ/kdz2Jg4Xxkv35MxCrMKM8VGcLT8c/GlP40qHQKm2+DtwJlncsVYBJ0SH
	 nxLqkzCcTtZ5tg9qwZilqSF1ar+zzy3I92ndJRshz0aHn+h9AH6GfDNZK6w/sts5QT
	 TkdGNBc99nd2glMxgHA0sw2Xcx5Yy70AAKLL4Zh4b694DEgub+wu55lgGO62bx1oep
	 hzjjG0YsnOmveVt3RVGj+FY1bekAsww2IwFHw2ErKiB+vCpk0u//db1Dpa326/+UEN
	 7Ep+lVCY6pHFA==
Received: by mail.raportygospodarcze.pl for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 08:55:49 GMT
Message-ID: <20231124074500-0.1.bs.1j0vm.0.qplxdnajkc@raportygospodarcze.pl>
Date: Fri, 24 Nov 2023 08:55:49 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@raportygospodarcze.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.raportygospodarcze.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_005714_420196_5B176C58 
X-CRM114-Status: UNSURE (   1.53  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
