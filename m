Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCAFC88E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsc2TOAxGPR19vDVtCCT0M/ncIdlacP4VgpPlsPn5EE=; b=1HnW+e2ojBu4pE
	k/vd6H2rfmg5TpPMHUem8bMO9g3t4uWVgwryyY0ObQ00KyQvi6FYc93QGGD8BevTtRGjdtdmysvHl
	4JgO1oxlEKj8cwcxS/4Lg8RWgzXKIqm/ILMKW0rXpQlFmD9vzn2NpMRyPKLPSyl+braiFpLCGB0bl
	UQ57AY6Uvohi4wa5YSW2dkCBnt4hxnFbiVAafNg/QwgYwlzlXwSs0nL8Gng7so0Vlwcy2x4Gtem0s
	Dw564pDRcR/ihB6LbE3xsL68kOcUpxV/js33pC1UwVSXsyS5thJ4JdfSgXzS3QrkmqamkfPOt1Zsp
	GNR+v3XMoTu6Uc7/pVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50dR-0000000GeWp-1fsL;
	Fri, 11 Sep 2026 12:45:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50dM-0000000GeW6-1eQd
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 12:45:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D9AA94E401EF;
	Fri, 11 Sep 2026 12:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DF20601DE;
	Fri, 11 Sep 2026 12:45:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C7F211C7AF8E;
	Fri, 11 Sep 2026 14:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789130731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KjBGGwR20vQiI0jIm/6+LCpumwMENqAyvKhaULfuQBM=;
	b=JWnIE9R2695Os1cP34Ko1AFn6UyQ7adbR0kCQmuqHK99TUwEHndhQoniIsuTsCQeoY3Dtk
	NZxAOZLcJofMGXQA+bH0EiLOOhYRkREe5Y1gCeuG8XCxtgzDhi7XWsMtcB9pg8lyFsTqSX
	hKfVDZGvXIyp+7mcOBDSEY5EqFy/plyJvN34ZxCs+0z/xyPm3fqzlp/m942xkrUw73xFk7
	7yBh1Qn9QNJ4gzOYPCYM+BkxR5ocyNozj4uQFf+spHEO2mMp4rJVkDtcHdpvnYnMD8vmQz
	WdUR5OZM069m6/6nP1mLEwbvDQgCqdU295YqcCaF5hJhe8ywD6awR3ErwU4DHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Michael Walle" <mwalle@kernel.org>,  "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>,  "Richard Weinberger"
 <richard@nod.at>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  linux-kernel@vger.kernel.org,  "Steam
 Lin" <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,  "Jon Hunter"
 <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
In-Reply-To: <20260911105245.408171F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 11 Sep 2026 10:52:44
	+0000")
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
	<20260911105245.408171F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 14:45:19 +0200
Message-ID: <877bksq7mo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054538_104806_FA315384 
X-CRM114-Status: UNSURE (   7.46  )
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

SGVsbG8gTWljaGFlbCwKCk9uIDExLzA5LzIwMjYgYXQgMTA6NTI6NDQgR01ULCBzYXNoaWtvLWJv
dEBrZXJuZWwub3JnIHdyb3RlOgoKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBT
YXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoK
PiAtIFtIaWdoXSBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjIoKSBsZWF2ZXMgc3JbMV0gdW5pbml0
aWFsaXplZCB3aGVuCj4gcmVhZF9zcjIgaXMgdW5zdXBwb3J0ZWQsIGxlYWRpbmcgdG8gdW5pbml0
aWFsaXplZCBzdGFjayBtZW1vcnkgdXNlIGluCj4gY2FsbGVycyBhbmQgc3B1cmlvdXMgLUVJTyBl
cnJvcnMuCgpUaGUgYW5ub3lpbmdseSByaWdodCBTYXNoaWtvIHJvYm90IGlzIGNvcnJlY3QgOi0p
CgpUaGUgYmVzdCB3YXkgSSBzZWUgdG8gbWFrZSBzdXJlIHRoaXMgZG9lcyBub3QgYXBwZWFyLCBp
cyB0byBqdXN0IGFkZAp0aGlzIGZhbGxiYWNrIHRvIG1ha2Ugc3VyZSB3aGVuIHdlIHJlYWQgYm90
aCByZWdpc3RlcnMgd2UganVzdCBnZXQgemVybwppbnN0ZWFkIG9mIHJhbmRvbSBkYXRhIGluIHRo
ZSBidWZmZXIuIEFnYWluLCB0aGUgaWRlYSBpcyB0byBtYWtlIHN1cmUKY2FsbGVycyBkbyBub3Qg
bmVlZCB0byBiZSAiUUVSIGF3YXJlIi4KCi0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
CisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCkBAIC04NjcsNiArODY3LDggQEAgaW50
IHNwaV9ub3JfcmVhZF9zcjFfYW5kX3NyMihzdHJ1Y3Qgc3BpX25vciAqbm9yLCB1OCAqc3IpCiAK
ICAgICAgICBpZiAobm9yLT5wYXJhbXMtPm9wY29kZXMucmVhZF9zcjIpCiAgICAgICAgICAgICAg
ICByZXQgPSBzcGlfbm9yX3JlYWRfc3IyKG5vciwgJnNyWzFdKTsKKyAgICAgICBlbHNlCisgICAg
ICAgICAgICAgICBzclsxXSA9IDA7CiAKICAgICAgICByZXR1cm4gcmV0OwogfQoKV2hhdCBkbyB5
b3UgdGhpbms/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
