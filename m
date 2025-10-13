Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1D3CCD183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP7B2QFyJb67xmv516XN+vp9W95V6C/PT9ANLcko1M0=; b=XUeI/A3Jh2PB1Y
	8EIRhAbMKmHBhkm0tmRIXyf0qCAxYm5mCHpOs4CSSV8FohUNAJsynmlINOEMblXvegxVPEyYPI5+Y
	jg1JqKlHBgdPm8BHQQ1pEc5mwUBF+gpSL9sIz39gX9/x+bv/1UbJZr28nmp7X46EOSpVXiURCVEtF
	+ooGUaxvkjLB/xFyePPLraP4hjFwPUJuG8NDHKzOTc9anlzwtg7fShtNnY4fakFmxf2JnTk2p5SZl
	JgKouYxWsAK1tqoc7KTUgGJhdY2cAhLXgvbu1kDqnCOzFcCAAi3nSgYuDq/Z75iyD9V0rOTA9Zf/m
	DuQzjNy5VRGsSbQwgd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EuV-0000000CkIb-0roG;
	Mon, 13 Oct 2025 09:32:07 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EuR-0000000CkHy-2ID4
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 09:32:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0C40C093A7;
	Mon, 13 Oct 2025 09:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94CD6606C6;
	Mon, 13 Oct 2025 09:31:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AEA3102F222A;
	Mon, 13 Oct 2025 11:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760347917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WsfdjoTIPJQRePNTbkeWdEmbRbZTcPhaW8sV+VHtvG8=;
	b=Ja40I7MgQx82YwpAy3kGzE//AIkzQ3khQ60FKvdMtqKJedIKukJ9At8u0EUp/iYeyM4P8M
	sh5TqKmOVKYChxjDLRasSYVdQZ+cupuDI2QZLVEMcMhcwnruOxnzfgszY4BFYJbXeSfch5
	B+Q5lxX5uOKUfmgv5PuUie+gNk7bQB/JFI8n4My4/kc+NOhHVNAJjESC+7uKFv8D2F4Dp9
	mDxy4fKrKW+TOEtU/hrdtDr9wVDKY+n/u1akeFf14polMMmtR2uabc7KikZXlFijN+eNwt
	RtwpShpsKb04JLsU8R0+/fs1HxPphBims4lj1zsUX2nJRKJtf6keNLPRh6eUIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.18
In-Reply-To: <mafs0ecrvdfl9.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	24 Sep 2025 17:40:02 +0200")
References: <mafs0ecrvdfl9.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 13 Oct 2025 11:31:49 +0200
Message-ID: <87ikgjqha2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023204_123616_F6FCA169 
X-CRM114-Status: UNSURE (   5.91  )
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

SGVsbG8sCgpPbiAyNC8wOS8yMDI1IGF0IDE3OjQwOjAyICswMiwgUHJhdHl1c2ggWWFkYXYgPHBy
YXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBIZXJlIGFyZSB0aGUg
U1BJIE5PUiBjaGFuZ2VzIGZvciB2Ni4xOC4KCkknbSBzb3JyeSBJIGZvcmdvdCB0byBhbnN3ZXIu
IEkgaW5kZWVkIHB1bGxlZCBpdCBpbiBtdGQvbmV4dCBiZWZvcmUgc2VuZGluZwp0aGUgUFIgdG8g
TGludXMgKHdoaWNoIHdhcyBhcHBsaWVkIGFscmVhZHkpLCBidXQgSSB3YXMgYSBiaXQgaW4gYSBo
dXJyeQpiZWZvcmUgYmVpbmcgb2ZmIGZvciBhIHdlZWsuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
