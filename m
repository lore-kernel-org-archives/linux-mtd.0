Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6781125842
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmBkPpdtP/8qnQb+iTGfk/HkJrcDwuX/aw0sR2QW3NE=; b=WIHmGY5OTSRMYh
	yrU//Wx0oJY+Wsy7Qg825F4j8xUFMxksoTpKyi5JI8ztLaKs9CKghKoYGBkmS+MJV1LE3QMjFe87B
	V+QvFA/tJig57F73joxXzgduh3Y+e5bcn4TxQ7oRYJvpDUM4eksWqTkzjfqVVofLzDZ2fIUgMtxV3
	CHJ8Gw3ZBzOFDxxhU9wGMwbPnfqzvz2WYtmHndwRZfJ0l9tlbvHsLf3ruUT3T4n4qTyc27tYtECdQ
	FS6KGniDYPLgdvCKKpUYXmUgbaR+uVj3g489gLETpI4HFYIy1gd415F6yN8niSGtQq4jJP8Qjs7Qx
	AkRd5VuUYLPceGa0HJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LbV-0000000BpsO-1zON;
	Wed, 11 Mar 2026 15:36:09 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LbT-0000000Bprk-2Yy0
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:36:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB8D3C41585;
	Wed, 11 Mar 2026 15:36:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 701A960004;
	Wed, 11 Mar 2026 15:36:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 693CC10368F58;
	Wed, 11 Mar 2026 16:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JhmOGNhiIi1eXcioSXLT0/h/WbawMjiqJ7Bp2B3Hsek=;
	b=gpUAi+lmP/6S5sMwPE8MSeZktxs3Br0pjmvtvCIMWD6Wv21twCMD2xNP7C9J8G7/95Pc67
	EGIbVDhJ9tc6Oa1BAzyWf7d6yFZ7d443koZTFPyTufgH6HuU39S5QS0NZq4jD7756IkFf4
	SqY6ab5dqpLqfOU0Yd5xedXBpFAnvdgQD33ihpmZ/VHUJlyulP5lLQVvfGqjGx/ABtnn1B
	LarfpSnmlYYkBNdgBUj4pAgjLiV1GKGiyX+ovwT34UylHPmPbRxAXHzx9Jf/EXOeagg359
	Uz6ro8imO/u6RZNP4uVfC0I2wH/+K3y/ynw5ttKpZyZ+I7P02B8OMlHsGE/1HA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Akhila YS <akhilayalmati@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix spear600-smi YAML conversion
In-Reply-To: <177324274850.685435.11462507375095087792.b4-ty@bootlin.com>
	(Miquel Raynal's message of "Wed, 11 Mar 2026 16:25:48 +0100")
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
	<177324274850.685435.11462507375095087792.b4-ty@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 11 Mar 2026 16:36:02 +0100
Message-ID: <87o6kul6ot.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_083607_788048_8B3A4A6C 
X-CRM114-Status: UNSURE (   5.98  )
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

T24gMTEvMDMvMjAyNiBhdCAxNjoyNTo0OCArMDEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIDI1IEZlYiAyMDI2IDE3OjI0OjQyICsw
MTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBSZWNlbnQgY29udmVyc2lvbiBmcm9tIHR4dCB0
byB5YW1sIG9mIHRoZSBTcGVhcjYwMCBTTUkgYmluZGluZyBieSBBa2hpbGEKPj4gbGVhZCB0byB3
YXJuaW5ncy4gVGhlc2UgYXJlIG15IDJjdHMgaW4gZ2V0dGluZyB0aGUgeWFtbCBjb252ZXJzaW9u
IGRvbmUKPj4gOi0pCj4+IAo+PiBDaGVlcnMsCj4+IE1pcXXDqGwKPj4gCj4+IFsuLi5dCj4KPiBB
cHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpJIG1vdmVkIHRoZW0gdG8gbXRkL2ZpeGVzLCB0
aGV5IHdpbGwgYmUgcXVldWVkIGluIHRoZSBuZXh0IE1URCBmaXhlcyBQUi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
