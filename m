Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26637E7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptPA68Rp1XxUMLdq5EBaTLKtQTHLFs9INY61EvIgXtE=; b=tn5iD42EI6ldP5
	OEz08GcqeG1fK+ewzVQ9hGjXna+ESBXb7i1de3XXTY4fE0nCDFAcwGjqV4ELr6SaKocZDHTSDrkbQ
	UW4LLlqvaDyR663D0irELL8WUGpjk7ZBpWQ4aYeYywtZ17ArudzY6jIAdR63MlHMUz//cWlMfSu2H
	J0FDjfBBKkH1zGYbctfUai+2Y731TYi/xUv8Q4glcKxCfUx+tk4cDGI6JhoCKQgJ8VzDXbcK8koD2
	M4TFP5zf2KRPG2l/whxADKk4pKfGUiqTC1VKNok8gOVe6ZP9RQOILpXC/QCB0kfM5RcdDgM+08Cl6
	CVMC8A3Q5Pj0aFFXkC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4Ru-0000000C02I-3Tv5;
	Tue, 24 Dec 2024 12:55:46 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4Rs-0000000C01t-1A2M
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 12:55:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F99E1C0003;
	Tue, 24 Dec 2024 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735044940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJbnNMFWK6NLl8J0zTZTEapVON1K3PSCSNSkYihw6Uw=;
	b=ji299DLguNmuwR3vaNiGsd8DRLN7Ia0ZE/lUmIgo1/LElmEbFpxO4wyNKWZrS3TWb2Tse0
	E9u6P783hciotaJ6LinD25SFrAj+ervp+X+wDBxM2hMQv5sOclv957YEiBXw3qQ7urSy5K
	5oOlfwWjcNGSPLTH6nTYZmcbgFh67WGdC53YJRmFRDnb/RYyCdc19XufHYe7+ALyljKzJF
	FozllW4wLgcpJT+SS1w0CxWPnMv0D2/bE3FpSnN+Ink07ILoKreze0PNLZwEyfw6vmPSBk
	GRmX2cSdiFvo2I4gBFWFgIrE2QyXp9Qha390mJLWr29KjMf0+CCnRMHEMiEaCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	richard@nod.at,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: hyperbus: hbmc-am654: fix an OF node reference leak
Date: Tue, 24 Dec 2024 13:51:01 +0100
Message-ID: <173504464300.1629980.14727050142919242670.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206133809.1074606-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241206133809.1074606-1-joe@pf.is.s.u-tokyo.ac.jp>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_045544_448434_67C23DED 
X-CRM114-Status: UNSURE (   5.52  )
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

T24gRnJpLCAwNiBEZWMgMjAyNCAyMjozODowOSArMDkwMCwgSm9lIEhhdHRvcmkgd3JvdGU6Cj4g
SW4gYW02NTRfaGJtY19wbGF0Zm9ybV9kcml2ZXIsIC5yZW1vdmUoKSBhbmQgdGhlIGVycm9yIHBh
dGggb2YgLnByb2JlKCkKPiBkbyBub3QgZGVjcmVtZW50IHRoZSByZWZjb3VudCBvZiBhbiBPRiBu
b2RlIG9idGFpbmVkIGJ5Cj4gICBvZl9nZXRfbmV4dF9jaGlsZCgpLiBGaXggdGhpcyBieSBhZGRp
bmcgb2Zfbm9kZV9wdXQoKSBjYWxscy4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5r
cyEKClsxLzFdIG10ZDogaHlwZXJidXM6IGhibWMtYW02NTQ6IGZpeCBhbiBPRiBub2RlIHJlZmVy
ZW5jZSBsZWFrCiAgICAgIGNvbW1pdDogYmY1ODIxOTA5ZWI5YzdmNWQwN2Q1YzZlODUyZWFkMmMz
NzNjOTRhMAoKUGF0Y2hlKHMpIHdpbGwgYmUgYXZhaWxhYmxlIHdpdGhpbiBob3VycyBvbjoKbXRk
L2xpbnV4LmdpdAoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
