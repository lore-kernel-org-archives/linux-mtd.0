Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C13D38FE4
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hClZDAp5r/2P2OOMNtrN+BT0iLuUng9AOwkOG+1riAA=; b=ahY+2qlzJvH4rJ
	e5mGwAiOCmqn8e1FSSp+sTWvi8qNlXu9EvpPqgYNC0c9x1P4DICFVHURpA/IDWZMDQr+KJyfgr86a
	Tprp1AaTNT7k4W7oZ+qnBXS8MIQSxXEdOJpZSinIrLpkO5/gmdVXWTXYhXk/lO/xGwfFfi3plVNTA
	ICQmKDcaUHVnCFtOiwmYYLRTnaKnqqTw1LNAQf3zKjzYyciiD9ox+Tssh/JFe6NNEKb4lvuGXWfV4
	DL59rjoFkEQuUX8iBgQ0EzgRyRkKqey73D9qUc63+9N86w63+eVZRnIDglprwjzj2TJxv1qY/uhiF
	V6TryHBZaPL1qSxhqn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3ZL-00000009tlJ-2NF9;
	Wed, 14 Jan 2026 16:18:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3ZI-00000009tk6-192R
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 16:18:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D370B1A285F;
	Wed, 14 Jan 2026 16:17:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FB1C6074A;
	Wed, 14 Jan 2026 16:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40F4910B6828D;
	Wed, 14 Jan 2026 17:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768407475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kqlu/Go4zKkBAxvMQsNKsuLb9+tzbw0LkGCoi2mwHew=;
	b=kAYhrAkjiy4XZt+odcbfsystw9MvS3g5f+5WGi68laO5+CcYkzVnnWnXZYAo+Gg98DYKNZ
	YVZNeDnK5BGBZb5rZDZBB5nGL+ttLrFhKi9rs/FtFeU1bwkWo3sipA07Kijc7bmfQfhuOw
	yrfpgmBLRZI3nevzIo5NEnm7xod8FKlBXxDhrnNf2lXhyloRhxqHSL0ZK06qrPSRws4ydz
	vr7w1sXUrsNvVbURS3qGTdEbimq6UqVHLoY23Re+k3RfuXs1nb/ETetPQYEibG6s81C1L7
	az4obbAwpRfhgSniEM38AB4Lp5hsN9o0+sFkhNin82Rby5706/0zyBMJZb9M9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,  Santhosh
 Kumar K <s-k6@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/27] mtd: spinand: Octal DTR support
In-Reply-To: <61a547d0-592c-4cf5-ae4f-54456b08e83d@sirena.org.uk> (Mark
	Brown's message of "Wed, 14 Jan 2026 11:25:32 +0000")
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
	<61a547d0-592c-4cf5-ae4f-54456b08e83d@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 14 Jan 2026 17:17:51 +0100
Message-ID: <87qzrsuq1c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_081800_465933_2341E98A 
X-CRM114-Status: UNSURE (   9.65  )
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

SGkgTWFyaywKCj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgOEQtOEQtOEQgaW4gU1BJ
IE5BTkQsIHdoaWNoIGNhbiBhbHJlYWR5IGJlCj4+IGxldmVyYWdlZCB3aXRob3V0IGFueSBTUEkg
Y2hhbmdlcyBhcyBjb250cm9sbGVycyBhbHJlYWR5IGhhdmUgdGhpcwo+PiBzdXBwb3J0IGZvciBz
b21lIFNQSSBOT1IgZGV2aWNlcy4KPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgMGY2MWIxODYwY2MzZjUyYWVmOTAzNmQ3MjM1ZWQxZjAxNzYzMjE5MzoKPgo+ICAgTGludXgg
Ni4xOS1yYzUgKDIwMjYtMDEtMTEgMTc6MDM6MTQgLTEwMDApCj4KPiBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zcGkuZ2l0IHRhZ3Mvc3BpLW9jdGFsLWR0cgo+
Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDg2MTgyNzE4ODdjYTEwYWM1MTA4ZmU3
ZTFkODJiYThmMWIxNTJjZjk6Cj4KPiAgIHNwaTogc3BpLW1lbTogTGltaXQgb2N0YWwgRFRSIGNv
bnN0cmFpbnRzIHRvIG9jdGFsIERUUiBzaXR1YXRpb25zICgyMDI2LTAxLTEyIDEyOjQwOjMwICsw
MDAwKQoKVGhhbmtzIHlvdSB2ZXJ5IG11Y2ghIEkgd2lsbCB3YWl0IGEgYml0IG1vcmUgYW5kIGV2
ZW50dWFsbHkgbWVyZ2UgaXQgaW4KbXRkL25leHQgYmVmb3JlIGFwcGx5aW5nIHRoZSByZXN0IG9m
IHRoZSBzZXJpZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
