Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA037CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vzf8vnWe/Zmq15mM+CWYHdt35b2AasuTtZOPHhDOglo=; b=18Rma0G5k9tekl
	vyLLnwAVQ9meD7HXdADrdRfXAwnpY8jYd/d1W6z1vXrbfa0Z1c2Dc3s5Z4BtCFAXThwr4xHv65iHx
	LQAh2uJ0J4vQxeHyJFoE2qtFivrft1YaljGr+lSaJLX/iKV/iwQtWWdFArTBdOekc7xH/Z3WlyjlQ
	kX8XVtRRxMk3QkFexLZ9ClctuofbJo/cCTd2IbXGFPI/4t/+dCP2xgxvAZziG6tq65YDK98bwOqXP
	jlSKHdTKx0ZIGrCRmuM1sZQW5RayGRNOsZZGJxB0n2b4OOiwy8FSFZ0724y6GSh6LTvMP3nqTnJOS
	QToM+unu09deggmmHnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv25-0000000EzVd-2RO4;
	Wed, 14 Oct 2026 09:12:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv22-0000000EzUj-2qbm
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 09:12:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C5C6D1A1229;
	Wed, 14 Oct 2026 09:12:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9906560368;
	Wed, 14 Oct 2026 09:12:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95C041032898A;
	Wed, 14 Oct 2026 11:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791969134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRP4bJl5SdVNOJG+y1WwkVlB28FaMO41Z/f5pWVsxLM=;
	b=E79CjDLifyM+hr0VPaPwWud3S3QF+ZaBXPZha/6kMq+3dU2x6jTvJWDPM+hKYK7d+2f6lP
	MsZHFh3ofjvAvKLVyTn1IRLygxgpskwSzD8IHFyPq4te/UJkRmjYze6d9ks+jU8W9j4N0s
	l8o046kHUf2i0kDliC44D81GUez9tGv5uGimbmVPHl+RwqQSPNWVGmEtgFXtD4NJaeV5vB
	QCn9ZU23hLlRfY+zgOqJVxb/Kk0lt20Fpai9yxzgDSUOckEL4v6JGDuOQoIlqBiF3KRBCk
	m67Hz6G2Sp0GcNEPjYuhbfwk58PAkj2bimGpXfz6PowOlZ+DVjKQ1ynTrZ/EQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/17] mtd: spi-nor: winbond: Add support for the
 W35TxxNW family
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	(Miquel Raynal's message of "Tue, 13 Oct 2026 18:33:50 +0200")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:12:11 +0200
Message-ID: <87y0c0y7bo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_021218_860671_17624D49 
X-CRM114-Status: UNSURE (   8.91  )
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

SGkgTWljaGFlbCwKCj4gRmlyc3QgcGF0Y2hlcyBhcmUgbWlzYyBmaXhlcy4KPgo+IFRoZW4gdGhl
cmUgYXJlIGNvcmUgZW5oYW5jZW1lbnRzIHRvIHN1cHBvcnQgT0RUUiBjaGlwcy4KPgo+IExhc3Qg
c2V0IG9mIHBhdGNoZXMgaXMgV2luYm9uZCBzcGVjaWZpYywgd2hlcmUgSSBhZGQgdGhlIGJ1bGsg
b2YgdGhlCj4gY2hhbmdlcyBmb3Igc3VwcG9ydGluZyB0aGUgbmV3IFdpbmJvbmQgT2N0YWwtRFRS
IFNQSSBOT1IgY2hpcHMgaW4gdGhlCj4gd2luYm9uZCBtYW51ZmFjdHVyZXIgZHJpdmVyLCBhbmQg
dGhlbiBzcGFya2xlIHRoZSBJRCB0YWJsZSB3aXRoIHRoZSBuZXcKPiBJRHMgYW5kIHRoZWlyIHJl
c3BlY3RpdmUgdGVzdGluZyBsb2dzLgoKSnVzdCB0byBsZXQgeW91IGtub3cgdGhhdCBJIGNvbnNp
ZGVyZWQgdGhlIHJldmlld3MgZnJvbSBTYXNoaWtvIG9uCnRoaXMgdmVyc2lvbiwgYnV0IEkgZGlz
Y2FyZGVkIHRoZW0gYm90aC4gSSdsbCBsZXQgeW91IGRvIHlvdXIgb3duIHJldmlldwotbm8gaHVy
cnktLCBsZXQgbWUga25vdyBpZiB5b3UgZGlzYWdyZWUgb3IgcmVxdWlyZSBtb3JlIGRldGFpbHMu
CgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
