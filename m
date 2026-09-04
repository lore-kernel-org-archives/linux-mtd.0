Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3F0C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8GCBQ89OFjrA9OIfX6Q39MivQZn7YsXoUt7uBx+Pk8=; b=0GQ7Cxam+ANk1U
	xwEqpOQxDn/v/sHPPHeSj7ay/t46jQwH7QLBszpfi5fZTyzNhtRyYNiJH4ZkkxyNGbj9pUK/Q9fZ4
	c1a+IydP1TLIX1EmjXUaBhryX0ciokUusZszB7GzBTRiISnM+ZpP7p7s6v6b6cdsA1A+0oZ7u3uzq
	t17U6RpZyeGhs081l5SksgcYmkm744bsFvIGOdoWWblBNh8sdQenEt6kpl3Aa74AuoS2LtQZW5rvR
	QlqaIwaqMQbGAhyNoqcqIz39ua3lXjUPf6uF/4VrWYNhNUxEdIzLc7D3akeN63sw4Spp6e09MHNN+
	KdbtSmLM6l5IOYeMlqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLi-00000002yuV-0sFJ;
	Fri, 04 Sep 2026 18:09:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLe-00000002yoc-3ziP
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5953F4E41521;
	Fri,  4 Sep 2026 18:09:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C2EB6057F;
	Fri,  4 Sep 2026 18:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A40E11C78705;
	Fri,  4 Sep 2026 20:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lxT4BF0pYe3TqiwjHM7pYr0KWW1klergbWZKc6pfWi4=;
	b=ALhRUt0SZ1BRPDm9381Qm6Qk756yaA4O3w4xhQULrhbBy7pG6+k8ZhxzEK6KuozHL3N5Xh
	zipW++KdfIOyKyFrgvZhLEJiE3vvctednBZjyLM+PQEON7O3GHDHX3jGDFjWCoOp8xhLec
	UZXn4C8aMsF6d/xY0PAZNNsCTvYOMOEEp6IT0barMu78KPbDAO+ThTYPqpm2dJNY946qU/
	U3Iv9qFAHZCvJZP5pTLYG13xJeFj041lR0EEhaK3c3SrBWEGROvy0j40Iui6Lnh7COGLRo
	UVpGDfURH4N2N8RoF+OscwTkWdAxpREgXJvuhVQrmtYm/mFB2RvDhtKB1gMV+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Sean MacLennan <smaclennan@pikatech.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260824202120.12280-1-rosenp@gmail.com>
References: <20260824202120.12280-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] mtd: rawnand: ndfc: use
 devm_platform_ioremap_resource()
Message-Id: <178854534716.1533016.1228581910442737455.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110911_157712_7482F596 
X-CRM114-Status: UNSURE (   8.87  )
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

T24gTW9uLCAyNCBBdWcgMjAyNiAxMzoyMToyMCAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
UmVwbGFjZSB0aGUgb3Blbi1jb2RlZCBvZl9pb21hcCgpL2lvdW5tYXAoKSB3aXRoIHRoZSBtYW5h
Z2VkCj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgaGVscGVyLiBUaGlzIGZpeGVz
IGEgbWFwcGluZyBsZWFrIG9uCj4gZHJpdmVyIHJlbW92ZSAodGhlIG9sZCBjb2RlIG5ldmVyIGNh
bGxlZCBpb3VubWFwKCkpIGFuZCBzaW1wbGlmaWVzIHRoZQo+IGVycm9yIHBhdGggYnkgZHJvcHBp
bmcgdGhlIG1hbnVhbCBjbGVhbnVwIGluIG5kZmNfcHJvYmUoKS4KPiAKPiBUaGVyZSBpcyBubyBv
dmVybGFwcGluZyBtZW1vcnktcmVnaW9uIGNvbmNlcm4gaW50cm9kdWNlZCBieSB0aGlzCj4gY2hh
bmdlOiBlYWNoIHN1cHBvcnRlZCBib2FyZCBEVCBkZXNjcmliZXMgYSBzaW5nbGUgbmRmYyBub2Rl
IHdpdGggYQo+IHVuaXF1ZSAweDIwMDAgcmVnaXN0ZXIgcmVnaW9uLCBhbmQgdGhlIEVCQyBwYXJl
bnQgdXNlcyBkY3ItcmVnIHJhdGhlcgo+IHRoYW4gYSBNRU0gcmVnIHJlc291cmNlLCBzbyB0aGUg
bmV3bHkgYWRkZWQgcmVxdWVzdF9tZW1fcmVnaW9uKCkgY2Fubm90Cj4gY29uZmxpY3Qgd2l0aCBh
biBleGlzdGluZyByZXNlcnZhdGlvbi4gRGlzdGluY3QgY2hpcCBzZWxlY3RzIG1hcCB0bwo+IGRp
c3RpbmN0IDY0LWJpdCBwaHlzaWNhbCBhZGRyZXNzZXMsIHNvIENTIGluc3RhbmNlcyBkbyBub3Qg
b3ZlcmxhcC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFd
IG10ZDogcmF3bmFuZDogbmRmYzogdXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgp
CiAgICAgIGNvbW1pdDogMGQ2NmY5ODk1ZjI4NmQyZmFiMzk2YTcxZTZlZmViOTVjNGE3ZTVhNgoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
